CREATE PROCEDURE [dbo].[spGetClassOfTrade]
@VendorID varchar(255)
 AS

SELECT  ClassOfTrade + '--'+ Discount +'%' AS ClassOfTradeDesc, ClassOfTrade  
FROM [dbo].[TradeClassOfTrade] C, [dbo].[TradeVendors] V
WHERE RTRIM(LTRIM(C.SAPVendorID)) LIKE RTRIM(LTRIM(V.SAPVendorID))
AND V.LegacyID = CAST(@VendorID AS DECIMAL(10))
GO