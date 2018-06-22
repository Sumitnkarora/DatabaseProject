CREATE TABLE [dbo].[refSAPProductHierarchy]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
,	CONSTRAINT [PK_refSAPProductHierarchy] PRIMARY KEY CLUSTERED ([Id])
);
