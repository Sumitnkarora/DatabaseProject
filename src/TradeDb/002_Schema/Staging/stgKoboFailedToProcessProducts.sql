CREATE TABLE [dbo].[stgKoboFailedToProcessProducts](
	[EbookID] [varchar](36) NULL, 
    [Reason] VARCHAR(500) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboFailedToProcessProducts] TO [KoboImporterApp];
GO