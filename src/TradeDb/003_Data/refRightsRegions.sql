IF OBJECT_ID('tempdb..[#refRightsRegions]') IS NOT NULL DROP TABLE [#refRightsRegions];

CREATE TABLE [#refRightsRegions]
(
	[RegionId] varchar(10) NOT NULL
,	[Description] varchar(MAX) NULL
);

INSERT #refRightsRegions VALUES ('US', 'United States');
INSERT #refRightsRegions VALUES ('CA', 'Canada');
INSERT #refRightsRegions VALUES ('', 'Any Region');

DELETE	dst
FROM	[dbo].[refRightsRegions] dst
	LEFT JOIN [#refRightsRegions] src ON dst.[RegionId] = src.[RegionId]
WHERE	src.[RegionId] IS NULL;

UPDATE	dst
SET	[Description] = src.[Description]
FROM	[dbo].[refRightsRegions] dst
JOIN	[#refRightsRegions] src ON dst.[RegionId] = src.[RegionId]
WHERE	(src.[Description] IS NULL AND dst.[Description] IS NOT NULL) OR (src.[Description] IS NOT NULL AND dst.[Description] IS NULL) OR src.[Description] <> dst.[Description];

INSERT	[dbo].[refRightsRegions] (
	[RegionId], [Description]
)
SELECT	src.[RegionId], src.[Description]
FROM	[#refRightsRegions] src
	LEFT JOIN [dbo].[refRightsRegions] dst ON dst.[RegionId] = src.[RegionId]
WHERE	dst.[RegionId] IS NULL;

