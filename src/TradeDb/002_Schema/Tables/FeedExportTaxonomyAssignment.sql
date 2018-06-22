CREATE TABLE [dbo].[FeedExportTaxonomyAssignment] (
    [ChangeVersionId] BIGINT           NOT NULL,
    [TaxonomyType]    VARCHAR (6)      NOT NULL,                                                                        -- either 'web' (TradeBisacData or KoboCategories) or 'retail' (TradeArticleMcLm)
    [ISBN13UPC]       VARCHAR (20)     CONSTRAINT [DF_FeedExportTaxonomyAssignment_ISBN13UPC] DEFAULT ('') NOT NULL,    -- populated from either TradeBisacData or TradeArticleMcLm
    [VendorId]        VARCHAR (12)     CONSTRAINT [DF_FeedExportTaxonomyAssignment_VendorId] DEFAULT ('') NOT NULL,     -- populated from TradeBisacData
    [VSRCode]         VARCHAR (12)     CONSTRAINT [DF_FeedExportTaxonomyAssignment_VSRCode] DEFAULT ('') NOT NULL,      -- populated from TradeBisacData
    [Ordinal]         TINYINT          CONSTRAINT [DF_FeedExportTaxonomyAssignment_Ordinal] DEFAULT((1)) NOT NULL,      -- populated from TradeBisacData
    [EBookID]         VARCHAR(36)      CONSTRAINT [DF_FeedExportTaxonomyAssignment_EBookID] DEFAULT ('') NOT NULL,      -- populated from KoboCategories
    [BISACOrdinal]    INT              CONSTRAINT [DF_FeedExportTaxonomyAssignment_BISACOrdinal] DEFAULT((1)) NOT NULL, -- populated from KoboCategories
    [StatusId]        SMALLINT         CONSTRAINT [DF_FeedExportTaxonomyAssignment_StatusId] DEFAULT ((0)) NOT NULL,    -- populated from KoboCategories
    [SessionId]       UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_FeedExportTaxonomyAssignment] PRIMARY KEY CLUSTERED ([ChangeVersionId] ASC, [TaxonomyType] ASC, [ISBN13UPC] ASC, [VendorId] ASC, [VSRCode] ASC, [Ordinal] ASC, [EBookID] ASC, [BISACOrdinal] ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportTaxonomyAssignment_TaxonomyType_ISBN13UPC_VendorId_VSRCode_Ordinal_EBookID] ON [dbo].[FeedExportTaxonomyAssignment] ([TaxonomyType] ASC, [ISBN13UPC] ASC, [VendorId] ASC, [VSRCode] ASC, [Ordinal] ASC, [EBookID] ASC, [BISACOrdinal] ASC)
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportTaxonomyAssignment_StatusId_SessionId] ON [dbo].[FeedExportTaxonomyAssignment] ([StatusId], [SessionId]) WHERE (SessionId IS NOT NULL)
GO

