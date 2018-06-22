CREATE PROCEDURE OnixImportClearStaging
AS
BEGIN
DELETE [stgTradeCoreAttributes];
DELETE [stgTradeAlternateIdentifiers];
DELETE [stgTradeCollections];
DELETE [stgTradeCollectionData];
DELETE [stgTradeContributors];
DELETE [stgTradeContributorData];
DELETE [stgTradeSubjects];
DELETE [stgTradeEnhancedContent];
DELETE [stgTradeSalesRights];
DELETE [stgTradeSupplierInformation];
DELETE [stgTradeSupplierPricing];
END
GO

GRANT EXECUTE ON OnixImportClearStaging TO OnixImportApp;
GO