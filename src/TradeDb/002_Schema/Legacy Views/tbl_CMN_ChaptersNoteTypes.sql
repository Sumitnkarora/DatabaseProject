CREATE VIEW [dbo].[tbl_CMN_ChaptersNoteTypes]
	AS SELECT DescriptionTypeID as NoteTypeID, IsActive, Description, ProductTypeId, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted FROM refDescriptionTypes
