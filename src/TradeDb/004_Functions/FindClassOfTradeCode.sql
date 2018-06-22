CREATE  Function [dbo].[FindClassOfTradeCode]
( @SAPVendorID varchar(12),  @ClassOfTrade varchar(50), @ClassOfTradeCode  varchar(4))
RETURNS varchar(4)  AS  
BEGIN 
 
DECLARE @strClassOfTradeCode VARCHAR(255)

-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.


IF @SAPVendorID IS NULL 
	RETURN NULL

--check whether the SAPVendorID is on exception list
IF dbo.IsSAPVendorValidate(@SAPVendorID)>0 return ''

IF @ClassOfTrade IS NULL 
	RETURN NULL

SET @ClassOfTrade = LTRIM(RTRIM(@ClassOfTrade))
IF   LEN( @ClassOfTrade ) < 0
	RETURN NULL
	

select @strClassOfTradeCode =  ClassOfTradeCode from tblClassOfTrade
where 
 LTRIM(RTRIM(ClassOfTrade)) = @ClassOfTrade
and  LTRIM(RTRIM(SAPVendorID)) =  LTRIM(RTRIM(@SAPVendorID))

RETURN @strClassOfTradeCode   

END 
