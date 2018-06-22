CREATE TABLE [dbo].[FeedExportProductAttributesInvalid]
(
	[ErrorId]           BIGINT           NOT NULL IDENTITY,
	[ISBN13]            VARCHAR (13)     NOT NULL,
	[EBookId]           VARCHAR (36)     CONSTRAINT [DF_FeedExportProductAttributesInvalid_EBookId] DEFAULT (('')) NOT NULL,
    [SessionId]         UNIQUEIDENTIFIER NOT NULL, 
    [Message]           NVARCHAR(MAX)    NULL,
	CONSTRAINT [PK_FeedExportProductAttributesInvalid] PRIMARY KEY CLUSTERED ([ErrorId] ASC),
	CONSTRAINT [FK_FeedExportProductAttributesInvalid_FeedExportSessionLog] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[FeedExportSessionLog] ([SessionId])
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportProductAttributesInvalid_SessionId] ON [dbo].[FeedExportProductAttributesInvalid] ([SessionId] ASC) INCLUDE ([ISBN13], [EBookId]);
GO