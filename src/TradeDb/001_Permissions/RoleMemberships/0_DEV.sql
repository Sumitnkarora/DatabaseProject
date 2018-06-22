--Create Users
IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'OnixImporterDev' )
	BEGIN
		CREATE USER OnixImporterDev FROM LOGIN OnixImporterDev
	END
	
IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'OnixParserDev' )
	BEGIN
		CREATE USER OnixParserDev FROM LOGIN OnixParserDev
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImportDev' )
	BEGIN
		CREATE USER TwrImportDev FROM LOGIN TwrImportDev
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrTDExporterDev' )
	BEGIN
		CREATE USER TwrTDExporterDev FROM LOGIN TwrTDExporterDev
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImageExportDev' )
	BEGIN
		CREATE USER TwrImageExportDev FROM LOGIN TwrImageExportDev
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImageImportDev' )
	BEGIN
		CREATE USER TwrImageImportDev FROM LOGIN TwrImageImportDev
	END

EXEC sys.sp_addrolemember @rolename = OnixImportApp , @membername = OnixImporterDev
EXEC sys.sp_addrolemember @rolename = OnixParserApp , @membername = OnixParserDev
EXEC sys.sp_addrolemember @rolename = TwrImportApp , @membername = TwrImportDev
EXEC sys.sp_addrolemember @rolename = TWRExporter , @membername = TwrTDExporterDev
EXEC sys.sp_addrolemember @rolename = TwrImageExportApp , @membername = TwrImageExportDev
EXEC sys.sp_addrolemember @rolename = TwrImageImportApp , @membername = TwrImageImportDev