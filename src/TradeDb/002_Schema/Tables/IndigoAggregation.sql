CREATE TABLE [dbo].[IndigoAggregation](
	[ISBN13] VARCHAR(13) NOT NULL,
	[CompetitorAggregationID] [varchar](32) NULL,
	[BowkerWorkID] [int] NULL,
	[IndigoAggregationId] [varchar](32) NOT NULL,
	[DateChanged] [datetime] NOT NULL,
	[PID] DECIMAL(12) NULL, 
    CONSTRAINT [PK_IndigoAggregation] PRIMARY KEY CLUSTERED 
(
	[ISBN13] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE NONCLUSTERED INDEX [IX_IndigoAggregation_IndigoAggregationId] ON [dbo].[IndigoAggregation] ([IndigoAggregationId])
GO

ALTER TABLE [dbo].[IndigoAggregation] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO