CREATE PROCEDURE [dbo].[spGetSAPVendorInfo] 
@LegacyID char(32)

AS

SELECT u.LegacyID, u.SAPVendorName, u.SAPVendorID
FROM [dbo].[TradeVendors] u
WHERE u.LegacyID = CAST(@LegacyID AS DECIMAL(10))

GO