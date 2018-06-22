CREATE VIEW [dbo].[tbl_CMN_ProductCategorySubClasses]
	AS SELECT top 0 0 as ProductCategoryID, 0 as SubClassID, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted
