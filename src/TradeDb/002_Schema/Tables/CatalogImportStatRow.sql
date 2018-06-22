CREATE TABLE [dbo].[CatalogImportStatRow](
	[FileID] [int] NOT NULL,
	[TotalRowsImported] [int] NOT NULL,
	[ValidCatalogDBRows] [int] NULL,
	[InvalidCatalogDBRows] [int] NULL,
	[ValidRetekDBRows] [int] NULL,
	[InvalidRetekDBRows] [int] NULL,
	[DeletedRetekDBRows] [int] NULL,
	[DateCreated] [datetime] NULL
) ON [PRIMARY]
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[CatalogImportStatRow] TO [CatalogImportApp];
GO