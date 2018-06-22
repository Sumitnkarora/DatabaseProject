CREATE VIEW [dbo].[MerchandiseCategories]
AS
	SELECT	MerchCategoryId, VisibleToCart, JSON_VALUE(Description, '$."en"') AS [Description_en], JSON_VALUE(Description, '$."fr"') AS [Description_fr]
	FROM	dbo.refMerchandiseCategories
GO;
