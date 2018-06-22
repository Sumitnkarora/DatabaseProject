CREATE  Function [dbo].[FindClassOfTradeName]
( @SAPVendorID varchar(12),  @ClassOfTrade varchar(50), @ClassOfTradeName  varchar(50))
RETURNS varchar(50)  AS  
BEGIN 

DECLARE @strClassOfTradeName VARCHAR(255)

-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.


IF @SAPVendorID IS NULL 
	RETURN NULL

IF dbo.IsSAPVendorValidate(@SAPVendorID)>0 return NULL

IF @ClassOfTrade IS NULL 
	RETURN NULL

SET @ClassOfTrade = LTRIM(RTRIM(@ClassOfTrade))
IF   LEN( @ClassOfTrade ) < 0
	RETURN NULL
	
-- Calculate check digit


select @strClassOfTradeName =  ClassOfTradeDescription from tblClassOfTrade
where 
 LTRIM(RTRIM(ClassOfTrade)) = @ClassOfTrade
and  LTRIM(RTRIM(SAPVendorID)) =  LTRIM(RTRIM(@SAPVendorID))

RETURN @strClassOfTradeName   

END 
