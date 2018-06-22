/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_ImageExport_ImageSentForCreation
Author:         Dan Tohatan
Description:    Creates a record in TWRImageUploadResults for an image sent to TWR
Input param:    @UPC, @ImageIndex
Dependencies:   TradeDB.dbo.TWRImageUploadResults
Run Method:     exec dbo.usp_ImageExport_ImageSentForCreation <UPC>, <ImageIndex>
Create Date:    2018/05/31
Change History: 2018/05/31 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_ImageExport_ImageSentForCreation
	@UPC VARCHAR(32),
	@ImageIndex TINYINT
AS
BEGIN
	IF (EXISTS (SELECT 1 FROM TWRImageUploadResults WHERE UPC=@UPC AND ImageIndex=@ImageIndex))
	BEGIN
		UPDATE TWRImageUploadResults
		SET DateItemLastExported = SYSDATETIME(), ExportStatus = 2, DateChanged = SYSDATETIME(), ChangedBy = SUSER_SNAME()
		WHERE UPC=@UPC AND ImageIndex=@ImageIndex;
	END
	ELSE
	BEGIN
		INSERT INTO TWRImageUploadResults (UPC, ImageIndex, ExportStatus, DateItemLastExported)
		VALUES (@UPC, @ImageIndex, 2, SYSDATETIME());
	END
END
GO

GRANT EXECUTE ON usp_ImageExport_ImageSentForCreation TO TwrImportApp;
GO