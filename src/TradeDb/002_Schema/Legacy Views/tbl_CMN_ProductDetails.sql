CREATE VIEW [dbo].[tbl_CMN_ProductDetails]
	AS SELECT TOP 0 0 as PID, 0 as ProductDetailID, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted
