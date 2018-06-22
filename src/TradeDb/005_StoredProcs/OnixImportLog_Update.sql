CREATE PROCEDURE OnixImportLog_Update
@ID int,
@ProcessStatus tinyint
AS
BEGIN
	UPDATE OnixImportLog
	SET
		ProcessStatus = @ProcessStatus,
		ProcessEnd = CASE WHEN @ProcessStatus = 3 OR @ProcessStatus = 9 THEN SYSDATETIME() ELSE NULL END
	WHERE ID = @ID;
END
GO

GRANT EXECUTE ON OnixImportLog_Update TO OnixImportApp;
GO