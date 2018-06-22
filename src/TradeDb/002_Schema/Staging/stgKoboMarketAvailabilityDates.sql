CREATE TABLE [dbo].[stgKoboMarketAvailabilityDates](
	[EBookID] [varchar](36) NOT NULL,
	[Region] [varchar](2) NULL ,
	[PreOrder] [datetime] NULL,
	[GeneralAvailability] [datetime] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboMarketAvailabilityDates_EBookID] ON [dbo].[stgKoboMarketAvailabilityDates] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboMarketAvailabilityDates] TO [KoboImporterApp];
GO