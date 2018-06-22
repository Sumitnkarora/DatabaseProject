CREATE TABLE [dbo].[TradeAlternateIdentifiers]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[ID] INT NOT NULL
,	[IdentifierType] CHAR(2) NOT NULL
,	[IdentifierValue] VARCHAR(50) NOT NULL
,	CONSTRAINT [PK_TradeAlternateIdentifiers] PRIMARY KEY CLUSTERED ([ISBN13] ASC, [SAPVendorID] ASC, [VSRCode] ASC, [ID] ASC)
,	CONSTRAINT [FK_TradeAlternateIdentifiers_TradeCoreAttributes] FOREIGN KEY([ISBN13], [SAPVendorID], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes]([ISBN13], [SAPVendorID], [VSRCode]) ON DELETE CASCADE
,	CONSTRAINT [FK_TradeAlternateIdentifiers_refIdentifierType] FOREIGN KEY([IdentifierType]) REFERENCES [dbo].[refIdentifierType]([Id])
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeAlternateIdentifiers TO OnixImportApp;
GO