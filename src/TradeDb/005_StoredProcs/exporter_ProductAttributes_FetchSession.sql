/* =============================================
 Author:		Dariusz Holc
 Create date:	Jan 5, 2018
 Description:	Updates top X records to StatusId = 1 (Processing) for exclusive export lock specified by SessionId;
				Returns updated records for exporting

 Revision history: 
				Jan 15, 2018 Dariusz Holc
				Added support for languages; exclude kobo books based on market availability
				Jan 17, 2018 Dariusz Holc
				Allow fetching for Trade data.
				Jan 18, 2018 Dariusz Holc
				Add details for Trade products (i.e. pricing, etc).
				Jan 19, 2018 Dariusz Holc
				Add aggregation and discounts for Trade products.
				Jan 22, 2018 Dariusz Holc
				Switch multi language handling to code instead of sql.
				Optimize to only retrieve additional data for non deleted.
				Jan 23, 2018 Dariusz Holc
				Add dimensions.
				Jan 30, 2018 Dariusz Holc
				Add audience code.
				Feb 01, 2018 Dariusz Holc
				Fix for fetching only lowest version records.
				Feb 06, 2018 Dariusz Holc
				Add aggregation for Kobo and change for Trade.
				Feb 08, 2018 Dariusz Holc
				Fix fetching with ordering by change version (first in, first out).
				Feb 14, 2018 Dariusz Holc
				Changes for IndigoAggregation for new PK (ISBN13 instead of PID)
				Feb 21, 2018 Dariusz Holc
				Make fetch only selection and move the marking of records to start session.
				Feb 27, 2018 Dariusz Holc
				Add support for Indigo Master Record (IMR).
				Mar 01, 2018 Dariusz Holc
				Fix Kobo aggregation (no need to join to itself like in indigo aggregation as related prod already available in the row)
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_ProductAttributes_FetchSession]
    @SessionId uniqueidentifier,
	@RegionId varchar(10) = 'CA',
	@DefaultCurrencyCode varchar(3) = 'CAD'
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @KoboVendorId VARCHAR(12) = '714254';
	DECLARE @IndigoVendorId VARCHAR(12) = '703416';
	DECLARE @RecordsToExport TABLE(ISBN13 varchar(13), SAPVendorId varchar(12), VSRCode varchar(12), EBookId varchar(36), isDeleted bit); 

	INSERT INTO @RecordsToExport (ISBN13, SAPVendorId, VSRCode, EBookId, isDeleted)
	SELECT f.ISBN13, f.SAPVendorId, f.VSRCode, f.EBookId, f.IsDeleted 
	FROM FeedExportProductAttributes f WITH (NOLOCK)
	WHERE f.StatusId = 1 AND f.SessionId = @SessionId;

	DECLARE @NowUtc DATETIME = GETUTCDATE();
		
	-- Return the data in multiple resultsets
	-- Main data
	SELECT
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		CASE WHEN s.ISBN13 IS NULL OR ISNULL(a.IsDeleted, 0) = 1 THEN CONVERT(bit, 1) ELSE e.IsDeleted END AS IsDeleted,
		s.ISBN AS Isbn10,
		UPPER(s.StatusCode) AS StatusCode,
		s.[Language] AS [Language],
		ISNULL(a.IsSearchable, 1) AS IsSearchable,
		ISNULL(a.IsPreview, 0) AS IsPreview,
		CASE WHEN UPPER(s.StatusCode) = 'BB' THEN CONVERT(bit, 1) ELSE NULL END AS IsBargain,
		CASE WHEN UPPER(ISNULL(s.CanadianTitle,'')) = 'Y' THEN CONVERT(bit, 1) ELSE NULL END AS IsCanadian,
		CASE WHEN UPPER(s.EditionDescription) = 'LTE' THEN CONVERT(bit, 1) ELSE NULL END AS IsLargePrint,
		a.IsFreeShipEligible AS IsFreeShipEligible,
		a.IsMITEligible AS IsMitEligible,
		a.IsRushEligible AS IsRushEligible,
		UPPER(s.Media) AS Media,
		UPPER(s.[Binding]) AS [Binding],
		s.Title AS Title,
		s.Subtitle AS Subtitle,
		UPPER(s.ItemPriceCurrency) AS DefaultCurrencyCode,
		a.OnlineMarkdownPrice AS OnlineMarkdownPrice,
		s.StreetDate AS StreetDate,
		s.PubDate AS PublicationDate,
		s.EditionNumber AS EditionNumber,
		s.EditionDescription AS EditionDescription,
		s.Imprint AS Imprint,
		rp.PublisherName AS PublisherName,
		CASE WHEN rac.AudienceCode IS NULL THEN s.AudienceCode ELSE rac.OnixCode END AS AudienceCode,
		s.AgeLowerLimit AS AgeLowerLimit,
		s.AgeUpperLimit AS AgeUpperLimit,
		s.GradeLowerLimit AS GradeLowerLimit,
		s.GradeUpperLimit AS GradeUpperLimit,
		s.Width AS Width,
		s.Height AS Height,
		s.Depth AS Depth,
		s.MeasurementUnits AS MeasurementUnit,
		s.[Weight] AS [Weight],
		s.WeightUnits AS WeightUnit,
		NULL AS ImageId,
		NULL AS IsKids,
		NULL AS IsAdult,
		NULL AS IsKoboWritingLife,
		NULL AS CoverImage,
		NULL AS ItemPage,
		NULL AS PurchasePath,
		NULL AS InstantPreview
	FROM @RecordsToExport e 
	LEFT JOIN TradeDataWithImrByRegion s WITH (NOLOCK) ON s.ISBN13 = e.ISBN13 AND s.SAPVendorId = e.SAPVendorId AND s.VSRCode = e.VSRCode AND s.RegionId = @RegionId
	LEFT JOIN TradeIndigoAttributes a WITH (NOLOCK) ON a.ISBN13 = e.ISBN13 AND a.SAPVendorId = e.SAPVendorId AND a.VSRCode = e.VSRCode
	LEFT JOIN refPublishers rp WITH (NOLOCK) ON rp.PublisherID = s.PublisherID
	LEFT JOIN refAudienceCodes rac WITH (NOLOCK) ON rac.AudienceCode = s.AudienceCode AND rac.IsDeleted = 0
	WHERE e.EBookId = ''
	UNION ALL
	SELECT
		k.ISBN AS Isbn13,
		@KoboVendorId AS SAPVendorId,
		'' AS VSRCode,
		e.EBookId AS EBookId,
		CASE WHEN k.EBookID IS NULL OR k.IsActive = 0 OR excid.eBookID IS NOT NULL OR excisbn.ISBN IS NOT NULL OR
				  ((a.GeneralAvailability IS NULL OR a.GeneralAvailability > @NowUtc) AND (a.PreOrder IS NULL OR a.PreOrder > @NowUtc))
		     THEN CONVERT(bit, 1) ELSE e.IsDeleted END AS IsDeleted,
		NULL AS Isbn10,
		'ACT' AS StatusCode,
		k.[Language] AS [Language],
		CONVERT(bit, 1) AS IsSearchable,
		CONVERT(bit, 0) AS IsPreview,
		NULL AS IsBargain,
		NULL AS IsCanadian,
		NULL AS IsLargePrint,
		NULL AS IsFreeShipEligible,
		NULL AS IsMitEligible,
		NULL AS IsRushEligible,
		'E' AS Media,
		'EB' AS [Binding],
		k.Title AS Title,
		k.Subtitle AS Subtitle,
		@DefaultCurrencyCode AS DefaultCurrencyCode,
		NULL AS OnlineMarkdownPrice,
		a.GeneralAvailability AS StreetDate,
		k.PublicationDate AS PublicationDate,
		NULL AS EditionNumber,
		k.Edition AS EditionDescription,
		k.Imprint AS Imprint,
		k.Publisher AS PublisherName,
		NULL AS AudienceCode,
		k.MinAge AS AgeLowerLimit,
		k.MaxAge AS AgeUpperLimit,
		NULL AS GradeLowerLimit,
		NULL AS GradeUpperLimit,
		NULL AS Width,
		NULL AS Height,
		NULL AS Depth,
		NULL AS MeasurementUnit,
		NULL AS [Weight],
		NULL AS WeightUnit,
		k.ImageId AS ImageId,
		k.IsKids AS IsKids,
		k.IsAdultMaterial AS IsAdult,
		k.IsKWL AS IsKoboWritingLife,
		k.CoverImage AS CoverImage,
		k.ItemPage AS ItemPage,
		k.PurchasePath AS PurchasePath,
		k.InstantPreview AS InstantPreview
	FROM @RecordsToExport e 
	LEFT JOIN KoboBooks k WITH (NOLOCK) ON k.EBookID = e.EBookId
	LEFT JOIN EBookExclusionsesEBookID excid WITH (NOLOCK) ON excid.eBookID = e.EBookId
	LEFT JOIN EBookExclusionsISBN excisbn WITH (NOLOCK) ON excisbn.ISBN = k.ISBN
	LEFT JOIN KoboMarketAvailabilityDates a WITH (NOLOCK) ON a.EBookID = k.EBookID AND a.Region = @RegionId
	WHERE e.EBookId <> '';
		
	-- Prices
	WITH pricing AS (
		SELECT
			s.ISBN13,
			s.SAPVendorId,
			s.VSRCode,
			UPPER(s.ItemPriceCurrency) AS ItemPriceCurrency,
			s.ItemPrice,
			s.ForeignVendCADRetail,
			s.Discount
		FROM @RecordsToExport e 
		JOIN TradeDataWithImrByRegion s WITH (NOLOCK) ON s.ISBN13 = e.ISBN13 AND s.SAPVendorId = e.SAPVendorId AND s.VSRCode = e.VSRCode
		WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND s.RegionId = @RegionId)
	SELECT 
		p.ISBN13 AS Isbn13,
		p.SAPVendorId AS SAPVendorId,
		p.VSRCode AS VSRCode,
		NULL AS EBookId,
		p.ItemPriceCurrency AS Currency,
		p.ItemPrice AS ListPrice,
		NULL AS SellingPrice,
		p.Discount AS DiscountPercentage,
		CASE WHEN ISNULL(p.ItemPriceCurrency,'') = @DefaultCurrencyCode THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS IncludeCost
	FROM pricing p
	UNION
	SELECT 
		p.ISBN13 AS Isbn13,
		p.SAPVendorId AS SAPVendorId,
		p.VSRCode AS VSRCode,
		NULL AS EBookId,
		@DefaultCurrencyCode AS Currency,
		p.ForeignVendCADRetail AS ListPrice,
		NULL AS SellingPrice,
		p.Discount AS DiscountPercentage,
		CONVERT(bit, 1) AS IncludeCost
	FROM pricing p
	WHERE @DefaultCurrencyCode = 'CAD' AND p.ForeignVendCADRetail IS NOT NULL AND ISNULL(p.ItemPriceCurrency,'') <> @DefaultCurrencyCode
	UNION ALL
	SELECT
		NULL AS Isbn13,
		@KoboVendorId AS SAPVendorId,
		'' AS VSRCode,
		k.EBookId AS EBookId,
		k.Currency AS Currency,
		k.ListPrice AS ListPrice,
		k.SellingPrice AS SellingPrice,
		null AS DiscountPercentage,
		CONVERT(bit, 0) AS IncludeCost
	FROM @RecordsToExport e 
	JOIN KoboPrices k WITH (NOLOCK) ON k.EBookID = e.EBookId
	WHERE e.EBookId <> '' AND ISNULL(e.isDeleted, 0) = 0 AND (k.[To] IS NULL OR k.[To] > @NowUtc) AND (k.[From] < @NowUtc)

	-- Product links (aggregation)
	SELECT DISTINCT
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		a.IndigoAggregationId AS AggregationId,
		tdr.ISBN13 AS ProductId,
		'06' AS LinkType
	FROM @RecordsToExport e 
	JOIN IndigoAggregation ia WITH (NOLOCK) ON ia.ISBN13 = e.ISBN13
	JOIN IndigoAggregation a WITH (NOLOCK) ON a.IndigoAggregationId = ia.IndigoAggregationId
	JOIN TradeDataByRegion tdr WITH (NOLOCK) ON tdr.ISBN13 = a.ISBN13
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND tdr.RegionID = @RegionId AND e.ISBN13 <> tdr.ISBN13
	UNION ALL
	SELECT
		NULL AS Isbn13,
		@KoboVendorId AS SAPVendorId,
		'' AS VSRCode,
		e.EBookId AS EBookId,
		ka.IndigoAggregationId AS AggregationId,
		CASE WHEN UPPER(ka.DestinationBookType) = 'EBOOK' THEN ka.DestinationEBookId ELSE ka.DestinationISBN13 END AS ProductId,
		'06' AS LinkType
	FROM @RecordsToExport e 
	JOIN KoboAggregation ka WITH (NOLOCK) ON ka.SourceEBookId = e.EBookId
	WHERE e.EBookId <> '' AND ISNULL(e.isDeleted, 0) = 0

	-- Contributors
	-- First: IMR only
	SELECT 
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		c.ContributorId AS ContributorId,
		c.Ordinal AS Ordinal,
		rc.RoleCode AS RoleCode
	FROM @RecordsToExport e 
	JOIN TradeContributorData c WITH (NOLOCK) ON c.ISBN13 = e.ISBN13 
	JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = c.ISBN13 AND indp.SAPVendorId = c.SAPVendorId AND indp.VSRCode = c.VSRCode AND indp.RegionId = @RegionId
	JOIN refContributorRoles rc WITH (NOLOCK) ON rc.RoleId = c.RoleId
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND c.SAPVendorId = @IndigoVendorId AND c.VSRCode = '' AND c.SAPVendorId != e.SAPVendorId 
	UNION ALL
	-- Second: Regular excluding already taken from IMR
	SELECT 
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		c.ContributorId AS ContributorId,
		c.Ordinal AS Ordinal,
		rc.RoleCode AS RoleCode
	FROM @RecordsToExport e 
	JOIN TradeContributorData c WITH (NOLOCK) ON c.ISBN13 = e.ISBN13 AND c.SAPVendorId = e.SAPVendorId AND c.VSRCode = e.VSRCode
	JOIN refContributorRoles rc WITH (NOLOCK) ON rc.RoleId = c.RoleId
	LEFT JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = c.ISBN13 AND indp.SAPVendorId = @IndigoVendorId AND indp.VSRCode = '' AND indp.RegionId = @RegionId
	LEFT JOIN TradeContributorData ind WITH (NOLOCK) ON ind.ISBN13 = indp.ISBN13 AND ind.SAPVendorId = indp.SAPVendorId AND ind.VSRCode = indp.VSRCode
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND (ind.SAPVendorId IS NULL OR c.SAPVendorId = @IndigoVendorId)
	UNION ALL
	-- Third: Kobo
	SELECT
		NULL AS Isbn13,
		@KoboVendorId AS SAPVendorId,
		'' AS VSRCode,
		k.EBookId AS EBookId,
		NULL AS ContributorId,
		k.ContributorOrdinal AS Ordinal,
		rc.RoleCode AS RoleCode
	FROM @RecordsToExport e 
	JOIN KoboContributors k WITH (NOLOCK) ON k.EBookID = e.EBookId
	JOIN refContributorRoles rc WITH (NOLOCK) ON rc.KoboType = k.ContributorType
	WHERE e.EBookId <> '' AND ISNULL(e.isDeleted, 0) = 0 AND rc.KoboType IS NOT NULL

	-- Series
	-- First: IMR only
	SELECT
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		CONVERT(VARCHAR, s.SeriesId) AS SeriesId,
		s.Ordinal AS Ordinal
	FROM @RecordsToExport e 
	JOIN TradeSeriesData s WITH (NOLOCK) ON s.ISBN13 = e.ISBN13
	JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = s.ISBN13 AND indp.SAPVendorId = s.SAPVendorId AND indp.VSRCode = s.VSRCode AND indp.RegionId = @RegionId
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND s.SAPVendorId = @IndigoVendorId AND s.VSRCode = '' AND s.SAPVendorId != e.SAPVendorId 
	UNION ALL
	-- Second: Regular excluding already taken from IMR
	SELECT
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		CONVERT(VARCHAR, s.SeriesId) AS SeriesId,
		s.Ordinal AS Ordinal
	FROM @RecordsToExport e 
	JOIN TradeSeriesData s WITH (NOLOCK) ON s.ISBN13 = e.ISBN13 AND s.SAPVendorId = e.SAPVendorId AND s.VSRCode = e.VSRCode
	LEFT JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = s.ISBN13 AND indp.SAPVendorId = @IndigoVendorId AND indp.VSRCode = '' AND indp.RegionId = @RegionId
	LEFT JOIN TradeSeriesData ind WITH (NOLOCK) ON ind.ISBN13 = indp.ISBN13 AND ind.SAPVendorId = indp.SAPVendorId AND ind.VSRCode = indp.VSRCode
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND (ind.SAPVendorId IS NULL OR s.SAPVendorId = @IndigoVendorId)
	UNION ALL
	-- Third: Kobo
	SELECT
		NULL AS Isbn13,
		@KoboVendorId AS SAPVendorId,
		'' AS VSRCode,
		k.EBookId AS EBookId,
		k.SeriesId AS SeriesId,
		TRY_CONVERT(INT, k.SeriesNumber) AS Ordinal
	FROM @RecordsToExport e 
	JOIN KoboSeriesAssignment k WITH (NOLOCK) ON k.EBookID = e.EBookId
	WHERE e.EBookId <> '' AND ISNULL(e.isDeleted, 0) = 0

	-- Subjects
	-- First: IMR only
	SELECT
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		s.BISACCode AS Code,
		'10' AS SubjectType
	FROM @RecordsToExport e 
	JOIN TradeBisacData s WITH (NOLOCK) ON s.ISBN13 = e.ISBN13
	JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = s.ISBN13 AND indp.SAPVendorId = s.SAPVendorId AND indp.VSRCode = s.VSRCode AND indp.RegionId = @RegionId
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND s.SAPVendorId = @IndigoVendorId AND s.VSRCode = '' AND s.SAPVendorId != e.SAPVendorId 
	UNION 
	-- Second: Regular excluding already taken from IMR
	SELECT
		e.ISBN13 AS Isbn13,
		e.SAPVendorId AS SAPVendorId,
		e.VSRCode AS VSRCode,
		NULL AS EBookId,
		s.BISACCode AS Code,
		'10' AS SubjectType
	FROM @RecordsToExport e 
	JOIN TradeBisacData s WITH (NOLOCK) ON s.ISBN13 = e.ISBN13 AND s.SAPVendorId = e.SAPVendorId AND s.VSRCode = e.VSRCode
	LEFT JOIN TradeDataPriority indp WITH (NOLOCK) ON indp.ISBN13 = s.ISBN13 AND indp.SAPVendorId = @IndigoVendorId AND indp.VSRCode = '' AND indp.RegionId = @RegionId
	LEFT JOIN TradeBisacData ind WITH (NOLOCK) ON ind.ISBN13 = indp.ISBN13 AND ind.SAPVendorId = indp.SAPVendorId AND ind.VSRCode = indp.VSRCode
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0 AND (ind.SAPVendorId IS NULL OR s.SAPVendorId = @IndigoVendorId)
	UNION
	-- Third: Kobo
	SELECT
		NULL AS Isbn13,
		@KoboVendorId AS SAPVendorId,
		'' AS VSRCode,
		k.EBookId AS EBookId,
		k.BISAC AS Code,
		'10' AS SubjectType
	FROM @RecordsToExport e 
	JOIN KoboCategories k WITH (NOLOCK) ON k.EBookID = e.EBookId
	WHERE e.EBookId <> '' AND ISNULL(e.isDeleted, 0) = 0

	-- Awards
	SELECT
		s.ISBN13 AS Isbn13,
		s.SAPVendorId AS SAPVendorId,
		s.VSRCode AS VSRCode,
		NULL AS EBookId,
		a.PrizeCode,
		UPPER(a.PrizeCountry) AS PrizeCountry,
		a.PrizeName,
		a.PrizeYear
	FROM @RecordsToExport e 
	JOIN TradeDataByVendor s WITH (NOLOCK) ON s.ISBN13 = e.ISBN13 AND s.SAPVendorId = e.SAPVendorId AND s.VSRCode = e.VSRCode
	JOIN BowkerAwards a WITH (NOLOCK) ON a.PID = s.PID
	WHERE e.EBookId = '' AND ISNULL(e.isDeleted, 0) = 0

END
GO

GRANT EXECUTE ON [dbo].[exporter_ProductAttributes_FetchSession] TO [FeedsExporter]; 
GO