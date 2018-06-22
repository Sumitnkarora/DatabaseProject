/* =============================================
 Author:		Dariusz Holc
 Create date:	Feb 15, 2018

 Description:	Gets sequential guid for new export session, inserts new session into FeedExportSessionLog,
				updates records to be processed and returns Unique SessionId with number of records to be processed.

 Revision history:
 				Feb 21, 2018 Dariusz Holc
				Move the marking of records to start session from fetch session.
				Mar 06, 2018 Dariusz Holc
				Remove creation of session as it is done in a separate call.
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_ProductDescriptions_StartSession]
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
		DECLARE @ProductsBatchToExport TABLE(changeVersionId bigint not null, isbn13 varchar(13), vendorId varchar(12), vsrCode varchar(12), descriptionTypeId tinyint, EBookID varchar(36)); 

		BEGIN TRANSACTION PRODUCT_DESCRIPTIONS_UPDATE

		INSERT INTO @ProductsBatchToExport (changeVersionId, isbn13, vendorId, vsrCode, descriptionTypeId, EBookID)
		SELECT TOP (@TopRecords) MIN(so.ChangeVersionId) as ChangeVersionId, so.ISBN13, so.VendorId, so.VSRCode, so.DescriptionTypeId, so.EBookID
		FROM
		(
			-- get more records ordered first (look ahead in case of multiple changes)
			SELECT TOP (2*@TopRecords) s.ChangeVersionId, s.ISBN13, s.VendorId, s.VSRCode, s.DescriptionTypeId, s.EBookID
			FROM FeedExportProductDescriptions s 
			LEFT JOIN FeedExportProductDescriptions s2 WITH (NOLOCK) -- to eliminate already processing
				ON s2.ISBN13 = s.ISBN13 AND s2.VendorId = s.VendorId AND s2.VSRCode = s.VSRCode AND s2.DescriptionTypeId = s.DescriptionTypeId AND s2.EBookID = s.EBookID AND s2.StatusId = 1
			LEFT JOIN dbo.FeedExportSessionLog l WITH (NOLOCK) ON s.SessionId = l.SessionId -- to include processing that are older than specified
			WHERE (s.StatusId IN (0, 3) AND s2.ChangeVersionId IS NULL) OR (s.StatusId = 1 AND l.StartDatetime < DATEADD(mi, -@SessionExpirationInMin, GETDATE()))
			ORDER BY s.ChangeVersionId ASC
		) so
		GROUP BY so.ISBN13, so.VendorId, so.VSRCode, so.DescriptionTypeId, so.EBookID
		ORDER BY MIN(so.changeversionid)
		
		UPDATE top (@TopRecords) u
		SET u.StatusId = 1, u.SessionId = @SessionId
		FROM FeedExportProductDescriptions u
		JOIN @ProductsBatchToExport c ON c.ChangeVersionId = u.ChangeVersionId AND c.ISBN13 = u.ISBN13 AND c.VendorId = u.VendorId AND c.VSRCode = u.VSRCode AND c.DescriptionTypeId = u.DescriptionTypeId AND c.EBookId = u.EBookId
		
		SELECT @SessionRecordCount = @@ROWCOUNT;

		COMMIT TRANSACTION PRODUCT_DESCRIPTIONS_UPDATE

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
			ROLLBACK TRANSACTION PRODUCT_DESCRIPTIONS_UPDATE
		
		DECLARE @FailDatetime datetime2(4) = GETDATE();
		DECLARE @ErrorMessage varchar(MAX);
		SET @SessionRecordCount = 0;
		SELECT @ErrorMessage = 'ErrorMessage: ' + ERROR_MESSAGE() + '; ErrorNumber: ' + CAST(ERROR_NUMBER() AS VARCHAR) + '; ErrorSeverity: ' + CAST(ERROR_SEVERITY() AS VARCHAR) + '; ErrorLine: ' + CAST(ERROR_LINE() AS VARCHAR)

		UPDATE FeedExportSessionLog 
		SET 
			EndDatetime = @FailDatetime,
			StatusId = 3,
			StatusMessage = @ErrorMessage
		WHERE SessionId = @SessionId;

		THROW;
	END CATCH;

	SET XACT_ABORT OFF;

	SELECT @SessionId AS SessionId, @SessionRecordCount AS RecordCount;
END
GO

GRANT EXECUTE ON [dbo].[exporter_ProductDescriptions_StartSession] TO [FeedsExporter]; 
GO