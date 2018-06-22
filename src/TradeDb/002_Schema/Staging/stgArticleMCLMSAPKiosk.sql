CREATE TABLE [dbo].[stgArticleMCLMSAPKiosk] (
	[PID] [decimal](13, 0) NULL,
	[MerchCategoryID] [varchar] (10),
	[MerchCategoryDesc] [varchar] (30),
	[LayoutModuleID] [varchar] (10),
	[LayoutModuleDesc] [varchar] (30),
	[OriginalPrice] [varchar] (100),
	[UPC] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE INDEX IDX_stgArticleMCLMSAPKiosk_UPC ON dbo.stgArticleMCLMSAPKiosk (UPC)
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgArticleMCLMSAPKiosk] TO [ArticleMCLMApp];
GO