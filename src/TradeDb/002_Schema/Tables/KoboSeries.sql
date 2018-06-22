﻿CREATE TABLE [dbo].[KoboSeries]
(
    [SeriesId] VARCHAR(64) NOT NULL PRIMARY KEY, 
    [SeriesName] NVARCHAR(255) NULL, 
    [DateChanged] DATETIME NULL
)
GO

ALTER TABLE [dbo].[KoboSeries] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO

