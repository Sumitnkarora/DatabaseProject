CREATE TABLE [dbo].[TradeContributors] (
    [ContributorId] INT NOT NULL,
    [ContributorTitle] NVARCHAR (255) NULL,
    CONSTRAINT [PK_TradeContributors] PRIMARY KEY CLUSTERED ([ContributorId] ASC)
);
GO

CREATE UNIQUE INDEX [UX_TradeContributors_ContributorTitle] ON [dbo].[TradeContributors]([ContributorTitle]);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON TradeContributors TO OnixImportApp;
GO