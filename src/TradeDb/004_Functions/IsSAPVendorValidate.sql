CREATE  Function [dbo].[IsSAPVendorValidate]
( @SAPVendorID varchar(12) )
RETURNS int  AS  
BEGIN 

 
DECLARE @intValidate int

-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.
IF @SAPVendorID IS NULL 
	RETURN 0


SET @SAPVendorID = LTRIM(RTRIM(@SAPVendorID))
IF   LEN( @SAPVendorID ) < 0
	RETURN 0
	
-- Calculate check digit

-- ***AV : From CatalogDB : Since this function simply checks if the SAPVendorID exists in tblClassOfTradeSAPVendor, which contains all
-- ***	SAPVendorID, we made it check directly to TradeVendors table.
--select @intValidate =  count(SAPVendorID)
--from tblClassOfTradeSAPVendor
--where 
-- LTRIM(RTRIM(SAPVendorID)) = @SAPVendorID

select @intValidate =  count(SAPVendorID)
from TradeVendors
where 
 LTRIM(RTRIM(SAPVendorID)) = @SAPVendorID AND IsClassOfTradeExcepted = 1 -- IsClassOfTradeSAPVendor flag to identify if it exists in the legacy table tblClassOfTradeSAPVendor


RETURN @intValidate   

END 
















