CREATE TABLE [dbo].[FeedExportSeries] (
    [ChangeVersionId] BIGINT           NOT NULL,
    [SeriesId]        INT              NOT NULL DEFAULT ((0)),
    [StatusId]        SMALLINT         CONSTRAINT [DF_FeedExportSeries_StatusId] DEFAULT ((0)) NOT NULL,
    [SessionId]       UNIQUEIDENTIFIER NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_FeedExportSeries_IsDeleted] DEFAULT ((0)) NOT NULL,
    [KoboSeriesId] VARCHAR(64) NOT NULL DEFAULT '', 
    CONSTRAINT [PK_FeedExportSeries] PRIMARY KEY CLUSTERED ([ChangeVersionId], [SeriesId], [KoboSeriesId])
);
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportSeries_SeriesId_KoboSeriesId] ON [dbo].[FeedExportSeries] ([SeriesId], [KoboSeriesId])
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportSeries_StatusId_SessionId] ON [dbo].[FeedExportSeries] ([StatusId], [SessionId]) INCLUDE ([IsDeleted]) WHERE ([SessionId] IS NOT NULL);
GO