CREATE VIEW [dbo].[tbl_001_BISACBindingTypes]
	AS SELECT BISACBindingTypeID, Description, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted, InternalOnly FROM refBisacBindingTypes
