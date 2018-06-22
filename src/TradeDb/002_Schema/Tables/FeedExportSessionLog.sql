CREATE TABLE [dbo].[FeedExportSessionLog] (
    [SessionId]     UNIQUEIDENTIFIER CONSTRAINT [DF_FeedExportSessionLog_SessionId] DEFAULT (newsequentialid()) NOT NULL,
    [ExporterName]  VARCHAR (50)     NOT NULL,
    [StartDatetime] DATETIME2 (4)    NOT NULL,
    [EndDatetime]   DATETIME2 (4)    NULL,
    [StatusId]      SMALLINT         CONSTRAINT [DF_FeedExportSessionLog_StatusId] DEFAULT ((0)) NOT NULL,
    [RecordsCount]  INT              NULL,
	[RecordsInvalidCount] INT        NULL,
    [StatusMessage] VARCHAR (MAX)    NULL,
    CONSTRAINT [PK_FeedExportSessionLog] PRIMARY KEY CLUSTERED ([SessionId] ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportSessionLog_ExporterName_StatusId] ON [dbo].[FeedExportSessionLog] ([ExporterName] ASC, [StatusId] ASC) INCLUDE ([SessionId]);
GO