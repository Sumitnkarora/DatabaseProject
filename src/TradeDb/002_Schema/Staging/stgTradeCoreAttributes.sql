CREATE TABLE [dbo].[stgTradeCoreAttributes]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[ProductForm] VARCHAR(2) NULL
,	[ProductFormDetail] VARCHAR(4) NULL
,	[Title] NVARCHAR(MAX) NOT NULL
,	[Subtitle] NVARCHAR(MAX) NULL
,	[AudienceCode] VARCHAR(2) NULL
,	[PublishingStatus] VARCHAR(2) NOT NULL
,	[PublicationDate] VARCHAR(50) NULL
,	[PrimaryLanguage] VARCHAR(50) NULL
,	[AllLanguages] VARCHAR(MAX) NULL
,	[Length] VARCHAR(20) NULL
,	[Width] VARCHAR(20) NULL
,	[Depth] VARCHAR(20) NULL
,	[UnitOfMeasurement] VARCHAR(3) NULL
,	[Weight] VARCHAR(20) NULL
,	[UnitOfWeight] VARCHAR(3) NULL
,	[Publisher] NVARCHAR(100) NULL
,	[Imprint] NVARCHAR(100) NULL
,	[Organizations] NVARCHAR(MAX) NULL
,	[ListPrice] VARCHAR(20) NOT NULL
,	[Currency] VARCHAR(3) NOT NULL
,	[DiscountType] CHAR(2) NULL
,	[DiscountValue] VARCHAR(255) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeCoreAttributes TO OnixImportApp;
GO