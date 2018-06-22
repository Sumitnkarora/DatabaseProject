CREATE TABLE [dbo].[TradeArticleMCLMDeleted](
	[PID] [decimal](13, 0) NOT NULL,
	[MerchCategoryID] [varchar](10) NULL,
	[LayoutModuleID] [varchar](10) NULL,
	[MerchCategoryDesc] [varchar](30) NULL,
	[LayoutModuleDesc] [varchar](30) NULL,
	[DateChanged] [datetime] NOT NULL CONSTRAINT [DF_TradeArticleMCLMDeleted_DateChanged]  DEFAULT (getdate()),
	[UPC] [varchar](20) NULL
) ON [PRIMARY]

GO