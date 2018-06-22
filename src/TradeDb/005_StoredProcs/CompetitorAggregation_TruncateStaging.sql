CREATE PROCEDURE [dbo].[CompetitorAggregation_TruncateStaging] 
AS
BEGIN
	SET NOCOUNT ON;
	
	TRUNCATE TABLE dbo.stgCompetitorAggregation;
END
GO

GRANT EXECUTE ON [dbo].[CompetitorAggregation_TruncateStaging] TO [AggregationImporterApp]; 
GO