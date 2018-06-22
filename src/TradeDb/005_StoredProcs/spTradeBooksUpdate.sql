CREATE PROCEDURE [dbo].[spTradeBooksUpdate]
AS
BEGIN
	SET NOCOUNT ON;

	------------------------------------------------------------ DECLARATIONS ----------------------------------------------------

	DECLARE @IndigoBooksSAPVendorID CHAR(6) = '703416',
			@FilterVSRCode CHAR(1) = '';

	------------------------------------------------------------ INSERTS ---------------------------------------------------------

	------------------------------------------------------------ tblCatalogData --------------------------------------------------

	/*
		Insert records that do not exist. Eight columns in tblCatalogData are smaller than in stgTradeBooks, so trimming them with LEFT, 
		everything else is either less in size or compatible
	*/
	INSERT INTO tblCatalogData (
		pid, 
		VendorID, 
		ISBN, 
		Title, 
		Subtitle, 
		Media, 
		[Binding],
		ItemPrice, 
		ForeignVendCADRetail,
		USDRetailPrice, 
		ItemPriceCurrency,
		Discount, 
		PubDate, 
		StatusCode, 
		PublisherID, 
		SuggestedBuy, 
		PrintQuantity, 
		OLDISBN, 
		OLDISBNOutofPrintDate, 
		EditionNumber, 
		EditionDescription, 
		VolumeNumber, 
		NumberofVolumes, 
		NumberofPages, 
		Height, 
		Width, 
		Depth, 
		MeasurementUnits,
		[Weight],
		WeightUnits,
		CartonQuantity,
		MinimumOrderQuantity, 
		CanadianTitle, 
		AudienceCode,
		GradeLowerLimit, 
		GradeUpperLimit, 
		AgeLowerLimit, 
		AgeUpperLimit, 
		[Language], 
		[FileName], 
		[Catalogue Name], 
		[Catalogue Page Number], 
		ReturnFormat, 
		SAPVendorID, 
		VSRCode, 
		ProcessStatus, 
		ReplacementISBN, 
		ReplacementCode, 
		OPDate,
		StreetDate, 
		ISBN13, 
		ReplacementISBN13, 
		Imprint, 
		PaperCertificationType, 
		ChainofCustody, 
		CertifiedPostConsumerWaste_PCW, 
		CertifiedPCWPercentage, 
		UncertifiedPCW, 
		UncertifiedPCWPercentage,
		SeriesTitle,
		Contributor1Role,
		Contributor1LastName,
		Contributor1FirstName,
		Contributor1InitialMiddleName,
		Contributor2Role,
		Contributor2LastName,
		Contributor2FirstName,
		Contributor2InitialMiddleName,
		Contributor3Role,
		Contributor3LastName,
		Contributor3FirstName,
		Contributor3InitialMiddleName,
		BisacSubjectCode1,
		BisacSubjectCode2,
		BisacSubjectCode3)
	SELECT 
		b.pid, 
		v.LegacyID, 
	    b.ISBN, 
		b.Title, 
		b.Subtitle, 
		b.Media, 
		b.[Binding], 
		b.ItemPrice, 
		b.ForeignVendCADRetail, 
		b.ItemPrice, 
		b.ItemPriceCurrency, 
		b.Discount, 
		b.PubDate, 
		b.StatusCode, 
		b.PublisherID, 
		b.SuggestedBuy, 
		b.PrintQuantity, 
		b.OLDISBN, 
		b.OLDISBNOutofPrintDate, 
		b.EditionNumber, 
		b.EditionDescription, 
		b.VolumeNumber, 
		b.NumberofVolumes, 
		b.NumberofPages, 
		b.Height, 
		b.Width, 
		b.Depth, 
		b.MeasurementUnits, 
		b.[Weight], 
		b.WeightUnits, 
		b.CartonQuantity, 
		b.MinimumOrderQuantity, 
		b.CanadianTitle, 
		b.AudienceCode, 
		b.GradeLowerLimit, 
		b.GradeUpperLimit, 
		b.AgeLowerLimit, 
		b.AgeUpperLimit, 
		b.[Language], 
		b.[FileName], 
		b.[Catalogue Name], 
		b.[Catalogue Page Number], 
		LEFT(b.ReturnFormat, 1), 
		v.SAPVendorID, 
		v.VSRCode, 
		0,
		b.ReplacementISBN, 
		LEFT(b.ReplacementCode, 5), 
		b.OPDate, 
		b.StreetDate, 
		b.ISBN13, 
		b.ReplacementISBN13, 
		b.Imprint, 
		b.PaperCertificationType,
		b.ChainofCustody,
		b.CertifiedPostConsumerWaste_PCW,
		b.CertifiedPCWPercentage, 
		b.UncertifiedPCW, 
		b.UncertifiedPCWPercentage,
		b.SeriesTitle,
		LEFT(b.Contributor1Role, 2),
		b.Contributor1LastName,
		b.Contributor1FirstName,
		b.Contributor1InitialMiddleName,
		LEFT(b.Contributor2Role, 2),
		b.Contributor2LastName,
		b.Contributor2FirstName,
		b.Contributor2InitialMiddleName,
		LEFT(b.Contributor3Role, 2),
		b.Contributor3LastName,
		b.Contributor3FirstName,
		b.Contributor3InitialMiddleName,
		LEFT(b.BisacSubjectCode1, 10),
		LEFT(b.BisacSubjectCode2, 10),
		LEFT(b.BisacSubjectCode3, 10)
	FROM stgTradeBooks b 
	JOIN TradeVendors v 
	ON v.SAPVendorId = @IndigoBooksSAPVendorID AND v.VSRCode = @FilterVSRCode
	WHERE b.InsertFlag = 1;

	------------------------------------------------------------ UPDATES ---------------------------------------------------------

	------------------------------------------------------------ TradeDataByVendor -----------------------------------------------
	----- NOTE: For all CAST operations we trust TradeDataByVendor data and assume it will cast properly
	----- NOTE 2: This SP is supposed to run after the Validation SP, so all data in stgTradeBooksImport doesn't need to be checked here
	UPDATE c
	SET c.StatusCode = CASE WHEN t.StatusCode = 'BB' THEN 1 ELSE 0 END,
		c.ItemPriceCurrency = CASE WHEN c.ItemPriceCurrency IS NOT NULL AND c.ItemPrice IS NOT NULL AND t.ItemPriceCurrency <> c.ItemPriceCurrency AND t.ItemPrice <> CAST(c.ItemPrice AS MONEY) THEN t.itempricecurrency ELSE c.ItemPriceCurrency END,
		c.ItemPrice = CASE WHEN c.ItemPriceCurrency IS NOT NULL AND c.ItemPrice IS NOT NULL AND t.ItemPriceCurrency <> c.ItemPriceCurrency AND t.ItemPrice <> CAST(c.ItemPrice AS MONEY) THEN t.ItemPrice ELSE c.ItemPrice END,
		c.PubDate = CASE WHEN c.PubDate IS NOT NULL AND t.publicationdate IS NOT NULL AND t.PublicationDate <> CAST(c.PubDate AS DATETIME) THEN t.publicationdate ELSE c.PubDate END,
		c.[Binding] = CASE WHEN c.[Binding] IS NOT NULL AND t.FormatBindingCode IS NOT NULL AND t.FormatBindingCode <> c.[Binding] THEN t.FormatBindingCode ELSE c.[Binding] END,
		c.Media = CASE WHEN c.Media IS NOT NULL AND t.MediaCode <> c.Media THEN t.MediaCode ELSE c.Media END,
		c.PublisherID = CASE WHEN c.publisherid IS NOT NULL AND t.publisherid IS NOT NULL AND t.publisherid <> c.publisherid THEN t.publisherid ELSE c.PublisherID END,
		c.CanadianTitle = CASE WHEN t.CanadianTitle IS NOT NULL AND t.CanadianTitle = 'Y' THEN 1 ELSE 0 END,
		c.NumberofVolumes = CASE WHEN c.NumberofVolumes IS NOT NULL AND t.NumberOfVolumes IS NOT NULL AND t.NumberOfVolumes <> CAST(c.NumberofVolumes AS SMALLINT) THEN t.NumberOfVolumes ELSE c.NumberofVolumes END,
		c.VolumeNumber = CASE WHEN c.VolumeNumber IS NOT NULL AND t.VolumeNumber IS NOT NULL AND t.VolumeNumber <> CAST(c.VolumeNumber AS SMALLINT) THEN t.VolumeNumber ELSE c.VolumeNumber END,
		------- 16 Feb, 2018: Below statements used to be below TradeSeriesData updates - maybe for a reason (leaving the message here, if something will not work correctly)
		c.EditionNumber = CASE WHEN t.EditionNumber IS NOT NULL AND t.EditionDescription IS NOT NULL THEN t.EditionNumber ELSE c.EditionNumber END,
		c.EditionDescription = CASE WHEN t.EditionNumber IS NOT NULL AND t.EditionDescription IS NOT NULL THEN t.EditionDescription ELSE c.EditionDescription END,
		c.NumberofPages = CASE WHEN t.NumberofPages IS NOT NULL AND t.NumberofPages <> CAST(ISNULL(c.NumberofPages, -1) AS SMALLINT) THEN t.NumberofPages ELSE c.NumberofPages END,
		c.Height = CASE WHEN t.Height IS NOT NULL AND t.Height <> CAST(ISNULL(c.Height, -1) AS DECIMAL(9, 4)) THEN t.Height ELSE c.height END,
		c.Width = CASE WHEN t.Width IS NOT NULL AND t.Width <> CAST(ISNULL(c.Width, -1) AS DECIMAL(9, 4)) THEN t.Width ELSE c.Width END,
		c.Depth = CASE WHEN t.Depth IS NOT NULL AND t.Depth <> CAST(ISNULL(c.Depth, -1) AS DECIMAL(9, 4)) THEN t.Depth ELSE c.Depth END,
		c.MeasurementUnits = CASE WHEN t.MeasurementUnits IS NOT NULL AND t.MeasurementUnits <> ISNULL(c.MeasurementUnits, '-1') THEN t.MeasurementUnits ELSE c.MeasurementUnits END,
		c.[Weight] = CASE WHEN t.[Weight] IS NOT NULL AND t.[Weight] <> CAST(ISNULL(c.[Weight], -1) AS DECIMAL(9, 4)) THEN t.[Weight] ELSE c.[Weight] END,
		c.WeightUnits = CASE WHEN t.WeightUnits IS NOT NULL AND t.WeightUnits <> ISNULL(c.WeightUnits, '-1') THEN t.WeightUnits ELSE c.WeightUnits END,
		c.CartonQuantity = CASE WHEN t.CartonQuantity IS NOT NULL AND t.CartonQuantity <> CAST(ISNULL(c.CartonQuantity, -1) AS SMALLINT) THEN t.CartonQuantity ELSE c.CartonQuantity END,
		c.MinimumOrderQuantity = CASE WHEN t.MinimumOrderQuantity IS NOT NULL AND t.MinimumOrderQuantity <> CAST(ISNULL(c.MinimumOrderQuantity, -1) AS SMALLINT) THEN t.MinimumOrderQuantity ELSE c.MinimumOrderQuantity END,
		c.GradeLowerLimit = CASE WHEN t.GradeLowerLimit IS NOT NULL THEN t.GradeLowerLimit ELSE c.GradeLowerLimit END,
		c.GradeUpperLimit = CASE WHEN t.GradeUpperLimit IS NOT NULL THEN t.GradeUpperLimit ELSE c.GradeUpperLimit END,
		c.AgeLowerLimit = CASE WHEN t.AgeLowerLimit IS NOT NULL THEN t.AgeLowerLimit ELSE c.AgeLowerLimit END,
		c.AgeUpperLimit = CASE WHEN t.AgeUpperLimit IS NOT NULL THEN t.AgeUpperLimit ELSE c.AgeUpperLimit END,
		----- LEFT JOIN for refLanguage would result in rl.LanguageName not being NULL only when there is actual match for the Language from stgTradeBooksImport (because rl.LanguageName is not nullable)
		c.[Language] = CASE WHEN rl.LanguageName IS NOT NULL AND t.[language] <> c.[language] THEN t.[Language] ELSE c.[Language] END
	FROM TradeDataByVendor c
	JOIN stgTradeBooksImport t
	ON c.pid = t.pid
	LEFT JOIN refLanguage rl
	ON t.[Language] = rl.LanguageName 
	WHERE c.SAPVendorId = @IndigoBooksSAPVendorID AND 
		  c.VSRCode = @FilterVSRCode;

	------------------------------------------------------------ productsdb..tbl_001_titles --------------------------------------

	----- 20 Dec, 2017: It seems that we won't need repid anymore. Commented out for now just in case if required later
	/*
		UPDATE productsdb..tbl_001_titles 
		SET repid = t.repid
		FROM stgTradeBooksImport t
		JOIN productsdb..tbl_001_titles c
		ON t.pid = c.pid
		WHERE t.repid <> c.repid AND t.repid IS NOT NULL;
	*/

	------------------------------------------------------------ tblCatalogData --------------------------------------------------

	MERGE INTO tblCatalogData c
	USING stgTradeBooksImport t 
	ON c.pid = t.pid AND 
	   c.SAPVendorId = @IndigoBooksSAPVendorID AND 
	   c.VSRCode = @FilterVSRCode 
	WHEN MATCHED THEN UPDATE
  	SET c.Contributor1Role = t.C1role,
		c.Contributor1FirstName = t.C1FirstName,
		c.Contributor1LastName = t.C1LastName,
		c.Contributor1InitialMiddleName = t.C1MiddleName,
		c.Contributor2Role = t.C2role,
		c.Contributor2FirstName = t.C2FirstName,
		c.Contributor2LastName = t.C2LastName,
		c.Contributor2InitialMiddleName = t.C2MiddleName,
		c.Contributor3Role = t.C3role,
		c.Contributor3FirstName = t.C3FirstName,
		c.Contributor3LastName = t.C3LastName,
		c.Contributor3InitialMiddleName = t.C3MiddleName,
		c.BisacSubjectCode1 = t.SubjectCode1,
		c.BisacSubjectCode2 = t.SubjectCode2,
		c.BisacSubjectCode3 = t.SubjectCode3,
		c.SeriesTitle = t.SeriesTitle;

	------------------------------------------------------------ TradeSeriesData -------------------------------------------------

	UPDATE TradeSeriesData
	SET SeriesPosition = t.SeriesNumber
	FROM stgTradeBooksImport t
	JOIN TradeSeries ts 
	ON ts.SeriesTitle = t.SeriesTitle
	JOIN TradeSeriesData tsd 
	ON tsd.SeriesId = ts.SeriesId
	WHERE t.SeriesNumber IS NOT NULL;
END;
GO

GRANT EXECUTE ON [dbo].[spTradeBooksUpdate] TO [TradeBooksApp]; 
GO