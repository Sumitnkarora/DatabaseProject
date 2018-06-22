CREATE PROCEDURE [dbo].[UpdateLayoutModule]
	@LayoutModuleId VARCHAR(20)
,	@Language CHAR(2)
,	@Value NVARCHAR(MAX)
AS
BEGIN
	IF NOT EXISTS ( SELECT TOP 1 1 FROM dbo.refLayoutModules WHERE LayoutModuleId = @LayoutModuleId )
	BEGIN
		RAISERROR('Layout Module does not exist.', 16, 1);
		RETURN;
	END

	IF @Language NOT IN ('en', 'fr')
	BEGIN
		RAISERROR('Accepted Languages are "en" and "fr".', 16, 1);
		RETURN;
	END

	UPDATE	dbo.refLayoutModules
	SET	[Description] = JSON_MODIFY([Description], '$."' + @Language + '"', @Value)
	WHERE	LayoutModuleId = @LayoutModuleId;
END;
GO
