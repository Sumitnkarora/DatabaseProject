CREATE VIEW [dbo].[tblClassOfTrade]
AS
SELECT        SAPVendorID, ClassOfTrade, ClassOfTradeCode, Discount, ClassOfTradeDescription, CreationDate
FROM            dbo.TradeClassOfTrade
GO
