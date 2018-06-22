CREATE TABLE [dbo].[KoboRelatedProducts](
	[EBookID] [varchar](36) NOT NULL,
	[ISBN] [varchar](36) NULL,
	[Relation] [varchar](50) NULL,
	[DateChanged] [datetime] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboRelatedProducts_EBookID] ON [dbo].[KoboRelatedProducts] ([EBookID]) WITH (FILLFACTOR=90);