CREATE PROCEDURE uspCleanupStgTradeBronteCore
--WITH EXECUTE AS OWNER -- this line should be reintroduced when them proper permissions are set in Azure  
AS
   truncate table stgTradeBronteCore
GO

GRANT EXECUTE ON [dbo].[uspCleanupStgTradeBronteCore] TO [CoreFileImporterApp]; 
GO