CREATE TABLE [dbo].[refFeedExportStatus] (
    [StatusId]    SMALLINT     NOT NULL,
    [Description] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_refFeedExportStatus] PRIMARY KEY CLUSTERED ([StatusId] ASC)
);

