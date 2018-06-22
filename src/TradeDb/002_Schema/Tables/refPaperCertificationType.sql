CREATE TABLE [dbo].[refPaperCertificationType](
	[PaperCertificationTypeName] [varchar](255) NULL,
	[PaperCertificationTypeCode] [varchar](255) NOT NULL,
	[Display] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaperCertificationTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO