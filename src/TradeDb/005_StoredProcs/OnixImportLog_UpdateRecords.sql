CREATE PROCEDURE OnixImportLog_UpdateRecords
@ID int,
@RecordsTotal int null,
@RecordsProcessed int null,
@RecordsError int null
AS
BEGIN
	UPDATE OnixImportLog
	SET
		RecordsTotal = @RecordsTotal,
		RecordsProcessed = @RecordsProcessed,
		RecordsError = @RecordsError
	WHERE ID = @ID;
END
GO

GRANT EXECUTE ON OnixImportLog_UpdateRecords TO OnixImportApp;
GO