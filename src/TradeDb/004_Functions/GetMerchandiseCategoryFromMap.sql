CREATE FUNCTION [dbo].[GetMerchandiseCategoryFromMap] (
	@BisacCode varchar(10)
,	@BindingCode varchar(100)
,	@LanguageCode varchar(50)
)
RETURNS varchar(50)
AS
BEGIN
	DECLARE @MerchCategoryID varchar(10)

	IF @LanguageCode <> 'French' SET @LanguageCode = 'NF'

	IF @BindingCode = 'CA' 
	BEGIN
		IF @LanguageCode = 'French' 
		BEGIN
			SELECT @MerchCategoryID = MerchCategoryID
			FROM refBisacToMCLMMap WHERE LanguageCode = 'FR' AND BindingCode = '+CA'
		END
		ELSE
			SELECT @MerchCategoryID = MerchCategoryID
			FROM refBisacToMCLMMap WHERE LanguageCode = 'NF' AND BindingCode = '+CA'
	END	
	ELSE
		IF @LanguageCode = 'French' 
		BEGIN
			SELECT @MerchCategoryID = MerchCategoryID
			FROM refBisacToMCLMMap WHERE BisacCode = @BisacCode AND LanguageCode = 'FR'
		END
		ELSE
			SELECT @MerchCategoryID = MerchCategoryID
			FROM refBisacToMCLMMap 
			WHERE BisacCode = @BisacCode AND LanguageCode = 'NF'
				AND ( ( (SUBSTRING(BindingCode, 1, 1) = '+') AND (CHARINDEX(@BindingCode, BindingCode) > 0) )
				OR ( (SUBSTRING(BindingCode, 1, 1) = '-') AND (CHARINDEX(@BindingCode, BindingCode) = 0) ) )
		
	RETURN @MerchCategoryID
END
GO
