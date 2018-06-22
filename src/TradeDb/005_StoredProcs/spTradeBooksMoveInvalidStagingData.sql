﻿CREATE PROCEDURE [dbo].[spTradeBooksMoveInvalidStagingData]
AS
BEGIN
	SET NOCOUNT ON;

	----- Insert records from stgTradeBooks that have invalid data into TradeBooksExceptions
	INSERT TradeBooksExceptions (
		[ID], 
		[pid], 
		[VendorID], 
		[ISBN], 
		[Title], 
		[Subtitle], 
		[SeriesTitle], 
		[Contributor1Role], 
		[Contributor1LastName], 
		[Contributor1FirstName], 
		[Contributor1InitialMiddleName], 
		[Contributor2Role], 
		[Contributor2LastName], 
		[Contributor2FirstName], 
		[Contributor2InitialMiddleName], 
		[Contributor3Role], 
		[Contributor3LastName], 
		[Contributor3FirstName], 
		[Contributor3InitialMiddleName],
		[Media], 
		[Binding], 
		[ItemPrice], 
		[ForeignVendCADRetail],
		[ItemPriceCurrency],
		[Discount],
		[PubDate],
		[StatusCode],
		[PublisherID], 
		[BisacSubjectCode1], 
		[BisacSubjectCode2],
		[BisacSubjectCode3], 
		[SuggestedBuy],
		[PrintQuantity],
		[OLDISBN], 
		[OLDISBNOutofPrintDate], 
		[EditionNumber],
		[EditionDescription], 
		[VolumeNumber],
		[NumberofVolumes],
		[NumberofPages],
		[Height],
		[Width],
		[Depth],
		[MeasurementUnits], 
		[Weight], 
		[WeightUnits], 
		[CartonQuantity], 
		[MinimumOrderQuantity],
		[CanadianTitle],
		[AudienceCode],
		[GradeLowerLimit],
		[GradeUpperLimit], 
		[AgeLowerLimit],
		[AgeUpperLimit],
		[Language],
		[FileName],
		[DateCreated], 
		[Catalogue Name],
		[Catalogue Page Number], 
		ReturnFormat,
		SAPVendorID, 
		VSRCode,
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
		[Problem])
	SELECT 
		[ID], 
		[PID], 
		[VendorID], 
		[ISBN],
		[Title], 
		[Subtitle],
		[SeriesTitle], 
		[Contributor1Role], 
		[Contributor1LastName], 
		[Contributor1FirstName],
		[Contributor1InitialMiddleName], 
		[Contributor2Role],
		[Contributor2LastName], 
		[Contributor2FirstName], 
		[Contributor2InitialMiddleName], 
		[Contributor3Role],
		[Contributor3LastName], 
		[Contributor3FirstName],
		[Contributor3InitialMiddleName],
		[Media], 
		[Binding], 
		[ItemPrice], 
		[ForeignVendCADRetail], 
		[ItemPriceCurrency], 
		[Discount], 
		[PubDate], 
		[StatusCode], 
		[PublisherID],
		[BisacSubjectCode1], 
		[BisacSubjectCode2],
		[BisacSubjectCode3], 
		[SuggestedBuy], 
		[PrintQuantity], 
		[OLDISBN], 
		[OLDISBNOutofPrintDate], 
		[EditionNumber], 
		[EditionDescription], 
		[VolumeNumber], 
		[NumberofVolumes], 
		[NumberofPages], 
		[Height], 
		[Width], 
		[Depth], 
		[MeasurementUnits], 
		[Weight], 
		[WeightUnits], 
		[CartonQuantity],
		[MinimumOrderQuantity], 
		[CanadianTitle],
		[AudienceCode], 
		[GradeLowerLimit], 
		[GradeUpperLimit],
		[AgeLowerLimit], 
		[AgeUpperLimit],
		[Language], 
		[FileName], 
		[DateCreated],
		[Catalogue Name], 
		[Catalogue Page Number], 
		ReturnFormat, 
		SAPVendorID,
		VSRCode, 
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
		Problem
	FROM stgTradeBooks
	WHERE Problem IS NOT NULL;

	----- Remove invalid data from stgTradeBooks
	DELETE stgTradeBooks
	WHERE Problem IS NOT NULL;

	RETURN @@ROWCOUNT;
END;
GO

GRANT EXECUTE ON [dbo].[spTradeBooksMoveInvalidStagingData] TO [TradeBooksApp]; 
GO