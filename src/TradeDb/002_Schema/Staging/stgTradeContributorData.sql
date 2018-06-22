CREATE TABLE [dbo].[stgTradeContributorData]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[Ordinal] TINYINT NOT NULL
,	[RoleId] VARCHAR(3) NULL
,	[ContributorId] INT NOT NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeContributorData TO OnixImportApp;
GO