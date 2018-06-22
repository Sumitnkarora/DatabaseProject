CREATE TABLE [dbo].[TradeSalesRights]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[ID] INT NOT NULL
,	[CountryCode] VARCHAR(5) NOT NULL
,	[Allowed] BIT NULL
,	[Disallowed] BIT NULL
,	[Exclusive] BIT NULL
,	[Norights] BIT NULL
,	CONSTRAINT [PK_TradeSalesRights] PRIMARY KEY CLUSTERED ([ISBN13] ASC, [SAPVendorID] ASC, [VSRCode] ASC, [ID] ASC)
,	CONSTRAINT [FK_TradeSalesRights_TradeCoreAttributes] FOREIGN KEY([ISBN13], [SAPVendorID], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes]([ISBN13], [SAPVendorID], [VSRCode]) ON DELETE CASCADE
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON TradeSalesRights TO OnixImportApp;
GO