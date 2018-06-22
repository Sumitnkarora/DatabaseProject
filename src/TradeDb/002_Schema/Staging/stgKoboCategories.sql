CREATE TABLE [dbo].[stgKoboCategories](
	[EBookID] [varchar](36) NOT NULL,
	[BISAC] [varchar](255) NULL,
	[BISACOrdinal] [int] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboCategories_EBookID] ON [dbo].[stgKoboCategories] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboCategories] TO [KoboImporterApp];
GO