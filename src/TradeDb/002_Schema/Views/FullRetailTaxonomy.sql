/* =============================================
 Author:		Raymond Chan
 Create date:	Dec 14, 2017
 Description:	Displays Retail Taxonomy in easy to read string format.

 Revision history:
 ============================================= */

CREATE VIEW [dbo].[FullRetailTaxonomy]
AS

WITH	MCLMList AS (
	SELECT	MerchCategoryId AS MCLM, Description_en AS Description
	FROM	dbo.MerchandiseCategories
	UNION ALL
	SELECT	LayoutModuleId AS MCLM, Description_en AS Description
	FROM	dbo.LayoutModules
),	Taxonomy AS (
	SELECT	tx.NodeId
	,	tx.MCLM
	,	COALESCE(ls.Description, tx.Description) AS Description
	,	tx.ParentId
	,	tx.CategoryLevel
	FROM	refRetailTaxonomy AS tx
		LEFT JOIN MCLMList AS ls ON ls.MCLM = tx.MCLM
),	RecursiveView AS (
	SELECT	r.NodeId, r.MCLM, r.Description, N'/' + r.Description + N'/' AS FullDescription, r.ParentId, r.CategoryLevel
	FROM	Taxonomy AS r
	WHERE	NodeId = '/'

	UNION ALL

	SELECT	nodes.NodeId, nodes.MCLM
	,	nodes.Description
	,	rv.FullDescription + nodes.Description + N'/'
	,	nodes.ParentId, nodes.CategoryLevel
	FROM	Taxonomy AS nodes
	JOIN	RecursiveView AS rv ON nodes.ParentId = rv.NodeId
)
SELECT	CategoryLevel, NodeId.ToString() AS [TaxonomyPath], MCLM, FullDescription
FROM	RecursiveView

GO