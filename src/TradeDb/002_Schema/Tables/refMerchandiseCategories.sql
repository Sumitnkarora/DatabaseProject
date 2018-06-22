CREATE TABLE [dbo].[refMerchandiseCategories]
(
	[MerchCategoryId] VARCHAR(10) NOT NULL
,	[Description] NVARCHAR(MAX) NULL
,	[VisibleToCart] BIT NOT NULL

,	CONSTRAINT [PK_refMerchandiseCategory] PRIMARY KEY CLUSTERED ([MerchCategoryId])
);
GO
