/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_tblLastRunTime_UpdateLastRunTime
Author:         Dan Tohatan
Description:    Updates the last run time of a process to current date and time
Input param:    @ProcessID
Dependencies:   TradeDB.dbo.tblLastRunTime
Run Method:     exec dbo.usp_tblLastRunTime_UpdateLastRunTime <ProcessID>
Create Date:    2018/05/25
Change History: 2018/05/25 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_tblLastRunTime_UpdateLastRunTime
	@ProcessID INT
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM tblLastRunTime WHERE ID = @ProcessID))
	BEGIN
		UPDATE tblLastRunTime SET LastRunTime = GETDATE() WHERE ID = @ProcessID;
	END
	ELSE
	BEGIN
		INSERT INTO tblLastRunTime (ID, LastRunTime) VALUES (@ProcessID, GETDATE());
	END
END
GO

GRANT EXECUTE ON usp_tblLastRunTime_UpdateLastRunTime TO TwrImageExportApp;
GO