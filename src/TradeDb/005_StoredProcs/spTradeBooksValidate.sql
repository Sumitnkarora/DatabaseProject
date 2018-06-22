CREATE PROCEDURE [dbo].[spTradeBooksValidate]
AS
BEGIN
	SET NOCOUNT ON;

	------------------------------------------------------------ DECLARATIONS ----------------------------------------------------

	DECLARE @TotalInvalidRows INT = 0,
			@InvalidRowsAfterValidation INT = 0,
			@Column VARCHAR(255) = '',
			@TrimReplaceSql VARCHAR(MAX) = '',
			@Count INT = 0,
	        @IndigoBooksSAPVendorID CHAR(6) = '703416',
			@FilterVSRCode CHAR(1) = '',
			@StgTradeBooksTableName CHAR(13) = 'stgTradeBooks';

	------------------------------------------------------------ INITIALIZATIONS -------------------------------------------------

	----- Trim data for leading, trailing blanks, and carriage return and line feed characters - first, find all columns that belong to stgTradeBooks table
	SELECT colid, name 
	INTO #StgTradeBooksColumns
	FROM syscolumns 
	WHERE id = OBJECT_ID(@StgTradeBooksTableName) 
	ORDER BY colid;

	----- Second, this will be used to iterate through the columns in the stgTradeBooks table
	SELECT @Count = COUNT(colid) 
	FROM #StgTradeBooksColumns;

	----- Initialize variable with the beginning of the Update statement
	SET @TrimReplaceSql = 'UPDATE ' + @StgTradeBooksTableName + ' SET ';

	----- Third, compile the dynamic SQL Update script for all available columns in the stgTradeBooks table, so that they will be all updated in one go
	WHILE @Count > 0
	BEGIN
		SELECT TOP 1 @Column = name FROM #StgTradeBooksColumns;

		SET @TrimReplaceSql = @TrimReplaceSql + '[' + @Column + '] = REPLACE(LTRIM(RTRIM([' + @Column + '])), CHAR(13) + CHAR(10), ''''), ';

		DELETE #StgTradeBooksColumns WHERE name = @Column;
		
		SET @Count = @Count - 1;
	END;

	----- Fourth, replace last two characters (which will be comma + space in case everything worked correctly) with semicolon - end of statement
	SET @TrimReplaceSql = STUFF(@TrimReplaceSql, LEN(@TrimReplaceSql), 2, ';');

	----- Fifth, execute the compiled SQL statement
	EXEC(@TrimReplaceSql);

	----- Empty the variable
	SET @TrimReplaceSql = '';

	----- Last, cleanup
	DROP TABLE #StgTradeBooksColumns;

	------------------------------------------------------------ VALIDATIONS -----------------------------------------------------
	/*
		General flow for validations: 
		1) Initially all data from files (txt, csv, etc.) is transferred through the service application into the stgTradeBooks table
		2) Update Problem column in the stgTradeBooks table to have specific description, based on which validation conditions were not met (otherwise leave NULL)
		3) Do step #2 for both Update and Insert case records
		4) Mark records for Update as having InsertFlag = 0, and mark records for Insert as having SET InsertFlag = 1
		5) Move exceptions data from stgTradeBooks (WHERE Problem IS NOT NULL) into reserved exceptions table TradeBooksExceptions
		6) Delete data from stgTradeBooks WHERE Problem IS NOT NULL

		NOTE: When comparing or searching for something that involves NULL values, the result would usually be empty set, so to avoid extra processing
		      basically everywhere we need to have conditions that our values are not NULLs
	*/

	----- Update the stgTradeBooks DateCreated column as well as do initial validation for ISBN and ISBN13 columns
	UPDATE stgTradeBooks
	SET DateCreated = GETDATE(),
		Problem = CASE WHEN ISBN IS NULL AND ISBN13 IS NULL THEN 'Both ISBN and ISBN13 are NULL.'
					   ELSE NULL END;

	----- Move invalid records from stgTradeBooks into TradeBooksExceptions. 
	----- NOTE: Special case here (that's why not using the spTradeBooksMoveInvalidStagingData) for the validation done above - insert NULLs into [ID], [VendorID], [Catalogue Name], [Catalogue Page Number] columns
	INSERT TradeBooksExceptions (
		[ID], 
		[PID], 
		[VendorID], 
		[ISBN], 
		[Title], 
		[Subtitle], 
		[SeriesTitle], 
		[Contributor1Role], 
		[Contributor1LastName], 
		[Contributor1FirstName], 
		[Contributor1InitialMiddleName], 
		[Contributor2Role], 
		[Contributor2LastName], 
		[Contributor2FirstName], 
		[Contributor2InitialMiddleName], 
		[Contributor3Role], 
		[Contributor3LastName], 
		[Contributor3FirstName], 
		[Contributor3InitialMiddleName],
		[Media], 
		[Binding], 
		[ItemPrice], 
		[ForeignVendCADRetail],
		[ItemPriceCurrency],
		[Discount],
		[PubDate],
		[StatusCode],
		[PublisherID], 
		[BisacSubjectCode1], 
		[BisacSubjectCode2],
		[BisacSubjectCode3], 
		[SuggestedBuy],
		[PrintQuantity],
		[OLDISBN], 
		[OLDISBNOutofPrintDate], 
		[EditionNumber],
		[EditionDescription], 
		[VolumeNumber],
		[NumberofVolumes],
		[NumberofPages],
		[Height],
		[Width],
		[Depth],
		[MeasurementUnits], 
		[Weight], 
		[WeightUnits], 
		[CartonQuantity], 
		[MinimumOrderQuantity],
		[CanadianTitle],
		[AudienceCode],
		[GradeLowerLimit],
		[GradeUpperLimit], 
		[AgeLowerLimit],
		[AgeUpperLimit],
		[Language],
		[FileName],
		[DateCreated], 
		[Catalogue Name],
		[Catalogue Page Number], 
		ReturnFormat,
		SAPVendorID, 
		VSRCode,
		ReplacementISBN,
		ReplacementCode,
		OPDate, 
		StreetDate, 
		ISBN13, 
		ReplacementISBN13,
		Imprint,
		PaperCertificationType,
		ChainofCustody, 
		CertifiedPostConsumerWaste_PCW,
		CertifiedPCWPercentage,
		UncertifiedPCW, 
		UncertifiedPCWPercentage,
		[Problem])
	SELECT 
		NULL, 
		[pid], 
		NULL, 
		[ISBN],
		[Title], 
		[Subtitle],
		[SeriesTitle], 
		[Contributor1Role], 
		[Contributor1LastName], 
		[Contributor1FirstName],
		[Contributor1InitialMiddleName], 
		[Contributor2Role],
		[Contributor2LastName], 
		[Contributor2FirstName], 
		[Contributor2InitialMiddleName], 
		[Contributor3Role],
		[Contributor3LastName], 
		[Contributor3FirstName],
		[Contributor3InitialMiddleName],
		[Media], 
		[Binding], 
		[ItemPrice], 
		[ForeignVendCADRetail], 
		[ItemPriceCurrency], 
		[Discount], 
		[PubDate], 
		[StatusCode], 
		[PublisherID],
		[BisacSubjectCode1], 
		[BisacSubjectCode2],
		[BisacSubjectCode3], 
		[SuggestedBuy], 
		[PrintQuantity], 
		[OLDISBN], 
		[OLDISBNOutofPrintDate], 
		[EditionNumber], 
		[EditionDescription], 
		[VolumeNumber], 
		[NumberofVolumes], 
		[NumberofPages], 
		[Height], 
		[Width], 
		[Depth], 
		[MeasurementUnits], 
		[Weight], 
		[WeightUnits], 
		[CartonQuantity],
		[MinimumOrderQuantity], 
		[CanadianTitle],
		[AudienceCode], 
		[GradeLowerLimit], 
		[GradeUpperLimit],
		[AgeLowerLimit], 
		[AgeUpperLimit],
		[Language], 
		[FileName], 
		[DateCreated],
		NULL, 
		NULL, 
		ReturnFormat, 
		SAPVendorID,
		VSRCode, 
		ReplacementISBN, 
		ReplacementCode, 
		OPDate, 
		StreetDate, 
		ISBN13, 
		ReplacementISBN13, 
		Imprint, 
		PaperCertificationType, 
		ChainofCustody, 
		CertifiedPostConsumerWaste_PCW, 
		CertifiedPCWPercentage, 
		UncertifiedPCW, 
		UncertifiedPCWPercentage, 
		Problem
	FROM stgTradeBooks
	WHERE Problem IS NOT NULL;

	----- Remove invalid data from stgTradeBooks before proceeding to next steps
	DELETE stgTradeBooks
	WHERE Problem IS NOT NULL;

	----- Add number of invalid rows to the end result
	SET @TotalInvalidRows = @TotalInvalidRows + @@ROWCOUNT;

	----- Another thing to do before the main validations
	UPDATE stgTradeBooks
	SET Problem = CASE WHEN ISBN IS NOT NULL AND (LEN(ISBN) <> 10 OR ISNUMERIC(LEFT(ISBN, LEN(ISBN) - 1)) = 0) THEN 'ISBN is not NULL, and its length is either not equal to 10 or characters except the last one are not numeric.' 
					   WHEN ISBN IS NOT NULL AND (ISNUMERIC(SUBSTRING(ISBN, 1, 9)) = 0 OR CHARINDEX('.', ISBN) > 0) THEN 'ISBN is not NULL, and either first nine characters are not numeric or the ISBN contains dot character.' 
					   ELSE NULL END;

	----- Move invalid data
	EXEC @InvalidRowsAfterValidation = dbo.spTradeBooksMoveInvalidStagingData;

		----- Add number of invalid rows to the end result
	SET @TotalInvalidRows = @TotalInvalidRows + @InvalidRowsAfterValidation;

	----- Update ISBN and ISBN13 based on conditions
	UPDATE stgTradeBooks
	SET ISBN = CASE WHEN ISBN IS NULL AND ISBN13 LIKE '978%' THEN dbo.ISBN13toISBN10(ISBN13) ELSE ISBN END,
		ISBN13 = CASE WHEN ISBN13 IS NULL AND ISBN IS NOT NULL THEN dbo.ISBN10toISBN13(ISBN) ELSE ISBN13 END;

	----- Another thing to do before the main validations
	UPDATE stgTradeBooks
	SET Problem = CASE WHEN ISBN13 IS NOT NULL AND (LEN(ISBN13) <> 13 OR ISNUMERIC(ISBN13) = 0) THEN 'ISBN13 is not NULL, and either its length is not equal to 13 or it has not numeric value.'
					   ELSE NULL END;

	----- Move invalid data
	EXEC @InvalidRowsAfterValidation = dbo.spTradeBooksMoveInvalidStagingData;

		----- Add number of invalid rows to the end result
	SET @TotalInvalidRows = @TotalInvalidRows + @InvalidRowsAfterValidation;

	----- Another thing to do before the main validations
	UPDATE stgTradeBooks
	SET Problem = CASE WHEN PID IS NOT NULL AND ISBN13 IS NOT NULL AND CAST(10 - (CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 12, 1) AS INT) * 3 +
							 													  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 11, 1) AS INT) +
							 													  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 10, 1) AS INT) * 3 +
							 													  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 9, 1) AS INT) +
							 													  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 8, 1) AS INT) * 3 +
							 													  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 7, 1) AS INT) +
							 													  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 6, 1) AS INT) * 3 +
							 													  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 5, 1) AS INT) +
																				  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 4, 1) AS INT) * 3 +
																				  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 3, 1) AS INT) +
																				  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 2, 1) AS INT) * 3 +
																				  CAST(SUBSTRING(CAST(PID AS VARCHAR(20)), 1, 1) AS INT)) % 10 AS VARCHAR(255)) <> RIGHT(ISBN13, 1) THEN 'Invalid ISBN13. The calculated checksum for PID doesn''t match the last digit of ISBN13, when they are both not NULLs.'
					   ELSE NULL END;

	----- Move invalid data
	EXEC @InvalidRowsAfterValidation = dbo.spTradeBooksMoveInvalidStagingData;

		----- Add number of invalid rows to the end result
	SET @TotalInvalidRows = @TotalInvalidRows + @InvalidRowsAfterValidation;

	----- Update PIDs. This is an enforcement and safety measure for the previous checksum PID validation step - the checksum may be the same for two different PIDs and we just want to make sure in the end PID with correct checksum matches the ISBN13 (sub)value
	UPDATE stgTradeBooks 
	SET PID = LEFT(ISBN13, 12);

	----- From here run validation rules to validate all records for some common rules (whether the records are for Insert or Update)

	----- This will be used for the validations
	SELECT PID
	INTO #DuplicatePIDs
	FROM stgTradeBooks
	GROUP BY PID
	HAVING COUNT(*) > 1;

	----- Update the stgTradeBooks table's column Problem for any kind of validation rules violation, or leave NULL, if the data is valid
	UPDATE r
	SET r.Problem = CASE WHEN r.PID IS NOT NULL AND r.PID IN (SELECT PID FROM #DuplicatePIDs) THEN 'Duplicate PID.'
						 WHEN r.Media IS NOT NULL AND b.bisacmediatypeid IS NULL THEN 'No matching Media Code in refBisacMediaTypes.'
						 WHEN r.title IS NOT NULL AND LEN(r.title) > 255 THEN 'Title is too long (maximum 255 characters).'
						 WHEN r.subtitle IS NOT NULL AND LEN(r.subtitle) > 100 THEN 'SubTitle is too long (maximum 100 characters).'
						 WHEN r.ItemPrice IS NOT NULL AND ISNUMERIC(r.ItemPrice) = 0 THEN 'ItemPrice is not NULL, but not numeric as well.'
						 WHEN r.ItemPriceCurrency IS NOT NULL AND c.currencytypeid IS NULL THEN 'No matching ItemPriceCurrency found in refCurrencyTypes.'
						 WHEN r.discount IS NOT NULL AND ISNUMERIC(r.discount) = 0 THEN 'Discount is not NULL, but still not numeric.'
						 WHEN r.discount IS NOT NULL AND CAST(r.discount AS DECIMAL) NOT BETWEEN 0 AND 100 THEN 'Discount not in [0; 100] range when not NULL.'
						 WHEN r.PubDate IS NOT NULL AND ISDATE(r.PubDate) = 0 THEN 'Publication Date is not NULL and not a valid date.'
						 WHEN r.publisherid IS NOT NULL AND p.publisherid IS NULL THEN 'No matching PublisherID found in refPublishers.'
						 WHEN r.statuscode IS NOT NULL AND s.statusid IS NULL THEN 'No matching StatusCode found in refStatusCodes.'
						 WHEN r.[Language] IS NOT NULL AND l.languagename IS NULL THEN 'No matching Language found in refLanguage.'
						 WHEN r.editionnumber IS NOT NULL AND LEN(r.editionnumber) > 5 THEN 'Edition Number is too long (maximum 5 characters).'
						 WHEN r.editiondescription IS NOT NULL AND LEN(r.editiondescription) > 50 THEN 'Edition Description is too long (maximum 50 characters).'
						 WHEN r.volumenumber IS NOT NULL AND ISNUMERIC(r.volumenumber) = 0 THEN 'Volume Number is not numeric when not NULL.'
						 WHEN r.numberofvolumes IS NOT NULL AND ISNUMERIC(r.numberofvolumes) = 0 THEN 'Number of Volumes is not numeric when not NULL.'
						 WHEN r.bisacsubjectcode1 IS NULL AND (r.bisacsubjectcode2 IS NOT NULL OR r.bisacsubjectcode3 IS NOT NULL) THEN 'BisacSubjectCode1 is NULL when BisacSubjectCode2 or BisacSubjectCode3 is not NULL.'
						 WHEN r.bisacsubjectcode1 IS NOT NULL AND r.bisacsubjectcode2 IS NOT NULL AND r.bisacsubjectcode1 = r.bisacsubjectcode2 THEN 'BisacSubjectCode1 is the same as BisacSubjectCode2 when they are not NULL.'
						 WHEN r.bisacsubjectcode1 IS NOT NULL AND r.bisacsubjectcode3 IS NOT NULL AND r.bisacsubjectcode1 = r.bisacsubjectcode3 THEN 'BisacSubjectCode1 is the same as BisacSubjectCode3 when they are not NULL.'
						 WHEN r.bisacsubjectcode2 IS NOT NULL AND r.bisacsubjectcode3 IS NOT NULL AND r.bisacsubjectcode2 = r.bisacsubjectcode3 THEN 'BisacSubjectCode2 is the same as BisacSubjectCode3 when they are not NULL.'
						 WHEN r.bisacsubjectcode1 IS NOT NULL AND bs1.BISACCode IS NULL THEN 'BisacSubjectCode1 does not exist in refBisacSubjects.'
						 WHEN r.bisacsubjectcode2 IS NOT NULL AND bs2.BISACCode IS NULL THEN 'BisacSubjectCode2 does not exist in refBisacSubjects.'
						 WHEN r.bisacsubjectcode3 IS NOT NULL AND bs3.BISACCode IS NULL THEN 'BisacSubjectCode3 does not exist in refBisacSubjects.'
						 WHEN r.[Binding] IS NOT NULL AND bt.bisacbindingtypeid IS NULL THEN 'Binding does not exist in refBisacBindingTypes.'
						 WHEN r.numberofpages IS NOT NULL AND ISNUMERIC(r.numberofpages) = 0 THEN 'Number of Pages is not numeric when not NULL.'
						 WHEN r.numberofpages IS NOT NULL AND r.numberofpages LIKE '%,%' THEN 'Using commas in Number of Pages.'
						 WHEN r.numberofpages IS NOT NULL AND CONVERT(INT, CONVERT(DECIMAL, r.numberofpages)) NOT BETWEEN 0 AND 32767 THEN 'Number of Pages must be between 0 and 32767, where not NULL.'
						 WHEN r.Contributor1role IS NOT NULL AND cr1.roleid IS NULL THEN 'No matching Contributor1role was found in refContributorRoles.'
						 WHEN r.Contributor2role IS NOT NULL AND cr2.roleid IS NULL THEN 'No matching Contributor2role was found in refContributorRoles.'
						 WHEN r.Contributor3role IS NOT NULL AND cr3.roleid IS NULL THEN 'No matching Contributor3role was found in refContributorRoles.'
						 WHEN r.Contributor1LastName IS NULL AND r.Contributor1role IS NOT NULL THEN 'Contributor1role is not NULL, but Contributor1LastName is NULL.'
						 WHEN r.Contributor2lastname IS NULL AND r.Contributor2role IS NOT NULL THEN 'Contributor2role is not NULL, but Contributor2lastname is NULL.'
						 WHEN r.Contributor3lastname IS NULL AND r.Contributor3role IS NOT NULL THEN 'Contributor3role is not NULL, but Contributor3lastname is NULL.'
						 WHEN r.Contributor1LastName IS NOT NULL AND r.Contributor1role IS NULL THEN 'Contributor1LastName is not NULL, but Contributor1Role is NULL.'
						 WHEN r.Contributor2lastname IS NOT NULL AND r.Contributor2role IS NULL THEN 'Contributor2LastName is not NULL, but Contributor2Role is NULL.'
						 WHEN r.Contributor3lastname IS NOT NULL AND r.Contributor3role IS NULL THEN 'Contributor3LastName is not NULL, but Contributor3Role is NULL.'
						 WHEN r.Contributor1LastName IS NULL AND r.Contributor1role IS NULL AND (r.Contributor1FirstName IS NOT NULL OR r.Contributor1InitialMiddleName IS NOT NULL) THEN 'Contributor1LastName is NULL, Contributor1Role is NULL, but Contributor1FirstName or Contributor1InitialMiddleName is not NULL.'
						 WHEN r.Contributor2lastname IS NULL AND r.Contributor2role IS NULL AND (r.Contributor2firstname IS NOT NULL OR r.Contributor2InitialMiddleName IS NOT NULL) THEN 'Contributor2LastName null, Contributor2Role null and (Contributor2FirstName not null or Contributor2InitialMiddleName IS NOT NULL).' 
						 WHEN r.Contributor3lastname IS NULL AND r.Contributor3role IS NULL AND (r.Contributor3firstname IS NOT NULL OR r.Contributor3InitialMiddleName IS NOT NULL) THEN 'Contributor3LastName null, Contributor3Role null and (Contributor3FirstName not null or Contributor3InitialMiddleName IS NOT NULL).' 
						 WHEN r.Contributor1LastName IS NOT NULL AND r.Contributor1role IS NOT NULL AND r.Contributor1InitialMiddleName IS NOT NULL AND r.Contributor1FirstName IS NULL THEN 'Contributor1LastName is not NULL, Contributor1role is not NULL, Contributor1InitialMiddleName is not NULL, but Contributor1FirstName is NULL.'
						 WHEN r.Contributor2lastname IS NOT NULL AND r.Contributor2role IS NOT NULL AND r.Contributor2InitialMiddleName IS NOT NULL AND r.Contributor2firstname IS NULL THEN 'Contributor2lastname is not NULL, Contributor2role is not NULL, Contributor2InitialMiddleName is not NULL, but Contributor2firstname is NULL.'
						 WHEN r.Contributor3lastname IS NOT NULL AND r.Contributor3role IS NOT NULL AND r.Contributor3InitialMiddleName IS NOT NULL AND r.Contributor3firstname IS NULL THEN 'Contributor3lastname is not NULL, Contributor3role is not NULL, Contributor3InitialMiddleName is not NULL, but Contributor3firstname is NULL.'
						 WHEN ISNULL(r.Contributor1Role, '') + ISNULL(r.Contributor1LastName, '') + ISNULL(r.Contributor1FirstName, '') + ISNULL(r.contributor1InitialMiddleName, '') = ISNULL(r.Contributor2Role, '') + ISNULL(r.Contributor2LastName, '') + ISNULL(r.Contributor2FirstName, '') + ISNULL(r.contributor2InitialMiddleName, '') THEN 'Contributor1Role + Contributor1LastName + Contributor1FirstName + Contributor1InitialMiddleName = Contributor2Role + Contributor2LastName + Contributor2FirstName + Contributor2InitialMiddleName.'
						 WHEN ISNULL(r.Contributor3Role, '') + ISNULL(r.Contributor3LastName, '') + ISNULL(r.Contributor3FirstName, '') + ISNULL(r.contributor3InitialMiddleName, '') = ISNULL(r.Contributor2Role, '') + ISNULL(r.Contributor2LastName, '') + ISNULL(r.Contributor2FirstName, '') + ISNULL(r.contributor2InitialMiddleName, '') THEN 'Contributor3Role + Contributor3LastName + Contributor3FirstName + Contributor3InitialMiddleName = Contributor2Role + Contributor2LastName + Contributor2FirstName + Contributor2InitialMiddleName.'
						 WHEN ISNULL(r.Contributor1Role, '') + ISNULL(r.Contributor1LastName, '') + ISNULL(r.Contributor1FirstName, '') + ISNULL(r.contributor1InitialMiddleName, '') = ISNULL(r.Contributor3Role, '') + ISNULL(r.Contributor3LastName, '') + ISNULL(r.Contributor3FirstName, '') + ISNULL(r.contributor3InitialMiddleName, '') THEN 'Contributor1Role + Contributor1LastName + Contributor1FirstName + Contributor1InitialMiddleName = Contributor3Role + Contributor3LastName + Contributor3FirstName + Contributor3InitialMiddleName.'
						 WHEN r.AgeLowerLimit IS NOT NULL AND ISNUMERIC(r.AgeLowerLimit) = 0 THEN 'AgeLowerLimit is not numeric value where it is not NULL.'
						 ----- Applying FLOOR for condition here (will return numeric type), because in the original function the floor function was applied to the UPDATE between the two validations. Will apply FLOOR after the validations as well to match the original SP
						 WHEN r.AgeLowerLimit IS NOT NULL AND FLOOR(r.AgeLowerLimit) NOT BETWEEN 0 AND 255 THEN 'AgeLowerLimit is not in range [0; 255] where it is not NULL.'
						 WHEN r.AgeUpperLimit IS NOT NULL AND ISNUMERIC(r.AgeUpperLimit) = 0 THEN 'AgeUpperLimit is not numeric value where it is not NULL.'
						 ----- Applying FLOOR for condition here (will return numeric type), because in the original function the floor function was applied to the UPDATE between the two validations. Will apply FLOOR after the validations as well to match the original SP
						 WHEN r.AgeUpperLimit IS NOT NULL AND FLOOR(r.AgeUpperLimit) NOT BETWEEN 0 AND 255 THEN 'AgeUpperLimit is not in range [0; 255] where it is not NULL.'
						 WHEN r.GradeLowerLimit IS NOT NULL AND ag1.audiencegrade IS NULL THEN 'No matching GradeLowerLimit was found in refAudienceGrades.'
						 WHEN r.GradeUpperLimit IS NOT NULL AND ag2.audiencegrade IS NULL THEN 'No matching GradeUpperLimit was found in refAudienceGrades.'
						 WHEN r.AudienceCode IS NOT NULL AND au.AudienceCode IS NULL THEN 'No matching AudienceCode was found in refAudienceCodes.'
						 WHEN r.height IS NOT NULL AND (ISNUMERIC(r.height) = 0 OR r.height = '.' OR r.height LIKE '%E%' OR r.height LIKE '%$%') THEN 'Height is not numeric where not NULL, or equals ".", or have "E", or have "$" in it.'
						 ----- Applying CONVERT for condition here, because in the original SP the data was converted in the UPDATE script between the two validations. Will apply CONVERT after the validations as well
						 WHEN r.height IS NOT NULL AND CAST(CONVERT(DECIMAL(12, 2), r.height) AS DECIMAL) NOT BETWEEN 0.00 AND 2000.00 THEN 'Height is not in range [0; 2000] when it is not NULL.'
						 WHEN r.width IS NOT NULL AND (ISNUMERIC(r.width) = 0 OR r.width = '.' OR r.width LIKE '%E%' OR r.width LIKE '%$%') THEN 'Width is not numeric where not NULL, or equals ".", or have "E", or have "$" in it.'
						 ----- Applying CONVERT for condition here, because in the original SP the data was converted in the UPDATE script between the two validations. Will apply CONVERT after the validations as well
						 WHEN r.width IS NOT NULL AND CAST(CONVERT(DECIMAL(12, 2), r.width) AS DECIMAL) NOT BETWEEN 0.00 AND 2000.00 THEN 'Width is not in range [0; 2000] when it is not NULL.'
						 WHEN r.depth IS NOT NULL AND (ISNUMERIC(r.depth) = 0 OR r.depth = '.' OR r.depth LIKE '%E%' OR r.depth LIKE '%$%') THEN 'Depth is not numeric where not NULL, or equals ".", or have "E", or have "$" in it.'
						 ----- Applying CONVERT for condition here, because in the original SP the data was converted in the UPDATE script between the two validations. Will apply CONVERT after the validations as well
						 WHEN r.depth IS NOT NULL AND CAST(CONVERT(DECIMAL(12, 2), r.depth) AS DECIMAL) NOT BETWEEN 0.00 AND 2000.00 THEN 'Depth is not in range [0; 2000] when it is not NULL.'
						 WHEN r.MeasurementUnits IS NOT NULL AND mu.unitid IS NULL THEN 'No matching MeasurementUnits was found in refLinearMeasurementUnits.'
						 WHEN r.[Weight] IS NOT NULL AND ISNUMERIC(r.[Weight]) = 0 THEN 'Weight is not numeric where is not NULL.'
						 WHEN r.[Weight] IS NOT NULL AND r.[Weight] LIKE '$%' THEN 'Weight starts with "$" when not NULL.'
						 WHEN r.[Weight] IS NOT NULL AND CAST(r.[Weight] AS DECIMAL(10, 2)) NOT BETWEEN 0.00 AND 9999.99 THEN 'Weight is not between 0.00 and 9999.99 when not NULL.'
						 WHEN r.[WeightUnits] IS NOT NULL AND LEN(r.[WeightUnits]) > 2 THEN 'WeightUnits length is more than 2 characters where not NULL.'
						 WHEN r.PaperCertificationType IS NOT NULL AND ISNUMERIC(r.PaperCertificationType) = 0 THEN 'PaperCertificationType is not numeric when not NULL.'
						 /*
							ChainofCustody validation:
							1. When not NULL
							2. Input format: "?????-COC-######", where "?????" are alpha characters and "#######" are numeric characters
							3. Maximum 16 characters
							4. Last ####### input must have 6 digits
							5. First ????? input has to be between 2~5 characters
						 */
						 WHEN r.ChainofCustody IS NOT NULL AND (SUBSTRING(RIGHT(r.ChainofCustody, 11), 1, 5) <> '-COC-' OR LEN(r.ChainofCustody) > 16 OR ISNUMERIC(RIGHT(r.ChainofCustody, 6)) = 0 OR PATINDEX('%[0-9]%', SUBSTRING(r.ChainofCustody, 1, LEN(r.ChainofCustody) - 11)) <> 0 OR (LEN(r.ChainofCustody) - 11 < 2 OR LEN(r.ChainofCustody) - 11 > 5)) THEN 'ChainofCustody format is incorrect where is not NULL.'
						 /*
							CertifiedPostConsumerWaste_PCW validation:
							1. When not NULL
							2. Must be numeric
						 */
						 WHEN r.CertifiedPostConsumerWaste_PCW IS NOT NULL AND ISNUMERIC(r.CertifiedPostConsumerWaste_PCW) = 0 THEN 'CertifiedPostConsumerWaste_PCW format is incorrect where is not NULL. Must be numeric.'
						 /*
							CertifiedPCWPercentage validation:
							1. When not NULL
							2. Must be numeric input
							3. Must not be decimal (only whole numbers)
							4. Maximum 3 digits
							5. Maximum percentage of 100
						 */		
						 WHEN r.CertifiedPCWPercentage IS NOT NULL AND (ISNUMERIC(r.CertifiedPCWPercentage) = 0 OR CHARINDEX('.', r.CertifiedPCWPercentage) > 0 OR LEN(r.CertifiedPCWPercentage) > 3 OR r.CertifiedPCWPercentage > 100) THEN 'CertifiedPCWPercentage format is incorrect where is not NULL.'
						 /*
							UncertifiedPCW validation:
							1. When not NULL
							2. Must be numeric
						 */
						 WHEN r.UncertifiedPCW IS NOT NULL AND ISNUMERIC(r.UncertifiedPCW) = 0 THEN 'UncertifiedPCW format is incorrect where is not NULL. Must be numeric.'
						 /*
							UncertifiedPCWPercentage validation:
							1. When not NULL
							2. Must be numeric input
							3. Must not be decimal (only whole numbers)
							4. Maximum 3 digits
							5. Maximum percentage of 100
						 */		
						 WHEN r.UncertifiedPCWPercentage IS NOT NULL AND (ISNUMERIC(r.UncertifiedPCWPercentage) = 0 OR CHARINDEX('.', r.UncertifiedPCWPercentage) > 0 OR LEN(r.UncertifiedPCWPercentage) > 3 OR r.UncertifiedPCWPercentage > 100) THEN 'UncertifiedPCWPercentage format is incorrect where is not NULL.'
						 ELSE NULL END
	FROM stgTradeBooks r
	LEFT JOIN refBisacMediaTypes b 
	ON r.Media = b.bisacmediatypeid
	LEFT JOIN refCurrencyTypes c
	ON r.ItemPriceCurrency = c.currencytypeid
	LEFT JOIN refPublishers p
	ON r.publisherid = p.publisherid
	LEFT JOIN refStatusCodes s 
	ON r.statuscode = s.statusid
	LEFT JOIN refLanguage l
	ON r.[Language] = l.languagename
	LEFT JOIN refBisacSubjects bs1 
	ON r.BisacSubjectCode1 = bs1.BISACCode
	LEFT JOIN refBisacSubjects bs2 
	ON r.BisacSubjectCode2 = bs2.BISACCode
	LEFT JOIN refBisacSubjects bs3 
	ON r.BisacSubjectCode3 = bs3.BISACCode
	LEFT JOIN refBisacBindingTypes bt 
	ON r.[Binding] = bt.bisacbindingtypeid
	LEFT JOIN refContributorRoles cr1
	ON r.Contributor1role = cr1.roleid
	LEFT JOIN refContributorRoles cr2
	ON r.Contributor2Role = cr2.roleid
	LEFT JOIN refContributorRoles cr3
	ON r.Contributor3role = cr3.roleid
	LEFT JOIN refAudienceGrades ag1 
	ON r.GradeLowerLimit = ag1.audiencegrade
	LEFT JOIN refAudienceGrades ag2 
	ON r.GradeUpperLimit = ag2.audiencegrade
	LEFT JOIN refAudienceCodes au
	ON r.AudienceCode = au.AudienceCode
	LEFT JOIN refLinearMeasurementUnits mu 
	ON r.MeasurementUnits = mu.unitid;

	----- Drop the not required table
	DROP TABLE #DuplicatePIDs;

	----- Move invalid data
	EXEC @InvalidRowsAfterValidation = dbo.spTradeBooksMoveInvalidStagingData;

		----- Add number of invalid rows to the end result
	SET @TotalInvalidRows = @TotalInvalidRows + @InvalidRowsAfterValidation;

	----- Transform values after validations are done
	UPDATE stgTradeBooks 
	SET PubDate = CONVERT(VARCHAR, CAST(PubDate AS DATETIME), 101),
		VolumeNumber = CAST(CAST(VolumeNumber AS DECIMAL(12, 4)) AS INT),
		NumberofVolumes = CAST(CAST(NumberofVolumes AS DECIMAL(12, 4)) AS INT),
		NumberofPages = CONVERT(INT, CONVERT(DECIMAL(10, 0), NumberofPages)),
		AgeLowerLimit = FLOOR(AgeLowerLimit),
		AgeUpperLimit = FLOOR(AgeUpperLimit),
		Height = CONVERT(DECIMAL(12, 2), Height),
		Width = CONVERT(DECIMAL(12, 2), Width),
		Depth = CONVERT(DECIMAL(12, 2), Depth); 

	----- Mark valid records that are linked to TradeDataByVendor table as records for Update
	UPDATE stgTradeBooks
	SET InsertFlag = 0
	FROM stgTradeBooks b
	JOIN TradeDataByVendor c (NOLOCK) 
	ON b.PID = c.PID 
	WHERE c.SAPVendorId = @IndigoBooksSAPVendorID AND 
	      c.VSRCode = @FilterVSRCode;

	----- From here run validation rules that would apply to potential Insert only records (not Update)

	UPDATE r
	SET Problem = CASE WHEN r.Title IS NULL THEN 'New product. Title is required.'
					   WHEN r.Media IS NULL THEN 'New product. Media is required.'
				       WHEN r.ItemPrice IS NULL THEN 'New product. ItemPrice is required.'
					   WHEN r.ItemPriceCurrency IS NULL THEN 'New product. ItemPriceCurrency is required.'
					   WHEN r.Discount IS NULL THEN 'New product. Discount is required.'
					   WHEN r.StatusCode IS NULL THEN 'New product. StatusCode is required.'
					   WHEN r.Contributor1LastName IS NULL THEN 'New product. Contributor1LastName is required.'
				       ELSE NULL END
	FROM stgTradeBooks r
	WHERE r.InsertFlag IS NULL;

	----- Move invalid data
	EXEC @InvalidRowsAfterValidation = dbo.spTradeBooksMoveInvalidStagingData;

		----- Add number of invalid rows to the end result
	SET @TotalInvalidRows = @TotalInvalidRows + @InvalidRowsAfterValidation;

	----- Set default Language as English for records to be marked for Insert (and which do not have assigned Language). Also mark valid remaining records (that has not been marked for Update) as records for Insert
	UPDATE stgTradeBooks 
	SET [Language] = CASE WHEN [Language] IS NULL AND InsertFlag IS NULL THEN 'English' ELSE [Language] END,
	    InsertFlag = CASE WHEN InsertFlag IS NULL THEN 1 ELSE InsertFlag END;

	------------------------------------------------------------ FINALIZE, CLEANUP AND END ---------------------------------------

	RETURN @TotalInvalidRows;
END;
GO

GRANT EXECUTE ON [dbo].[spTradeBooksValidate] TO [TradeBooksApp]; 
GO