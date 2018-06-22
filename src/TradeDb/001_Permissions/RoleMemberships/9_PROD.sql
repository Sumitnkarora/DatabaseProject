--Create Users
IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'OnixImporterProd' )
	BEGIN
		CREATE USER OnixImporterProd FROM LOGIN OnixImporterProd
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'OnixParserProd' )
	BEGIN
		CREATE USER OnixParserProd FROM LOGIN OnixParserProd
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImportProd' )
	BEGIN
		CREATE USER TwrImportProd FROM LOGIN TwrImportProd
	END
	
IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrTDExporterProd' )
	BEGIN
		CREATE USER TwrTDExporterProd FROM LOGIN TwrTDExporterProd
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImageExportProd' )
	BEGIN
		CREATE USER TwrImageExportProd FROM LOGIN TwrImageExportProd
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImageImportProd' )
	BEGIN
		CREATE USER TwrImageImportProd FROM LOGIN TwrImageImportProd
	END

EXEC sys.sp_addrolemember @rolename = OnixImportApp , @membername = OnixImporterProd
EXEC sys.sp_addrolemember @rolename = OnixParserApp , @membername = OnixParserProd
EXEC sys.sp_addrolemember @rolename = TwrImportApp , @membername = TwrImportProd
EXEC sys.sp_addrolemember @rolename = TWRExporter , @membername = TwrTDExporterProd
EXEC sys.sp_addrolemember @rolename = TwrImageExportApp , @membername = TwrImageExportProd
EXEC sys.sp_addrolemember @rolename = TwrImageImportApp , @membername = TwrImageImportProd