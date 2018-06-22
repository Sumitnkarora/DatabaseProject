CREATE PROCEDURE TradeVendorsClearStaging
AS
BEGIN
	DELETE dbo.stgTradeVendorsNoVSR
	DELETE dbo.stgTradeVendorsVSR
END
GO
