/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_TradeDataExport_UpdateStatus
Author:         Dan Tohatan
Description:    Updates the status of an exported item
Input param:    @ISBN13, @RegionId, @ExportStatus, @ErrorMessage
Dependencies:   TradeDB.dbo.TradeDataExport
Run Method:     exec dbo.usp_TradeDataExport_UpdateStatus <ISBN13>, <RegionId>, <Status>, <ErrorMessage>
Create Date:    2018/05/16
Change History: 2018/05/16 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_TradeDataExport_UpdateStatus
	@ISBN13 VARCHAR(13),
	@RegionId VARCHAR(10),
	@ExportStatus TINYINT,
	@ErrorMessage NVARCHAR(MAX) NULL
AS
BEGIN
	UPDATE TradeDataExport
	SET
		ExportStatus = @ExportStatus,
		ErrorMessage = @ErrorMessage,
		DateItemLastExported = CASE WHEN @ExportStatus = 2 OR @ExportStatus = 6 THEN SYSDATETIME() ELSE DateItemLastExported END,
		DateItemCreated = CASE WHEN DateItemCreated IS NULL AND @ExportStatus = 4 THEN SYSDATETIME() ELSE DateItemCreated END,
		DateItemUpdated = CASE WHEN @ExportStatus = 4 THEN SYSDATETIME() ELSE DateItemUpdated END,
		DateItemInError = CASE WHEN @ExportStatus = 3 OR @ExportStatus = 7 THEN SYSDATETIME() WHEN @ExportStatus = 4 THEN NULL ELSE DateItemInError END,
		DateChanged = SYSDATETIME(),
		ChangedBy = SUSER_SNAME()
	WHERE ISBN13 = @ISBN13 AND RegionId = @RegionId;
END
GO

GRANT EXECUTE ON usp_TradeDataExport_UpdateStatus TO TwrImportApp;
GO