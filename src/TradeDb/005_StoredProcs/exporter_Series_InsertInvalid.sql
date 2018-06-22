/* =============================================
 Author:		Dariusz Holc
 Create date:	Dec 6, 2017
 Description:	Inserts invalid record for series with optional message
 Revision history:
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_Series_InsertInvalid]
	@SeriesId int,
	@KoboSeriesId varchar(64),
	@SessionId uniqueidentifier,
	@Message varchar(MAX) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[FeedExportSeriesInvalid]
           ([SeriesId]
           ,[SessionId]
           ,[Message]
           ,[KoboSeriesId])
     VALUES
           (@SeriesId
           ,@SessionId
           ,@Message
           ,@KoboSeriesId)
END
GO

GRANT EXECUTE ON [dbo].[exporter_Series_InsertInvalid] TO [FeedsExporter]; 
GO