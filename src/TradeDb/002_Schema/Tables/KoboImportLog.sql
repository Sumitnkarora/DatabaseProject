CREATE TABLE [dbo].[KoboImportLog](
	[FileName] [nvarchar](255) NULL,
	[DateProcessed] [datetime] NULL
)
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[KoboImportLog] TO [KoboImporterApp];
GO