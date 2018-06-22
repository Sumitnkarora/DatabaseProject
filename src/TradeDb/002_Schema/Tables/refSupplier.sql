CREATE TABLE [dbo].[refSupplier]
(
	[Id] INT NOT NULL IDENTITY(1, 1)
,	[SupplierName] NVARCHAR(128) NOT NULL
,	[SAPVendorId] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[TransferType] VARCHAR(4) NOT NULL
,	[ServerName] NVARCHAR(255) NOT NULL
,	[Username] NVARCHAR(255) NOT NULL
,	[Password] NVARCHAR(255) NOT NULL
,	[FolderName] NVARCHAR(MAX) NOT NULL
,	[FilePattern] NVARCHAR(255) NOT NULL
,	CONSTRAINT [PK_refSupplier] PRIMARY KEY ([Id])
,	CONSTRAINT [FK_refSupplier_TradeVendors] FOREIGN KEY([SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeVendors]([SAPVendorId], [VSRCode])
);
GO

GRANT SELECT, REFERENCES ON refSupplier TO OnixParserApp;
GO