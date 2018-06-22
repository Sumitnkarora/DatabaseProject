CREATE TABLE [dbo].[refBindingMap]
(
	[CatalogDBBinding] [char] (2) NOT NULL
,	[SAPDiscountCode] [char] (2) NOT NULL
,	[SAPProdHierarchy] [char] (2) NOT NULL
,	[SAPProductType] [char] (2) NOT NULL

,	CONSTRAINT [PK_refBindingMap] PRIMARY KEY CLUSTERED([CatalogDBBinding])
)
GO
