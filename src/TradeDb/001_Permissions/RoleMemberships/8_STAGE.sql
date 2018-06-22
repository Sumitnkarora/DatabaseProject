--Create Users
IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'OnixImporterStage' )
	BEGIN
		CREATE USER OnixImporterStage FROM LOGIN OnixImporterStage
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'OnixParserStage' )
	BEGIN
		CREATE USER OnixParserStage FROM LOGIN OnixParserStage
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImportStage' )
	BEGIN
		CREATE USER TwrImportStage FROM LOGIN TwrImportStage
	END
	
IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrTDExporterStage' )
	BEGIN
		CREATE USER TwrTDExporterStage FROM LOGIN TwrTDExporterStage
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImageExportStage' )
	BEGIN
		CREATE USER TwrImageExportStage FROM LOGIN TwrImageExportStage
	END

IF NOT EXISTS ( SELECT TOP 1 1 FROM sys.sysusers WHERE name = 'TwrImageImportStage' )
	BEGIN
		CREATE USER TwrImageImportStage FROM LOGIN TwrImageImportStage
	END

EXEC sys.sp_addrolemember @rolename = OnixImportApp , @membername = OnixImporterStage
EXEC sys.sp_addrolemember @rolename = OnixParserApp , @membername = OnixParserStage
EXEC sys.sp_addrolemember @rolename = TwrImportApp , @membername = TwrImportStage
EXEC sys.sp_addrolemember @rolename = TWRExporter , @membername = TwrTDExporterStage
EXEC sys.sp_addrolemember @rolename = TwrImageExportApp , @membername = TwrImageExportStage
EXEC sys.sp_addrolemember @rolename = TwrImageImportApp , @membername = TwrImageImportStage