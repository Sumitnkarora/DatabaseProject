CREATE PROCEDURE spTWRPricing  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT 
	Id,
	Name,
	Description,
	TWRLevel,
	IsEnabled
FROM [dbo].[TWRPricing] WITH(NOLOCK)

END;

GO

GRANT EXECUTE ON dbo.spTWRPricing TO  [TWRExporter];
