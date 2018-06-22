CREATE PROCEDURE [dbo].[spTradeBooksCleanupStaging]
AS
BEGIN
	TRUNCATE TABLE [dbo].[stgTradeBooks];
	TRUNCATE TABLE [dbo].[stgTradeBooksImport];
END;
GO

GRANT EXECUTE ON [dbo].[spTradeBooksCleanupStaging] TO [TradeBooksApp];
GO