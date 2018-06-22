CREATE VIEW [dbo].[tbl_CMN_MainSiteSubjectIDs]
	AS SELECT top 0 0 as MainSiteSubjectID, 0 as ProductTypeID, NULL as SubjectCategory, NULL as Description, 
		0 as MerchantID, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted FROM refDescriptionStatusCodes
