CREATE TABLE [dbo].[TradeEnhancedContent] (
	[ISBN13] VARCHAR (13) NOT NULL
,	[SAPVendorId] VARCHAR (20) NOT NULL
,	[VSRCode] VARCHAR (20) NOT NULL
,	[ID] INT NOT NULL
,	[ContentCode] CHAR(2) NOT NULL
,	[ContentType] CHAR(2) NULL
,	[URL] NVARCHAR(MAX) NULL
,	[Content] NVARCHAR(MAX) NOT NULL
,	CONSTRAINT [PK_TradeDescriptionData] PRIMARY KEY CLUSTERED ([ISBN13] ASC, [SAPVendorId] ASC, [VSRCode] ASC, [ID] ASC)
,	CONSTRAINT [FK_TradeDescriptionData_refContentCode] FOREIGN KEY ([ContentCode]) REFERENCES [dbo].[refContentCode] ([Id])
,	CONSTRAINT [FK_TradeDescriptionData_refContentType] FOREIGN KEY ([ContentType]) REFERENCES [dbo].[refContentType] ([Id])
,	CONSTRAINT [FK_TradeDescriptionData_TradeCoreAttributes] FOREIGN KEY ([ISBN13], [SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes] ([ISBN13], [SAPVendorId], [VSRCode]) ON DELETE CASCADE
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeEnhancedContent TO OnixImportApp;
GO