/************************************************************************************
Procedure Name: uspKoboBooksClearStaging
Description:    Clears Kobo Staging Tables
Run Method:     exec uspKoboBooksClearStaging
Create Date:    Oct. 23, 2017
************************************************************************************/
CREATE PROCEDURE [dbo].[uspKoboBooksClearStaging]
AS
BEGIN
	TRUNCATE TABLE [dbo].[stgKoboBooks]
	TRUNCATE TABLE [dbo].[stgKoboCategories]
	TRUNCATE TABLE [dbo].[stgKoboContributors]
	TRUNCATE TABLE [dbo].[stgKoboPrices]
	TRUNCATE TABLE [dbo].[stgKoboRelatedProducts]
	TRUNCATE TABLE [dbo].[stgKoboReadThisOn]
	TRUNCATE TABLE [dbo].[stgKoboDownloadable]
	TRUNCATE TABLE [dbo].[stgKoboSubscriptions]
	TRUNCATE TABLE [dbo].[stgKoboMarketAvailabilityDates]
	TRUNCATE TABLE [dbo].[stgKoboFailedToProcessProducts]
END
GO

GRANT EXECUTE ON [dbo].[uspKoboBooksClearStaging] TO [KoboImporterApp]; 
GO