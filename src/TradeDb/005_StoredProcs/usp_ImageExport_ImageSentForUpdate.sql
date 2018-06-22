/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_ImageExport_ImageSentForUpdate
Author:         Dan Tohatan
Description:    Updates the status and exported date for an image sent to TWR
Input param:    @UPC, @ImageIndex
Dependencies:   TradeDB.dbo.TWRImageUploadResults
Run Method:     exec dbo.usp_ImageExport_ImageSentForUpdate <UPC>, <ImageIndex>
Create Date:    2018/05/28
Change History: 2018/05/28 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_ImageExport_ImageSentForUpdate
	@UPC VARCHAR(32),
	@ImageIndex TINYINT
AS
BEGIN
	UPDATE TWRImageUploadResults
	SET DateItemLastExported = SYSDATETIME(), ExportStatus = 6, DateChanged = SYSDATETIME(), ChangedBy = SUSER_SNAME()
	WHERE UPC=@UPC AND ImageIndex=@ImageIndex;
END
GO

GRANT EXECUTE ON usp_ImageExport_ImageSentForUpdate TO TwrImageExportApp;
GO