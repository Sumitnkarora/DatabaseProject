CREATE TABLE [dbo].[FeedExportProductDescriptions] (
    [ChangeVersionId]   BIGINT           NOT NULL,
    [ISBN13]            VARCHAR (13)     CONSTRAINT [DF_FeedExportProductDescriptions_ISBN13] DEFAULT ('') NOT NULL,
    [VendorId]          VARCHAR (12)     CONSTRAINT [DF_FeedExportProductDescriptions_VendorId] DEFAULT ('') NOT NULL,
    [VSRCode]           VARCHAR (12)     CONSTRAINT [DF_FeedExportProductDescriptions_VSRCode] DEFAULT ('') NOT NULL,
    [DescriptionTypeId] TINYINT          CONSTRAINT [DF_FeedExportProductDescriptions_DescriptionTypeId] DEFAULT ((0)) NOT NULL,
    [StatusId]          SMALLINT         CONSTRAINT [DF_FeedExportProductDescriptions_StatusId] DEFAULT ((0)) NOT NULL,
    [SessionId]         UNIQUEIDENTIFIER NULL,
    [EBookID]           VARCHAR (36)     CONSTRAINT [DF_FeedExportProductDescriptions_EBookID] DEFAULT ('') NOT NULL, 
    [UpdateType] VARCHAR NOT NULL DEFAULT ('') , 
    [FromPrimaryVendor] BIT NULL, 
    CONSTRAINT [PK_FeedExportProductDescriptions] PRIMARY KEY CLUSTERED ([ChangeVersionId], [ISBN13], [VendorId], [VSRCode], [DescriptionTypeId], [EBookID])
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportProductDescriptions_ISBN13_VendorId_VSRCode_DescriptionTypeId_EBookID] ON [dbo].[FeedExportProductDescriptions] ([ISBN13], [VendorId], [VSRCode], [DescriptionTypeId], [EBookID]);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportProductDescriptions_StatusId_SessionId] ON [dbo].[FeedExportProductDescriptions] ([StatusId], [SessionId]) INCLUDE ([UpdateType],[FromPrimaryVendor]) WHERE ([SessionId] IS NOT NULL);
GO