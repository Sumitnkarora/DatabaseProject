/************************************************************************************
Target DB:      AzureDb - TradeDb_US
Procedure Name: dbo.spTradeDataExport
Description:    Export trade data from [TradeDataExport] in staus 1 and 5 to TWR
Input param:    None
Dependencies:   dbo.TradeDataExport, TradeCollectionData, TradeCollections, TradeContributorData, refContributorRoles, TradeContributors, TradeEnhancedContent, 
TradeDataPriority, refProductFormToMediaBinding, TradeSupplierPricing, TradeSupplierInformation
Create Date:    2018/05/28
Change History: 
Design Notes:
    *	For CollectionTitle , take  First Trade Series + SeriesData Entry from [TradeCollections]
	*   ContentCodes and ContentTpesy in TradeEnhancedContent are in a key value format i.e. in two columns. To create seperate column for each content code, a pivot is used
	*   List price calculation = ListPrice - (1 - Discount in %)
	*   Select first collection title which matches the join between TradeCollections and TradeCollectionData  
************************************************************************************/

CREATE PROCEDURE spTradeDataExport  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #TempTradeCollectionsData(ISBN13 VARCHAR(13) NOT NULL, SAPVendorID VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL, CollectionId INT NOT NULL)
	INSERT #TempTradeCollectionsData (ISBN13, SAPVendorId, VSRCode, CollectionId)
	SELECT      ISBN13,SAPVendorId,VSRCode, MIN(CollectionId) AS CollectionId
				FROM [dbo].[TradeCollectionData] AS tcld WITH(NOLOCK)
				GROUP BY ISBN13,SAPVendorId,VSRCode;

	CREATE TABLE #TempTradeCollections (ISBN13 VARCHAR(13) NOT NULL, SAPVendorID VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL, CollectionId INT NOT NULL, CollectionTitle NVARCHAR(255) NOT NULL PRIMARY KEY CLUSTERED(ISBN13, SAPVendorId, VSRCode));
	INSERT	#TempTradeCollections ( ISBN13, SAPVendorId, VSRCode, CollectionId, CollectionTitle )
	SELECT DISTINCT	tcld.ISBN13, tcld.SAPVendorId, tcld.VSRCode, tcld.CollectionId, tcl.CollectionTitle
	FROM [dbo].[TradeCollections] AS tcl WITH(NOLOCK)
	INNER JOIN #TempTradeCollectionsData AS tcld  WITH(NOLOCK) on tcld.CollectionId = tcl.CollectionId
	WHERE tcl.CollectionType = 'series';

	CREATE TABLE #TradeContributorData (ISBN13 VARCHAR(13) NOT NULL, SAPVendorID VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL, DescriptionAndContributorTitle NVARCHAR(MAX) NULL, RoleId CHAR(3) NULL, RoleDescription VARCHAR(MAX) ,ContributorTitle NVARCHAR(255) NULL PRIMARY KEY CLUSTERED(ISBN13, SAPVendorId, VSRCode));
	INSERT #TradeContributorData (ISBN13, SAPVendorID, VSRCode, DescriptionAndContributorTitle, RoleId, ContributorTitle)
	SELECT ISBN13,SAPVendorId,VSRCode,'~' + STRING_AGG(CONCAT(rcr.Description , '^', tc.ContributorTitle),'~') AS 'DescriptionAndContributorTitle',MIN(tcd.RoleId) AS 'RoleId', rcr.Description ,MIN(tc.ContributorTitle) AS 'ContributorTitle'
	FROM [dbo].[TradeContributorData] tcd
	INNER JOIN [dbo].[refContributorRoles] as rcr WITH(NOLOCK) on rcr.RoleCode = tcd.RoleId
	INNER JOIN [dbo].[TradeContributors] as tc WITH(NOLOCK) on tc.ContributorId = tcd.ContributorId
	GROUP BY ISBN13,SAPVendorId,VSRCode,Description;

	WITH PivotTradeEnhancedContent (ISBN13, SAPVendorId, VSRCode,ContentType01,ContentType02,ContentType03,ContentType13)
	AS
	(
		select ISBN13, SAPVendorId, VSRCode, [01] AS 'ContentType01', [02] AS 'ContentType02', [03] AS 'ContentType03', [13] AS 'ContentType13'
		from 
		(
			SELECT  ISBN13,SAPVendorId,VSRCode,ContentType,Content
			FROM TradeEnhancedContent
		) src
		pivot
		(
		  max(Content)
		  for ContentType in ([01] , [02], [03], [13])
		) piv
	)

SELECT 
		tde.ISBN13 AS 'StyleNo',
		tca.Title AS 'Description1',	
		tca.Title AS 'Description2',
		tca.Title AS 'Description4',
		refProduct.BindingCode AS 'AttributeSet1',
		tdp.SAPVendorId AS 'PrimaryVendor',
		tca.ListPrice * ( 1.00 - ( tca.Discount / 100 ) ) AS 'OrderCost',
		'' AS 'SeasonName',
		'' AS 'TaxGroupCode',
		'' AS 'TaxCategory',
		tca.Imprint AS 'BrandName',
		'' AS 'CountryOfOrigin',
		tec.ContentType13 AS 'CustomLongText1',
		tca.Title AS 'CustomLongText2',
		COALESCE(tec.ContentType01, tec.ContentType02, tec.ContentType03) AS 'CustomLongText3',
		'' AS 'CustomLongText4',
		'' AS 'CustomLongText5',
		tcd.DescriptionAndContributorTitle AS 'CustomLongText6',
		tdp.ISBN13 AS 'EID',
		tdp.ISBN13 AS 'PLU',
		tdp.ISBN13 AS 'CLU',
		tdp.ISBN13 AS 'UPCValue',
		'' AS 'Attribute1',
		'' AS 'Attribute2',
		tca.Depth AS 'Height',
		tca.[Length] AS 'Length',
		tca.[Weight] AS 'Weight',
		tca.Width AS 'Width',
		tca.ListPrice * ( 1.00 - ( tca.Discount / 100 ) ) AS 'ItemCost',
		tca.ListPrice AS 'BasePrice',
		tca.PublicationDate AS 'ReleaseDate',
		tca.Title AS 'Name',
		tca.Title AS 'LookupName',
		tsi.OnSaleDate AS 'CustomDate1',
		tcd.ContributorTitle AS 'CustomText1',
		tcd.RoleDescription AS 'CustomText2',
		tca.PrimaryLanguage AS 'CustomText5',
		tcld.CollectionTitle AS 'CustomText9',
		tde.MerchCategoryId AS 'SubClass1',
		tde.LayoutModuleId AS 'SubClass2'
	FROM [dbo].[TradeDataExport] AS tde WITH(NOLOCK)
	INNER JOIN [dbo].[TradeDataPriority] AS tdp WITH(NOLOCK) on tdp.ISBN13 = tde.ISBN13 AND tdp.RegionId = tde.RegionId
	LEFT JOIN [dbo].[TradeCoreAttributes] AS tca WITH(NOLOCK) ON tca.ISBN13 = tdp.ISBN13 AND tca.SAPVendorID = tdp.SAPVendorId AND tca.VSRCode = tdp.VSRCode  
	LEFT JOIN [dbo].[refProductFormToMediaBinding] AS refProduct WITH(NOLOCK) ON refProduct.ProductFormId = tca.ProductForm AND refProduct.ProductFormDetailId = tca.ProductFormDetail
	LEFT JOIN [dbo].[TradeSupplierPricing] AS tsp WITH(NOLOCK) ON tsp.ISBN13 = tdp.ISBN13 AND tsp.SAPVendorID = tdp.SAPVendorId AND tsp.VSRCode = tdp.VSRCode  
	LEFT JOIN [PivotTradeEnhancedContent] as tec WITH(NOLOCK) on tec.ISBN13 = tdp.ISBN13 AND tec.SAPVendorID = tdp.SAPVendorId AND tec.VSRCode = tdp.VSRCode 
	LEFT JOIN #TradeContributorData as tcd WITH(NOLOCK) on tcd.ISBN13 = tde.ISBN13 AND tcd.SAPVendorID = tdp.SAPVendorId AND tcd.VSRCode = tdp.VSRCode  
	LEFT JOIN [dbo].[TradeSupplierInformation] AS tsi WITH(NOLOCK) ON tsi.ISBN13 = tdp.ISBN13 AND tsi.SAPVendorID = tdp.SAPVendorId AND tsi.VSRCode = tdp.VSRCode  
	LEFT JOIN #TempTradeCollections as tcld WITH(NOLOCK) on tcld.ISBN13 = tdp.ISBN13 AND tcld.SAPVendorID = tdp.SAPVendorId AND tcld.VSRCode = tdp.VSRCode   
	WHERE tde.ExportStatus IN (1,5) 

	DROP TABLE #TempTradeCollectionsData
	DROP TABLE #TempTradeCollections
	DROP TABLE #TradeContributorData

END;

GO

GRANT EXECUTE ON dbo.spTradeDataExport TO  [TWRExporter];
