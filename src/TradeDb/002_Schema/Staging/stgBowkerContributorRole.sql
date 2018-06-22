CREATE TABLE [dbo].[stgBowkerContributorRole](
	[RecordReference] [varchar](32) NULL,
	[SequenceNumber] [varchar](3) NULL,
	[ContributorRole] [varchar](50) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerContributorRole] TO [BowkerApp];
GO