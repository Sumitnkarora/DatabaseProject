CREATE PROCEDURE dbo.spUpdateExportedItemStatus
(
	@ISBN13 VARCHAR(13)
)
AS
BEGIN

	UPDATE TradeDataExport SET ExportStatus = CASE WHEN ExportStatus = 1 THEN 2 WHEN ExportStatus = 5 THEN 6 END, DateItemLastExported = GETDATE()
	WHERE ISBN13=@ISBN13

END

GO

GRANT EXECUTE ON dbo.spUpdateExportedItemStatus TO  [TWRExporter];
