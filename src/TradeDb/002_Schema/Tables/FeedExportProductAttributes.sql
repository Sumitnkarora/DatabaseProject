CREATE TABLE [dbo].[FeedExportProductAttributes]
(
	[ChangeVersionId]   BIGINT           NOT NULL,
	[ISBN13]            VARCHAR (13)     NOT NULL DEFAULT (('')),
    [SAPVendorId]       VARCHAR (12)     NOT NULL,
    [VSRCode]           VARCHAR (12)     NOT NULL DEFAULT (('')),
	[EBookId]           VARCHAR (36)     CONSTRAINT [DF_FeedExportProductAttributes_EBookId] DEFAULT (('')) NOT NULL,
    [StatusId]          SMALLINT         CONSTRAINT [DF_FeedExportProductAttributes_StatusId] DEFAULT ((0)) NOT NULL,
    [SessionId]         UNIQUEIDENTIFIER NULL,
    [IsDeleted]         BIT              CONSTRAINT [DF_FeedExportProductAttributes_IsDeleted] DEFAULT ((0)) NOT NULL,
	CONSTRAINT [PK_FeedExportProductAttributes] PRIMARY KEY CLUSTERED ([ChangeVersionId] ASC, [ISBN13] ASC, [SAPVendorId] ASC, [VSRCode] ASC, [EBookId] ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportProductAttributes_ISBN13_SAPVendorId_VSRCode_EBookId] ON [dbo].[FeedExportProductAttributes] ([ISBN13] ASC, [SAPVendorId] ASC, [VSRCode] ASC, [EBookId] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportProductAttributes_StatusId_SessionId] ON [dbo].[FeedExportProductAttributes] ([StatusId], [SessionId]) INCLUDE ([IsDeleted]) WHERE ([SessionId] IS NOT NULL);
GO
