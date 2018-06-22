CREATE PROCEDURE [dbo].[CreateMerchandiseCategory]
	@MerchCategoryId VARCHAR(20)
,	@Description_en NVARCHAR(MAX)
,	@Description_fr NVARCHAR(MAX)
AS
BEGIN
	IF EXISTS ( SELECT TOP 1 1 FROM dbo.refMerchandiseCategories WHERE MerchCategoryId = @MerchCategoryId )
	BEGIN
		RAISERROR('Merchandise Category already exists.', 16, 1);
		RETURN;
	END;

	INSERT	dbo.refMerchandiseCategories
		( MerchCategoryId, [Description] )
	VALUES	(
		@MerchCategoryId, ( SELECT @Description_en AS [en], @Description_fr AS [fr] FOR JSON PATH, WITHOUT_ARRAY_WRAPPER )
	);
END;
GO
