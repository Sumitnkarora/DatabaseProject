CREATE TABLE [dbo].[stgBowkerWorkIdentifier](
	[RecordReference] [varchar](32) NULL,
	[WorkIDType] [char](2) NULL,
	[IDValue] [varchar](100) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerWorkIdentifier] TO [BowkerApp];
GO