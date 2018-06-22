CREATE VIEW [dbo].[LayoutModules]
AS
	SELECT	LayoutModuleId, VisibleToCart, JSON_VALUE(Description, '$."en"') AS [Description_en], JSON_VALUE(Description, '$."fr"') AS [Description_fr]
	FROM	dbo.refLayoutModules
GO;
