/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_tblLastRunTime_GetLastRunTime
Author:         Dan Tohatan
Description:    Gets the last run time of a process
Input param:    @ProcessID
Dependencies:   TradeDB.dbo.tblLastRunTime
Run Method:     exec dbo.usp_tblLastRunTime_GetLastRunTime <ProcessID>
Create Date:    2018/05/25
Change History: 2018/05/25 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_tblLastRunTime_GetLastRunTime
	@ProcessID INT
AS
BEGIN
	SELECT LastRunTime FROM tblLastRunTime WHERE ID = @ProcessID;
END
GO

GRANT EXECUTE ON usp_tblLastRunTime_GetLastRunTime TO TwrImageExportApp;
GO