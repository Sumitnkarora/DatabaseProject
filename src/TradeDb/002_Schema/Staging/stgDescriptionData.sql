-- Formerly known as [ScratchPadDB].[dbo].[tbl_ChaptersNotes]
CREATE TABLE [dbo].[stgDescriptionData]
(
	[ISBN] VARCHAR(13) NULL, 
    [DescriptionTypeId] TINYINT NULL, 
    [DescriptionText] NTEXT NULL, 
    [SourceType] SMALLINT NULL, 
    [PID] DECIMAL(12) NOT NULL 
)
