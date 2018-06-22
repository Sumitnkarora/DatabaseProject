CREATE TABLE [dbo].[stgKoboBooks](
	[EBookID] [varchar](36) NOT NULL,
	[AccountHolderId] [varchar](255) NULL,
	[ISBN] [varchar](13) NULL,
	[UpdateType] [varchar](50) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Subtitle] [nvarchar](255) NULL,
	[Imprint] [nvarchar](255) NULL,
	[Edition] [nvarchar](255) NULL,
	[Series] [nvarchar](255) NULL,
	[SeriesNumber] [nvarchar](55) NULL,
	[Language] [varchar](2) NULL,
	[Description] [nvarchar](MAX) NULL,
	[Publisher] [nvarchar](255) NULL,
	[CoverImage] [varchar](500) NULL,
	[ItemPage] [varchar](500) NULL,
	[PurchasePath] [varchar](500) NULL,
	[ImageId] [varchar](500) NULL,
	[ImageName] [varchar](500) NULL,
	[PublicationDate] [datetime] NULL,
	[MinAge] [int] NULL,
	[MaxAge] [int] NULL,
	[SeriesId] [varchar](64) NULL,
	[SeriesNumberFloat] [decimal](7, 2) NULL,
	[IsKids] [bit] NULL,
	[HasPreview] [bit] NULL,
	[IsKWL] [bit] NULL, 
    [IsAdultMaterial] [BIT] NULL, 
    [InstantPreview] [VARCHAR] (500) NULL, 
    [InstantPreviewFormat] [NCHAR] (100) NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboBooks_EBookID] ON [dbo].[stgKoboBooks] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboBooks] TO [KoboImporterApp];
GO