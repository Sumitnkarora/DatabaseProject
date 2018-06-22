CREATE TABLE [dbo].[refBisacSubjects]
(
	[BISACCode] VARCHAR(10) NOT NULL
,	[Hierarchy] HIERARCHYID NOT NULL
,	[ParentHierarchy] AS Hierarchy.GetAncestor(1) PERSISTED
,	[Description] VARCHAR(MAX) NULL

,	CONSTRAINT [PK_refBisacSubjects] PRIMARY KEY NONCLUSTERED([BISACCode])
,	CONSTRAINT [IK_refBisacSubjects_Hierarchy] FOREIGN KEY ([ParentHierarchy]) REFERENCES dbo.[refBisacSubjects]([Hierarchy])
	
);
GO

CREATE UNIQUE CLUSTERED INDEX [UCX_refBisacSubjects_Hierarchy] ON [dbo].[refBisacSubjects]([Hierarchy]);
GO
