CREATE PROCEDURE [dbo].[ChaptersNotesMerge]
AS
	SELECT PID, DescriptionText, DescriptionTypeId, SourceType as ProviderId
	INTO #descriptionTemp
	FROM stgDescriptionData;

	-- Delete invalid data
	DELETE FROM #descriptionTemp WHERE DescriptionTypeId NOT IN (Select DescriptionTypeId FROM refDescriptionTypes);
	DELETE FROM #descriptionTemp WHERE ProviderId NOT IN (Select ProviderID FROM refContentProviders);

	-- Retain the first record of duplicate rows
	WITH ROWP AS ( SELECT PID, DescriptionTypeId,
		ROW_NUMBER() OVER (Partition by PID, DescriptionTypeId order by (Select 1)) as RN
		FROM #descriptionTemp)
	DELETE FROM ROWP where RN > 1;

	-- Merge to TradeDescriptionData
	MERGE INTO TradeDescriptionData dd
	USING (SELECT s.PID, DescriptionText, DescriptionTypeId, SourceType as ProviderId, ISBN13, SAPVendorId, VSRCode
		FROM #descriptionTemp s
		JOIN TradeDataByRegion d ON d.PID = s.PID and d.RegionId = 'CA') stg
	ON  stg.ISBN13 = dd.ISBN13 AND
		stg.SAPVendorID = dd.SAPVendorID AND
		stg.VSRCode = dd.VSRCode AND
		stg.DescriptionTypeId = dd.DescriptionTypeId
	WHEN MATCHED
	THEN UPDATE SET DescriptionText = stg.DescriptionText,
		ProviderId = stg.ProviderId
	WHEN NOT MATCHED BY TARGET
	THEN INSERT(ISBN13, SAPVendorId, VSRCode, DescriptionTypeId,DescriptionText,
		DescriptionStatusId,ProviderID, IsDeleted, DateCreated, DateChanged, CreatedBy, ChangedBy)
		VALUES (stg.ISBN13,
		stg.SAPVendorId, -- always 706954
		stg.VSRCode,
		stg.DescriptionTypeId, 
		stg.DescriptionText,
		3, -- StatusID always = 3
		stg.ProviderId,
		0, -- IsDeleted = 0
		GETDATE(),
		GETDATE(),
		USER_NAME(),
		USER_NAME());


	TRUNCATE TABLE stgDescriptionData
RETURN 0

