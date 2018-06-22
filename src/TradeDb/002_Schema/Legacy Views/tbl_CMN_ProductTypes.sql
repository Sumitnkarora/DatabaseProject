CREATE VIEW [dbo].[tbl_CMN_ProductTypes]
	AS SELECT 1 as ProductTypeID, 'Books, Audio Books' as Description, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted, 0 as IsGift
