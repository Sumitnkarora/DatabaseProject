CREATE TABLE [dbo].[TradeSupplierPricing]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[SupplierId] TINYINT NOT NULL
,	[PriceType] CHAR(2) NOT NULL
,	[Currency] VARCHAR(3) NULL
,	[DiscountType] CHAR(2) NULL
,	[DiscountTypeName] VARCHAR(255) NULL
,	[DiscountValue] VARCHAR(255) NULL
,	[Price] MONEY NULL
,	CONSTRAINT [PK_TradeSupplierPricing] PRIMARY KEY CLUSTERED ([ISBN13] ASC, [SAPVendorID] ASC, [VSRCode] ASC, [SupplierId] ASC)
,	CONSTRAINT [FK_TradeSupplierPricing_TradeCoreAttributes] FOREIGN KEY([ISBN13], [SAPVendorID], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes]([ISBN13], [SAPVendorID], [VSRCode]) ON DELETE CASCADE
,	CONSTRAINT [FK_TradeSupplierPricing_refSupplierPriceType] FOREIGN KEY([PriceType]) REFERENCES [dbo].[refSupplierPriceType]([Id])
,	CONSTRAINT [FK_TradeSupplierPricing_refSupplierDiscountType] FOREIGN KEY([DiscountType]) REFERENCES [dbo].[refSupplierDiscountType]([Id])
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeSupplierPricing TO OnixImportApp;
GO