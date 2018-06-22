CREATE VIEW [dbo].[tbl_ChaptersNotes]
AS
SELECT			ISBN,
				DescriptionTypeId as NoteType,
				DescriptionText as Note,
				SourceType,
				PID

FROM            dbo.stgDescriptionData
GO