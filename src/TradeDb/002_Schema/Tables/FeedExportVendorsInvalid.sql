CREATE TABLE [dbo].[FeedExportVendorsInvalid]
(
	[ErrorId] BIGINT NOT NULL IDENTITY, 
    [VendorId] VARCHAR(12) NOT NULL, 
    [SessionId] UNIQUEIDENTIFIER NOT NULL, 
    [Message] NVARCHAR(MAX) NULL,
	CONSTRAINT [PK_FeedExportVendorsInvalid] PRIMARY KEY CLUSTERED ([ErrorId] ASC),
	CONSTRAINT [FK_FeedExportVendorsInvalid_FeedExportSessionLog] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[FeedExportSessionLog] ([SessionId])
);
GO

CREATE NONCLUSTERED INDEX [IX_FeedExportVendorsInvalid_VendorId] ON [dbo].[FeedExportVendorsInvalid] ([VendorId] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_FeedExportVendorsInvalid_SessionId] ON [dbo].[FeedExportVendorsInvalid] ([SessionId] ASC) INCLUDE ([VendorId]);
GO
