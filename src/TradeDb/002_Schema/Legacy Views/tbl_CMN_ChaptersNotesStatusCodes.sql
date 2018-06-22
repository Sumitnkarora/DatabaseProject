CREATE VIEW [dbo].[tbl_CMN_ChaptersNotesStatusCodes]
	AS SELECT DescriptionStatusId as NoteStatusID, Description, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted FROM refDescriptionStatusCodes
