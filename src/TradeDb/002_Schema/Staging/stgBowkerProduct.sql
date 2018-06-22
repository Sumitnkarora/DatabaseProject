CREATE TABLE [dbo].[stgBowkerProduct](
	[RecordReference] [varchar](32) NULL,
	[MessageNumber] [varchar](12) NULL,
	[SentDate] [varchar](12) NULL,
	[Barcode] [char](2) NULL,
	[ReplacesISBN] [char](10) NULL,
	[ReplacesEAN13] [char](13) NULL,
	[ProductForm] [char](2) NULL,
	[BookFormDetail] [char](2) NULL,
	[NumberOfPieces] [varchar](10) NULL,
	[EpubType] [varchar](3) NULL,
	[DistinctiveTitle] [nvarchar](400) NULL,
	[TitlePrefix] [nvarchar](100) NULL,
	[TitleWithoutPrefix] [nvarchar](400) NULL,
	[Subtitle] [nvarchar](400) NULL,
	[TranslationOfTitle] [nvarchar](400) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerProduct] TO [BowkerApp];
GO