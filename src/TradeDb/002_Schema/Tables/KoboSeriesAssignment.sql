CREATE TABLE [dbo].[KoboSeriesAssignment]
(
    [EBookID] VARCHAR(36) NOT NULL , 
    [SeriesId] VARCHAR(64) NOT NULL, 
    [DateChanged] DATETIME NULL, 
    [SeriesNumber] NVARCHAR(55) NULL, 
    [SeriesNumberFloat] DECIMAL(7, 2) NULL, 
    PRIMARY KEY ([EBookID], [SeriesId])
)
