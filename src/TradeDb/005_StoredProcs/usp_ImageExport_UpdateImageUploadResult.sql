/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_ImageExport_UpdateImageUploadResult
Author:         Hao Li
Description:    Updates a record in TWRImageUploadResults for an image service result
Input param:    @UPC, @ImageIndex, @ExportStatus, @ErrorMessage
Dependencies:   TradeDB.dbo.TWRImageUploadResults
Run Method:     exec dbo.usp_ImageExport_UpdateImageUploadResult <UPC>, <ImageIndex>, <ExportStatus>, <ErrorMessage>
Create Date:    2018/06/12
Change History: 2018/06/12 : Hao Li - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_ImageExport_UpdateImageUploadResult
	@UPC VARCHAR(32),
	@ImageIndex TINYINT,
	@ExportStatus TINYINT,
	@ErrorMessage NVARCHAR(MAX)
AS
BEGIN
	UPDATE TWRImageUploadResults
	SET DateItemLastExported = CASE WHEN @ExportStatus = 2 OR @ExportStatus = 6 THEN SYSDATETIME() ELSE DateItemLastExported END,
		DateItemCreated = CASE WHEN DateItemCreated IS NULL AND @ExportStatus = 4 THEN SYSDATETIME() ELSE DateItemCreated END,
		DateItemUpdated = CASE WHEN @ExportStatus = 4 THEN SYSDATETIME() ELSE DateItemUpdated END,
		DateItemInError = CASE WHEN @ExportStatus = 3 OR @ExportStatus = 7 THEN SYSDATETIME() WHEN @ExportStatus = 4 THEN NULL ELSE DateItemInError END,
		ExportStatus = @ExportStatus, 
		ErrorMessage = @ErrorMessage, 
		DateChanged = SYSDATETIME(), 
		ChangedBy = SUSER_SNAME()
	WHERE UPC=@UPC AND ImageIndex=@ImageIndex;
END
GO

GRANT EXECUTE ON usp_ImageExport_UpdateImageUploadResult TO TwrImageImportApp;
GO