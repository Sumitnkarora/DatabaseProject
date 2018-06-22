CREATE TABLE TradeDataExport (
ISBN13 VARCHAR(13) NOT NULL,
RegionId VARCHAR(10) NOT NULL,
MerchCategoryId VARCHAR(10) NULL,
LayoutModuleId VARCHAR(20) NULL,
ExportStatus TINYINT NOT NULL DEFAULT(0),
ErrorMessage NVARCHAR(MAX) NULL,
DateItemLastExported DATETIME2(3) NULL,
DateItemCreated DATETIME2(3) NULL,
DateItemUpdated DATETIME2(3) NULL,
DateItemInError DATETIME2(3) NULL,
DateChanged DATETIME2(3) NOT NULL DEFAULT(SYSDATETIME()),
ChangedBy NVARCHAR(128) NOT NULL DEFAULT(SUSER_SNAME()),
CONSTRAINT PK_TradeDataExport PRIMARY KEY CLUSTERED (ISBN13, RegionId),
CONSTRAINT [FK_TradeDataExport_refLayoutModules] FOREIGN KEY ([LayoutModuleId]) REFERENCES [dbo].[refLayoutModules]([LayoutModuleId]),
CONSTRAINT [FK_TradeDataExport_refMerchandiseCategories] FOREIGN KEY ([MerchCategoryId]) REFERENCES [dbo].[refMerchandiseCategories]([MerchCategoryId])
);

GO

CREATE NONCLUSTERED INDEX IX_TradeDataExport_ExportStatus ON TradeDataExport (ExportStatus);
GO

GRANT SELECT, UPDATE, REFERENCES ON TradeDataExport TO TwrImportApp;
GO

GRANT SELECT, REFERENCES ON TradeDataExport TO TwrImageExportApp;
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON dbo.TradeDataExport TO [TWRExporter];
GO