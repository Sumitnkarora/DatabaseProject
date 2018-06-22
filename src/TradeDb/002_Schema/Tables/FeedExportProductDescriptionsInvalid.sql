CREATE TABLE [dbo].[FeedExportProductDescriptionsInvalid]
(
    [ErrorId] BIGINT NOT NULL IDENTITY, 
    [ISBN13]    VARCHAR (13)     CONSTRAINT [DF_FeedExportProductDescriptionsInvalid_ISBN13] DEFAULT ('') NOT NULL,
    [EBookID]   VARCHAR (36)     CONSTRAINT [DF_FeedExportProductDescriptionsInvalid_EBookID] DEFAULT ('') NOT NULL,
    [SessionId] UNIQUEIDENTIFIER NOT NULL, 
    [Message] NVARCHAR(MAX) NULL, 
    [DescriptionTypeId] VARCHAR(6) NULL, 
    CONSTRAINT [PK_FeedExportProductDescriptionsInvalid] PRIMARY KEY ([ErrorId])
)
