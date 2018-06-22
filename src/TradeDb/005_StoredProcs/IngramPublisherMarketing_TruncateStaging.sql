CREATE PROCEDURE [dbo].[IngramPublisherMarketing_TruncateStaging]
AS

BEGIN
	SET NOCOUNT ON;
	TRUNCATE TABLE [dbo].[stgIngramPublisherMarketing]
END
GO

GRANT EXECUTE ON [dbo].[IngramPublisherMarketing_TruncateStaging] TO [IngramImportApp]; 
GO