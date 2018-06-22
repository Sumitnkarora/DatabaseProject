CREATE VIEW [dbo].[tbl_CMN_Language]
	AS SELECT LanguageID, LanguageName, USER_NAME() as CreatedBy, USER_NAME() as ChangedBy,
		GETDATE() as DateCreated, GETDATE() as DateChanged, CAST(0 as BIT) as IsDeleted FROM refLanguage
