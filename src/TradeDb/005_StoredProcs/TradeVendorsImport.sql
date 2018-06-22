CREATE PROCEDURE TradeVendorsImport
AS
BEGIN
	DELETE	dbo.stgTradeVendorsNoVSR
	WHERE	LegacyId <> ''
	AND	ISNUMERIC(LegacyId) = 0

	DELETE	dbo.stgTradeVendorsNoVSR
	WHERE	ISNUMERIC(SAPVendorId) = 0

	MERGE	INTO dbo.TradeVendors AS target
	USING	dbo.stgTradeVendorsNoVSR AS source
		ON source.SAPVendorId = target.SAPVendorId
	WHEN	MATCHED AND 
			ISNULL(target.LegacyID, -1) <> ISNULL(CASE WHEN source.LegacyId = '' THEN NULL ELSE source.LegacyId END, -1) 
		OR	target.SAPVendorName <> source.SAPVendorName
		OR	target.VendorName <> source.VendorName
		OR	CASE WHEN source.BlockIndicator = '*' THEN 1 ELSE 0 END <> ISNULL(target.Blocked, 0)
		OR	ISNULL(source.CurrencyTypeId, '') <> ISNULL(target.CurrencyTypeID, '') THEN
		UPDATE SET target.LegacyID = CASE WHEN source.LegacyId = '' THEN NULL ELSE source.LegacyId END, target.SAPVendorName = source.SAPVendorName, target.VendorName = source.VendorName, target.Blocked = CASE WHEN source.BlockIndicator = '*' THEN 1 ELSE 0 END, target.CurrencyTypeID = source.CurrencyTypeId, target.DateChanged = GETDATE()
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (LegacyID, SAPVendorId, SAPVendorName, VSRCode, VendorName, Blocked, CurrencyTypeID)
		VALUES (CASE WHEN source.LegacyId = '' THEN NULL ELSE source.LegacyId END, source.SAPVendorId, source.SAPVendorName, '', source.VendorName, CASE WHEN source.BlockIndicator = '*' THEN 1 ELSE 0 END, CASE WHEN source.CurrencyTypeId = '' THEN NULL ELSE source.CurrencyTypeId END);

	WITH VSRVendors AS (
		SELECT	v.LegacyId, r.SAPVendorId, r.VSRCode, v.SAPVendorName, r.VSRDescription AS VSRName, v.VendorName, v.Blocked, v.CurrencyTypeID, CAST(v.DiscountBlocked as INT) as OnlineDiscountBlocked
		FROM	dbo.TradeVendors AS v
		JOIN	dbo.stgTradeVendorsVSR AS r ON r.SAPVendorId = v.SAPVendorId
		WHERE	v.VSRCode = ''
	)
	MERGE	INTO dbo.TradeVendors AS target
	USING	VSRVendors AS source
		ON target.VSRCode IS NOT NULL AND source.SAPVendorId = target.SAPVendorId AND source.VSRCode = target.VSRCode
	WHEN	MATCHED AND
			ISNULL(target.LegacyID, -1) <> ISNULL(source.LegacyID, -1)
		OR	target.SAPVendorName <> source.SAPVendorName
		OR	target.VSRName <> source.VSRName
		OR	target.VendorName <> source.VendorName
		OR	source.Blocked <> ISNULL(target.Blocked, 0)
		OR	ISNULL(source.CurrencyTypeId, '') <> ISNULL(target.CurrencyTypeID, '') THEN
		UPDATE SET target.LegacyID = source.LegacyID, target.SAPVendorName = source.SAPVendorName, target.VendorName = source.VendorName, target.Blocked = source.Blocked, target.CurrencyTypeID = source.CurrencyTypeId, target.DateChanged = GETDATE()
	WHEN	NOT MATCHED BY TARGET THEN
		INSERT (LegacyID, SAPVendorId, VSRCode, SAPVendorName, VSRName, VendorName, Blocked, CurrencyTypeID)
		VALUES (source.LegacyID, source.SAPVendorId, source.VSRCode, source.SAPVendorName, source.VSRName, source.VendorName, source.Blocked, source.CurrencyTypeID);
END
GO
