CREATE TABLE [dbo].[stgBowkerPrize](
	[RecordReference] [varchar](32) NULL,
	[PrizeName] [nvarchar](100) NULL,
	[PrizeYear] [char](4) NULL,
	[PrizeCountry] [char](2) NULL,
	[PrizeCode] [char](2) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerPrize] TO [BowkerApp];
GO