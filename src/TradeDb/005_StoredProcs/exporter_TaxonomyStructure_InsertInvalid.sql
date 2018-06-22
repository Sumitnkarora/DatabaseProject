/* =============================================
 Author:		Raymond Chan
 Create date:	Dec 12, 2017
 Description:	Inserts invalid record for Taxonomy Structure with optional message
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_TaxonomyStructure_InsertInvalid]
	@NodeIdPath varchar(MAX),
	@TaxonomyType varchar(6),
	@SessionId uniqueidentifier,
	@Message varchar(MAX) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[FeedExportTaxonomyStructureInvalid]
           ([NodeIdPath]
		   ,[TaxonomyType]
           ,[SessionId]
           ,[Message])
     VALUES
           (@NodeIdPath
		   ,@TaxonomyType
           ,@SessionId
           ,@Message)
END
GO

GRANT EXECUTE ON [dbo].[exporter_TaxonomyStructure_InsertInvalid] TO [FeedsExporter]; 
GO