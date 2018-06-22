CREATE TABLE [dbo].[refRightsRegions]
(
	[RegionId] VARCHAR(10) NOT NULL
,	[Description] VARCHAR(MAX) NULL

,	CONSTRAINT [PK_refRightsRegion] PRIMARY KEY CLUSTERED ([RegionId])
);
