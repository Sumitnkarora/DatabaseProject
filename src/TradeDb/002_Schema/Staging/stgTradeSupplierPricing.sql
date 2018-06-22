CREATE TABLE [dbo].[stgTradeSupplierPricing]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[SupplierId] TINYINT NOT NULL
,	[PriceType] VARCHAR(2) NOT NULL
,	[Currency] VARCHAR(3) NULL
,	[DiscountType] VARCHAR(2) NULL
,	[DiscountTypeName] VARCHAR(255) NULL
,	[DiscountValue] VARCHAR(255) NULL
,	[Price] VARCHAR(20) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeSupplierPricing TO OnixImportApp;
GO