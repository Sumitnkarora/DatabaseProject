CREATE TABLE [dbo].[stgTradeCollections]
(
	[CollectionId] INT NOT NULL
,	[CollectionType] VARCHAR(16) NOT NULL
,	[CollectionTitle] NVARCHAR(MAX) NOT NULL
,	[CollectionTotalItems] INT NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeCollections TO OnixImportApp;
GO