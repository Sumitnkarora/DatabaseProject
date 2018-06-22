/************************************************************************************
Procedure Name: uspKoboBooksUpload
Description:    uploads Kobo feed
Run Method:     exec uspKoboBooksUpload. The procedure is called FROM .NET application Kobo Feed v4.0
Create Date:    Oct. 23, 2017

************************************************************************************/

CREATE PROCEDURE [dbo].[uspKoboBooksUpload]
	@BatchSize int = 10000
AS
BEGIN
	SET XACT_ABORT ON

	------------------------------------------------------
	-- Check if the following are correct:
	--		1.In case of partial updates, item should already exists in KoboBooks
	--		2.In case of deactivated items, full update should be provided
	-- Otherwise add them to stgKoboFailedToProcessProducts
	------------------------------------------------------

	INSERT INTO stgKoboFailedToProcessProducts (EbookID, Reason)
		(SELECT a.EbookID, CASE WHEN b.EBookID IS NULL THEN 'For partial updates, item should already exist.( UpdateType = ' + a.UpdateType + ' )'
								ELSE 'For deactived items, Full update should be provided.( UpdateType = ' + a.UpdateType + ' )'
						   END
			FROM stgKoboBooks AS a
			LEFT JOIN KoboBooks  AS b WITH(NOLOCK)
			ON a.EBookID = b.EBookID
			WHERE a.UpdateType <> 'Full' 
				AND (b.EBookID IS NULL OR (b.EBookID IS NOT NULL AND b.IsActive = 0))
		)

	------------------------------------------------------

	INSERT INTO KoboFailedToProcessProducts(EbookID, DateCreated, Reason)
		   SELECT EbookID, GETDATE(), Reason FROM stgKoboFailedToProcessProducts GROUP BY EbookID, Reason

	------------------------------------------------------

	DELETE stgKoboBooks
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboPrices 
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboCategories
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboContributors
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboRelatedProducts
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboReadThisOn
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboDownloadable
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboSubscriptions
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	DELETE stgKoboMarketAvailabilityDates
		WHERE EBookID IN (SELECT EBookID FROM stgKoboFailedToProcessProducts)

	------------------------------------------------------
	------------------- Deactivation Section -------------
	------------------------------------------------------

	Update KoboBooks SET IsActive = 0,
						 DateChanged = GETDATE()
		WHERE EBookID IN (SELECT EBookID FROM stgKoboBooks WHERE UpdateType = 'Deactivation')

	------------------------------------------------------
	------------------- Batching Init Section ------------
	------------------------------------------------------

	CREATE TABLE #UpdatedRecords ([action] varchar(10));
	CREATE TABLE #BatchRecords (EBookID varchar(36) PRIMARY KEY CLUSTERED (EBookID))

	------------------------------------------------------------------------
	----------------------- UPDATE KOBO AGGREGATION ------------------------
	------------------------------------------------------------------------

	SELECT s.EbookID INTO #AggregationUpdates
	FROM stgKoboBooks s

	CREATE TABLE #NewKoboAggregations (SourceEBookId varchar(36), 
									   DestinationBookType varchar(20),
									   DestinationEBookId varchar(36), 
									   DestinationISBN13 varchar(13), 
									   IndigoAggregationId varchar(32))

	WHILE EXISTS (SELECT TOP 1 EBookId FROM #AggregationUpdates)
	BEGIN
		
		-- Truncate the batch table and fill it with the next batch
		TRUNCATE TABLE #BatchRecords
		INSERT INTO #BatchRecords (EBookID) (SELECT TOP (@BatchSize) EBookID FROM #AggregationUpdates)
		

		-- Insert new unaggregated kobo aggregations into a temp table
		TRUNCATE TABLE #NewKoboAggregations
		INSERT INTO #NewKoboAggregations
		SELECT  DISTINCT r.EBookID,
					     r.Relation, 
					     NULL,
					     r.ISBN,
					     CONCAT('K', r.ISBN)
		FROM stgKoboRelatedProducts r
			 INNER JOIN #BatchRecords b
			 ON r.EBookID = b.EBookID


		-- Update the destination EBookId from KoboBooks where the destination book type is 'EBook'
		UPDATE #NewKoboAggregations
		SET DestinationEBookId = b.EBookID
		FROM #NewKoboAggregations a LEFT JOIN stgKoboBooks b
		  ON a.DestinationISBN13 = b.ISBN
		WHERE a.DestinationBookType = 'EBook'


		-- Merge new unaggregated kobo aggregations into KoboAggregations
		MERGE KoboAggregation AS target
		USING
		(
			SELECT SourceEBookId,
			       DestinationBookType,
				   DestinationEBookId,
				   DestinationISBN13,
				   IndigoAggregationId
			FROM #NewKoboAggregations
		) 
		AS source (SourceEBookId, DestinationBookType, DestinationEBookId, DestinationISBN13, IndigoAggregationId)
		ON target.SourceEBookId = source.SourceEBookId AND target.DestinationISBN13 = source.DestinationISBN13
		WHEN MATCHED THEN
			UPDATE SET 
				target.DestinationBookType = source.DestinationBookType,
				target.DestinationEBookId = source.DestinationEBookId,
				target.DestinationISBN13 = source.DestinationISBN13,
				target.DateChanged = GETDATE()
		WHEN NOT MATCHED THEN
			INSERT (SourceEBookId, DestinationBookType, DestinationEBookID, DestinationISBN13, IndigoAggregationID, DateChanged)
			VALUES (source.SourceEBookId, source.DestinationBookType, source.DestinationEBookID, source.DestinationISBN13, source.IndigoAggregationID, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;


		-- Remove the current batch EBooks from the new aggregations
		DELETE FROM #AggregationUpdates WHERE EBookID IN (SELECT EBookID FROM #BatchRecords)

	END

	-- Recompute the kobo aggregation table once after all new aggregations have been inserted
	;with cte AS
	(
		SELECT w.SourceEBookId, w.IndigoAggregationId, ROW_NUMBER() OVER (PARTITION BY w.SourceEBookId ORDER BY w.DateChanged ASC) as rn
		FROM KoboAggregation w 
	)
	UPDATE a
	SET a.IndigoAggregationId = cte.IndigoAggregationId, a.DateChanged = GETDATE()
	FROM KoboAggregation a INNER JOIN cte
		ON a.SourceEBookId = cte.SourceEBookId
	WHERE cte.rn = 1  AND a.IndigoAggregationId <> cte.IndigoAggregationId


	;with cte AS
	(
		SELECT r.DestinationISBN13, r.IndigoAggregationId, ROW_NUMBER() OVER (PARTITION BY r.DestinationISBN13 ORDER BY r.DateChanged DESC) as rn
		FROM KoboAggregation r
	)
	UPDATE a
	SET a.IndigoAggregationId = cte.IndigoAggregationId, a.DateChanged = GETDATE()
	FROM KoboAggregation a INNER JOIN cte
		ON a.DestinationISBN13 = cte.DestinationISBN13
	WHERE cte.rn = 1 AND a.IndigoAggregationId <> cte.IndigoAggregationId


	;WITH cte AS
	(
		SELECT DISTINCT DestinationISBN13,
				IndigoAggregationId,
				ROW_NUMBER() OVER (PARTITION BY DestinationISBN13 ORDER BY DateChanged ASC) as rn
		FROM KoboAggregation
	)
	MERGE IndigoAggregation as target
	USING
	(
		SELECT DestinationISBN13,
				IndigoAggregationId
		FROM cte
		WHERE rn = 1
	) 
	AS source (ISBN13, IndigoAggregationID)
	ON target.ISBN13 = source.ISBN13
	WHEN MATCHED THEN
		UPDATE SET
			target.IndigoAggregationId = source.IndigoAggregationId,
			target.DateChanged = GETDATE()
	WHEN NOT MATCHED THEN
		INSERT (ISBN13, CompetitorAggregationId, BowkerWorkId, IndigoAggregationId, DateChanged)
		VALUES (source.ISBN13, NULL, NULL, source.IndigoAggregationID, GETDATE())
	OUTPUT $action INTO #UpdatedRecords;

	------------------------------------------------------
	------------------- Availability Section -------------
	------------------------------------------------------

	SELECT s.EbookID INTO #AvailabilityOrFullUpdateTypes
	FROM stgKoboBooks s
	WHERE UpdateType = 'Availability' OR UpdateType = 'Full' 

	WHILE EXISTS (SELECT TOP 1 EBookId FROM #AvailabilityOrFullUpdateTypes)
	BEGIN
		-- Truncate the batch table and fill it with the next batch
		TRUNCATE TABLE #BatchRecords
		INSERT INTO #BatchRecords (EBookID) (SELECT TOP (@BatchSize) EBookID FROM #AvailabilityOrFullUpdateTypes)


		DELETE KoboSubscriptions
		WHERE KoboSubscriptions.EBookID IN (SELECT EBookID FROM #BatchRecords)
		  AND NOT EXISTS (SELECT 1 
						  FROM stgKoboSubscriptions
						  WHERE stgKoboSubscriptions.EBookID = KoboSubscriptions.EBookID
							AND stgKoboSubscriptions.Region = KoboSubscriptions.Region
							AND stgKoboSubscriptions.[From] = KoboSubscriptions.[From]
							AND stgKoboSubscriptions.[To] = KoboSubscriptions.[To]
						  )

		MERGE KoboSubscriptions AS target
		USING
		(
			SELECT s.EBookID, Region, [From], [To]
			FROM stgKoboSubscriptions s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookID, Region, [From], [To])
		ON target.EBookId = source.EBookId
		   AND target.Region = source.Region
		   AND target.[From] = source.[From]
		   AND target.[To] = source.[To]
		WHEN NOT MATCHED THEN
			INSERT (EBookID, Region, [From], [To], DateChanged)
			VALUES (source.EBookID, source.Region, source.[From], source.[To], GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		------------------------------------------------------

		DELETE KoboMarketAvailabilityDates
		WHERE KoboMarketAvailabilityDates.EBookID IN (SELECT EBookID FROM #BatchRecords)
		  AND NOT EXISTS (SELECT 1 
						  FROM stgKoboMarketAvailabilityDates
						  WHERE stgKoboMarketAvailabilityDates.EBookID = KoboMarketAvailabilityDates.EBookID
							AND stgKoboMarketAvailabilityDates.PreOrder = KoboMarketAvailabilityDates.PreOrder
							AND stgKoboMarketAvailabilityDates.GeneralAvailability = KoboMarketAvailabilityDates.GeneralAvailability
							AND stgKoboMarketAvailabilityDates.Region = KoboMarketAvailabilityDates.Region
						  )

		MERGE KoboMarketAvailabilityDates AS target
		USING
		(
			SELECT s.EBookID, PreOrder, GeneralAvailability, Region
			FROM stgKoboMarketAvailabilityDates s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookID, PreOrder, GeneralAvailability, Region)
		ON target.EBookId = source.EBookId
		   AND target.PreOrder = source.PreOrder
		   AND target.GeneralAvailability = source.GeneralAvailability
		   AND target.Region = source.Region
		WHEN NOT MATCHED THEN
			INSERT (EBookID, PreOrder, GeneralAvailability, Region, DateChanged)
			VALUES (source.EBookID, source.PreOrder, source.GeneralAvailability, source.Region, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		------------------------------------------------------

		DELETE KoboPrices
		WHERE KoboPrices.EBookID IN (SELECT EBookID FROM #BatchRecords) 
		  AND NOT EXISTS (SELECT 1 
						  FROM stgKoboPrices
						  WHERE stgKoboPrices.EBookID = KoboPrices.EBookID
							AND stgKoboPrices.ListPrice = KoboPrices.ListPrice
							AND stgKoboPrices.Discount = KoboPrices.Discount
							AND stgKoboPrices.SellingPrice = KoboPrices.SellingPrice
							AND stgKoboPrices.Cogs = KoboPrices.Cogs
							AND stgKoboPrices.Currency = KoboPrices.Currency
							AND stgKoboPrices.[From] = KoboPrices.[From]
							AND stgKoboPrices.[To] = KoboPrices.[To]
							AND stgKoboPrices.Region = KoboPrices.Region
							AND stgKoboPrices.PriceType = KoboPrices.PriceType
							AND stgKoboPrices.IsPreOrder = KoboPrices.IsPreOrder
							AND stgKoboPrices.IncludesTax = KoboPrices.IncludesTax
						  )

		MERGE KoboPrices AS target
		USING
		(
			SELECT s.EBookID, ListPrice, Discount, SellingPrice, Cogs, Currency, [From], [To], Region, PriceType, IsPreOrder, IncludesTax
			FROM stgKoboPrices s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookID, ListPrice, Discount, SellingPrice, Cogs, Currency, [From], [To], Region, PriceType, IsPreOrder, IncludesTax)
		ON source.EBookID = target.EBookID
		   AND source.ListPrice = target.ListPrice
		   AND source.Discount = target.Discount
		   AND source.SellingPrice = target.SellingPrice
		   AND source.Cogs = target.Cogs
		   AND source.Currency = target.Currency
		   AND source.[From] = target.[From]
		   AND source.[To] = target.[To]
		   AND source.Region = target.Region
		   AND source.PriceType = target.PriceType
		   AND source.IsPreOrder = target.IsPreOrder
		   AND source.IncludesTax = target.IncludesTax
		WHEN NOT MATCHED THEN
			INSERT (EBookID, ListPrice, Discount, SellingPrice, Cogs, Currency, [From], [To], Region, PriceType, IsPreOrder, IncludesTax, DateChanged)
			VALUES (source.EBookID, 
					source.ListPrice, 
					source.Discount, 
					source.SellingPrice, 
					source.Cogs, 
					source.Currency, 
					source.[From], 
					source.[To], 
					source.Region, 
					source.PriceType, 
					source.IsPreOrder, 
					source.IncludesTax, 
					GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		DELETE FROM #AvailabilityOrFullUpdateTypes WHERE EBookID IN (SELECT EBookID FROM #BatchRecords)
	END


	------------------------------------------------------
	------------------- Metadata Section -----------------
	------------------------------------------------------

	SELECT s.EbookID INTO #MetadataOrFullUpdateTypes
	FROM stgKoboBooks s
	WHERE UpdateType = 'Metadata' OR UpdateType = 'Full' 

	-- Delete, merge and insert Kobo records from staging tables in batches
	WHILE EXISTS (SELECT TOP 1 EBookId FROM #MetadataOrFullUpdateTypes)
	BEGIN
		-- Truncate the batch table and fill it with the next batch
		TRUNCATE TABLE #BatchRecords
		INSERT INTO #BatchRecords (EBookID) (SELECT TOP (@BatchSize) EBookID FROM #MetadataOrFullUpdateTypes)

		------------------------------------------------------

		MERGE KoboContributors AS target
		USING
		(
			SELECT s.EBookID, ContributorName, ContributorType, ContributorOrdinal
			FROM stgKoboContributors s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookID, ContributorName, ContributorType, ContributorOrdinal)
		ON target.EBookID = source.EBookID
		   AND target.ContributorOrdinal = source.ContributorOrdinal
		WHEN MATCHED THEN
			UPDATE SET
				target.ContributorName = source.ContributorName,
				target.ContributorType = source.ContributorType,
				target.DateChanged = GETDATE()
		WHEN NOT MATCHED THEN
			INSERT (EBookID, ContributorName, ContributorType, ContributorOrdinal, DateChanged)
			VALUES (source.EBookID, source.ContributorName, source.ContributorType, source.ContributorOrdinal, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;
	 

		------------------------------------------------------
	
		MERGE KoboCategories AS target
		USING
		(
			SELECT s.EBookID, BISAC, BISACOrdinal
			FROM stgKoboCategories s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookID, BISAC, BISACOrdinal)
		ON target.EBookID = source.EBookID
		   AND target.BISACOrdinal = source.BISACOrdinal
		WHEN MATCHED THEN
			UPDATE SET
				target.BISAC = source.BISAC,
				target.DateChanged = GETDATE()
		WHEN NOT MATCHED THEN
			INSERT (EBookID, BISAC, BISACOrdinal, DateChanged)
			VALUES (source.EBookID, source.BISAC, source.BISACOrdinal, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		------------------------------------------------------

		DELETE KoboRelatedProducts 
		WHERE KoboRelatedProducts.EBookID IN (SELECT EBookID FROM #BatchRecords)
		  AND NOT EXISTS (SELECT 1 
						  FROM stgKoboRelatedProducts 
						  WHERE stgKoboRelatedProducts.EBookID = KoboRelatedProducts.EBookID
							AND stgKoboRelatedProducts.ISBN = KoboRelatedProducts.ISBN
							AND stgKoboRelatedProducts.Relation = KoboRelatedProducts.Relation
						  )

		MERGE KoboRelatedProducts AS target
		USING
		(
			SELECT s.EBookId, s.ISBN, s.Relation
			FROM stgKoboRelatedProducts s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookId, ISBN, Relation)
		ON target.EBookID = source.EBookID
		   AND target.ISBN = source.ISBN
		   AND target.Relation = source.Relation
		WHEN NOT MATCHED THEN
			INSERT (EBookId, ISBN, Relation, DateChanged)
			VALUES (source.EBookID, source.ISBN, source.Relation, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		------------------------------------------------------

		DELETE KoboReadThisOn
		WHERE KoboReadThisOn.EBookID IN (SELECT EBookID FROM #BatchRecords)
		  AND NOT EXISTS (SELECT 1 
						  FROM stgKoboReadThisOn 
						  WHERE stgKoboReadThisOn.EBookID = KoboReadThisOn.EBookID
							AND stgKoboReadThisOn.PlatformGroup = KoboReadThisOn.PlatformGroup
							AND stgKoboReadThisOn.[Format] = KoboReadThisOn.[Format]
							AND stgKoboReadThisOn.DRM = KoboReadThisOn.DRM
						  )

		MERGE KoboReadThisOn AS target
		USING
		(
			SELECT s.EBookID, s.PlatformGroup, s.[Format], s.DRM
			FROM stgKoboReadThisOn s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookID, PlatformGroup, [Format], DRM)
		ON target.EBookID = source.EBookID
		   AND target.PlatformGroup = source.PlatformGroup
		   AND target.[Format] = source.[Format]
		   AND target.DRM = source.DRM
		WHEN NOT MATCHED THEN
			INSERT (EBookID, PlatformGroup, [Format], DRM, DateChanged)
			VALUES (source.EBookID, source.PlatformGroup, source.[Format], source.DRM, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;


		------------------------------------------------------

		DELETE KoboDownloadable
		WHERE KoboDownloadable.EBookID IN (SELECT EBookID FROM #BatchRecords)
		  AND NOT EXISTS (SELECT 1 
						  FROM stgKoboDownloadable 
						  WHERE stgKoboDownloadable.EBookID = KoboDownloadable.EBookID
							AND stgKoboDownloadable.[Format] = KoboDownloadable.[Format]
							AND stgKoboDownloadable.DRM = KoboDownloadable.DRM
						  )

		MERGE KoboDownloadable AS target
		USING
		(
			SELECT s.EBookID, [Format], DRM
			FROM stgKoboDownloadable s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookId, [Format], DRM)
		ON target.EBookId = source.EBookId
		   AND target.[Format] = source.[Format]
		   AND target.DRM = source.DRM
		WHEN NOT MATCHED THEN
			INSERT (EBookId, [Format], DRM, DateChanged)
			VALUES (source.EBookId, source.[Format], source.DRM, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		------------------------------------------------------

		MERGE KoboSeriesAssignment AS target
		USING
		(
			SELECT s.EBookId, SeriesId, SeriesNumber, SeriesNumberFloat
			FROM stgKoboBooks s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookId, SeriesId, SeriesNumber, SeriesNumberFloat)
		ON target.EBookId = source.EBookId
		WHEN MATCHED AND source.SeriesId IS NULL THEN
			DELETE
		WHEN MATCHED AND source.SeriesId IS NOT NULL THEN
			UPDATE SET
				target.SeriesId = source.SeriesId,
				target.SeriesNumber = source.SeriesNumber,
				target.SeriesNumberFloat = source.SeriesNumberFloat,
				target.DateChanged = GETDATE()
		WHEN NOT MATCHED AND source.SeriesId IS NOT NULL THEN
			INSERT (EBookId, SeriesId, SeriesNumber, SeriesNumberFloat, DateChanged)
			VALUES (source.EBookId, source.SeriesId, source.SeriesNumber, source.SeriesNumberFloat, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;


		MERGE KoboSeries AS target
		USING
		(
			SELECT SeriesId, Series,
				   ROW_NUMBER() OVER(PARTITION BY SeriesId ORDER BY SeriesId DESC) AS RowNumber
			FROM stgKoboBooks s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
			WHERE SeriesId IS NOT NULL
		) 
		AS source (SeriesId, SeriesName, RowNumber)
		ON target.SeriesId = source.SeriesId
		WHEN NOT MATCHED AND RowNumber = 1 THEN
			INSERT (SeriesId, SeriesName, DateChanged)
			VALUES (source.SeriesId, source.SeriesName, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		-------------------------------------------------------------------------------------

		MERGE KoboBooks AS target
		USING
		(
			SELECT s.EBookID, AccountHolderId, ISBN
				  ,1, Title, Subtitle, Imprint, Edition
				  ,[Language], [Description], Publisher, CoverImage
				  ,ItemPage, PurchasePath, ImageId, ImageName
				  ,PublicationDate, MinAge, MaxAge, IsKids, HasPreview
				  ,IsKWL, IsAdultMaterial, InstantPreview, InstantPreviewFormat
			FROM stgKoboBooks s INNER JOIN #BatchRecords b
			ON s.EBookID = b.EBookID
		) 
		AS source (EBookID, AccountHolderId, ISBN
				  ,IsActive, Title, Subtitle, Imprint, Edition
				  ,[Language], [Description], Publisher, CoverImage
				  ,ItemPage, PurchasePath, ImageId, ImageName
				  ,PublicationDate, MinAge, MaxAge, IsKids, HasPreview
				  ,IsKWL, IsAdultMaterial, InstantPreview, InstantPreviewFormat)
		ON target.EBookID = source.EBookID
		WHEN MATCHED THEN
			UPDATE SET
				target.AccountHolderId = source.AccountHolderId, 
				target.ISBN = source.ISBN,
				target.IsActive = source.IsActive, 
				target.Title = source.Title, 
				target.Subtitle = source.Subtitle, 
				target.Imprint = source.Imprint, 
				target.Edition = source.Edition,
				target.[Language] = source.[Language],
				target.[Description] = source.[Description],
				target.Publisher = source.Publisher, 
				target.CoverImage = source.CoverImage,
				target.ItemPage = source.ItemPage,
				target.PurchasePath = source.PurchasePath,
				target.ImageId = source.ImageId,
				target.ImageName = source.ImageName,
				target.PublicationDate = source.PublicationDate,
				target.MinAge = source.MinAge, 
				target.MaxAge = source.MaxAge, 
				target.IsKids = source.IsKids, 
				target.HasPreview = source.HasPreview,
				target.IsKWL = source.IsKWL, 
				target.IsAdultMaterial = source.IsAdultMaterial,
				target.InstantPreview = source.InstantPreview,
				target.InstantPreviewFormat = source.InstantPreviewFormat,
				target.DateChanged = GETDATE()
		WHEN NOT MATCHED THEN
			INSERT (EBookID, AccountHolderId, ISBN
				   ,IsActive, Title, Subtitle, Imprint, Edition
				   ,[Language], [Description], Publisher, CoverImage
				   ,ItemPage, PurchasePath, ImageId, ImageName
				   ,PublicationDate, MinAge, MaxAge, IsKids, HasPreview
				   ,IsKWL, IsAdultMaterial, InstantPreview, InstantPreviewFormat, DateChanged)
			VALUES (source.EBookID, source.AccountHolderId, source.ISBN
				   ,source.IsActive, source.Title, source.Subtitle, source.Imprint, source.Edition
				   ,source.[Language], source.[Description], source.Publisher, source.CoverImage
				   ,source.ItemPage, source.PurchasePath, source.ImageId, source.ImageName
				   ,source.PublicationDate, source.MinAge, source.MaxAge, source.IsKids, source.HasPreview
				   ,source.IsKWL, source.IsAdultMaterial, source.InstantPreview, source.InstantPreviewFormat, GETDATE())
		OUTPUT $action INTO #UpdatedRecords;

		DELETE FROM #MetadataOrFullUpdateTypes WHERE EBookID IN (SELECT EBookID FROM #BatchRecords)		
	END

	------------------------------------------------------
	---------- Changetracking Update Section -------------
	------------------------------------------------------

	-- UPDATE the date in KoboBooks for EBooks that only had Update Type 'Availability' so they will be picked up by change tracking
	SELECT s.EbookID INTO #AvailabilityUpdates
	FROM stgKoboBooks s
	WHERE UpdateType = 'Availability'

	-- Delete, merge and insert Kobo records from staging tables in batches
	WHILE EXISTS (SELECT TOP 1 EBookId FROM #AvailabilityUpdates)
	BEGIN
		TRUNCATE TABLE #BatchRecords
		INSERT INTO #BatchRecords (EBookID) (SELECT TOP (@BatchSize) EBookID FROM #AvailabilityUpdates)

		UPDATE b SET DateChanged = GETDATE() FROM KoboBooks b WHERE b.EBookID IN (SELECT EBookID FROM #BatchRecords) 

		DELETE FROM #AvailabilityUpdates WHERE EBookID IN (SELECT EBookID FROM #BatchRecords)	
	END
	SET XACT_ABORT OFF
END
GO

GRANT EXECUTE ON [dbo].[uspKoboBooksUpload] TO [KoboImporterApp]; 
GO