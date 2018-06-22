CREATE TABLE [dbo].[FeedExportVendors] (
    [ChangeVersionId] BIGINT           NOT NULL,
    [VendorId]        VARCHAR (12)     NOT NULL,
    [VSRCode]         VARCHAR (12)     NOT NULL,
    [StatusId]        SMALLINT         CONSTRAINT [DF_FeedExportVendors_StatusId] DEFAULT ((0)) NOT NULL,
    [SessionId]       UNIQUEIDENTIFIER NULL,
    [IsDeleted]       BIT              CONSTRAINT [DF_FeedExportVendors_IsDeleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FeedExportVendors] PRIMARY KEY CLUSTERED ([ChangeVersionId] ASC, [VendorId] ASC, [VSRCode] ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportVendors_VendorId_VSRCode] ON [dbo].[FeedExportVendors] (VendorId, VSRCode)
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportVendors_StatusId_SessionId] ON [dbo].[FeedExportVendors] (StatusId, SessionId) INCLUDE ([IsDeleted]) WHERE ([SessionId] IS NOT NULL);
GO