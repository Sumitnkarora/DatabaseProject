CREATE ROLE [VendorImportApp] AUTHORIZATION [dbo];
GO
GRANT EXECUTE ON TradeVendorsClearStaging TO VendorImportApp;
GO
GRANT EXECUTE ON TradeVendorsImport TO VendorImportApp;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeVendorsNoVSR TO VendorImportApp;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeVendorsVSR TO VendorImportApp;
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON TradeVendors TO VendorImportApp;
GO