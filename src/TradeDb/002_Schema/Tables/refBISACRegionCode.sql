CREATE TABLE [syme].[refBISACRegionCode](
	[BISACRegionDescription] [VARCHAR](255) NULL,
	[BISACRegionCode] [VARCHAR](255) NULL,
	[Display] [BIT] NOT NULL,
	[Level] [CHAR](10) NULL,
	[Continent] [VARCHAR](50) NULL
) ON [PRIMARY]
GO

ALTER TABLE [syme].[refBISACRegionCode] ADD  CONSTRAINT [DF_refBISACRegionCode_Display]  DEFAULT (0) FOR [Display]
GO
