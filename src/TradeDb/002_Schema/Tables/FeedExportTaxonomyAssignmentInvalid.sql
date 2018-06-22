CREATE TABLE [dbo].[FeedExportTaxonomyAssignmentInvalid]
(
	[ErrorId] BIGINT NOT NULL IDENTITY,
	-- ProductSku is one of: TradeBisacData.ISBN13, TradeArticleMcLm.PID, or KoboCategories.EBookId
    [ProductSku] VARCHAR (36) CONSTRAINT [DF_FeedExportTaxonomyAssignmentInvalid_ProductSku] DEFAULT ('') NOT NULL, 
    [SessionId] UNIQUEIDENTIFIER NOT NULL, 
    [Message] NVARCHAR(MAX) NULL,
	CONSTRAINT [PK_FeedExportTaxonomyAssignmentInvalid] PRIMARY KEY CLUSTERED ([ErrorId] ASC),
	CONSTRAINT [FK_FeedExportTaxonomyAssignmentInvalid_FeedExportSessionLog] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[FeedExportSessionLog] ([SessionId])
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportTaxonomyAssignmentInvalid_ProductSku] ON [dbo].[FeedExportTaxonomyAssignmentInvalid] ([ProductSku] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportTaxonomyAssignmentInvalid_SessionId] ON [dbo].[FeedExportTaxonomyAssignmentInvalid] ([SessionId] ASC) INCLUDE ([ProductSku]);
GO