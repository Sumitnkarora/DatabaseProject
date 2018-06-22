CREATE TABLE [dbo].[TradeCollectionData]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorId] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[Ordinal] TINYINT NOT NULL
,	[CollectionId] INT NOT NULL
,	[CollectionIndex] INT NULL

,	CONSTRAINT [PK_TradeCollectionData] PRIMARY KEY CLUSTERED ([ISBN13], [SAPVendorId], [VSRCode], [Ordinal])
,	CONSTRAINT [FK_TradeCollectionData_TradeCoreAttributes] FOREIGN KEY ([ISBN13], [SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes]([ISBN13], [SAPVendorId], [VSRCode]) ON DELETE CASCADE
,	CONSTRAINT [FK_TradeCollectionData_TradeCollections] FOREIGN KEY ([CollectionId]) REFERENCES [dbo].[TradeCollections]([CollectionId])
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeCollectionData TO OnixImportApp;
GO