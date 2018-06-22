/* =============================================
 Author:		Dariusz Holc
 Create date:	Feb 21, 2018

 Description:	Gets sequential guid for new export session, inserts new session into FeedExportSessionLog,
				updates records to be processed and returns Unique SessionId with number of records to be processed.

 Revision history:
				Feb 21, 2018 Dariusz Holc
				Move the marking of records to start session from fetch session.
				Mar 06, 2018 Dariusz Holc
				Remove creation of session as it is done in a separate call.
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_TaxonomyStructure_StartSession]
	@SessionId uniqueidentifier,
    @TopRecords int = 0,
    @SessionExpirationInMin int = 30
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DECLARE @SessionRecordCount int = 0;

	BEGIN TRY
		-- Mark records as part of the session
		DECLARE @StructureBatchToExport TABLE(changeVersionId bigint not null, taxonomyType varchar(6)); 

		BEGIN TRANSACTION TAXONOMY_UPDATE

		-- We only select top 1, because our InsertChangedData should only insert 1 web or 1 retail in StatusId=0
		INSERT INTO @StructureBatchToExport (changeVersionId, taxonomyType)
		SELECT TOP 1 
			t.ChangeVersionId, t.TaxonomyType
		FROM FeedExportTaxonomyStructure t
		LEFT JOIN FeedExportTaxonomyStructure t2 WITH (NOLOCK) -- to eliminate already processing (we match on StatusId=1, then ChangeVersionId null for those that don't match)
			on t.TaxonomyType = t2.TaxonomyType and t2.StatusId=1
		LEFT JOIN dbo.FeedExportSessionLog l WITH (NOLOCK) ON t.SessionId = l.SessionId 
		WHERE (t.StatusId IN (0, 3) AND t2.ChangeVersionId IS NULL)  -- get those not in StatusId=0
			OR (t.StatusId = 1 AND l.StartDatetime < DATEADD(mi, -@SessionExpirationInMin, GETDATE())) -- get any timed out
		ORDER BY t.ChangeVersionId ASC

		UPDATE t
		SET t.StatusId = 1, t.SessionId = @SessionId 
		FROM FeedExportTaxonomyStructure t
			LEFT JOIN dbo.FeedExportSessionLog l WITH (NOLOCK) ON t.SessionId = l.SessionId 
			JOIN @StructureBatchToExport c ON c.ChangeVersionId = t.ChangeVersionId AND c.TaxonomyType = t.TaxonomyType
	
		SELECT @SessionRecordCount = @@ROWCOUNT;

		COMMIT TRANSACTION TAXONOMY_UPDATE

		-- Automatically finish session if no records
		IF @SessionRecordCount = 0
		BEGIN
			UPDATE FeedExportSessionLog 
			SET 
				EndDatetime = GETDATE(),
				StatusId = 2,
				RecordsCount = 0,
				RecordsInvalidCount = 0
			WHERE SessionId = @SessionId;
		END
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0 OR XACT_STATE() <> 0)
			ROLLBACK TRANSACTION TAXONOMY_UPDATE
		
		DECLARE @FailDatetime datetime2(4) = GETDATE();
		DECLARE @ErrorMessage varchar(MAX);
		SET @SessionRecordCount = 0;
		SELECT @ErrorMessage = 'ErrorMessage: ' + ERROR_MESSAGE() + '; ErrorNumber: ' + CAST(ERROR_NUMBER() AS VARCHAR) + '; ErrorSeverity: ' + CAST(ERROR_SEVERITY() AS VARCHAR)  + '; ErrorLine: ' + CAST(ERROR_LINE() AS VARCHAR)

		UPDATE FeedExportSessionLog 
		SET 
			EndDatetime = @FailDatetime,
			StatusId = 3,
			StatusMessage = @ErrorMessage
		WHERE SessionId = @SessionId

	END CATCH;

	SET XACT_ABORT OFF;

	SELECT @SessionId AS SessionId, @SessionRecordCount AS RecordCount;
END
GO

GRANT EXECUTE ON [dbo].[exporter_TaxonomyStructure_StartSession] TO [FeedsExporter]; 
GO