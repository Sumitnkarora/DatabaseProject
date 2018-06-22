/* =============================================
 Author:		Raymond Chan
 Create date:	Dec 21, 2017
 Description:	Inserts invalid record for taxonomy assignment with optional message
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_TaxonomyAssignment_InsertInvalid]
	@ProductSku varchar(36), -- This is one of: TradeBisacData.ISBN13, TradeArticleMcLm.PID, or KoboCategories.EBookID
	@SessionId uniqueidentifier,
	@Message varchar(MAX) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[FeedExportTaxonomyAssignmentInvalid]
           ([ProductSku]
           ,[SessionId]
           ,[Message])
     VALUES
           (@ProductSku
           ,@SessionId
           ,@Message)
END
GO

GRANT EXECUTE ON [dbo].[exporter_TaxonomyAssignment_InsertInvalid] TO [FeedsExporter]; 
GO