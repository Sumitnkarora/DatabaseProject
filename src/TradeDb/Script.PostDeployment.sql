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

--
-- Change Tracking
--

IF NOT EXISTS (SELECT 1 FROM sys.change_tracking_databases 
               WHERE database_id = DB_ID())
BEGIN
     ALTER DATABASE [$(DatabaseName)]
     SET CHANGE_TRACKING = ON
     (CHANGE_RETENTION = 5 DAYS, AUTO_CLEANUP = ON);
END
               
--
-- Database Permissions
--


IF '$(Environment)' = 'Azure-Development'
BEGIN
	:r "001_Permissions\RoleMemberships\0_DEV.sql"
END
ELSE IF '$(Environment)' = 'Azure-QA'
BEGIN
	:r "001_Permissions\RoleMemberships\1_QA.sql"
END

IF '$(Environment)' IN ('Azure-QA', 'Azure-Development')
BEGIN
	:r "003_Data\TradeClassOfTrade.sql"

	UPDATE	dbo.TradeClassOfTrade
	SET	SAPVendorID = '723125'
	WHERE	SAPVendorID = '724543';
END

/*
ELSE IF '$(Environment)' = 'STAGE'
BEGIN
	:r "001_Permissions\RoleMemberships\8_STAGE.sql"
END
ELSE IF '$(Environment)' = 'PROD'
BEGIN
	:r "001_Permissions\RoleMemberships\9_PROD.sql"
END
*/
--
-- Data Scripts from here down.
--

:r "003_Data\refBindingMap.sql"
:r "003_Data\refContributorRoles.sql"
:r "003_Data\refDescriptionTypes.sql"
:r "003_Data\refFeedExportStatus.sql"
:r "003_Data\refReturnFormatSAPMap.sql"
:r "003_Data\refRightsRegions.sql"
:r "003_Data\refCountry.sql"
:r "003_Data\refPaperCertificationType.sql"
:r "003_Data\refDescriptionStatusCodes.sql"
:r "003_Data\refContentProviders.sql"
:r "003_Data\refAudienceCodes.sql"
:r "003_Data\refAudienceGrades.sql"
:r "003_Data\refBisacBindingTypes.sql"
:r "003_Data\refBisacMediaTypes.sql"
:r "003_Data\refCurrencyTypes.sql"
:r "003_Data\refLanguage.sql"
:r "003_Data\refLinearMeasurementUnits.sql"
:r "003_Data\refMassMeasurementUnits.sql"
:r "003_Data\refStatusCodes.sql"
:r "003_Data\refReplacementCode.sql"
:r "003_Data\refHandlingIndicator.sql"
-- Begin Onix data scripts
:r "003_Data\refAudienceCode.sql"
:r "003_Data\refCollectionType.sql"
:r "003_Data\refContentCode.sql"
:r "003_Data\refContentType.sql"
:r "003_Data\refIdentifierType.sql"
:r "003_Data\refProductForm.sql"
:r "003_Data\refProductFormDetail.sql"
:r "003_Data\refPublishingStatus.sql"
:r "003_Data\refReturnConditionCode.sql"
:r "003_Data\refReturnConditionType.sql"
:r "003_Data\refSubjectScheme.sql"
:r "003_Data\refSupplierDiscountType.sql"
:r "003_Data\refSupplierPriceType.sql"
:r "003_Data\refSupplierRole.sql"
:r "003_Data\refDiscountCodeMapping.sql"
-- End Onix data scripts

:r "003_Data\refBisacSubjects.sql"
--:r "003_Data\refOnlineTaxonomy.sql"
:r "003_Data\refRetailTaxonomy.sql"
:r "003_Data\refLayoutModules.sql"
:r "003_Data\refMerchandiseCategories.sql"

-- Requires BisacSubjects, OnlineTaxonomy
--:r "003_Data\refBisacToOnlineTaxonomy.sql"

-- Requires BisacSubjects, MerchandiseCategories, LayoutModules
:r "003_Data\refBisacToMCLMMap.sql"

--:r "003_Data\refPublishers.sql"

-- Trade data export ref tables
:r "003_Data\refExportStatus.sql"
:r "003_Data\refDiscountType.sql"
:r "003_Data\refDiscountEligibilityParameterType.sql"
:r "003_Data\refDiscountEligibilityParameterGroup.sql"
--IF '$(Environment)' = 'DEV'
--BEGIN
	-- If you're using this locally or in dev, you probably want some vendors.
--	:r "003_Data\stgTradeVendorsVSR.sql"
--	:r "003_Data\stgTradeVendorsNoVSR.sql"
--	EXEC dbo.TradeVendorsImport;
--END
