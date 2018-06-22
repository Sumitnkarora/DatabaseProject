/* =============================================
 Author:		Sean Wikant
 Create date:	Dec 8, 2017
 Description:	Inserts invalid record for vendors with optional message
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_Vendors_InsertInvalid]
	@VendorId varchar(12),
	@SessionId uniqueidentifier,
	@Message varchar(MAX) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[FeedExportVendorsInvalid]
           ([VendorId]
           ,[SessionId]
           ,[Message])
     VALUES
           (@VendorId
           ,@SessionId
           ,@Message)
END
GO

GRANT EXECUTE ON [dbo].[exporter_Vendors_InsertInvalid] TO [FeedsExporter]; 
GO