CREATE TABLE [dbo].[TradeBooksFilesStat]
(
	[Id] INT IDENTITY(1,1),
	[FileName] [varchar](500) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime] NULL
)
GO

ALTER TABLE [dbo].[TradeBooksFilesStat] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[TradeBooksFilesStat] TO [TradeBooksApp];
GO