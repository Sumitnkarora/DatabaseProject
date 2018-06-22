CREATE PROCEDURE spTWRDiscountEligibility  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT 
	DiscountId,
	Id,
	ParameterType,
	ParameterGroup,
	ParameterValue
FROM TWRDiscountEligibility WITH(NOLOCK)

END;

GO

GRANT EXECUTE ON dbo.spTWRDiscountEligibility TO  [TWRExporter];
