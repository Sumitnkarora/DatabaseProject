CREATE procedure [dbo].[uspVendorListGet]
@sFilter VARCHAR(500) = NULL,
@nMaxRecs SMALLINT = 0
--@IsSAPVendor bit = 1
AS

IF LEN(REPLACE(@sFilter, '¤', ''))>0
BEGIN

DECLARE @IsSAPVendor bit
if LEFT(@sFilter,1) = '¤'
	BEGIN
		SET @IsSAPVendor = 1
		SET @sFilter = SUBSTRING(@sFilter,2,500)

	END
else
	BEGIN
		SET @IsSAPVendor = 0
	END




	IF @nMaxRecs > 0
		SET ROWCOUNT @nMaxRecs
	SET @sFilter = '%' + @sFilter + '%'
	IF @IsSAPVendor = 1
		SELECT min(LegacyID) as LID, SAPVendorName + ' [' + SAPVendorID + ']' as LText
		FROM tblSAPVendors
		where SAPVendorID IS NOT NULL
			AND SAPVendorName LIKE @sFilter
			AND LegacyID IS NOT NULL
		group by SAPVendorID, SAPVendorName
		order by SAPVendorName
	ELSE
		SELECT min(LegacyID) as LID, SAPVendorName + isnull(' [' + SAPVendorID + ']','') as LText
		FROM tblSAPVendors
		where SAPVendorName LIKE @sFilter
			AND LegacyID IS NOT NULL
		group by SAPVendorID, SAPVendorName
		order by SAPVendorName
	SET ROWCOUNT 0
END

