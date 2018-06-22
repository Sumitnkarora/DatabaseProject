CREATE PROCEDURE [dbo].[spGetVendorCodes]
@SearchKey varchar(50)
AS

SELECT min(SAPVendorID) AS SAPVendorID,
ISNULL(VendorName, 'NULL') + '-' + ISNULL(SAPVendorID, 'NULL')
AS SAPVendor
FROM [dbo].[TradeVendors]
WHERE SAPVendorID LIKE '7%'
AND SAPVendorName LIKE @SearchKey
GROUP BY SAPVendorID, VendorName
ORDER BY VendorName
GO