/* =============================================
 Author:		Irene Kondryna
 Create date:	November 15, 2017

 Description:	Gets sequential guid for new export session, inserts new session into FeedExportSessionLog and returns Unique SessionId

 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_StartSession]
	@ExporterName varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		DECLARE @newIds TABLE (UniqueId uniqueidentifier)

		INSERT INTO dbo.FeedExportSessionLog (ExporterName, StartDatetime, StatusId) 
		OUTPUT inserted.SessionId INTO @newIds
		VALUES (@ExporterName, GETDATE(), 1);

		SELECT TOP 1 UniqueId FROM @newIds;
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage varchar(MAX);

		SELECT @ErrorMessage = 'ErrorMessage: ' + ERROR_MESSAGE() + '; ErrorNumber: ' + ERROR_NUMBER() + '; ErrorSeverity: ' + ERROR_SEVERITY() + '; ErrorLine: ' + ERROR_LINE()
		RAISERROR(@ErrorMessage, 16, 1);

		RETURN;
	END CATCH

END
GO

GRANT EXECUTE ON [dbo].[exporter_StartSession] TO [FeedsExporter]; 
GO