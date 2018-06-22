/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

--:r "001_Permissions\RoleMemberships\_roleuserheader.sql"

--IF '$(Environment)' = 'DEV'
--BEGIN
--	:r "001_Permissions\RoleMemberships\0_DEV.sql"
--END
--ELSE IF '$(Environment)' = 'QA'
--BEGIN
--	:r "001_Permissions\RoleMemberships\1_QA.sql"
--END
--ELSE IF '$(Environment)' = 'STAGE'
--BEGIN
--	:r "001_Permissions\RoleMemberships\8_STAGE.sql"
--END
--ELSE IF '$(Environment)' = 'PROD'
--BEGIN
--	:r "001_Permissions\RoleMemberships\9_PROD.sql"
--END

--:r "001_Permissions\RoleMemberships\_roleuserfooter.sql"

--
-- Data Scripts from here down.
--

--:r "003_Data\refBISACRegionCode.sql"
--:r "003_Data\tbl_001_ReturnFormats.sql"
--:r "003_Data\tbl_RTK_ProductTypeMap.sql"
--:r "003_Data\tbl_syme_catalog_pending_changes_ChangeStatus.sql"
--:r "003_Data\tbl_Syme_Catalog_Settings.sql"
--:r "003_Data\tblActivity.sql"
--:r "003_Data\tblSettings.sql"
--:r "003_Data\tblToolGroup.sql"
--:r "003_Data\tblTool.sql"

