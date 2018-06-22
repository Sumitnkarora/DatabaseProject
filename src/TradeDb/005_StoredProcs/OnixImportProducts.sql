CREATE PROCEDURE [dbo].[OnixImportProducts]
AS
BEGIN
	--
	-- Change to Discount Code Mapping to use ClassOfTrade when present.
	--
	IF OBJECT_ID('tempdb..#DiscountCodeMapping', 'U') IS NOT NULL DROP TABLE #DiscountCodeMapping;
	CREATE TABLE #DiscountCodeMapping (
		[SAPVendorId] [varchar](20) NOT NULL
	,	[DiscountCodeType] [char](2) NOT NULL
	,	[DiscountCodeValue] [varchar](255) NOT NULL
	,	[Discount] [decimal](9, 5) NOT NULL
	);

	CREATE UNIQUE CLUSTERED INDEX UCX_DCM_TMP ON #DiscountCodeMapping(SAPVendorId, DiscountCodeType, DiscountCodeValue);

	INSERT  #DiscountCodeMapping ( SAPVendorId, DiscountCodeType, DiscountCodeValue, Discount )
	SELECT	SAPVendorID
	,	'02' as DiscountCodeType
	,	ClassOfTrade as DiscountCodeValue
	,	Discount
	FROM	dbo.TradeClassOfTrade;

	INSERT  #DiscountCodeMapping ( SAPVendorId, DiscountCodeType, DiscountCodeValue, Discount )
	SELECT	SAPVendorId
	,	DiscountCodeType
	,	DiscountCodeValue
	,	Discount
	FROM	dbo.refDiscountCodeMapping
	WHERE	NOT (
			DiscountCodeType = '02'
		AND	SAPVendorId IN ( SELECT SAPVendorId FROM #DiscountCodeMapping )
		);
	
	MERGE INTO dbo.TradeCoreAttributes AS target
	USING	dbo.stgTradeCoreAttributes AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode
	WHEN	MATCHED AND (
			ISNULL(target.ProductForm, '') <> ISNULL(source.ProductForm, '')
		OR	ISNULL(target.ProductFormDetail, '') <> ISNULL(source.ProductFormDetail, '')
		OR	target.Title <> source.Title
		OR	ISNULL(target.Subtitle, '') <> ISNULL(source.Subtitle, '')
		OR	ISNULL(target.AudienceCode, '') <> ISNULL(source.AudienceCode, '')
		OR	target.PublishingStatus <> source.PublishingStatus
		OR	ISNULL(target.PublicationDate, '1801-01-01') <> ISNULL(CONVERT(DATETIME, source.PublicationDate), '1801-01-01')
		OR	ISNULL(target.PrimaryLanguage, '') <> ISNULL(source.PrimaryLanguage, '')
		OR	ISNULL(target.AllLanguages, '') <> ISNULL(source.AllLanguages, '')
		OR	ISNULL(target.Length, -1) <> ISNULL(CONVERT(DECIMAL(9, 5), source.Length), -1)
		OR	ISNULL(target.Width, -1) <> ISNULL(CONVERT(DECIMAL(9, 5), source.Width), -1)
		OR	ISNULL(target.Depth, -1) <> ISNULL(CONVERT(DECIMAL(9, 5), source.Depth), -1)
		OR	ISNULL(target.UnitOfMeasurement, '') <> ISNULL(source.UnitOfMeasurement, '')
		OR	ISNULL(target.Weight, -1) <> ISNULL(CONVERT(DECIMAL(9, 5), source.Weight), -1)
		OR	ISNULL(target.UnitOfWeight, '') <> ISNULL(source.UnitOfWeight, '')
		OR	ISNULL(target.Publisher, '') <> ISNULL(source.Publisher, '')
		OR	ISNULL(target.Imprint, '') <> ISNULL(source.Imprint, '')
		OR	ISNULL(target.Organizations, '') <> ISNULL(source.Organizations, '')
		OR	target.ListPrice <> CONVERT(DECIMAL(9, 5), source.ListPrice)
		OR	target.Currency <> source.Currency
		OR	target.Discount <> (SELECT Discount FROM #DiscountCodeMapping WHERE SAPVendorId = source.SAPVendorId AND DiscountCodeType = source.DiscountType AND DiscountCodeValue = source.DiscountValue)
		) THEN
		UPDATE SET target.ProductForm = source.ProductForm, 
			target.ProductFormDetail = source.ProductFormDetail,
			target.Title = source.Title,
			target.Subtitle = source.Subtitle,
			target.AudienceCode = source.AudienceCode,
			target.PublishingStatus = source.PublishingStatus,
			target.PublicationDate = CONVERT(DATETIME, source.PublicationDate),
			target.PrimaryLanguage = source.PrimaryLanguage,
			target.AllLanguages = source.AllLanguages,
			target.Length = CONVERT(DECIMAL(9, 5), source.Length),
			target.Width = CONVERT(DECIMAL(9, 5), source.Width),
			target.Depth = CONVERT(DECIMAL(9, 5), source.Depth),
			target.UnitOfMeasurement = source.UnitOfMeasurement,
			target.Weight = CONVERT(DECIMAL(9, 5), source.Weight),
			target.UnitOfWeight = source.UnitOfWeight,
			target.Publisher = source.Publisher,
			target.Imprint = source.Imprint,
			target.Organizations = source.Organizations,
			target.ListPrice = CONVERT(MONEY, source.ListPrice),
			target.Currency = source.Currency,
			target.Discount = (SELECT Discount FROM [dbo].[refDiscountCodeMapping] WHERE SAPVendorId = source.SAPVendorId AND DiscountCodeType = source.DiscountType AND DiscountCodeValue = source.DiscountValue)
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode,
			ProductForm, ProductFormDetail, Title, Subtitle, AudienceCode, PublishingStatus, PublicationDate,
			PrimaryLanguage, AllLanguages, Length, Width, Depth, UnitOfMeasurement, Weight, UnitOfWeight,
			Publisher, Imprint, Organizations, ListPrice, Currency, Discount)
		VALUES (
			source.ISBN13,
			source.SAPVendorID,
			source.VSRCode,
			source.ProductForm,
			source.ProductFormDetail,
			source.Title,
			source.Subtitle,
			source.AudienceCode,
			source.PublishingStatus,
			CONVERT(DATETIME, source.PublicationDate),
			source.PrimaryLanguage,
			source.AllLanguages,
			CONVERT(DECIMAL(9, 5), source.Length),
			CONVERT(DECIMAL(9, 5), source.Width),
			CONVERT(DECIMAL(9, 5), source.Depth),
			source.UnitOfMeasurement,
			CONVERT(DECIMAL(9, 5), source.Weight),
			source.UnitOfWeight,
			source.Publisher,
			source.Imprint,
			source.Organizations,
			CONVERT(MONEY, source.ListPrice),
			source.Currency,
			(SELECT Discount FROM [dbo].[refDiscountCodeMapping] WHERE SAPVendorId = source.SAPVendorId AND DiscountCodeType = source.DiscountType AND DiscountCodeValue = source.DiscountValue)
		);

	MERGE INTO dbo.TradeAlternateIdentifiers AS target
	USING	dbo.stgTradeAlternateIdentifiers AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.ID = target.ID
	WHEN	MATCHED AND (
			target.IdentifierType <> source.IdentifierType
		OR	target.IdentifierValue <> source.IdentifierValue
		) THEN
		UPDATE SET target.IdentifierType = source.IdentifierType, 
			target.IdentifierValue = source.IdentifierValue
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, ID, IdentifierType, IdentifierValue)
		VALUES (
			source.ISBN13, source.SAPVendorID, source.VSRCode, source.ID,
			source.IdentifierType, source.IdentifierValue
		);

	MERGE INTO dbo.TradeCollections AS target
	USING	dbo.stgTradeCollections AS source
		ON	source.CollectionId = target.CollectionId
	WHEN	MATCHED AND (
			target.CollectionType <> source.CollectionType
		OR	target.CollectionTitle <> source.CollectionTitle
		) THEN
		UPDATE SET target.CollectionType = source.CollectionType, 
			target.CollectionTitle = source.CollectionTitle
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (CollectionId, CollectionType, CollectionTitle)
		VALUES (
			source.CollectionId, source.CollectionType, source.CollectionTitle
		);

	MERGE INTO dbo.TradeCollectionData AS target
	USING	dbo.stgTradeCollectionData AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.Ordinal = target.Ordinal
	WHEN	MATCHED AND (
			target.CollectionId <> source.CollectionId
		OR	ISNULL(target.CollectionIndex, -1) <> ISNULL(CONVERT(INT, source.CollectionIndex), -1)
		) THEN
		UPDATE SET target.CollectionId = source.CollectionId, 
			target.CollectionIndex = CONVERT(INT, source.CollectionIndex)
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, Ordinal, CollectionId, CollectionIndex)
		VALUES (
			source.ISBN13, source.SAPVendorID, source.VSRCode, source.Ordinal,
			source.CollectionId, CONVERT(INT, source.CollectionIndex)
		);

	MERGE INTO dbo.TradeContributors AS target
	USING	dbo.stgTradeContributors AS source
		ON	source.ContributorId = target.ContributorId
	WHEN	MATCHED AND (
			ISNULL(target.ContributorTitle, '') <> ISNULL(source.ContributorTitle, '')
		) THEN
		UPDATE SET target.ContributorTitle = source.ContributorTitle
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ContributorId, ContributorTitle)
		VALUES (
			source.ContributorId, source.ContributorTitle
		);

	MERGE INTO dbo.TradeContributorData AS target
	USING	dbo.stgTradeContributorData AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.Ordinal = target.Ordinal
	WHEN	MATCHED AND (
			target.ContributorId <> source.ContributorId
		OR	target.RoleId <> source.RoleId
		) THEN
		UPDATE SET target.ContributorId = source.ContributorId, 
			target.RoleId = source.RoleId
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, Ordinal, ContributorId, RoleId)
		VALUES (
			source.ISBN13, source.SAPVendorID, source.VSRCode, source.Ordinal,
			source.ContributorId, source.RoleId
		);

	MERGE INTO dbo.TradeSubjects AS target
	USING	dbo.stgTradeSubjects AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.Ordinal = target.Ordinal
	WHEN	MATCHED AND (
			target.SubjectScheme <> source.SubjectScheme
		OR	target.SubjectSchemeName <> source.SubjectSchemeName
		OR	ISNULL(target.SubjectCode, '') <> ISNULL(source.SubjectCode, '')
		OR	ISNULL(target.SubjectText, '') <> ISNULL(source.SubjectText, '')
		) THEN
		UPDATE SET target.SubjectScheme = source.SubjectScheme, 
			target.SubjectSchemeName = source.SubjectSchemeName,
			target.SubjectCode = source.SubjectCode,
			target.SubjectText = source.SubjectText
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, Ordinal,
			SubjectScheme, SubjectSchemeName, SubjectCode, SubjectText)
		VALUES (
			source.ISBN13,
			source.SAPVendorID,
			source.VSRCode,
			source.Ordinal,
			source.SubjectScheme,
			source.SubjectSchemeName,
			source.SubjectCode,
			source.SubjectText
		);

	MERGE INTO dbo.TradeEnhancedContent AS target
	USING	dbo.stgTradeEnhancedContent AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.ID = target.ID
	WHEN	MATCHED AND (
			target.ContentCode <> source.ContentCode
		OR	ISNULL(target.ContentType, '') <> ISNULL(source.ContentType, '')
		OR	target.Content <> source.Content
		) THEN
		UPDATE SET target.ContentCode = source.ContentCode, 
			target.ContentType = source.ContentType,
			target.Content = source.Content
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, ID,
			ContentCode, ContentType, Content)
		VALUES (
			source.ISBN13, source.SAPVendorID, source.VSRCode, source.ID,
			source.ContentCode, source.ContentType, source.Content
		);

	MERGE INTO dbo.TradeSalesRights AS target
	USING	dbo.stgTradeSalesRights AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.ID = target.ID
	WHEN	MATCHED AND (
			target.CountryCode <> source.CountryCode
		OR	EXISTS (SELECT target.Allowed EXCEPT SELECT CONVERT(BIT, source.Allowed))
		OR	EXISTS (SELECT target.Disallowed EXCEPT SELECT CONVERT(BIT, source.Disallowed))
		OR	EXISTS (SELECT target.Exclusive EXCEPT SELECT CONVERT(BIT, source.Exclusive))
		OR	EXISTS (SELECT target.Norights EXCEPT SELECT CONVERT(BIT, source.Norights))
		) THEN
		UPDATE SET target.CountryCode = source.CountryCode, 
			target.Allowed = CONVERT(BIT, source.Allowed),
			target.Disallowed = CONVERT(BIT, source.Disallowed),
			target.Exclusive = CONVERT(BIT, source.Exclusive),
			target.Norights = CONVERT(BIT, source.Norights)
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, ID,
			CountryCode, Allowed, Disallowed, Exclusive, Norights)
		VALUES (
			source.ISBN13, source.SAPVendorID, source.VSRCode, source.ID,
			source.CountryCode, CONVERT(BIT, source.Allowed), CONVERT(BIT, source.Disallowed),
			CONVERT(BIT, source.Exclusive), CONVERT(BIT, source.Norights)
		);

	MERGE INTO dbo.TradeSupplierInformation AS target
	USING	dbo.stgTradeSupplierInformation AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.SupplierId = target.SupplierId
	WHEN	MATCHED AND (
			target.SupplierName <> source.SupplierName
		OR	ISNULL(target.SupplierRole, '') <> ISNULL(source.SupplierRole, '')
		OR	ISNULL(target.ReturnConditionType, '') <> ISNULL(source.ReturnConditionType, '')
		OR	ISNULL(target.ReturnConditionCode, '') <> ISNULL(source.ReturnConditionCode, '')
		OR	ISNULL(target.AvailabilityCode, '') <> ISNULL(source.AvailabilityCode, '')
		OR	ISNULL(target.AvailabilityOldCode, '') <> ISNULL(source.AvailabilityOldCode, '')
		OR	ISNULL(target.OnSaleDate, '1801-01-01') <> ISNULL(CONVERT(DATETIME, source.OnSaleDate), '1801-01-01')
		OR	ISNULL(target.CartonQty, -1) <> ISNULL(CONVERT(INT, source.CartonQty), -1)
		) THEN
		UPDATE SET target.SupplierName = source.SupplierName, 
			target.SupplierRole = source.SupplierRole,
			target.ReturnConditionType = source.ReturnConditionType,
			target.ReturnConditionCode = source.ReturnConditionCode,
			target.AvailabilityCode = source.AvailabilityCode,
			target.AvailabilityOldCode = source.AvailabilityOldCode,
			target.OnSaleDate = CONVERT(DATETIME, source.OnSaleDate),
			target.CartonQty = CONVERT(INT, source.CartonQty)
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, SupplierId,
			SupplierName, SupplierRole, ReturnConditionType, ReturnConditionCode,
			AvailabilityCode, AvailabilityOldCode, OnSaleDate, CartonQty)
		VALUES (
			source.ISBN13,
			source.SAPVendorID,
			source.VSRCode,
			source.SupplierId,
			source.SupplierName,
			source.SupplierRole,
			source.ReturnConditionType,
			source.ReturnConditionCode,
			source.AvailabilityCode,
			source.AvailabilityOldCode,
			CONVERT(DATETIME, source.OnSaleDate),
			CONVERT(INT, source.CartonQty)
		);

	MERGE INTO dbo.TradeSupplierPricing AS target
	USING	dbo.stgTradeSupplierPricing AS source
		ON	source.ISBN13 = target.ISBN13 AND
			source.SAPVendorId = target.SAPVendorId AND
			source.VSRCode = target.VSRCode AND
			source.SupplierId = target.SupplierId
	WHEN	MATCHED AND (
			target.PriceType <> source.PriceType
		OR	ISNULL(target.Currency, '') <> ISNULL(source.Currency, '')
		OR	ISNULL(target.DiscountType, '') <> ISNULL(source.DiscountType, '')
		OR	ISNULL(target.DiscountTypeName, '') <> ISNULL(source.DiscountTypeName, '')
		OR	ISNULL(target.DiscountValue, '') <> ISNULL(source.DiscountValue, '')
		OR	ISNULL(target.Price, -1) <> ISNULL(CONVERT(MONEY, source.Price), -1)
		) THEN
		UPDATE SET target.PriceType = source.PriceType, 
			target.Currency = source.Currency,
			target.DiscountType = source.DiscountType,
			target.DiscountTypeName = source.DiscountTypeName,
			target.DiscountValue = source.DiscountValue,
			target.Price = CONVERT(MONEY, source.Price)
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (ISBN13, SAPVendorID, VSRCode, SupplierId,
			PriceType, Currency, DiscountType, DiscountTypeName, DiscountValue, Price)
		VALUES (
			source.ISBN13, source.SAPVendorID, source.VSRCode, source.SupplierId,
			source.PriceType, source.Currency, source.DiscountType, source.DiscountTypeName, source.DiscountValue,
			CONVERT(MONEY, source.Price)
		);
END
GO

GRANT EXECUTE ON OnixImportProducts TO OnixImportApp;
GO