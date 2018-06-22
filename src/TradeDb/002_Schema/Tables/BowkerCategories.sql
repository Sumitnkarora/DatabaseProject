CREATE TABLE [dbo].[BowkerCategories](
	[PID] [decimal](12, 0) NOT NULL,
	[SubjectCode] [varchar](100) NOT NULL,
	[Category] [nvarchar](500) NULL,
	[DateChanged] [datetime] NULL,
 CONSTRAINT [PK_tbl_001_BowkerCategories] PRIMARY KEY CLUSTERED 
(
	[PID] ASC,
	[SubjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
)
