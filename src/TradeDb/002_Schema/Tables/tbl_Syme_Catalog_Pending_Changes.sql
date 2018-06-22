﻿CREATE TABLE [syme].[tbl_Syme_Catalog_Pending_Changes](
	[ChangeID] [INT] IDENTITY(1,1) NOT NULL,
	[pid] [DECIMAL](12, 0) NOT NULL,
	[ISBN] [VARCHAR](13) NULL,
	[VendorID] [VARCHAR](255) NOT NULL,
	[VendorName] [VARCHAR](80) NULL,
	[Title] [VARCHAR](255) NULL,
	[Subtitle] [VARCHAR](255) NULL,
	[SeriesTitle] [VARCHAR](255) NULL,
	[Contributor1Role] [VARCHAR](255) NULL,
	[Contributor1LastName] [VARCHAR](255) NULL,
	[Contributor1FirstName] [VARCHAR](255) NULL,
	[Contributor1InitialMiddleName] [VARCHAR](255) NULL,
	[Contributor2Role] [VARCHAR](255) NULL,
	[Contributor2LastName] [VARCHAR](255) NULL,
	[Contributor2FirstName] [VARCHAR](255) NULL,
	[Contributor2InitialMiddleName] [VARCHAR](255) NULL,
	[Contributor3Role] [VARCHAR](255) NULL,
	[Contributor3LastName] [VARCHAR](255) NULL,
	[Contributor3FirstName] [VARCHAR](255) NULL,
	[Contributor3InitialMiddleName] [VARCHAR](255) NULL,
	[Media] [VARCHAR](255) NULL,
	[Binding] [VARCHAR](255) NULL,
	[ItemPrice] [VARCHAR](255) NULL,
	[ItemPriceCurrency] [VARCHAR](255) NULL,
	[Discount] [VARCHAR](255) NULL,
	[PubDate] [VARCHAR](255) NULL,
	[StatusCode] [VARCHAR](255) NULL,
	[PublisherID] [VARCHAR](255) NULL,
	[BisacSubjectCode1] [VARCHAR](255) NULL,
	[BisacSubjectCode2] [VARCHAR](255) NULL,
	[BisacSubjectCode3] [VARCHAR](255) NULL,
	[SuggestedBuy] [VARCHAR](255) NULL,
	[PrintQuantity] [VARCHAR](255) NULL,
	[OLDISBN] [VARCHAR](255) NULL,
	[OLDISBNOutofPrintDate] [VARCHAR](255) NULL,
	[EditionNumber] [VARCHAR](255) NULL,
	[EditionDescription] [VARCHAR](255) NULL,
	[VolumeNumber] [VARCHAR](255) NULL,
	[NumberofVolumes] [VARCHAR](255) NULL,
	[NumberofPages] [VARCHAR](255) NULL,
	[Height] [VARCHAR](255) NULL,
	[Width] [VARCHAR](255) NULL,
	[Depth] [VARCHAR](255) NULL,
	[MeasurementUnits] [VARCHAR](255) NULL,
	[Weight] [VARCHAR](255) NULL,
	[WeightUnits] [VARCHAR](255) NULL,
	[CartonQuantity] [VARCHAR](255) NULL,
	[MinimumOrderQuantity] [VARCHAR](255) NULL,
	[CanadianTitle] [VARCHAR](255) NULL,
	[AudienceCode] [VARCHAR](255) NULL,
	[GradeLowerLimit] [VARCHAR](255) NULL,
	[GradeUpperLimit] [VARCHAR](255) NULL,
	[AgeLowerLimit] [VARCHAR](255) NULL,
	[AgeUpperLimit] [VARCHAR](255) NULL,
	[Language] [VARCHAR](255) NULL,
	[FileName] [VARCHAR](255) NULL,
	[Catalogue Name] [VARCHAR](255) NULL,
	[Catalogue Page Number] [VARCHAR](255) NULL,
	[DateCreated] [DATETIME] NOT NULL,
	[DateChanged] [DATETIME] NULL,
	[LoggingID] [INT] NOT NULL,
	[ChangeStatusFlag] [INT] NOT NULL,
	[ChangedByUserID] [VARCHAR](255) NOT NULL,
	[CatalogueName] [VARCHAR](255) NULL,
	[CataloguePageNumber] [VARCHAR](10) NULL,
	[ReturnFormat] [CHAR](1) NULL,
	[ReplacementISBN] [VARCHAR](13) NULL,
	[ReplacementCode] [VARCHAR](5) NULL,
	[OPDate] [VARCHAR](12) NULL,
	[ISBN13] [VARCHAR](50) NULL,
	[ReplacementISBN13] [VARCHAR](50) NULL,
	[Imprint] [VARCHAR](100) NULL,
	[ClassOfTrade] [VARCHAR](50) NULL,
	[Contributor1CountryCode] [VARCHAR](10) NULL,
	[Contributor2CountryCode] [VARCHAR](10) NULL,
	[Contributor3CountryCode] [VARCHAR](10) NULL,
	[NA1] [VARCHAR](10) NULL,
	[NA2] [VARCHAR](10) NULL,
	[NA3] [VARCHAR](10) NULL,
	[RunTime] [VARCHAR](10) NULL,
	[BISACRegionCode] [VARCHAR](20) NULL,
	[UserID] [INT] NOT NULL,
	[PaperCertificationType] [VARCHAR](255) NULL,
	[ChainofCustody] [VARCHAR](255) NULL,
	[CertifiedPostConsumerWaste_PCW] [VARCHAR](255) NULL,
	[CertifiedPCWPercentage] [VARCHAR](255) NULL,
	[UncertifiedPCW] [VARCHAR](255) NULL,
	[UncertifiedPCWPercentage] [VARCHAR](255) NULL,
 CONSTRAINT [PK_tbl_Syme_Catalog_Pending_Changes] PRIMARY KEY CLUSTERED 
(
	[ChangeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [syme].[tbl_Syme_Catalog_Pending_Changes] ADD  CONSTRAINT [DF__tbl_Syme_Catalog_Pending_Changes__UserID]  DEFAULT ('') FOR [UserID]
GO

ALTER TABLE [syme].[tbl_Syme_Catalog_Pending_Changes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Syme_Catalog_Pending_Changes_tbl_syme_catalog_pending_changes_ChangeStatus] FOREIGN KEY([ChangeStatusFlag])
REFERENCES [syme].[tbl_syme_catalog_pending_changes_ChangeStatus] ([ChangeStatusID])
GO

ALTER TABLE [syme].[tbl_Syme_Catalog_Pending_Changes] CHECK CONSTRAINT [FK_tbl_Syme_Catalog_Pending_Changes_tbl_syme_catalog_pending_changes_ChangeStatus]
GO