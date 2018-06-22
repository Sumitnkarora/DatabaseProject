CREATE VIEW [dbo].[tblBisacToDeptToMerchCartMap]
AS
	SELECT	m.BISACCode
	,	bs.[Description] as [BISACDescription]
	,	CAST(NULL AS SMALLINT) AS [DeptId]
	,	CAST(NULL AS VARCHAR(255)) AS [DeptName]
	,	CAST(NULL AS SMALLINT) AS [ClassID]
	,	CAST(NULL AS VARCHAR(255)) AS [ClassName]
	,	CAST(NULL AS SMALLINT) AS [SubClassID]
	,	CAST(NULL AS VARCHAR(255)) AS [SubClassName]
	,	m.MerchCategoryID
	,	m.LayoutModuleID
	,	CAST(LEFT(mc.Description_en, 50) AS VARCHAR(50)) AS [MerchCategoryDesc]
	,	CAST(LEFT(lm.Description_en, 50) AS VARCHAR(50)) AS [LayoutModuleDesc]
	,	m.LanguageCode
	,	m.BindingCode
	FROM	dbo.refBisacToMCLMMap as m
	JOIN	dbo.refBisacSubjects as bs ON m.BISACCode = bs.BISACCode
	JOIN	dbo.MerchandiseCategories as mc ON m.MerchCategoryId = mc.MerchCategoryId
	JOIN	dbo.LayoutModules as lm ON m.LayoutModuleId = lm.LayoutModuleId
GO
