CREATE TABLE [dbo].[refOnlineTaxonomy] (
    [NodeId]        [sys].[hierarchyid] NOT NULL,
    [SearchIndexId] INT                 NULL,
    [Description]   NVARCHAR (MAX)      NULL,
    [ParentId]      AS                  ([NodeId].[GetAncestor]((1))) PERSISTED,
    [CategoryLevel] AS                  ([NodeId].[GetLevel]()) PERSISTED,
    CONSTRAINT [PK_refOnlineTaxonomy] PRIMARY KEY CLUSTERED ([NodeId] ASC),
    CONSTRAINT [IK_refOnlineTaxonomy_Hierarchy] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[refOnlineTaxonomy] ([NodeId])
);
GO

CREATE NONCLUSTERED INDEX [IX_refOnlineTaxonomy_NodeId_SearchIndexId] ON [dbo].[refOnlineTaxonomy] ([NodeId], [SearchIndexId])
GO

ALTER TABLE [dbo].[refOnlineTaxonomy] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


