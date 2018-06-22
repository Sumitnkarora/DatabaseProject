CREATE TABLE [dbo].[TradeSupplierInformation]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[SupplierId] TINYINT NOT NULL
,	[SupplierName] NVARCHAR(128) NOT NULL
,	[SupplierRole] CHAR(2) NULL
,	[ReturnConditionType] CHAR(2) NULL
,	[ReturnConditionCode] CHAR(2) NULL
,	[AvailabilityCode] VARCHAR(2) NULL
,	[AvailabilityOldCode] VARCHAR(2) NULL
,	[OnSaleDate] DATETIME NULL
,	[CartonQty] INT NULL
,	CONSTRAINT [PK_TradeSupplierInformation] PRIMARY KEY CLUSTERED ([ISBN13] ASC, [SAPVendorID] ASC, [VSRCode] ASC, [SupplierId] ASC)
,	CONSTRAINT [FK_TradeSupplierInformation_TradeCoreAttributes] FOREIGN KEY([ISBN13], [SAPVendorID], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes]([ISBN13], [SAPVendorID], [VSRCode]) ON DELETE CASCADE
,	CONSTRAINT [FK_TradeSupplierInformation_refSupplierRole] FOREIGN KEY([SupplierRole]) REFERENCES [dbo].[refSupplierRole]([Id])
,	CONSTRAINT [FK_TradeSupplierInformation_refReturnConditionType] FOREIGN KEY([ReturnConditionType]) REFERENCES [dbo].[refReturnConditionType]([Id])
,	CONSTRAINT [FK_TradeSupplierInformation_refReturnConditionCode] FOREIGN KEY([ReturnConditionCode]) REFERENCES [dbo].[refReturnConditionCode]([Id])
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeSupplierInformation TO OnixImportApp;
GO