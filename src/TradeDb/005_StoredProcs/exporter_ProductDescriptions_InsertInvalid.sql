/* =============================================
 Author:		Sean Wikant
 Create date:	Dec 8, 2017
 Description:	Inserts invalid record for vendors with optional message
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_ProductDescriptions_InsertInvalid]
	@ISBN13 varchar(13),
	@EBookID varchar(36),
	@DescriptionTypeId varchar(6),
	@SessionId uniqueidentifier,
	@Message varchar(MAX) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[FeedExportProductDescriptionsInvalid]
           ([ISBN13]
           ,[EBookID]
           ,[DescriptionTypeId]
           ,[SessionId]
           ,[Message])
     VALUES
           (@ISBN13
		   ,@EBookID
		   ,@DescriptionTypeId
           ,@SessionId
           ,@Message)
END
GO

GRANT EXECUTE ON [dbo].[exporter_ProductDescriptions_InsertInvalid] TO [FeedsExporter]; 
GO