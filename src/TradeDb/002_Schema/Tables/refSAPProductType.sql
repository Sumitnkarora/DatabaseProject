CREATE TABLE [dbo].[refSAPProductType]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
,	CONSTRAINT [PK_refSAPProductType] PRIMARY KEY CLUSTERED ([Id])
);
