/* =============================================
 Author:		Sean Wikant
 Create date:	Dec 8, 2017
 Description:	Inserts invalid record for vendors with optional message
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_Contributors_InsertInvalid]
	@ContributorId int,
	@KoboEBookId varchar(36),
	@KoboContributorOrdinal int,
	@SessionId uniqueidentifier,
	@Message varchar(MAX) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[FeedExportContributorsInvalid]
           ([ContributorId]
           ,[EBookID]
           ,[ContributorOrdinal]
           ,[SessionId]
           ,[Message])
     VALUES
           (@ContributorId
           ,@KoboEBookID
           ,@KoboContributorOrdinal
           ,@SessionId
           ,@Message)
END
GO

GRANT EXECUTE ON [dbo].[exporter_Contributors_InsertInvalid] TO [FeedsExporter]; 
GO