/* =============================================
 Author:		Irene Kondryna
 Create date:	November 24, 2017

 Description:	Updates records that for some reason are still in Processing status to Failed status;
				Should be called before processing starts to re-initialize records

 Revision history:
				Dec 8, 2017 Dariusz Holc
				Make the updates only per exporter type. Only get sessions with status processing and update to failed instead of success.
				Jan 5, 2018 Dariusz Holc
				Add support for product attributes.
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_RestartInitialize]
	@ExporterType varchar(50),
	@ExporterName varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		SELECT SessionId INTO #sessions
		FROM dbo.FeedExportSessionLog 
		WHERE ExporterName = @ExporterName AND StatusId = 1;

		DECLARE @endDate datetime = GETDATE();
		DECLARE @FailedStatus int = 3;

		IF UPPER(@ExporterType) = 'SERIES' BEGIN
			UPDATE s
			SET StatusId = @FailedStatus
			FROM dbo.FeedExportSeries s
			JOIN #sessions t ON s.SessionId = t.SessionId AND s.StatusId = 1;
		END
		ELSE IF UPPER(@ExporterType) = 'VENDORS' BEGIN
			UPDATE v
			SET StatusId = @FailedStatus
			FROM dbo.FeedExportVendors v
			JOIN #sessions t ON v.SessionId = t.SessionId AND v.StatusId = 1;
		END
		ELSE IF UPPER(@ExporterType) = 'CONTRIBUTORS' BEGIN
			UPDATE c
			SET StatusId = @FailedStatus
			FROM dbo.FeedExportContributors c
			JOIN #sessions t ON c.SessionId = t.SessionId AND c.StatusId = 1;
		END
		ELSE IF UPPER(@ExporterType) = 'TAXONOMYSTRUCTURE' BEGIN
			UPDATE ts
			SET StatusId = @FailedStatus
			FROM dbo.FeedExportTaxonomyStructure ts
			JOIN #sessions t ON ts.SessionId = t.SessionId AND ts.StatusId = 1;
		END
		ELSE IF UPPER(@ExporterType) = 'TAXONOMYASSIGNMENT' BEGIN
			UPDATE ta
			SET StatusId = @FailedStatus
			FROM dbo.FeedExportTaxonomyAssignment ta
			JOIN #sessions t ON ta.SessionId = t.SessionId AND ta.StatusId = 1;
		END
		ELSE IF UPPER(@ExporterType) = 'PRODUCTDESCRIPTIONS' BEGIN
			UPDATE p
			SET StatusId = @FailedStatus
			FROM dbo.FeedExportProductDescriptions p
			JOIN #sessions t ON p.SessionId = t.SessionId AND p.StatusId = 1;
		END
		ELSE IF UPPER(@ExporterType) = 'PRODUCTATTRIBUTES' BEGIN
			UPDATE a
			SET StatusId = @FailedStatus
			FROM dbo.FeedExportProductAttributes a
			JOIN #sessions t ON a.SessionId = t.SessionId AND a.StatusId = 1;
		END
		ELSE BEGIN
			RAISERROR('Unknown ExporterType', 16, 1);
		END

		UPDATE l
		SET EndDatetime = @endDate, StatusId = @FailedStatus, StatusMessage = 'RestartInitialize: Records updated to Failed'
		FROM dbo.FeedExportSessionLog l
		JOIN #sessions t  ON t.SessionId = l.SessionId

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage varchar(MAX);

		SELECT @ErrorMessage = 'ErrorMessage: ' + ERROR_MESSAGE() + '; ErrorNumber: ' + CAST(ERROR_NUMBER() AS VARCHAR) + '; ErrorSeverity: ' + CAST(ERROR_SEVERITY() AS VARCHAR) + '; ErrorLine: ' + CAST(ERROR_LINE() AS VARCHAR)
		RAISERROR(@ErrorMessage, 16, 1);

		RETURN;
	END CATCH;

END;
GO

GRANT EXECUTE ON [dbo].[exporter_RestartInitialize] TO [FeedsExporter]; 
GO