/* =============================================
 Author:		Irene Kondryna
 Create date:	November 15, 2017

 Description:	Inserts initial data (Ids) into corresponding monitoring tables: 
				FeedExportSeries, FeedExportVendors, FeedExportContributors, 
				FeedExportTaxonomyStructure, FeedExportTaxonomyAssignment, 
				FeedExportProductDescriptions, FeedExportProductAttributes

 Revision history:
				Dec 19, 2017 Dariusz Holc - Added support for FeedExportProductAttributes
				Jan 08, 2018 Dariusz Holc - Added support for region for prod attributes
				Jan 12, 2018 Raymond Chan - added Taxonomy Assignment for retail
				Feb 05, 2018 Raymond Chan - FeedExportTaxonomyAssignment remove IsKobo and IsDeleted columns
				Feb 15, 2018 Raymond Chan - simplify Taxonomy Structure Initial Load
				Feb 28, 2018 Raymond Chan - use TradeBisacDataByRegion view instead of table for TaxonomyAssignment
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_LoadInitialData]
    @RegionId varchar(10) = 'CA'
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ingramVendorId varchar(6);
	SET @ingramVendorId = '706954';

	DECLARE @next_baseline bigint;  
	SET @next_baseline = CHANGE_TRACKING_CURRENT_VERSION();

	DECLARE @comment varchar(500);

	/* Series */
	TRUNCATE TABLE dbo.FeedExportSeries;

	--Trade
	INSERT INTO dbo.FeedExportSeries (ChangeVersionId, SeriesId) 
	SELECT @next_baseline, SeriesId FROM dbo.TradeSeries; -- StatusId 0 = new

	SELECT @comment = 'Initial load - # of records: Series [' + CAST(COUNT(SeriesId) as varchar) + ']' FROM FeedExportSeries;
	PRINT 'Series loaded - ' + CAST(GETDATE() AS varchar);

	--Kobo
	INSERT INTO dbo.FeedExportSeries (ChangeVersionId, KoboSeriesId) 
	SELECT @next_baseline, SeriesId FROM dbo.KoboSeries; -- StatusId 0 = new

	SELECT @comment = 'Initial load - # of records: Kobo Series [' + CAST(COUNT(KoboSeriesId) as varchar) + ']' FROM FeedExportSeries WHERE KoboSeriesId <> '';
	PRINT 'Kobo Series loaded - ' + CAST(GETDATE() AS varchar);

	/* Vendors */
	TRUNCATE TABLE dbo.FeedExportVendors;

	INSERT INTO dbo.FeedExportVendors (ChangeVersionId, VendorId, VSRCode)
	SELECT @next_baseline, SAPVendorId, VSRCode FROM dbo.TradeVendors WHERE LTRIM(RTRIM(ISNULL(VSRCode, ''))) = ''

	SELECT @comment = @comment + '; Vendors [' + CAST(COUNT(VendorId) as varchar) + ']' FROM dbo.FeedExportVendors;

	PRINT 'Vendors loaded - ' + CAST(GETDATE() AS varchar);

	/* Contributors */
	TRUNCATE TABLE dbo.FeedExportContributors;

	--Trade
	INSERT INTO dbo.FeedExportContributors (ChangeVersionId, ContributorId, EBookID, ContributorOrdinal) 
	SELECT @next_baseline, ContributorId, '', 0 FROM dbo.TradeContributors;

	SELECT @comment = @comment + '; Contributors [' + CAST((SELECT COUNT(ContributorId)) as varchar) + ']' FROM dbo.FeedExportContributors WHERE ContributorID <> '';
	PRINT 'TradeContributors loaded - ' + CAST(GETDATE() AS varchar);

	--Kobo
	INSERT INTO dbo.FeedExportContributors (ChangeVersionId, ContributorId, EBookID, ContributorOrdinal) 
	SELECT @next_baseline, 0, EBookID, ContributorOrdinal FROM dbo.KoboContributors;

	SELECT @comment = @comment + '; Kobo Contributors [' + CAST((SELECT COUNT(A.CountField)) as varchar) + ']' FROM (SELECT ('' + CAST(EBookID AS VARCHAR) + '_' + CAST(ContributorOrdinal AS VARCHAR)) AS CountField FROM dbo.FeedExportContributors WHERE EBookID <> '' AND ContributorOrdinal <> 0) A;
	PRINT 'Kobo Contributors loaded - ' + CAST(GETDATE() AS varchar);

	/* Taxonomy Structure Web and Retail */
	TRUNCATE TABLE dbo.FeedExportTaxonomyStructure;

	-- Web
	INSERT INTO dbo.FeedExportTaxonomyStructure (ChangeVersionId, TaxonomyType) 
	SELECT @next_baseline, 'web';

	SELECT @comment = @comment + '; TaxonomyStructureWeb [1]';
	PRINT 'TaxonomyStructureWeb loaded - ' + CAST(GETDATE() AS varchar);

	-- Retail
	INSERT INTO dbo.FeedExportTaxonomyStructure (ChangeVersionId, TaxonomyType) 
	SELECT @next_baseline, 'retail';

	SELECT @comment = @comment + '; TaxonomyStructureRetail [1]';
	PRINT 'TaxonomyStructureRetail loaded - ' + CAST(GETDATE() AS varchar);


	/* Taxonomy Assignment Web, Retail, and Kobo */
	TRUNCATE TABLE dbo.FeedExportTaxonomyAssignment;

	-- Web
	INSERT INTO dbo.FeedExportTaxonomyAssignment (ChangeVersionId, TaxonomyType, ISBN13UPC, VendorId, VSRCode, Ordinal) 
	SELECT @next_baseline, 'web', ISBN13, SAPVendorId AS VendorId, VSRCode, Ordinal FROM dbo.TradeBisacDataByRegion;

	SELECT @comment = @comment + ';TaxonomyAssignmentWeb [' + CAST(COUNT(ISBN13UPC) as varchar) + ']' FROM dbo.FeedExportTaxonomyAssignment where TaxonomyType='web' and EBookId = '';
	PRINT 'TaxonomyAssignmentWeb loaded - ' + CAST(GETDATE() AS varchar);

	-- Retail
	INSERT INTO dbo.FeedExportTaxonomyAssignment (ChangeVersionId, TaxonomyType, ISBN13UPC)  
	SELECT @next_baseline, 'retail', convert(varchar(20), UPC) FROM dbo.TradeArticleMCLM;

	SELECT @comment = @comment + ';TaxonomyAssignmentRetail [' + CAST(COUNT(ISBN13UPC) as varchar) + ']' FROM dbo.FeedExportTaxonomyAssignment where TaxonomyType='retail' and EBookId = '';
	PRINT 'TaxonomyAssignmentRetail loaded - ' + CAST(GETDATE() AS varchar);

	-- Kobo
	INSERT INTO dbo.FeedExportTaxonomyAssignment (ChangeVersionId, TaxonomyType, EBookID, BISACOrdinal) 
	SELECT @next_baseline, 'web', EBookID, BISACOrdinal FROM dbo.KoboCategories;

	SELECT @comment = @comment + ';TaxonomyAssignmentKobo [' + CAST(COUNT(EBookID) as varchar) + ']' FROM dbo.FeedExportTaxonomyAssignment where TaxonomyType='web' and EBookId <> '';
	PRINT 'TaxonomyAssignmentKobo loaded - ' + CAST(GETDATE() AS varchar);


	/* Product Descriptions */
	TRUNCATE TABLE dbo.FeedExportProductDescriptions;

	--Trade
	INSERT INTO dbo.FeedExportProductDescriptions (ChangeVersionId, ISBN13, VendorId, VSRCode, DescriptionTypeId, EBookID, UpdateType, FromPrimaryVendor) 
	SELECT @next_baseline, d.ISBN13, d.SAPVendorId, d.VSRCode, d.DescriptionTypeId, '', 'I', 1
	FROM dbo.TradeDescriptionData d LEFT JOIN TradeDataPriority p
	ON d.ISBN13 = p.ISBN13 AND d.SAPVendorId = p.SAPVendorId AND d.VSRCode = p.VSRCode
	WHERE p.[Priority] = 1 AND p.RegionId = @RegionId
	UNION
	SELECT @next_baseline, d.ISBN13, d.SAPVendorId, d.VSRCode, d.DescriptionTypeId, '', 'I', 0
	FROM dbo.TradeDescriptionData d LEFT JOIN TradeDataPriority p
	ON d.ISBN13 = p.ISBN13 AND d.SAPVendorId = p.SAPVendorId AND d.VSRCode = p.VSRCode
	WHERE p.[Priority] <> 1 AND p.RegionId = @RegionId
	  AND p.SAPVendorId = @ingramVendorId
	  AND d.DescriptionTypeId NOT IN (SELECT DescriptionTypeId 
				                        FROM TradeDescriptionData t 
				                        WHERE t.ISBN13 = d.ISBN13 
				                            AND t.VSRCode = d.VSRCode
				                            AND t.SAPVendorId <> @ingramVendorId)

	SELECT @comment = @comment + '; Trade Product Descriptions [' + CAST((SELECT COUNT(A.CountField)) as varchar) + ']' FROM (SELECT ('' + CAST(ISBN13 AS VARCHAR) + '_' + CAST(VendorId AS VARCHAR) + '_' + CAST(VSRCode AS VARCHAR) + '_' + CAST(DescriptionTypeId AS VARCHAR) + '_' + CAST(EBookID AS VARCHAR)) AS CountField FROM dbo.FeedExportProductDescriptions WHERE ISBN13 <> '') A;
	PRINT 'Trade Product Descriptions loaded - ' + CAST(GETDATE() AS varchar);

	--Kobo
	INSERT INTO dbo.FeedExportProductDescriptions (ChangeVersionId, ISBN13, VendorId, VSRCode, DescriptionTypeId, EBookID, UpdateType, FromPrimaryVendor) 
	SELECT @next_baseline, '', '', '', 0, b.EBookID, 'I', 1
	FROM KoboBooks b

	SELECT @comment = @comment + '; Kobo Product Descriptions [' + CAST((SELECT COUNT(A.CountField)) as varchar) + ']' FROM (SELECT ('' + CAST(ISBN13 AS VARCHAR) + '_' + CAST(VendorId AS VARCHAR) + '_' + CAST(VSRCode AS VARCHAR) + '_' + CAST(DescriptionTypeId AS VARCHAR) + '_' + CAST(EBookID AS VARCHAR)) AS CountField FROM dbo.FeedExportProductDescriptions WHERE EBookID <> '') A;
	PRINT 'Kobo Product Descriptions loaded - ' + CAST(GETDATE() AS varchar);


	/* Product Attributes */
	TRUNCATE TABLE dbo.FeedExportProductAttributes;

	INSERT INTO dbo.FeedExportProductAttributes (ChangeVersionId, ISBN13, SAPVendorId, VSRCode) 
	SELECT @next_baseline, ISBN13, SAPVendorId, VSRCode FROM dbo.TradeDataByRegion
	WHERE RegionId = @RegionId;

	INSERT INTO dbo.FeedExportProductAttributes (ChangeVersionId, ISBN13, SAPVendorId, VSRCode, EBookId) 
	SELECT @next_baseline, '', '714254', '', EBookID FROM dbo.KoboBooks;

	SELECT @comment = @comment + '; ProductAttributes [' + CAST(COUNT(ISBN13) as varchar) + ']' FROM dbo.FeedExportProductAttributes;

	PRINT 'ProductAttributes loaded - ' + CAST(GETDATE() AS varchar);

	-- Log results
	INSERT INTO dbo.FeedExportSyncVersion (ChangeVersionId, DateAdded, Comment) VALUES (@next_baseline, GETDATE(), @comment);

	PRINT @comment;

END;
GO

GRANT EXECUTE ON [dbo].[exporter_LoadInitialData] TO [FeedsExporter]; 
GO