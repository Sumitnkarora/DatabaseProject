CREATE PROCEDURE OnixImportClearErrors
AS
BEGIN
DELETE [OnixImportErrors] WHERE DateCreated < DATEADD(week,-2,GETDATE());
END
GO

GRANT EXECUTE ON OnixImportClearErrors TO OnixImportApp;
GO