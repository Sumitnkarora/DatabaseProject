/* =============================================
 Author:		Dariusz Holc
 Create date:	Jan 4, 2018
 Description:	Inserts invalid record for product attributes with optional message
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_ProductAttributes_InsertInvalid]
	@Isbn13 varchar(13),
	@SessionId uniqueidentifier,
	@Message varchar(MAX) = null,
	@EBookId varchar(36) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[FeedExportProductAttributesInvalid]
           ([ISBN13]
		   ,[EBookId]
           ,[SessionId]
           ,[Message])
     VALUES
           (@Isbn13
		   ,ISNULL(@EBookId, '')
           ,@SessionId
           ,@Message)
END
GO

GRANT EXECUTE ON [dbo].[exporter_ProductAttributes_InsertInvalid] TO [FeedsExporter]; 
GO