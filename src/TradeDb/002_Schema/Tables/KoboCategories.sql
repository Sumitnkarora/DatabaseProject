CREATE TABLE [dbo].[KoboCategories](
	[EBookID] [varchar](36) NOT NULL,
	[BISAC] [varchar](255) NULL,
	[BISACOrdinal] [int] NOT NULL,
	[DateChanged] [datetime] NULL,
 CONSTRAINT [PK_KoboCategories] PRIMARY KEY CLUSTERED 
(
	[EBookID] ASC,
	[BISACOrdinal] ASC
)
)
GO

ALTER TABLE [dbo].[KoboCategories] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
