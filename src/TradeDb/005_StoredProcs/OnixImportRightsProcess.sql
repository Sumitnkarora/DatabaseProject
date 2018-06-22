CREATE PROCEDURE OnixImportRightsProcess
@FileName VARCHAR(255)
AS
BEGIN
DECLARE @CountryCode VARCHAR(5);
DECLARE @ISBN13 VARCHAR(13);
DECLARE @IncomingSAPVendorID VARCHAR(20);
DECLARE @IncomingVSRCode VARCHAR(20);

CREATE TABLE #TradeDataPriority (
	ISBN13 VARCHAR(13),
	SAPVendorId VARCHAR(20),
	VSRCode VARCHAR(20),
	RegionId VARCHAR(2),
	Priority TINYINT
);

DECLARE RightsCur CURSOR FAST_FORWARD FOR
SELECT ISBN13, SAPVendorID, VSRCode, CountryCode FROM stgTradeSalesRights WHERE CountryCode IN ('CA', 'US', 'ROW', 'WORLD');

OPEN RightsCur;
FETCH NEXT FROM RightsCur INTO @ISBN13, @IncomingSAPVendorID, @IncomingVSRCode, @CountryCode;

WHILE @@FETCH_STATUS = 0
BEGIN

	DECLARE @RegionId VARCHAR(2);
	SELECT @RegionId = CASE WHEN @CountryCode = 'WORLD' OR @CountryCode = 'ROW' THEN '' ELSE @CountryCode END;

	DECLARE @SAPVendorID VARCHAR(20);
	DECLARE @VSRCode VARCHAR(20);
	DECLARE @IndigoOverride BIT;
	SET @IndigoOverride = 0;

	DECLARE @Title NVARCHAR(MAX);
	DECLARE @Msg NVARCHAR(MAX);
	DECLARE @SAPVendorName VARCHAR(255);

	SET @SAPVendorID = NULL;
	SET @VSRCode = NULL;

	SELECT @SAPVendorID=SAPVendorID, @VSRCode=VSRCode, @IndigoOverride=IndigoOverride
	FROM TradeDataPriority WHERE ISBN13=@ISBN13 AND RegionId=@RegionId AND Priority=1;

	IF @SAPVendorID IS NULL AND @VSRCode IS NULL
	AND EXISTS (SELECT 1 FROM TradeSalesRights WHERE ISBN13=@ISBN13 AND SAPVendorID=@IncomingSAPVendorID AND VSRCode=@IncomingVSRCode AND CountryCode=@CountryCode AND Allowed=1)
	BEGIN
		INSERT INTO #TradeDataPriority (ISBN13, SAPVendorId, VSRCode, RegionId, Priority)
		SELECT ISBN13, SAPVendorID, VSRCode, @RegionId as RegionId, 1 as Priority
		FROM TradeSalesRights WHERE ISBN13=@ISBN13 AND SAPVendorID=@IncomingSAPVendorID AND VSRCode=@IncomingVSRCode AND CountryCode=@CountryCode AND Allowed=1;
	END
	IF @SAPVendorID IS NULL AND @VSRCode IS NULL
	AND EXISTS (SELECT 1 FROM TradeSalesRights WHERE ISBN13=@ISBN13 AND SAPVendorID=@IncomingSAPVendorID AND VSRCode=@IncomingVSRCode AND CountryCode=@CountryCode AND (Norights=1 OR Disallowed=1))
	AND NOT EXISTS (SELECT 1 FROM TradeDataPriority WHERE ISBN13=@ISBN13 AND SAPVendorId=@IncomingSAPVendorID AND VSRCode=@IncomingVSRCode AND RegionId=@RegionId)
	BEGIN
		DECLARE @MaxPriority TINYINT;
		SET @MaxPriority = NULL;
		SELECT @MaxPriority = MAX(Priority) FROM (
			SELECT Priority FROM TradeDataPriority WHERE RegionId=@RegionId AND ISBN13=@ISBN13
			UNION SELECT Priority FROM #TradeDataPriority WHERE RegionId=@RegionId AND ISBN13=@ISBN13
			) s;
		INSERT INTO #TradeDataPriority (ISBN13, SAPVendorId, VSRCode, RegionId, Priority)
		VALUES (@ISBN13, @IncomingSAPVendorID, @IncomingVSRCode, @RegionId, ISNULL(@MaxPriority, 1)+1);
	END
	IF @SAPVendorID IS NOT NULL AND @VSRCode IS NOT NULL AND @IndigoOverride = 0
	AND EXISTS (SELECT 1 FROM TradeSalesRights WHERE CountryCode=@CountryCode AND ISBN13=@ISBN13 AND (Norights=1 OR Disallowed=1)
	AND SAPVendorID=@SAPVendorID AND VSRCode=@VSRCode)
	BEGIN
		-- Exception Case 1
		SELECT TOP 1 @Title = Title FROM TradeCoreAttributes WHERE ISBN13=@ISBN13;
		SELECT TOP 1 @SAPVendorName = SAPVendorName FROM TradeVendors WHERE SAPVendorId=@SAPVendorID;
		SET @Msg = CONCAT('A vendor which has rights indicates that it no longer has rights, for title ''', @Title,
			''' (ISBN13: ', @ISBN13, '). Vendor ID: ', @SAPVendorID,
			', Vendor Name: ', @SAPVendorName, ', ONIX File Name: ', @FileName);
		RAISERROR (@Msg, 16, 1);
	END
	IF @SAPVendorID IS NOT NULL AND @VSRCode IS NOT NULL AND @IndigoOverride = 0
	AND EXISTS (SELECT 1 FROM TradeSalesRights WHERE CountryCode=@CountryCode AND ISBN13=@ISBN13 AND Allowed=1
	AND (SAPVendorID<>@SAPVendorID OR VSRCode<>@VSRCode))
	BEGIN
		-- Exception Case 2
		DECLARE @IncomingSAPVendorName VARCHAR(255);
		SELECT TOP 1 @Title = Title FROM TradeCoreAttributes WHERE ISBN13=@ISBN13;
		SELECT TOP 1 @SAPVendorName = SAPVendorName FROM TradeVendors WHERE SAPVendorId=@SAPVendorID;
		SELECT TOP 1 @IncomingSAPVendorName = SAPVendorName FROM TradeVendors WHERE SAPVendorId=@IncomingSAPVendorID;
		SET @Msg = CONCAT('A competing vendor already exists with rights for title ''', @Title,
			''' (ISBN13: ', @ISBN13, '). Current Rights Vendor ID: ', @SAPVendorID,
			', Current Rights Vendor Name: ', @SAPVendorName,
			', Incoming Rights Vendor ID: ', @IncomingSAPVendorID,
			', Incoming Rights Vendor Name: ', @IncomingSAPVendorName,
			', Incoming ONIX File Name: ', @FileName);
		RAISERROR (@Msg, 16, 1);
	END

	FETCH NEXT FROM RightsCur INTO @ISBN13, @IncomingSAPVendorID, @IncomingVSRCode, @CountryCode;

END

CLOSE RightsCur;
DEALLOCATE RightsCur;

INSERT INTO TradeDataPriority (ISBN13, SAPVendorId, VSRCode, RegionId, Priority)
SELECT ISBN13, SAPVendorId, VSRCode, RegionId, Priority FROM #TradeDataPriority;

DROP TABLE #TradeDataPriority;
END
GO

GRANT EXECUTE ON OnixImportRightsProcess TO OnixImportApp;
GO