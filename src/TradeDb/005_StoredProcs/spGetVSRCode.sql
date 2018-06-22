CREATE PROCEDURE [dbo].[spGetVSRCode]
@SAPVendorID varchar(12)
AS

SELECT  ISNULL(VSRCode, '') AS VSRCode, ISNULL(VSRName, '(No VSR Code)') AS VSRName
FROM [dbo].[TradeVendors] 
WHERE SAPVendorID = @SAPVendorID 
Group By VSRCode, VSRName

GO