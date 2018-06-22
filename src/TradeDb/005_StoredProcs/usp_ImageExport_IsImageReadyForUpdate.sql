/************************************************************************************
Target DB:      TradeDB
Procedure Name: usp_ImageExport_IsImageReadyForUpdate
Author:         Dan Tohatan
Description:    Gets whether the image is ready to be updated
Input param:    @UPC, @ImageIndex, @Hash
Dependencies:   TradeDB.dbo.TWRImageUploadResults
Run Method:     exec dbo.usp_ImageExport_IsImageReadyForUpdate <UPC>, <ImageIndex>, <Hash>
Create Date:    2018/05/28
Change History: 2018/05/28 : Dan Tohatan - Initial Revision
************************************************************************************/
CREATE PROCEDURE usp_ImageExport_IsImageReadyForUpdate
	@UPC VARCHAR(32),
	@ImageIndex TINYINT,
	@Hash BINARY(32)
AS
BEGIN
	-- If image did not change, do not update it
	IF (EXISTS (SELECT 1 FROM TWRImageUploadResults WHERE UPC=@UPC AND ImageIndex=@ImageIndex AND Hash=@Hash))
	BEGIN
		SELECT CAST(0 AS BIT);
	END
	-- Image must be in Ready for Update status
	ELSE IF (EXISTS (SELECT 1 FROM TWRImageUploadResults WHERE UPC=@UPC AND ImageIndex=@ImageIndex AND ExportStatus=5))
	BEGIN
		SELECT CAST(1 AS BIT);
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT);
	END
END
GO

GRANT EXECUTE ON usp_ImageExport_IsImageReadyForUpdate TO TwrImageExportApp;
GO