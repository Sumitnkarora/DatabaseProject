CREATE VIEW [dbo].[tbl_IndigoAggregation]
AS
SELECT        ISBN13, CompetitorAggregationID AS AmazonAggregationID, BowkerWorkID, IndigoAggregationId, DateChanged
FROM            dbo.IndigoAggregation
GO