CREATE PROCEDURE [dbo].[spGetLegacyID] 
@SAPVendorID varchar(12), @VSRCode varchar(12)

AS

SELECT MAX(LegacyID) AS LegacyID FROM tblSAPVendors
WHERE 
 LTRIM(RTRIM(SAPVendorID)) =  LTRIM(RTRIM(@SAPVendorID))
AND  LTRIM(RTRIM(VSRCode)) =  LTRIM(RTRIM(@VSRCode))
GO