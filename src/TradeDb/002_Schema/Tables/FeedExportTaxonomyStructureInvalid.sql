CREATE TABLE [dbo].[FeedExportTaxonomyStructureInvalid]
(
	[ErrorId] BIGINT NOT NULL IDENTITY,
	[NodeIdPath]      VARCHAR(max) NOT NULL,
    [TaxonomyType]    VARCHAR (6)  NOT NULL,
    [SessionId] UNIQUEIDENTIFIER NOT NULL, 
    [Message] NVARCHAR(MAX) NULL,
	CONSTRAINT [PK_FeedExportTaxonomyStructureInvalid] PRIMARY KEY CLUSTERED ([ErrorId] ASC),
	CONSTRAINT [FK_FeedExportTaxonomyStructureInvalid_FeedExportSessionLog] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[FeedExportSessionLog] ([SessionId])
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportTaxonomyStructureInvalid_SeriesId] ON [dbo].[FeedExportTaxonomyStructureInvalid] ([TaxonomyType] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportTaxonomyStructureInvalid_SessionId] ON [dbo].[FeedExportTaxonomyStructureInvalid] ([SessionId] ASC) INCLUDE ([TaxonomyType]);
GO