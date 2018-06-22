CREATE PROCEDURE [dbo].[ArticleMCLM_TruncateStgArticleMCLMSAPKiosk]
AS

BEGIN
	SET NOCOUNT ON;
	
	TRUNCATE TABLE dbo.stgArticleMCLMSAPKiosk;
END
GO

GRANT EXECUTE ON [dbo].[ArticleMCLM_TruncateStgArticleMCLMSAPKiosk] TO [ArticleMCLMApp]; 
GO