CREATE TABLE [dbo].[FeedExportSyncVersion] (
    [ChangeVersionId] BIGINT        NOT NULL,
    [DateAdded]       DATETIME2 (4) CONSTRAINT [DF_FeedExportSyncVersion_DateChanged] DEFAULT (getdate()) NOT NULL,
    [Comment]         VARCHAR (1000) NULL
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FeedExportSyncVersion_ChangeVersionId]
    ON [dbo].[FeedExportSyncVersion]([ChangeVersionId] ASC, [DateAdded] ASC)
GO
