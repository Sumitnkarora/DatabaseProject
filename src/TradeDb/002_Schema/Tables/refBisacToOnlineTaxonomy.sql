CREATE TABLE [dbo].[refBisacToOnlineTaxonomy]
(
	[BISACCode] VARCHAR(10) NOT NULL
,	[NodeId] hierarchyid NOT NULL
,	CONSTRAINT [PK_refBisacToOnlineTaxonomy] PRIMARY KEY CLUSTERED([BISACCode], [NodeId])
,	CONSTRAINT [FK_refBisacToOnlineTaxonomy_refBisacSubjects] FOREIGN KEY ([BISACCode]) REFERENCES [dbo].[refBisacSubjects]([BISACCode])
,	CONSTRAINT [FK_refBisacToOnlineTaxonomy_refOnlineTaxonomy] FOREIGN KEY ([NodeId]) REFERENCES [dbo].[refOnlineTaxonomy]([NodeId])
);
GO

CREATE NONCLUSTERED INDEX [IX_refBisacToOnlineTaxonomy_BisacCode] ON [dbo].[refBisacToOnlineTaxonomy] ([BISACCode])
GO

CREATE NONCLUSTERED INDEX [IX_refBisacToOnlineTaxonomy_NodeId] ON [dbo].[refBisacToOnlineTaxonomy] ([NodeId])
GO