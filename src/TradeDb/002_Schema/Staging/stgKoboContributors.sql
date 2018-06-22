CREATE TABLE [dbo].[stgKoboContributors](
	[EBookID] [varchar](36) NOT NULL,
	[ContributorType] [varchar](255) NULL,
	[ContributorOrdinal] [int] NULL,
	[ContributorName] [nvarchar](255) NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboContributors_EBookID] ON [dbo].[stgKoboContributors] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboContributors] TO [KoboImporterApp];
GO