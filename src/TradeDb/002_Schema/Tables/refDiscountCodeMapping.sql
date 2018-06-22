CREATE TABLE [dbo].[refDiscountCodeMapping]
(
	[Id] INT NOT NULL IDENTITY(1, 1) PRIMARY KEY
,	[SAPVendorId] VARCHAR(20) NOT NULL
,	[DiscountCodeType] CHAR(2) NULL
,	[DiscountCodeValue] VARCHAR(255) NULL
,	[Discount] DECIMAL(9, 5) NOT NULL
,	CONSTRAINT [FK_refDiscountCodeMapping_refSupplierDiscountType] FOREIGN KEY([DiscountCodeType]) REFERENCES [dbo].[refSupplierDiscountType]([Id])
);
GO

GRANT SELECT, REFERENCES ON refDiscountCodeMapping TO OnixImportApp;
GO