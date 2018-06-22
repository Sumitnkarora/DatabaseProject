CREATE VIEW [dbo].[tbl_009_Distributors]
	AS SELECT top 0 0 as DistributorID, NULL as DistributorName, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted