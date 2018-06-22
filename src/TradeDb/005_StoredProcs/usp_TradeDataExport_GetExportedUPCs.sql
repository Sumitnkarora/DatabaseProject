/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_TradeDataExport_GetExportedUPCs
Author:         Dan Tohatan
Description:    Gets the exported ISBNs from TradeDataExport table
Input param:    None
Dependencies:   TradeDB.dbo.TradeDataExport
Run Method:     exec dbo.usp_TradeDataExport_GetExportedUPCs
Create Date:    2018/05/28
Change History: 2018/05/28 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE dbo.usp_TradeDataExport_GetExportedUPCs
AS
BEGIN
	SELECT DISTINCT ISBN13 as UPC FROM TradeDataExport WHERE ExportStatus = 4;
END
GO

GRANT EXECUTE ON usp_TradeDataExport_GetExportedUPCs TO TwrImageExportApp;
GO