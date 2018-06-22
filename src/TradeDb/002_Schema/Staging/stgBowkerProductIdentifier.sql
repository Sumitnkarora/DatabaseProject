CREATE TABLE [dbo].[stgBowkerProductIdentifier](
	[RecordReference] [varchar](32) NULL,
	[ProductIDType] [char](2) NULL,
	[IDTypeName] [nvarchar](350) NULL,
	[IDValue] [nvarchar](100) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerProductIdentifier] TO [BowkerApp];
GO