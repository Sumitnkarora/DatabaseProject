CREATE TABLE [dbo].[TradeIndigoAttributes]
(
	[SAPVendorId]                               VARCHAR (20)  NOT NULL,
    [VSRCode]                                   VARCHAR (20)  NOT NULL,
	[ISBN13]                                    VARCHAR (13)  NOT NULL,
	[ItemCost]                                  money NOT NULL,
	[CostOverridden]                            bit NOT NULL DEFAULT 0,
	[SourcePrice]                               money NOT NULL,
	[ListPriceOverridden]                       bit NOT NULL DEFAULT 0,
	[AdjustedPriceOverridden]                   bit NOT NULL DEFAULT 0,
	[AdjustedPrice]                             money NOT NULL,
	[CostFactorID]								VARCHAR (3) NULL,
	[IsDeleted]                                 bit NOT NULL,
	IsSearchable                                BIT NOT NULL,
	IsPreview                                   BIT NOT NULL,
	IsFreeShipEligible                          BIT NULL,
	IsMITEligible                               BIT NULL,
	IsRushEligible                              BIT NULL,
	OnlineMarkdownPrice                         money NULL,
	CONSTRAINT [PK_TradeIndigoAttributes] PRIMARY KEY NONCLUSTERED (ISBN13, SAPVendorId, VSRCode),
    CONSTRAINT [FK_TradeIndigoAttributes_TradeCoreAttributes] FOREIGN KEY(ISBN13,[SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes](ISBN13,[SAPVendorId], [VSRCode])
);
GO

ALTER TABLE [dbo].[TradeIndigoAttributes] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO
