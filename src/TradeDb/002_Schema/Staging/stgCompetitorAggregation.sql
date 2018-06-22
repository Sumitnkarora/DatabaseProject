CREATE TABLE [dbo].[stgCompetitorAggregation](
	[Isbn10] [varchar](13) NOT NULL,
	[Isbn13] [varchar](13) NULL,
	[AggregatedSKUList] [varchar](MAX) NULL
) ON [PRIMARY]
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgCompetitorAggregation] TO [AggregationImporterApp];
GO