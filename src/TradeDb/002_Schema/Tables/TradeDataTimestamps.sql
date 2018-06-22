CREATE TABLE [dbo].[TradeDataTimestamps]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorId] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[DateCreated]                               DATETIME      DEFAULT (getdate()) NOT NULL
,	[DateChanged]                               DATETIME      DEFAULT (getdate()) NOT NULL
,	[DateChangedDiscount]                       DATETIME      NULL
,	[DateChangedItemPrice]                      DATETIME      NULL
,	[DateChangedItemPriceCurrency]              DATETIME      NULL
,	[DateChangedCanadianTitle]                  DATETIME      NULL
,	[DateChangedEditionNumber]                  DATETIME      NULL
,	[DateChangedEditionDescription]             DATETIME      NULL
,	[DateChangedMeasurementUnits]               DATETIME      NULL
,	[DateChangedWeightUnits]                    DATETIME      NULL
,	[DateChangedCartonQuantity]                 DATETIME      NULL
,	[DateChangedTitle]                          DATETIME      NULL
,	[DateChangedContributor1]                   DATETIME      NULL
,	[DateChangedISBN13]                         DATETIME      NULL
,	[DateChangedImprint]                        DATETIME      NULL
,	[DateChangedOPDate]                         DATETIME      NULL
,	[DateChangedStreetDate]                     DATETIME      NULL
,	[DateChangedStatusCode]                     DATETIME      NULL
,	[DateChanged_ForeignVendCADRetail]          DATETIME      NULL
,	[DateChanged_USDRetailPrice]                DATETIME      NULL
,	[DateChangedPubDate]                        DATETIME      NULL
,	[DateChangedVSRCode]                        DATETIME      NULL
,	[DateChangedReturnFormat]                   DATETIME      NULL
,	[DateChangedClassOfTradeCode]               DATETIME      NULL
,	[DateChangedPaperCertificationType]         DATETIME      NULL
,	[DateChangedChainofCustody]                 DATETIME      NULL
,	[DateChangedCertifiedPostConsumerWaste_PCW] DATETIME      NULL
,	[DateChangedCertifiedPCWPercentage]         DATETIME      NULL
,	[DateChangedUncertifiedPCW]                 DATETIME      NULL
,	[DateChangedUncertifiedPCWPercentage]       DATETIME      NULL
,   [DateChangedSeries]                         DATETIME      NULL 
,   [DateChangedContributorAny]                 DATETIME      NULL 
,   [DateChangedAwards]                         DATETIME      NULL 

,   CONSTRAINT [PK_TradeDataTimestamps] PRIMARY KEY NONCLUSTERED ([ISBN13], [SAPVendorId], [VSRCode])
,	CONSTRAINT [PK_TradeDataTimestamps_TradeCoreAttributes] FOREIGN KEY ([ISBN13], [SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes] ([ISBN13], [SAPVendorId], [VSRCode]) ON DELETE CASCADE
);
GO

ALTER TABLE [dbo].[TradeDataTimestamps] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO