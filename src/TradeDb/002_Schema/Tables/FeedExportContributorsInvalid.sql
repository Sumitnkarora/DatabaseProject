CREATE TABLE [dbo].[FeedExportContributorsInvalid]
(
    [ErrorId]             BIGINT            NOT NULL IDENTITY, 
    [ContributorId]       INT               CONSTRAINT [DF_FeedExportContributorsInvalid_ContributorId] DEFAULT ((0)) NOT NULL,
    [SessionId]           UNIQUEIDENTIFIER  NOT NULL, 
    [Message]             NVARCHAR(MAX)     NULL,
    [EBookID]             VARCHAR(36)       CONSTRAINT [DF_FeedExportContributorsInvalid_EBookID] DEFAULT ('') NOT NULL, 
    [ContributorOrdinal]  INT               CONSTRAINT [DF_FeedExportContributorsInvalid_ContributorOrdinal] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FeedExportContributorsInvalid] PRIMARY KEY CLUSTERED ([ErrorId] ASC),
    CONSTRAINT [FK_FeedExportContributorsInvalid_FeedExportSessionLog] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[FeedExportSessionLog] ([SessionId])
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportContributorsInvalid_VendorId] ON [dbo].[FeedExportContributorsInvalid] ([ContributorId] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportContributorsInvalid_SessionId] ON [dbo].[FeedExportContributorsInvalid] ([SessionId] ASC) INCLUDE ([ContributorId]);
GO