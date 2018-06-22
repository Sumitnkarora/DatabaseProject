/* =============================================
 Author:		Irene Kondryna
 Create date:	November 15, 2017
 Parameters:	SessionId

 Description:	Returns entire taxonomy (either web or retail)
				By inspecting which taxonomy records have changed.
				Updates the records (by either web or retail) to StatusId = 1 (Processing) 

 Revision history:
 				Feb 01, 2018 Dariusz Holc - Fix for fetching only lowest version records
				Feb 15, 2018 Raymond Chan - Simplify Taxonomy Structure to remove nodeid dependency
				Feb 21, 2018 Dariusz Holc - Make fetch only selection and move the marking of records to start session.
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_TaxonomyStructure_FetchSession]
    @SessionId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TaxonomyToExport TABLE(taxonomyType varchar(6)); 
	DECLARE @taxonomyType VARCHAR(6)
	
	INSERT INTO @TaxonomyToExport (taxonomyType)
	SELECT f.TaxonomyType
	FROM FeedExportTaxonomyStructure f WITH (NOLOCK)
	WHERE f.StatusId = 1 AND f.SessionId = @SessionId;

	-- if there are any records, it means taxonomy has changed
	-- unlike other feeds, for Taxonomy we work with all-or-nothing
	IF EXISTS (SELECT TOP 1 * FROM @TaxonomyToExport)
	BEGIN
		SELECT TOP 1 @taxonomyType = TaxonomyType FROM @TaxonomyToExport

		IF (@taxonomyType = 'web')
		BEGIN
			SELECT web.NodeId.ToString() AS [NodeIdPath], 
				   CONVERT(varchar(30), web.SearchIndexId) as 'SearchIndexIdMCLM', -- NOTE: SearchIndexId is an int while MCLM is varchar(30)
				   web.Description, 
				   web.ParentId.ToString() as [ParentIdPath], 
				   web.CategoryLevel,
				   'web' as 'TaxonomyType'
			FROM dbo.refOnlineTaxonomy web
			ORDER BY NodeIdPath
		END
		IF (@taxonomyType = 'retail')
		BEGIN
			SELECT retail.NodeId.ToString() AS [NodeIdPath], 
				   retail.MCLM as 'SearchIndexIdMCLM', -- NOTE: SearchIndexId is an int while MCLM is varchar(30)
				   retail.Description, 
				   retail.ParentId.ToString() as [ParentIdPath], 
				   retail.CategoryLevel,
				   'retail' as 'TaxonomyType'
			FROM dbo.refRetailTaxonomy retail
			ORDER BY NodeIdPath
		END
		IF (@taxonomyType <> 'web' and @taxonomyType <> 'retail')
		BEGIN
			-- should never be here, but return nothing just in case
			SELECT TOP 0 
				   web.NodeId.ToString() AS [NodeIdPath], 
				   CONVERT(varchar(30), web.SearchIndexId) as 'SearchIndexIdMCLM',
				   web.Description, 
				   web.ParentId.ToString() as [ParentIdPath], 
				   web.CategoryLevel
			FROM dbo.refOnlineTaxonomy web
		END
	END
	ELSE
	BEGIN
		-- No Changes, return nothing
		SELECT TOP 0 
			   web.NodeId.ToString() AS [NodeIdPath], 
			   CONVERT(varchar(30), web.SearchIndexId) as 'SearchIndexIdMCLM',
			   web.Description, 
			   web.ParentId.ToString() as [ParentIdPath], 
			   web.CategoryLevel
		FROM dbo.refOnlineTaxonomy web

	END
END
GO

GRANT EXECUTE ON [dbo].[exporter_TaxonomyStructure_FetchSession] TO [FeedsExporter]; 
GO