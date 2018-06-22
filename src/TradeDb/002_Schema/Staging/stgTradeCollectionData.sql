CREATE TABLE [dbo].[stgTradeCollectionData]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[Ordinal] TINYINT NOT NULL
,	[CollectionId] INT NOT NULL
,	[CollectionIndex] VARCHAR(20) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeCollectionData TO OnixImportApp;
GO