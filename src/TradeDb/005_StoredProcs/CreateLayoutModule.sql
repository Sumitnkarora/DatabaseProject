CREATE PROCEDURE [dbo].[CreateLayoutModule]
	@LayoutModuleId VARCHAR(20)
,	@Description_en NVARCHAR(MAX)
,	@Description_fr NVARCHAR(MAX)
AS
BEGIN
	IF EXISTS ( SELECT TOP 1 1 FROM dbo.refLayoutModules WHERE LayoutModuleId = @LayoutModuleId )
	BEGIN
		RAISERROR('Layout Module already exists.', 16, 1);
		RETURN;
	END;

	INSERT	dbo.refLayoutModules
		( LayoutModuleId, [Description] )
	VALUES	(
		@LayoutModuleId, ( SELECT @Description_en AS [en], @Description_fr AS [fr] FOR JSON PATH, WITHOUT_ARRAY_WRAPPER )
	);
END;
GO
