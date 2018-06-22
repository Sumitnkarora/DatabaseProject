CREATE VIEW [dbo].[tblSAPVendors]
AS
SELECT        LegacyID, SAPVendorId, VSRCode, SAPVendorName, VSRName, VendorName, DateChanged, Blocked, CurrencyTypeID, CAST(DiscountBlocked as INT) as OnlineDiscountBlocked
FROM            dbo.TradeVendors