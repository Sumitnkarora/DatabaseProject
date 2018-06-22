CREATE VIEW [dbo].[tbl_CMN_ProductDetailTypes]
	AS SELECT TOP 0 0 as ProductDetailID, 0 as ProductCategoryID, NULL as ProductDetailDesc, 
		USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted
