CREATE VIEW [dbo].[FullOnlineTaxonomy]
AS
WITH	RecursiveView AS (
	SELECT	r.NodeId, r.SearchIndexId, r.Description, N'/' + r.Description + N'/' AS FullDescription, r.ParentId, r.CategoryLevel
	FROM	dbo.refOnlineTaxonomy AS r
	WHERE	NodeId = '/'

	UNION ALL

	SELECT	nodes.NodeId, nodes.SearchIndexId, nodes.Description, rv.FullDescription + nodes.Description + N'/', nodes.ParentId, nodes.CategoryLevel
	FROM	dbo.refOnlineTaxonomy AS nodes
	JOIN	RecursiveView AS rv ON nodes.ParentId = rv.NodeId
)
SELECT	CategoryLevel, NodeId.ToString() AS [TaxonomyPath], SearchIndexId, FullDescription
FROM	RecursiveView
GO
