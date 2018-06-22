CREATE PROCEDURE [dbo].[IngramAnnotation_TruncateStaging]
AS

BEGIN
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[stgIngramAnnotations]
END
GO

GRANT EXECUTE ON [dbo].[IngramAnnotation_TruncateStaging] TO [IngramImportApp]; 
GO