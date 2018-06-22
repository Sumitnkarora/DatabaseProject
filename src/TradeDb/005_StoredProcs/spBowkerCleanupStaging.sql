CREATE procedure [dbo].[spBowkerCleanupStaging]
-- Use with caution !!!
-- Purpose: Cleans up staging tables for loading Bowker XML data
-- Use: used inside dt_UploadBowkerData DTS package to clean up staging tables
-- before the xml file is loaded using SQLXML.
as
	truncate table stgBowkerAudience
	truncate table stgBowkerAudienceRange
	truncate table stgBowkerContributorRole
	truncate table stgBowkerContributor
	truncate table stgBowkerOtherText
	truncate table stgBowkerPrize
	truncate table stgBowkerProductIdentifier
	truncate table stgBowkerSubject
	truncate table stgBowkerWorkIdentifier
	truncate table stgBowkerProduct
	truncate table stgBowkerONIXmessage
GO

GRANT EXECUTE ON [dbo].[spBowkerCleanupStaging] TO [BowkerApp]; 
GO