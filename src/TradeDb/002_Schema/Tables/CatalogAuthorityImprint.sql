CREATE TABLE [dbo].[CatalogAuthorityImprint](
	[VariationName] [varchar](255) NOT NULL,
	[NormalName] [varchar](255) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_CatalogAuthorityImprint_CreationDate]  DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[VariationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]