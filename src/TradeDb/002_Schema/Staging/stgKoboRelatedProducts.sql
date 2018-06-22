CREATE TABLE [dbo].[stgKoboRelatedProducts](
	[EBookID] [varchar](36) NOT NULL,
	[ISBN] [varchar](36) NULL,
	[Relation] [varchar](50) NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboRelatedProducts_EBookID] ON [dbo].[stgKoboRelatedProducts] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboRelatedProducts] TO [KoboImporterApp];
GO