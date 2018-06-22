CREATE PROCEDURE OnixImportLog_Start
@FileType tinyint,
@SAPVendorId varchar(20),
@VSRCode varchar(20),
@FileName varchar(255)
AS
BEGIN
	INSERT INTO OnixImportLog (FileType, SAPVendorId, VSRCode, FileName, ProcessStatus)
	OUTPUT inserted.ID
	VALUES (@FileType, @SAPVendorId, @VSRCode, @FileName, 1);
END
GO

GRANT EXECUTE ON OnixImportLog_Start TO OnixImportApp;
GO