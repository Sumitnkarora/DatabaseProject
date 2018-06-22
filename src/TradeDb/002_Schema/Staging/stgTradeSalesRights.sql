CREATE TABLE [dbo].[stgTradeSalesRights]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[ID] INT NOT NULL
,	[CountryCode] VARCHAR(5) NOT NULL
,	[Allowed] VARCHAR(1) NULL
,	[Disallowed] VARCHAR(1) NULL
,	[Exclusive] VARCHAR(1) NULL
,	[Norights] VARCHAR(1) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeSalesRights TO OnixImportApp;
GO