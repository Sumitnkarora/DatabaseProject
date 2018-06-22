CREATE TABLE [dbo].[stgBowkerContributor](
	[RecordReference] [varchar](32) NULL,
	[SequenceNumber] [varchar](3) NULL,
	[CorporateName] [nvarchar](200) NULL,
	[PersonNameInverted] [nvarchar](500) NULL,
	[NamesBeforeKey] [nvarchar](100) NULL,
	[KeyNames] [nvarchar](100) NULL,
	[SuffixToKey] [nvarchar](100) NULL,
	[BiographicalNote] [ntext] NULL,
	[ContributorDescription] [nvarchar](200) NULL,
	[UnnamedPersons] [char](2) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerContributor] TO [BowkerApp];
GO