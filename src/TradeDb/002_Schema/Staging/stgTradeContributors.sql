CREATE TABLE [dbo].[stgTradeContributors]
(
	[ContributorId] INT NOT NULL
,	[ContributorTitle] NVARCHAR(MAX) NOT NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeContributors TO OnixImportApp;
GO