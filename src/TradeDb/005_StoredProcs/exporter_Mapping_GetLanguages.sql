/* =============================================
 Author:		Dariusz Holc
 Create date:	Jan 22, 2018
 Description:	Gets languages from reference table.

 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_Mapping_GetLanguages]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		rl.LanguageName AS [Name],
		rl.LanguageCode AS Code,
		rl.OnixCode AS OnixCode
	FROM refLanguage rl
	WHERE rl.IsDeleted = 0 AND rl.OnixCode IS NOT NULL
END
GO

GRANT EXECUTE ON [dbo].[exporter_Mapping_GetLanguages] TO [FeedsExporter]; 
GO