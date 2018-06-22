/* =============================================
 Author:		Irene Kondryna
 Create date:	November 7, 2017
 Parameters:	SessionId
				StatusId
				ErrorMessage
 Description:	Finalizes export batch - deletes successfully prossed records or updates status to Failed
		
 Revision history:
				Feb 15, 2018 - Raymond Chan 
				Add NoLock when selecting count from invalid table
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_Contributors_FinishSession]
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
			DELETE FROM FeedExportContributors 
			OUTPUT deleted.SessionId INTO @Session
			WHERE SessionId = @SessionId AND StatusId = 1
		END
		ELSE
		BEGIN
			UPDATE s
			SET StatusId = @ExportStatusId
			OUTPUT inserted.SessionId INTO @Session
			FROM FeedExportContributors s
			WHERE s.SessionId = @SessionId AND s.StatusId = 1
		END

		DECLARE @RecordsCount int;
		SELECT @RecordsCount = COUNT(sessionId) FROM @Session
		
		DECLARE @InvalidCount int;
		SET @InvalidCount = 0;
		IF @RecordsCount > 0
		BEGIN
			SELECT @InvalidCount = COUNT(*) FROM 
			(SELECT ContributorId FROM FeedExportContributorsInvalid WITH (NOLOCK)
			 WHERE SessionId = @SessionId
			 GROUP BY ContributorId, EBookID, ContributorOrdinal) AS Invalid;
		END

		UPDATE l
		SET EndDatetime = @now, StatusId = @ExportStatusId, RecordsCount = @RecordsCount, RecordsInvalidCount = @InvalidCount, StatusMessage = @StatusMessage
		FROM FeedExportSessionLog l
		WHERE SessionId = @SessionId
	END TRY
	BEGIN CATCH

		SET @StatusMessage = 'ErrorMessage: ' + ERROR_MESSAGE() + '; ErrorNumber: ' + CAST(ERROR_NUMBER() AS VARCHAR) + '; ErrorSeverity: ' + CAST(ERROR_SEVERITY() AS VARCHAR)  + '; ErrorLine: ' + CAST(ERROR_LINE() AS VARCHAR)  + '; Exception: ' + @StatusMessage

		-- We have an error, so we set the StatusId to failed
		UPDATE l
		SET EndDatetime = @now, StatusId = 3, RecordsCount = 0, StatusMessage = @StatusMessage
		FROM FeedExportSessionLog l
		WHERE SessionId = @SessionId
	END CATCH
END
GO

GRANT EXECUTE ON [dbo].[exporter_Contributors_FinishSession] TO [FeedsExporter]; 
GO