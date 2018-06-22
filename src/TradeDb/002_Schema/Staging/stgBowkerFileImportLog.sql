CREATE TABLE [dbo].[stgBowkerFileImportLog](
	[ImportDate] [datetime] NULL CONSTRAINT [DF_tbl_BowkerFileImportLog_ImportDate]  DEFAULT (getdate()),
	[FileName] [varchar](500) NULL,
	[Status] [varchar](10) NULL,
	[NumProducts] [int] NULL,
	[ErrorText] [varchar](8000) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerFileImportLog] TO [BowkerApp];
GO