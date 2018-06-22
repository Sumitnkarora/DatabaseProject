CREATE PROCEDURE spTWRDiscounts  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT 
	PricingId,
	Id,
	ResultType,
	ResultValue,
	IsEnabled
FROM [dbo].[TWRDiscounts] WITH(NOLOCK)

END;

GO

GRANT EXECUTE ON dbo.spTWRDiscounts TO  [TWRExporter];
