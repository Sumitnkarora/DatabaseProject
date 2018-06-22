CREATE TABLE [dbo].[refSupplierPriceType]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
,	CONSTRAINT [PK_refSupplierPriceType] PRIMARY KEY CLUSTERED ([Id])
);
