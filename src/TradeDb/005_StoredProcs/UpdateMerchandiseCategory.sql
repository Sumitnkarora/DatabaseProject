CREATE PROCEDURE [dbo].[UpdateMerchandiseCategory]
	@MerchCategoryId VARCHAR(20)
,	@Language CHAR(2)
,	@Value NVARCHAR(MAX)
AS
BEGIN
	IF NOT EXISTS ( SELECT TOP 1 1 FROM dbo.refMerchandiseCategories WHERE MerchCategoryId = @MerchCategoryId )
	BEGIN
		RAISERROR('Merchandise Category does not exist.', 16, 1);
		RETURN;
	END

	IF @Language NOT IN ('en', 'fr')
	BEGIN
		RAISERROR('Accepted Languages are "en" and "fr".', 16, 1);
		RETURN;
	END

	UPDATE	dbo.refMerchandiseCategories
	SET	[Description] = JSON_MODIFY([Description], '$."' + @Language + '"', @Value)
	WHERE	MerchCategoryId = @MerchCategoryId;
END;
GO
