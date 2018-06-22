﻿CREATE TABLE [dbo].[CompetitorAggregation](
	[ISBN13] VARCHAR(13) NOT NULL,
	[Sku] [varchar](13) NOT NULL,
	[AggregationId] [varchar](32) NULL,
	[DateChanged] [datetime] NOT NULL,
	[PID] DECIMAL(12) NULL, 
    CONSTRAINT [PK_CompetitorAggregation] PRIMARY KEY CLUSTERED 
(
	[ISBN13] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]