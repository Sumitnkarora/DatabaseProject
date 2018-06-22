/* =============================================
 Author:		Raymond Chan
 Create date:	Jan 18, 2018
 Parameters:	SessionId
				TopRecords

 Description:	Updates top X records to StatusId = 1 (Processing) for exclusive export lock specified by SessionId;
				Returns updated records for exporting

				For sample, see Confluence - there is a spreadsheet with sample data and scripts for testing
				https://indigoca.atlassian.net/wiki/spaces/Core/pages/3885112/Taxonomy+Assignment+export+service

 Revision history:
		Jan 22, 2018 - Raymond Chan - Add Kobo support
		Feb 01, 2018 - Dariusz Holc - Fix for fetching only lowest version records.
		Feb  6, 2018 - Raymond Chan - Update to use UPC instead of PID
		Feb 08, 2018 - Dariusz Holc - Fix fetching with ordering by change version (first in, first out).
		Feb 21, 2018 - Dariusz Holc - Make fetch only selection and move the marking of records to start session.
		Feb 28, 2018 - Raymond Chan - Use TradeBisacDataByRegion view instead of actual table
		Mar  2, 2018 - Raymond Chan - Add support for IMR (Indigo Master Record)
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_TaxonomyAssignment_FetchSession]
    @SessionId uniqueidentifier,
	@RegionId varchar(10) = 'CA'
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @TaxonomyToExport TABLE(taxonomyType varchar(6), isbn13upc varchar(20), vendorId varchar(12), vsrCode varchar(12), ordinal tinyint, ebookId varchar(36), bisacOrdinal int); 

	INSERT INTO @TaxonomyToExport (taxonomyType, isbn13upc, vendorId, vsrCode, ordinal, ebookId, bisacOrdinal)
	SELECT f.TaxonomyType, f.ISBN13UPC, f.VendorId, f.VSRCode, f.Ordinal, f.EBookID, f.BISACOrdinal
	FROM FeedExportTaxonomyAssignment f WITH (NOLOCK)
	WHERE f.StatusId = 1 AND f.SessionId = @SessionId;
	
	/* Five Scenarios

		PART #1 - Web+Retail assignments
		1. Get all Web Data
			- change due to web - view "TradeBisacDataByRegion" 
			- FeedExport left join all to TradeBisacDataByRegion 
			- Web data means we need ISBN13 + NodeId -- [ISBN13UPC = ISBN13, SearchIndexIdMCLM = NodeId]

		2. Get "overlapping" Web Data 
			- change due to retail "TradeArticleMCLM" 
			- FeedExport right join to TradeBisacDataByRegion 
			- Web data means we need ISBN13 + NodeId -- [ISBN13UPC = ISBN13, SearchIndexIdMCLM = NodeId]
		

		3. Get all Retail Data
			- change due to retail "TradeArticleMCLM" 
			- FeedExport left join to TradeArticleMCLM 
			- Retail data means we need UPC + MCLM -- [ISBN13UPC = UPC, SearchIndexIdMCLM = MC+LM]

		4. Get "overlapping" Retail Data
			- change due to web - view  "TradeBisacDataByRegion" 
			- FeedExport right join to TradeArticleMCLM
			- assignment changes in "web" means we have to also get overlapping products in "retail" (hence right join)
			- Retail data means we need UPC + MCLM -- [ISBN13UPC = UPC, SearchIndexIdMCLM = MC+LM]

		PART #2 - Kobo assignments (also uses "web" TaxonomyStructure)
		5. Get all Kobo Data
			- change due to kobo table "KoboCategories"
			- similar to "TradeBisacDataByRegion", uses web taxonomy structure
	*/

	DECLARE @IndigoVendorId VARCHAR(12) = '703416';

	-- The CTE_WEB creates list of ISBN13 that have changed, but one ISBN can have many BISAC
	-- the join will create multiple duplicated rows when there is more than one ISBN
	-- note: we will remove these in C# Code, for performance reasons
	WITH CTE_WEB as (

		-- First: IMR only (i.e. records where there is an indigo record, but priority <> 1, and change in FeedExport table represents vendor priority = 1
		SELECT	
			 E.taxonomyType 
			,E.ISBN13UPC	
			,A.BISACCode	-- could be null if no mapping, or could be null if data deleted
			,A.Ordinal
			,C.NodeId.ToString() as 'NodeIdPath'
			,C.SearchIndexId as 'SearchIndexIdMcLm'
		FROM @TaxonomyToExport E 
		JOIN TradeBisacData A WITH (NOLOCK) ON E.ISBN13UPC = A.ISBN13 
		JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = A.ISBN13 AND indp.SAPVendorId = A.SAPVendorId AND indp.VSRCode = A.VSRCode AND indp.RegionId = @RegionId
		LEFT JOIN refBisacToOnlineTaxonomy as B WITH (NOLOCK) on A.BISACCode = B.BISACCode 
		LEFT JOIN refOnlineTaxonomy as C WITH (NOLOCK) ON B.NodeId = C.NodeId 
		where E.EBookId = ''
		and (E.taxonomyType <> 'retail' or A.ISBN13 is not null) -- exclude items from retail that do not have a match in web (taxonomy=retail AND ISBN13=null)
		and A.SAPVendorId = @IndigoVendorId AND A.VSRCode = '' AND A.SAPVendorId != e.VendorId -- take only indigo records (if there are any)

		UNION

		-- Second: Regular excluding already taken from IMR
		SELECT	
			 E.taxonomyType 
			,E.ISBN13UPC	
			,A.BISACCode	-- could be null if no mapping, or could be null if data deleted
			,A.Ordinal
			,C.NodeId.ToString() as 'NodeIdPath'
			,C.SearchIndexId as 'SearchIndexIdMcLm'
		FROM @TaxonomyToExport E 
		LEFT JOIN TradeBisacData A WITH (NOLOCK) ON A.ISBN13 = e.ISBN13UPC AND A.SAPVendorId = e.VendorId AND A.VSRCode = e.VSRCode -- i.e. exact match for vendor
		LEFT JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = A.ISBN13 AND indp.SAPVendorId = @IndigoVendorId AND indp.VSRCode = '' AND indp.RegionId = @RegionId -- get Indigo record
		LEFT JOIN TradeBisacData ind WITH (NOLOCK) ON ind.ISBN13 = indp.ISBN13 AND ind.SAPVendorId = indp.SAPVendorId AND ind.VSRCode = indp.VSRCode -- get Indigo record details
		LEFT JOIN refBisacToOnlineTaxonomy as B WITH (NOLOCK) on A.BISACCode = B.BISACCode 
		LEFT JOIN refOnlineTaxonomy as C WITH (NOLOCK) ON B.NodeId = C.NodeId 
		where E.EBookId = ''
		and (E.taxonomyType <> 'retail' or A.ISBN13 is not null) -- exclude items from retail that do not have a match in web (taxonomy=retail AND ISBN13=null)
		AND (ind.SAPVendorId IS NULL OR A.SAPVendorId = @IndigoVendorId) -- take only if regular record or indigo record
	)

	-- The CTE_RETAIL creates list of ISBN13UPC that have changed
	-- the join will create multiple duplicated rows when there is more than one change, e.g. due to both web and retail
	-- note: we will remove these in C# Code, for performance reasons
	,CTE_RETAIL as (
		SELECT	
			E.TaxonomyType
			,E.ISBN13UPC
			,CASE -- for 'retail', we do not join to refRetailTaxonomy table to get actual NodeId
				WHEN (A.MerchCategoryID is null and A.LayoutModuleId is null) THEN null
				WHEN (A.MerchCategoryID = '' and A.LayoutModuleId = '') THEN ''
				ELSE ISNULL(A.MerchCategoryID, '') + ISNULL('-' + A.LayoutModuleId, '') END as 'NodeIdPath'
			,CASE 
				WHEN (A.MerchCategoryID is null and A.LayoutModuleId is null) THEN null
				WHEN (A.MerchCategoryID = '' and A.LayoutModuleId = '') THEN ''
				ELSE ISNULL(A.MerchCategoryID, '') + ISNULL('-' + A.LayoutModuleId, '') END as 'SearchIndexIdMcLm'
		FROM @TaxonomyToExport E 
		LEFT JOIN TradeArticleMCLM A WITH (NOLOCK) ON E.ISBN13UPC = A.UPC
		where E.EBookId = ''
		and (E.taxonomyType<>'web' or A.UPC is not null) -- exclude items from web that do not have a match in retail (taxonomy=web and UPC=null)
	)

	-- The CTE_KOBO is similar to CTE_WEB, except we use EBookId instead of ISBN13UPC
	,CTE_KOBO as (
		SELECT	
			 E.taxonomyType 
			,E.EBookId	
			,A.BISAC
			,A.BISACOrdinal
			,C.NodeId.ToString() as 'NodeIdPath'
			,C.SearchIndexId as 'SearchIndexIdMcLm'
		FROM @TaxonomyToExport E 
		LEFT JOIN KoboCategories A WITH (NOLOCK) ON E.EBookID = A.EBookID
		LEFT JOIN refBisacToOnlineTaxonomy as B WITH (NOLOCK) on A.BISAC = B.BISACCode 
		LEFT JOIN refOnlineTaxonomy as C WITH (NOLOCK) ON B.NodeId = C.NodeId 
		where E.EBookId <> ''
	)


	-- Scenario #1 and #2 -- Web Data
	SELECT	
			'web' as 'TaxonomyType' -- hard coded to indicate output is web data
			,X.TaxonomyType as 'SourceOfChange' 
			,X.ISBN13UPC
			,X.BISACCode
			,X.NodeIdPath
			,convert(varchar(21), X.SearchIndexIdMcLm)  as 'SearchIndexIdMcLm'
			,X.Ordinal
			,0 as 'IsPrimary' -- Future ToDo: performance in sql was too slow, so we are now letting C# Code take minimal Ordinal to deterimine 'IsPrimary'
			,'' as 'EBookId'
			,1 as 'BISACOrdinal'
			,0 as 'IsKobo'
	FROM	CTE_WEB X

	UNION

	-- Scenario #3 and #4 -- Retail Data
	SELECT	
			 'retail' as 'TaxonomyType' -- hard coded to indicate output is retail data
			,X.TaxonomyType as 'SourceOfChange' 
			,X.ISBN13UPC
			,'' as 'BISACCode' -- 'retail' data does NOT use BISACCode
			,X.NodeIdPath
			,X.SearchIndexIdMcLm 
			,1 as Ordinal -- 'retail' data does not have Ordinals
			,1 as 'IsPrimary' -- 'retail' only has one map
			,'' as 'EBookId'
			,1 as 'BISACOrdinal'
			,0 as 'IsKobo'
	FROM CTE_RETAIL X 

	UNION

	-- Scenario #5 - Kobo Data
	SELECT	
			'web' as 'TaxonomyType' -- hard coded to indicate output is still considered web data
			,'kobo' as 'SourceOfChange' 
			,'' as ISBN13UPC
			,X.BISAC as 'BISACCode'
			,X.NodeIdPath
			,convert(varchar(21), X.SearchIndexIdMcLm) as 'SearchIndexIdMcLm'
			,1 as 'Ordinal'   -- 'kobo' data uses BISACOrdinal, this is 'web'
			,0 as 'IsPrimary' -- Future ToDo: performance in sql was too slow, so we are now letting C# Code take minimal Ordinal to deterimine 'IsPrimary'
			,X.EBookID
			,X.BISACOrdinal
			,1 as 'IsKobo'
	FROM	CTE_KOBO X


	-- expected sort results: Web/Retail first (EBookId will be '' for Kobo), then the rest of it
	ORDER BY EBookID, BISACOrdinal, ISBN13UPC, TaxonomyType desc, Ordinal, SearchIndexIdMcLm

END
GO

GRANT EXECUTE ON [dbo].[exporter_TaxonomyAssignment_FetchSession] TO [FeedsExporter]; 
GO