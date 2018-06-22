CREATE TABLE [dbo].[stgTradeAlternateIdentifiers]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[ID] INT NOT NULL
,	[IdentifierType] VARCHAR(2) NOT NULL
,	[IdentifierValue] VARCHAR(50) NOT NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeAlternateIdentifiers TO OnixImportApp;
GO