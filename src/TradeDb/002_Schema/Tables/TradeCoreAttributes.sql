CREATE TABLE [dbo].[TradeCoreAttributes]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[ProductForm] CHAR(2) NULL
,	[ProductFormDetail] CHAR(4) NULL
,	[Title] NVARCHAR(MAX) NOT NULL
,	[Subtitle] NVARCHAR(MAX) NULL
,	[AudienceCode] CHAR(2) NULL
,	[PublishingStatus] CHAR(2) NOT NULL
,	[PublicationDate] DATETIME NULL
,	[PrimaryLanguage] VARCHAR(50) NULL
,	[AllLanguages] VARCHAR(MAX) NULL
,	[Length] DECIMAL(9, 5) NULL
,	[Width] DECIMAL(9, 5) NULL
,	[Depth] DECIMAL(9, 5) NULL
,	[UnitOfMeasurement] VARCHAR(3) NULL
,	[Weight] DECIMAL(9, 5) NULL
,	[UnitOfWeight] VARCHAR(3) NULL
,	[Publisher] NVARCHAR(100) NULL
,	[Imprint] NVARCHAR(100) NULL
,	[Organizations] NVARCHAR(MAX) NULL
,	[ListPrice] MONEY NOT NULL
,	[Currency] VARCHAR(3) NOT NULL
,	[Discount] DECIMAL(9, 5) NOT NULL
,	CONSTRAINT [PK_TradeCoreAttributes] PRIMARY KEY CLUSTERED ([ISBN13] ASC, [SAPVendorID] ASC, [VSRCode] ASC)
,	CONSTRAINT [FK_TradeCoreAttributes_TradeVendors] FOREIGN KEY([SAPVendorID], [VSRCode]) REFERENCES [dbo].[TradeVendors]([SAPVendorID], [VSRCode])
,	CONSTRAINT [FK_TradeCoreAttributes_refProductForm] FOREIGN KEY([ProductForm]) REFERENCES [dbo].[refProductForm]([Id])
,	CONSTRAINT [FK_TradeCoreAttributes_refProductFormDetail] FOREIGN KEY([ProductFormDetail]) REFERENCES [dbo].[refProductFormDetail]([Id])
,	CONSTRAINT [FK_TradeCoreAttributes_refAudienceCode] FOREIGN KEY([AudienceCode]) REFERENCES [dbo].[refAudienceCode]([Id])
,	CONSTRAINT [FK_TradeCoreAttributes_refPublishingStatus] FOREIGN KEY([PublishingStatus]) REFERENCES [dbo].[refPublishingStatus]([Id])
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeCoreAttributes TO OnixImportApp;
GO