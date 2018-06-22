CREATE VIEW [dbo].[tbl_001_AudienceCodes]
	AS SELECT AudienceCode, Description, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted FROM refAudienceCodes
