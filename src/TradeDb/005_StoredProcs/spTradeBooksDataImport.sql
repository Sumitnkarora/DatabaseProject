﻿CREATE PROCEDURE [dbo].[spTradeBooksDataImport]
AS
BEGIN
	----- Move stuff into the Archive table for logging purposes
	INSERT INTO TradeBooksArchive (
		VendorID,
		ISBN,
		Title,
		Subtitle,
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
		Media,
		[Binding],
		ItemPrice,
		ItemPriceCurrency,
		Discount,
		PubDate,
		StatusCode,
		PublisherID,
		BisacSubjectCode1,
		BisacSubjectCode2,
		BisacSubjectCode3,
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
		CatalogueName,
		CataloguePageNumber,
		ReturnFormat,
		VSRCode,
		ReplacementCode,
		ReplacementISBN,
		OPDate,
		ErrorDetail,
		Streetdate,
		ISBN13,
		ReplacementISBN13,
		Imprint,
		ForeignVendCADRetail,
		[FileName],
		InsertFlag,
		PID,
		SAPVendorID,
		DateCreated,
		[Catalogue Name],
		[Catalogue Page Number],
		[ID])
	SELECT 
		VendorID,
		ISBN,
		Title,
		Subtitle,
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
		Media,
		[Binding],
		ItemPrice,
		ItemPriceCurrency,
		Discount,
		PubDate,
		StatusCode,
		PublisherID,
		BisacSubjectCode1,
		BisacSubjectCode2,
		BisacSubjectCode3,
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
		CatalogueName,
		CataloguePageNumber,
		ReturnFormat,
		VSRCode,
		ReplacementCode,
		ReplacementISBN,
		OPDate,
		ErrorDetail,
		Streetdate,
		ISBN13,
		ReplacementISBN13,
		Imprint,
		ForeignVendCADRetail,
		[FileName],
		InsertFlag,
		PID,
		SAPVendorID,
		DateCreated,
		[Catalogue Name],
		[Catalogue Page Number],
		[ID]
	FROM stgTradeBooks;

	----- Move update records to the BooksImport staging table
	INSERT INTO stgTradeBooksImport (
		[PID],
        [ISBN],
        [UPC],
        [MediaCode],
        [Title],
        [Subtitle],
        [ItemPrice],
        [ItemPriceCurrency],
        [Discount],
        [PublicationDate],
        [VendorID],
        [FormatBindingCode],
        [PublisherID],
        [StatusCode],
        [Language],
        [EditionNumber],
        [EditionDescription],
        [SeriesTitle],
        [VolumeNumber],
        [NumberOfVolumes],
        [SubjectCode1],
        [SubjectCode2],
        [SubjectCode3],
        [NumberOfPages],
        [C1FirstName],
        [C1LastName],
        [C1MiddleName],
        [C1Role],
        [C2FirstName],
        [C2LastName],
        [C2MiddleName],
        [C2Role],
        [C3FirstName],
        [C3LastName],
        [C3MiddleName],
        [C3Role],
        [CanadianTitle],
        [AgeLowerLimit],
        [AgeUpperLimit],
        [GradeLowerLimit],
        [GradeUpperLimit],
        [AudienceCode],
        [Height],
        [Width],
        [Depth],
        [MeasurementUnits],
        [Weight],
        [WeightUnits],
        [CartonQuantity],
        [MinimumOrderQuantity],
        [PaperCertificationType],
        [ChainofCustody],
        [CertifiedPostConsumerWaste_PCW],
        [CertifiedPCWPercentage],
        [UncertifiedPCW],
        [UncertifiedPCWPercentage])
	SELECT
		LEFT(ISBN13, 12),
		LEFT(ISBN, 10),
		LEFT(ISBN13, 13),
		LEFT(Media, 1),
		LEFT(Title, 255),
		LEFT(Subtitle, 255),
		ItemPrice,
		LEFT(ItemPriceCurrency, 3),
		CASE WHEN CAST(Discount AS DECIMAL) < 40 THEN 2 ELSE 1 END,
		PubDate,
		LEFT(VendorID, 15),
		LEFT([Binding], 2),
		LEFT(PublisherID, 20),		
		LEFT(StatusCode, 3),
		LEFT([Language], 50),
		LEFT(EditionNumber, 5),
		LEFT(EditionDescription, 50),
		LEFT(SeriesTitle, 255),
		VolumeNumber,
		NumberOfVolumes,
		LEFT(BisacSubjectCode1, 9),
		LEFT(BisacSubjectCode2, 9),
		LEFT(BisacSubjectCode3, 9),
		NumberofPages,
		LEFT(Contributor1FirstName, 50),
		LEFT(Contributor1LastName, 50),
		LEFT(Contributor1InitialMiddleName, 50),
		LEFT(Contributor1Role, 50),
		LEFT(Contributor2FirstName, 50),
		LEFT(Contributor2LastName, 50),
		LEFT(Contributor2InitialMiddleName, 50),
		LEFT(Contributor2Role, 50),
		LEFT(Contributor3FirstName, 50),
		LEFT(Contributor3LastName, 50),
		LEFT(Contributor3InitialMiddleName, 50),
		LEFT(Contributor3Role, 50),
		LEFT(CanadianTitle, 1),
		LEFT(AgeLowerLimit, 2),
		LEFT(AgeUpperLimit, 2),
		LEFT(GradeLowerLimit, 2),
		LEFT(GradeUpperLimit, 2),
		LEFT(AudienceCode, 3),
		Height,
		Width,
		Depth,
		LEFT(MeasurementUnits, 2),
		[Weight],
		LEFT(WeightUnits, 2),
		CartonQuantity,
		MinimumOrderQuantity,
		LEFT(PaperCertificationType, 255),
		LEFT(ChainofCustody, 255),
		LEFT(CertifiedPostConsumerWaste_PCW, 255),
		LEFT(CertifiedPCWPercentage, 255),
		LEFT(UncertifiedPCW, 255),
		LEFT(UncertifiedPCWPercentage, 255)
	FROM stgTradeBooks
	WHERE InsertFlag = 0;
END;
GO

GRANT EXECUTE ON [dbo].[spTradeBooksDataImport] TO [TradeBooksApp]; 
GO