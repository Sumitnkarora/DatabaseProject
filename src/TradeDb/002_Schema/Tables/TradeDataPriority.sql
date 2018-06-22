CREATE TABLE [dbo].[TradeDataPriority]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorId] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[RegionId] VARCHAR(10) NOT NULL
,	[Priority] TINYINT NOT NULL
,	[IndigoOverride] BIT NOT NULL DEFAULT(0)
,	[DateChanged] DATETIME2(3) NOT NULL DEFAULT(SYSDATETIME())
,	CONSTRAINT [PK_TradeDataPriority] PRIMARY KEY NONCLUSTERED ([ISBN13], [SAPVendorId], [VSRCode], [RegionId])
,	CONSTRAINT [FK_TradeDataPriority_TradeCoreAttributes] FOREIGN KEY ([ISBN13], [SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes]([ISBN13], [SAPVendorId], [VSRCode]) ON DELETE CASCADE
,	CONSTRAINT [FK_TradeDataPriority_refRightsRegions] FOREIGN KEY([RegionId]) REFERENCES [dbo].[refRightsRegions]([RegionId])
);
GO

CREATE UNIQUE CLUSTERED INDEX [UX_TradeDataPriority_ISBN13_RegionId_Priority] ON dbo.[TradeDataPriority]([ISBN13], [RegionId], [Priority]);
GO

ALTER TABLE [dbo].[TradeDataPriority] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO
