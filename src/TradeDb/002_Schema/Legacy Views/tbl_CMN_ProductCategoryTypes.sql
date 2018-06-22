CREATE VIEW [dbo].[tbl_CMN_ProductCategoryTypes]
	AS SELECT top 0 0 as ProductCategoryID, NULL as ProductCategoryDesc, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted