CREATE  Function [dbo].[IsSAPVendorImprintValidate]
( @SAPVendorID varchar(12) )
RETURNS int  AS  
BEGIN 

DECLARE @intValidate int

-- return NULL if the input is NULL. It's required by SymeDB- CatDB import validation logic.
IF @SAPVendorID IS NULL 
	RETURN 0


SET @SAPVendorID = LTRIM(RTRIM(@SAPVendorID))
IF   LEN( @SAPVendorID ) = 0
	RETURN 0
	
-- Calculate check digit


select @intValidate =  count(SAPVendorID)
from CatalogImportValidationON
where 
 LTRIM(RTRIM(SAPVendorID)) = @SAPVendorID
and useImprint =1

RETURN @intValidate  

END 
