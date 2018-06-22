CREATE TABLE [dbo].[KoboContributors](
	[EBookID] [varchar](36) NOT NULL,
	[ContributorName] [nvarchar](255) NULL,
	[ContributorType] [varchar](255) NULL,
	[ContributorOrdinal] [int] NOT NULL,
	[DateChanged] [datetime] NULL,
 CONSTRAINT [PK_KoboContributors] PRIMARY KEY CLUSTERED 
(
	[EBookID] ASC,
	[ContributorOrdinal] ASC
)
)
GO
ALTER TABLE [dbo].[KoboContributors] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

GO