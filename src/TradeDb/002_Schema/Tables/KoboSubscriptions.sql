CREATE TABLE [dbo].[KoboSubscriptions](
	[EBookID] [varchar](36) NOT NULL,
	[Region] [varchar](2) NULL,
	[From] [datetime] NULL,
	[To] [datetime] NULL,
	[DateChanged] [datetime] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboSubscriptions_EBookID] ON [dbo].[KoboSubscriptions] ([EBookID]) WITH (FILLFACTOR=90);
