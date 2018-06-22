CREATE TABLE [dbo].[KoboMarketAvailabilityDates](
	[EBookID] [varchar](36) NOT NULL,
	[Region] [varchar](2) NULL,
	[PreOrder] [datetime] NULL,
	[GeneralAvailability] [datetime] NULL,
	[DateChanged] [datetime] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboMarketAvailabilityDates_EBookID] ON [dbo].[KoboMarketAvailabilityDates] ([EBookID]) WITH (FILLFACTOR=90);
