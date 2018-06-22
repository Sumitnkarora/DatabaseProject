CREATE procedure [dbo].[Catalog_UpdateRowStats]
as

update CatalogImportStatRow set ValidRetekDBRows = 0 where ValidRetekDBRows is null

update CatalogImportStatRow set InvalidRetekDBRows = 0 where InvalidRetekDBRows is null

update CatalogImportStatRow set DeletedRetekDBRows = ValidCatalogDBRows - ValidRetekDBRows

where DeletedRetekDBRows is null
GO

GRANT EXECUTE ON [dbo].[Catalog_UpdateRowStats] TO [CatalogImportApp]; 
GO