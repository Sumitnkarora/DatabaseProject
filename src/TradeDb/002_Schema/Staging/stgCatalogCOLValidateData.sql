﻿CREATE TABLE [dbo].[stgCatalogCOLValidateData](
	[ID] [int] NULL,
	[pid] [decimal](12, 0) NULL,
	[VendorID] [varchar](255) NULL,
	[ISBN] [varchar](255) NULL,
	[Title] [varchar](255) NULL,
	[Subtitle] [varchar](255) NULL,
	[SeriesTitle] [varchar](255) NULL,
	[Contributor1Role] [varchar](255) NULL,
	[Contributor1LastName] [varchar](255) NULL,
	[Contributor1FirstName] [varchar](255) NULL,
	[Contributor1InitialMiddleName] [varchar](255) NULL,
	[Contributor2Role] [varchar](255) NULL,
	[Contributor2LastName] [varchar](255) NULL,
	[Contributor2FirstName] [varchar](255) NULL,
	[Contributor2InitialMiddleName] [varchar](255) NULL,
	[Contributor3Role] [varchar](255) NULL,
	[Contributor3LastName] [varchar](255) NULL,
	[Contributor3FirstName] [varchar](255) NULL,
	[Contributor3InitialMiddleName] [varchar](255) NULL,
	[Media] [varchar](255) NULL,
	[Binding] [varchar](255) NULL,
	[ItemPrice] [varchar](255) NULL,
	[ItemPriceCurrency] [varchar](255) NULL,
	[Discount] [varchar](255) NULL,
	[PubDate] [varchar](255) NULL,
	[StatusCode] [varchar](255) NULL,
	[PublisherID] [varchar](255) NULL,
	[BisacSubjectCode1] [varchar](255) NULL,
	[BisacSubjectCode2] [varchar](255) NULL,
	[BisacSubjectCode3] [varchar](255) NULL,
	[SuggestedBuy] [varchar](255) NULL,
	[PrintQuantity] [varchar](255) NULL,
	[OLDISBN] [varchar](255) NULL,
	[OLDISBNOutofPrintDate] [varchar](255) NULL,
	[EditionNumber] [varchar](255) NULL,
	[EditionDescription] [varchar](255) NULL,
	[VolumeNumber] [varchar](255) NULL,
	[NumberofVolumes] [varchar](255) NULL,
	[NumberofPages] [varchar](255) NULL,
	[Height] [varchar](255) NULL,
	[Width] [varchar](255) NULL,
	[Depth] [varchar](255) NULL,
	[MeasurementUnits] [varchar](255) NULL,
	[Weight] [varchar](255) NULL,
	[WeightUnits] [varchar](255) NULL,
	[CartonQuantity] [varchar](255) NULL,
	[MinimumOrderQuantity] [varchar](255) NULL,
	[CanadianTitle] [varchar](255) NULL,
	[AudienceCode] [varchar](255) NULL,
	[GradeLowerLimit] [varchar](255) NULL,
	[GradeUpperLimit] [varchar](255) NULL,
	[AgeLowerLimit] [varchar](255) NULL,
	[AgeUpperLimit] [varchar](255) NULL,
	[Language] [varchar](255) NULL,
	[FileName] [varchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[Catalogue Name] [varchar](255) NULL,
	[Catalogue Page Number] [varchar](255) NULL,
	[ReturnFormat] [char](1) NULL,
	[SAPVendorID] [varchar](50) NULL,
	[VSRCode] [varchar](12) NULL,
	[ReplacementISBN] [varchar](13) NULL,
	[ReplacementCode] [varchar](5) NULL,
	[OPDate] [varchar](12) NULL,
	[StreetDate] [varchar](12) NULL,
	[ISBN13] [varchar](50) NULL,
	[ReplacementISBN13] [varchar](50) NULL,
	[Imprint] [varchar](255) NULL,
	[ForeignVendCADRetail] [varchar](255) NULL,
	[USDRetailPrice] [varchar](255) NULL,
	[ClassOfTrade] [varchar](50) NULL,
	[Contributor1CountryCode] [varchar](255) NULL,
	[Contributor2CountryCode] [varchar](255) NULL,
	[Contributor3CountryCode] [varchar](255) NULL,
	[BISACRegionCode] [varchar](255) NULL,
	[RunTime] [varchar](255) NULL,
	[NA1] [varchar](255) NULL,
	[NA2] [varchar](255) NULL,
	[NA3] [varchar](255) NULL,
	[ClassOfTradeName] [varchar](50) NULL,
	[ClassOfTradeCode] [varchar](4) NULL,
	[FreezeOnlinePrice] [varchar](10) NULL,
	[PaperCertificationType] [varchar](255) NULL,
	[ChainofCustody] [varchar](255) NULL,
	[CertifiedPostConsumerWaste_PCW] [varchar](255) NULL,
	[CertifiedPCWPercentage] [varchar](255) NULL,
	[UncertifiedPCW] [varchar](255) NULL,
	[UncertifiedPCWPercentage] [varchar](255) NULL,
	[LastDateForReturns] [varchar](50) NULL,
	[CountryOfManufacture] [varchar](10) NULL,
	[FromLanguage] [varchar](10) NULL,
	[ToLanguage] [varchar](10) NULL,
	[Contributor1PlaceRelator] [varchar](10) NULL,
	[Contributor2PlaceRelator] [varchar](10) NULL,
	[Contributor3PlaceRelator] [varchar](10) NULL,
	[Contributor1RegionCode] [varchar](100) NULL,
	[Contributor2RegionCode] [varchar](100) NULL,
	[Contributor3RegionCode] [varchar](100) NULL,
	[PrintedOnProduct] [varchar](10) NULL,
	[PositionOnProduct] [varchar](10) NULL,
	[Contributor1NameType] [varchar](10) NULL,
	[Contributor2NameType] [varchar](10) NULL,
	[Contributor3NameType] [varchar](10) NULL,
	[Illustrated] [varchar](10) NULL,
	[AncillaryContent] [varchar](10) NULL,
	[AncillaryContentDescription] [varchar](255) NULL,
	[ProductPackaging] [varchar](10) NULL,
	[ProductComposition] [varchar](10) NULL,
	[BibleContents] [varchar](10) NULL,
	[BibleVersion] [varchar](10) NULL,
	[StudyBibleType] [varchar](10) NULL,
	[BiblePurpose] [varchar](10) NULL,
	[BibleTextOrganization] [varchar](10) NULL,
	[BibleReferenceLocation] [varchar](10) NULL,
	[ReligiousTextIdentifer] [varchar](10) NULL,
	[Prize1Name] [varchar](255) NULL,
	[Prize1Year] [varchar](10) NULL,
	[Prize1Country] [varchar](10) NULL,
	[Prize1Code] [varchar](10) NULL,
	[Prize2Name] [varchar](255) NULL,
	[Prize2Year] [varchar](10) NULL,
	[Prize2Country] [varchar](10) NULL,
	[Prize2Code] [varchar](10) NULL,
	[Prize3Name] [varchar](255) NULL,
	[Prize3Year] [varchar](10) NULL,
	[Prize3Country] [varchar](10) NULL,
	[Prize3Code] [varchar](10) NULL,
	[StartDate] [varchar](50) NULL,
	[EndDate] [varchar](50) NULL,
	[ExpectedDate] [varchar](50) NULL,
	[OrderTime] [varchar](50) NULL, 
    [Problem] VARCHAR(255) NULL
) ON [PRIMARY]
