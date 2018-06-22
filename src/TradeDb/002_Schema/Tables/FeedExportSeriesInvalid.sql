CREATE TABLE [dbo].[FeedExportSeriesInvalid]
(
    [ErrorId] BIGINT NOT NULL IDENTITY,
    [SeriesId] INT NOT NULL DEFAULT ((0)) , 
    [SessionId] UNIQUEIDENTIFIER NOT NULL, 
    [Message] NVARCHAR(MAX) NULL,
    [KoboSeriesId] VARCHAR(64) NOT NULL DEFAULT '' , 
    CONSTRAINT [PK_FeedExportSeriesInvalid] PRIMARY KEY CLUSTERED ([ErrorId] ASC),
    CONSTRAINT [FK_FeedExportSeriesInvalid_FeedExportSessionLog] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[FeedExportSessionLog] ([SessionId])
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportSeriesInvalid_SeriesId] ON [dbo].[FeedExportSeriesInvalid] ([SeriesId] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportSeriesInvalid_SessionId] ON [dbo].[FeedExportSeriesInvalid] ([SessionId] ASC) INCLUDE ([SeriesId]);
GO