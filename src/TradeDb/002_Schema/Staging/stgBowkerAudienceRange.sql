CREATE TABLE [dbo].[stgBowkerAudienceRange](
	[RecordReference] [varchar](32) NULL,
	[RangesXML] [varchar](500) NULL,
	[AudienceRangeQualifier] [char](2) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerAudienceRange] TO [BowkerApp];
GO