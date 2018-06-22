CREATE TABLE [dbo].[FeedExportTaxonomyStructure] (
    [ChangeVersionId] BIGINT              NOT NULL,
    [TaxonomyType]    VARCHAR (6)         NOT NULL,
    [StatusId]        SMALLINT            CONSTRAINT [DF_FeedExportTaxonomyStructure_StatusId] DEFAULT ((0)) NOT NULL,
    [SessionId]       UNIQUEIDENTIFIER    NULL,
	CONSTRAINT [PK_FeedExportTaxonomyStructure] PRIMARY KEY CLUSTERED ([ChangeVersionId] ASC, [TaxonomyType] ASC)
)
GO