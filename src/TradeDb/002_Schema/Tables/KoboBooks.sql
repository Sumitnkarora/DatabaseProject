CREATE TABLE [dbo].[KoboBooks](
	[EBookID] [varchar](36) NOT NULL,
	[AccountHolderId] [varchar](255) NULL,
	[ISBN] [varchar](13) NULL,
	[IsActive] [BIT] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Subtitle] [nvarchar](255) NULL,
	[Imprint] [nvarchar](255) NULL,
	[Edition] [nvarchar](255) NULL,
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
	[IsKids] [bit] NULL,
	[HasPreview] [bit] NULL,
	[IsKWL] [bit] NULL, 
    [IsAdultMaterial] [BIT] NULL, 
    [InstantPreview] [VARCHAR] (500) NULL, 
    [InstantPreviewFormat] [NCHAR] (100) NULL,
	[DateChanged] [datetime] NULL,

	CONSTRAINT [PK_KoboBooks] PRIMARY KEY CLUSTERED ([EBookID] ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboBooks_ISBN] ON [dbo].[KoboBooks] ([ISBN])
GO

ALTER TABLE [dbo].[KoboBooks] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO