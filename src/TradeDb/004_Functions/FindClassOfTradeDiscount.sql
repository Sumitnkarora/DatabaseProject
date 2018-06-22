CREATE  Function [dbo].[FindClassOfTradeDiscount]
( @SAPVendorID varchar(12),  @ClassOfTrade varchar(50), @Discount  varchar(20))
RETURNS varchar(20)  AS  
BEGIN 
 
DECLARE @strDiscount VARCHAR(255)

-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.


IF @SAPVendorID IS NULL 
	RETURN NULL

IF dbo.IsSAPVendorValidate(@SAPVendorID)>0 return @Discount

IF @ClassOfTrade IS NULL 
	RETURN NULL

SET @ClassOfTrade = LTRIM(RTRIM(@ClassOfTrade))
IF   LEN( @ClassOfTrade ) < 0
	RETURN NULL
	
-- Calculate check digit


select @strDiscount =  Discount from tblClassOfTrade
where 
 LTRIM(RTRIM(ClassOfTrade)) =@ClassOfTrade
and  LTRIM(RTRIM(SAPVendorID)) =  LTRIM(RTRIM(@SAPVendorID))

RETURN @strDiscount   

END 


















