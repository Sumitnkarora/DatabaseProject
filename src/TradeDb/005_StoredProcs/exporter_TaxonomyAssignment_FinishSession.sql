/* =============================================
 Author:		Irene Kondryna
 Create date:	November 7, 2017
 Parameters:	SessionId
				StatusId
				ErrorMessage
 Description:	Finalizes export batch - deletes successfully prossed records or updates status to Failed
		
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_TaxonomyAssignment_FinishSession]
	@SessionId uniqueidentifier,
	@ExportStatusId tinyint,
	@StatusMessage varchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @now as datetime
	SET @now = GETDATE();

	BEGIN TRY
		DECLARE @Session TABLE(sessionId uniqueidentifier); 

		-- Session succeeded
		IF (@ExportStatusId = 2)
		BEGIN
			DELETE FROM FeedExportTaxonomyAssignment 
			OUTPUT deleted.SessionId INTO @Session
			WHERE SessionId = @SessionId AND StatusId = 1
		END
		ELSE
		BEGIN
			UPDATE s
			SET StatusId = @ExportStatusId
			OUTPUT inserted.SessionId INTO @Session
			FROM FeedExportTaxonomyAssignment s
			WHERE s.SessionId = @SessionId AND s.StatusId = 1
		END

		DECLARE @RecordsCount int;
		SELECT @RecordsCount = COUNT(sessionId) FROM @Session

		DECLARE @InvalidCount int;
		SET @InvalidCount = 0;
		IF @RecordsCount > 0
		BEGIN
			SELECT @InvalidCount = COUNT(DISTINCT i.ProductSku) 
			FROM FeedExportTaxonomyAssignmentInvalid i WITH (NOLOCK) 
			WHERE i.SessionId = @SessionId;
		END
		
		UPDATE l
		SET EndDatetime = @now, StatusId = @ExportStatusId, RecordsCount = @RecordsCount, RecordsInvalidCount = @InvalidCount, StatusMessage = @StatusMessage
		FROM FeedExportSessionLog l
		WHERE SessionId = @SessionId

	END TRY
	BEGIN CATCH

		SET @StatusMessage = 'ErrorMessage: ' + ERROR_MESSAGE() + '; ErrorNumber: ' + CAST(ERROR_NUMBER() AS VARCHAR) + '; ErrorSeverity: ' + CAST(ERROR_SEVERITY() AS VARCHAR) + '; ErrorLine: ' + CAST(ERROR_LINE() AS VARCHAR) + '; Exception: ' + @StatusMessage

		-- We have an error, so we set the StatusId to failed
		UPDATE l
		SET EndDatetime = @now, StatusId = 3, RecordsCount = 0, StatusMessage = @StatusMessage
		FROM FeedExportSessionLog l
		WHERE SessionId = @SessionId
	END CATCH
END
GO

GRANT EXECUTE ON [dbo].[exporter_TaxonomyAssignment_FinishSession] TO [FeedsExporter]; 
GO