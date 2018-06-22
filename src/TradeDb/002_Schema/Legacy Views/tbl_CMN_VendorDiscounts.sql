CREATE VIEW [dbo].[tbl_CMN_VendorDiscounts]
	AS SELECT top 0 NULL as VendorID, 0 as CostFactorID, NULL as Description, 0 as DiscountValue, 
		0 as DefaultDiscountFlag, 0 as ShortDiscountFlag , USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted
