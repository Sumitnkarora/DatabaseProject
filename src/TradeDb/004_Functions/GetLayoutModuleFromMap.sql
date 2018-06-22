CREATE FUNCTION [dbo].[GetLayoutModuleFromMap] (
	@BisacCode varchar(10)
,	@BindingCode varchar(100)
,	@LanguageCode varchar(50)
)
RETURNS varchar(50)
AS
BEGIN
	DECLARE @LayoutModuleID varchar(10)

	IF @LanguageCode <> 'French' SET @LanguageCode = 'NF'

	IF @BindingCode = 'CA' 
	BEGIN
		IF @LanguageCode = 'French' 
		BEGIN
			SELECT @LayoutModuleID = LayoutModuleID
			FROM refBisacToMCLMMap WHERE LanguageCode = 'FR' AND BindingCode = '+CA'
		END
		ELSE
			SELECT @LayoutModuleID = LayoutModuleID
			FROM refBisacToMCLMMap WHERE LanguageCode = 'NF' AND BindingCode = '+CA'
	END	
	ELSE
		IF @LanguageCode = 'French' 
		BEGIN
			SELECT @LayoutModuleID = LayoutModuleID
			FROM refBisacToMCLMMap WHERE BisacCode = @BisacCode AND LanguageCode = 'FR'
		END
		ELSE
			SELECT @LayoutModuleID = LayoutModuleID
			FROM refBisacToMCLMMap 
			WHERE BisacCode = @BisacCode AND LanguageCode = 'NF'
				AND ( ( (SUBSTRING(BindingCode, 1, 1) = '+') AND (CHARINDEX(@BindingCode, BindingCode) > 0) )
				OR ( (SUBSTRING(BindingCode, 1, 1) = '-') AND (CHARINDEX(@BindingCode, BindingCode) = 0) ) )
		

	RETURN @LayoutModuleID
END