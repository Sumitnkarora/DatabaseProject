CREATE TABLE [dbo].[stgTradeVendorsNoVSR]
(
	[LegacyId] VARCHAR(12) NULL
,	[SAPVendorId] VARCHAR(12) NOT NULL
,	[SAPVendorName] VARCHAR(158) NOT NULL
,	[VendorName] VARCHAR(100) NOT NULL
,	[BlockIndicator] CHAR(1) NULL
,	[CurrencyTypeId] VARCHAR(50) NULL
);
