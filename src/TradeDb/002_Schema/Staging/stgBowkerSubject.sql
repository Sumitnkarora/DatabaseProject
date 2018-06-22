CREATE TABLE [dbo].[stgBowkerSubject](
	[RecordReference] [varchar](32) NULL,
	[SubjectSchemeIdentifier] [char](2) NULL,
	[SubjectCode] [varchar](100) NULL,
	[SubjectHeadingText] [nvarchar](500) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerSubject] TO [BowkerApp];
GO