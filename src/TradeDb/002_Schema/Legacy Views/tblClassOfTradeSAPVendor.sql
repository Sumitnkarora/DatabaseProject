CREATE VIEW [dbo].[tblClassOfTradeSAPVendor]
	AS SELECT SAPVendorID, SAPVendorName FROM TradeVendors WHERE IsClassOfTradeExcepted = 1
