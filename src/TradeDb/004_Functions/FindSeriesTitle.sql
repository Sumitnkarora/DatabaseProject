CREATE  Function [dbo].[FindSeriesTitle]
( @SAPVendorID varchar(12),  @SeriesTitle varchar(255))
RETURNS varchar(255)  AS  
BEGIN 
 
DECLARE @strReturnSeriesTitle VARCHAR(255)

-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.


IF @SAPVendorID IS NULL 
	RETURN NULL

IF @SeriesTitle IS NULL 
	RETURN NULL
	
IF dbo.IsSAPVendorSeriesTitleValidate(@SAPVendorID)<=0 return @SeriesTitle

SET @SeriesTitle = LTRIM(RTRIM(@SeriesTitle))
IF   LEN( @SeriesTitle ) <= 0
	RETURN NULL
	

set @strReturnSeriesTitle ='NoMatchFound: ' + @SeriesTitle
select @strReturnSeriesTitle =  NormalName from CatalogAuthoritySeries
where 
 LTRIM(RTRIM(VariationName)) =@SeriesTitle


RETURN @strReturnSeriesTitle   

END 
























