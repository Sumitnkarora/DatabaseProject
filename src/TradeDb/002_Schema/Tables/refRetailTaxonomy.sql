CREATE TABLE [dbo].[refRetailTaxonomy] (
	[NodeId] hierarchyid NOT NULL
,	[MCLM] VARCHAR(30) NULL
,	[Description] nvarchar(MAX) NULL
,	[ParentId] AS [NodeId].GetAncestor(1) PERSISTED
,	[CategoryLevel] AS [NodeId].GetLevel() PERSISTED
    CONSTRAINT [PK_refRetailTaxonomy] PRIMARY KEY CLUSTERED ([NodeId] ASC),
    CONSTRAINT [IK_refRetailTaxonomy_Hierarchy] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[refRetailTaxonomy] ([NodeId])
);


GO
ALTER TABLE [dbo].[refRetailTaxonomy] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


