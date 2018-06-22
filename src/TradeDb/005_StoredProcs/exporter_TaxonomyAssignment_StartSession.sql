/* =============================================
 Author:		Dariusz Holc
 Create date:	Feb 21, 2018

 Description:	Gets sequential guid for new export session, inserts new session into FeedExportSessionLog,
				updates records to be processed and returns Unique SessionId with number of records to be processed.

 Revision history:
				Feb 21, 2018 Dariusz Holc
				Move the marking of records to start session from fetch session.
				Feb 27, 2018 Raymond Chan
				Use temp tables to partition the data prior to update, for faster performance
				Mar 06, 2018 Dariusz Holc
				Remove creation of session as it is done in a separate call.
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_TaxonomyAssignment_StartSession]
	@SessionId uniqueidentifier,
    @TopRecords int = 0,
    @SessionExpirationInMin int = 30
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	DECLARE @SessionRecordCount int = 0;

	BEGIN TRY
		-- Create temp tables to identify records for marking as part of the session
		IF OBJECT_ID('tempdb..#RecordsBatch', 'U') IS NOT NULL DROP TABLE #RecordsBatch;
		CREATE TABLE #RecordsBatch (ChangeVersionId BIGINT, TaxonomyType varchar(6), ISBN13UPC varchar(13), VendorId varchar(12), VSRCode varchar(12), Ordinal tinyint, EBookId varchar(36), BISACOrdinal int,
		UNIQUE NONCLUSTERED (ChangeVersionId, taxonomyType, ISBN13UPC, VendorId, VSRCode, Ordinal, EBookId, BISACOrdinal)); 

		IF OBJECT_ID('tempdb..#RecordsToExport', 'U') IS NOT NULL DROP TABLE #RecordsToExport;
		CREATE TABLE #RecordsToExport (ChangeVersionId BIGINT, TaxonomyType varchar(6), ISBN13UPC varchar(13), VendorId varchar(12), VSRCode varchar(12), Ordinal tinyint, EBookId varchar(36), BISACOrdinal int,
		UNIQUE NONCLUSTERED (ChangeVersionId, taxonomyType, ISBN13UPC, VendorId, VSRCode, Ordinal, EBookId, BISACOrdinal)); 

		DECLARE @iteration int = 1, @stillNeed INT, @maxIteration INT = 2;
		SET @stillNeed = @TopRecords;

		-- This 'loop' is basically to determine if we have enough records or not
		-- If not, then we increase the 'top records' (by changing the interation number) and fetching more
		WHILE (@stillNeed > 0 AND @iteration <= @maxIteration)
		BEGIN

			-- get 1.2X more records than we expect
			-- This table will contain the records from our FeedExport table, with duplicates
			-- include StatusId=0 (new) or StatusId=3 (error) or StatusId=1 (inprogress & session expired)
			INSERT INTO #RecordsBatch
				SELECT TOP (CONVERT(INT, 1.2 * @iteration * @TopRecords)) s.ChangeVersionId, s.TaxonomyType, s.ISBN13UPC, s.VendorId, s.VSRCode, s.Ordinal, s.EBookId, s.BISACOrdinal
				FROM FeedExportTaxonomyAssignment s WITH (NOLOCK) 
				LEFT JOIN dbo.FeedExportSessionLog l2 WITH (NOLOCK) ON l2.SessionId = s.SessionId 
				WHERE (s.StatusId IN (0, 3)) OR (s.StatusId = 1 AND l2.StartDatetime < DATEADD(mi, -@SessionExpirationInMin, GETDATE()))
				ORDER BY s.ChangeVersionId ASC

			-- This table will contain the records after we've removed duplicates 
			INSERT INTO #RecordsToExport
				SELECT TOP (@TopRecords)  MIN(s.ChangeVersionId) as ChangeVersionId, s.TaxonomyType, s.ISBN13UPC, s.VendorId, s.VSRCode, s.Ordinal, s.EBookId, s.BISACOrdinal
				FROM #RecordsBatch s
				LEFT JOIN FeedExportTaxonomyAssignment s2 WITH (NOLOCK) -- to eliminate already processing
					ON s.TaxonomyType = s2.TaxonomyType AND s2.ISBN13UPC = s.ISBN13UPC AND s2.VendorId = s.VendorId AND s2.VSRCode = s.VSRCode AND s2.Ordinal = s.Ordinal AND s2.EBookId = s.EBookId AND s2.BISACOrdinal = s.BISACOrdinal 
						AND s2.ChangeVersionId <> s.ChangeVersionId AND s2.SessionId IS NOT NULL
				WHERE s2.ISBN13UPC IS NULL 
				GROUP BY s.TaxonomyType, s.ISBN13UPC, s.VendorId, s.VSRCode, s.Ordinal, s.EBookId, s.BISACOrdinal

			set @iteration = @iteration + 1;

			-- check to see if we have enough records or not. if not, do again and get more
			SELECT @stillNeed = @TopRecords - COUNT(1) FROM #RecordsToExport;
			if (@stillNeed < 0.5 * @TopRecords OR @iteration = @maxIteration)
			BEGIN
				SET @stillNeed = 0;
			END
			ELSE 
			BEGIN 
				TRUNCATE TABLE #RecordsToExport; 
			END

		END -- end loop identifying records to mark as part of session for import


		BEGIN TRANSACTION TAXONOMY_ASSIGNMENT_UPDATE

			-- Set Status to 'Processing'
			UPDATE top (@TopRecords) u
			SET u.StatusId = 1, u.SessionId = @SessionId
			FROM FeedExportTaxonomyAssignment u
			JOIN #RecordsToExport c ON c.ChangeVersionId = u.ChangeVersionId AND c.TaxonomyType = u.TaxonomyType AND c.ISBN13UPC = u.ISBN13UPC AND c.VendorId = u.VendorId AND c.VSRCode = u.VSRCode AND c.Ordinal = u.Ordinal AND c.EBookId = u.EBookId AND c.BISACOrdinal = u.BISACOrdinal

			SELECT @SessionRecordCount = @@ROWCOUNT;

		COMMIT TRANSACTION TAXONOMY_ASSIGNMENT_UPDATE

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
			ROLLBACK TRANSACTION TAXONOMY_ASSIGNMENT_UPDATE
		
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

GRANT EXECUTE ON [dbo].[exporter_TaxonomyAssignment_StartSession] TO [FeedsExporter]; 
GO