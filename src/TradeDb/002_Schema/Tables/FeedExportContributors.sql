CREATE TABLE [dbo].[FeedExportContributors] (
    [ChangeVersionId]     BIGINT           NOT NULL,
    [ContributorId]       INT              CONSTRAINT [DF_FeedExportContributors_ContributorId] DEFAULT ((0)) NOT NULL,
    [StatusId]            SMALLINT         CONSTRAINT [DF_FeedExportContributors_StatusId] DEFAULT ((0)) NOT NULL,
    [SessionId]           UNIQUEIDENTIFIER NULL,
    [IsDeleted]           BIT              CONSTRAINT [DF_FeedExportContributors_IsDeleted] DEFAULT ((0)) NOT NULL,
    [EBookID]             VARCHAR(36)      CONSTRAINT [DF_FeedExportContributors_EBookID] DEFAULT ('') NOT NULL, 
    [ContributorOrdinal]  INT              CONSTRAINT [DF_FeedExportContributors_ContributorOrdinal] DEFAULT ((0)) NOT NULL, 
    CONSTRAINT [PK_FeedExportContributors] PRIMARY KEY CLUSTERED ([ChangeVersionId], [ContributorId], [EBookID], [ContributorOrdinal])
);
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportContributors_ContributorId_EBookID_ContributorOrdinal] ON [dbo].[FeedExportContributors] ([ContributorId], [EBookId], [ContributorOrdinal]) 
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportContributors_StatusId_SessionId] ON [dbo].[FeedExportContributors] ([StatusId], [SessionId]) INCLUDE ([IsDeleted]) WHERE ([SessionId] IS NOT NULL);
GO