CREATE TABLE [dbo].[TradeArticleMCLM](
	[UPC] [varchar](20) NOT NULL,
	[PID] [decimal](13, 0) NOT NULL,
	[MerchCategoryID] [varchar](10) NULL,
	[LayoutModuleID] [varchar](10) NULL,
	[MerchCategoryDesc] [varchar](30) NULL,
	[LayoutModuleDesc] [varchar](30) NULL,
	[OriginalPrice] [money] NULL,
	[SpecialPrice] [money] NULL,
	[RetailPriceKiosk] [money] NULL,
	[DateChanged] [datetime] NOT NULL CONSTRAINT [DF_TradeArticleMCLM_DateChanged]  DEFAULT (getdate())
 CONSTRAINT [PK_TradeArticleMCLM] PRIMARY KEY CLUSTERED 
([UPC])WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_TradeArticleMCLM_PID] ON [dbo].[TradeArticleMCLM] ([PID]);
GO

ALTER TABLE [dbo].[TradeArticleMCLM] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO

CREATE TRIGGER [dbo].[trg_Update_TradeArticleMCLM] ON [dbo].[TradeArticleMCLM] 
FOR UPDATE
AS
IF @@Rowcount = 0 
RETURN
ELSE
	UPDATE a
	SET DateChanged = getdate()
	FROM dbo.TradeArticleMCLM a
	INNER JOIN inserted i
	ON a.PID = i.PID

GO

