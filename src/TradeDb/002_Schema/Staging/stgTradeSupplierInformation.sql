CREATE TABLE [dbo].[stgTradeSupplierInformation]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[SupplierId] TINYINT NOT NULL
,	[SupplierName] NVARCHAR(128) NOT NULL
,	[SupplierRole] VARCHAR(2) NULL
,	[ReturnConditionType] VARCHAR(2) NULL
,	[ReturnConditionCode] VARCHAR(2) NULL
,	[AvailabilityCode] VARCHAR(2) NULL
,	[AvailabilityOldCode] VARCHAR(2) NULL
,	[OnSaleDate] VARCHAR(50) NULL
,	[CartonQty] VARCHAR(20) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeSupplierInformation TO OnixImportApp;
GO