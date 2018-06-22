CREATE TABLE [dbo].[EBookDetails]
(
	[PID] [decimal](12, 0) NOT NULL,
	[eBookID] [varchar](36) NOT NULL,
	[KoboContentType] [smallint] NOT NULL,
	[NumberOfChapters] [int] NULL,
	[IsFiction] [bit] NULL,
	[Monetization] [bit] NULL,
	[ActivationDate] [datetime] NULL,
	[Rating] [int] NULL,
	[CostOfGoods] [money] NULL,
	[DRMFee] [money] NULL,
	[KoboItemPageURL] [varchar](500) NULL,
	[CoverImageURL] [varchar](500) NULL,
	[FileFormat] [varchar](100) NULL,
	[FileSize] [int] NULL,
	[Quality] [int] NULL,
	[DateChanged] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[eBookImageId] [varchar](500) NULL,
	[eBookImageName] [varchar](500) NULL,
	[PreviewURL] [varchar](500) NULL,
 CONSTRAINT [PK_tbl_001_eBookDetails_PID] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO