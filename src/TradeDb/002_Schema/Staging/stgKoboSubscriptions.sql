CREATE TABLE [dbo].[stgKoboSubscriptions](
	[EBookID] [varchar](36) NOT NULL,
	[Region] [varchar](2) NULL, 
	[From] [datetime] NULL,
	[To] [datetime] NULL,
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboSubscriptions_EBookID] ON [dbo].[stgKoboSubscriptions] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboSubscriptions] TO [KoboImporterApp];
GO