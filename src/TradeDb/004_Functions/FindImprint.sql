CREATE  Function [dbo].[FindImprint]
( @SAPVendorID varchar(12),  @Imprint varchar(255))
RETURNS varchar(255)  AS  
BEGIN 
 
DECLARE @strReturnImprint VARCHAR(255)

-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.


IF @SAPVendorID IS NULL 
	RETURN NULL

IF @Imprint IS NULL 
	RETURN NULL
	
IF dbo.IsSAPVendorImprintValidate(@SAPVendorID)<=0 return @Imprint

SET @Imprint = LTRIM(RTRIM(@Imprint))
IF   LEN( @Imprint ) < 0
	RETURN NULL
	
-- Calculate check digit


set @strReturnImprint ='NoMatchFound: '+@Imprint 
select @strReturnImprint =  NormalName from CatalogAuthorityImprint
where 
 LTRIM(RTRIM(variationName)) =@Imprint


RETURN @strReturnImprint   

END 






















