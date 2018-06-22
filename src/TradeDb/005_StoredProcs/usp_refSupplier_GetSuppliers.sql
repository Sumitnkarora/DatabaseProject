/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_refSupplier_GetSuppliers
Description:    Gets the list of suppliers and their connection information
Input param:    <none>
Dependencies:   TradeDB.dbo.refSupplier
Run Method:     exec dbo.usp_refSupplier_GetSuppliers
Create Date:    2018/03/15
Change History: 2018/03/15 : Hao Li - Initial Revision
************************************************************************************/
CREATE PROCEDURE dbo.usp_refSupplier_GetSuppliers
AS
BEGIN
	SELECT * FROM refSupplier
END
GO

GRANT EXECUTE ON usp_refSupplier_GetSuppliers TO OnixParserApp;
GO