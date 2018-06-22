/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_TradeDataExport_GetStatus
Author:         Dan Tohatan
Description:    Gets the status of an exported item
Input param:    @ISBN13, @RegionId
Dependencies:   TradeDB.dbo.TradeDataExport
Run Method:     exec dbo.usp_TradeDataExport_GetStatus <ISBN13>, <RegionId>
Create Date:    2018/05/16
Change History: 2018/05/16 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_TradeDataExport_GetStatus
	@ISBN13 VARCHAR(13),
	@RegionId VARCHAR(10)
AS
BEGIN
	SELECT ExportStatus FROM TradeDataExport WHERE ISBN13 = @ISBN13 AND RegionId = @RegionId;
END
GO

GRANT EXECUTE ON usp_TradeDataExport_GetStatus TO TwrImportApp;
GO