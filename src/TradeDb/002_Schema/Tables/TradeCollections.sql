CREATE TABLE [dbo].[TradeCollections] (
    [CollectionId] INT NOT NULL,
    [CollectionType] VARCHAR(16) NOT NULL, 
    [CollectionTitle] NVARCHAR (255) NOT NULL,
    [CollectionTotalItems] INT NULL,
    CONSTRAINT [PK_TradeCollections] PRIMARY KEY CLUSTERED ([CollectionId] ASC), 
    CONSTRAINT [FK_TradeCollections_refCollectionType] FOREIGN KEY ([CollectionType]) REFERENCES [refCollectionType]([Id])
);
GO

CREATE UNIQUE INDEX [UX_TradeCollections_CollectionTitle] ON [dbo].[TradeCollections]([CollectionTitle]);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeCollections TO OnixImportApp;
GO