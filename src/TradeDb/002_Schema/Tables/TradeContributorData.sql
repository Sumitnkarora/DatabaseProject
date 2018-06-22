CREATE TABLE [dbo].[TradeContributorData]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorId] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[Ordinal] TINYINT NOT NULL
,	[RoleId] CHAR(3) NULL
,	[ContributorId] INT NOT NULL

,	CONSTRAINT [PK_TradeContributorData] PRIMARY KEY CLUSTERED ([ISBN13], [SAPVendorId], [VSRCode], [Ordinal])
,	CONSTRAINT [FK_TradeContributorData_TradeCoreAttributes] FOREIGN KEY([ISBN13], [SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes]([ISBN13], [SAPVendorId], [VSRCode]) ON DELETE CASCADE
,	CONSTRAINT [FK_TradeContributorData_TradeContributors] FOREIGN KEY ([ContributorId]) REFERENCES [dbo].[TradeContributors]([ContributorId])
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeContributorData TO OnixImportApp;
GO