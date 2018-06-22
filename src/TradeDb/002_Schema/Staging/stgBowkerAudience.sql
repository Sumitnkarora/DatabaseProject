CREATE TABLE [dbo].[stgBowkerAudience](
	[RecordReference] [varchar](32) NULL,
	[AudienceCode] [char](2) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerAudience] TO [BowkerApp];
GO