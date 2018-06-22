/************************************************************************************
Target DB:      AzureDb - TradeDb_US
Procedure Name: dbo.TradeAutoApproval
Description:    Automatically approves items for a specific vendor into the 
		TradeDataExport table
Input param:    @SAPVendorID - Vendor Id to Auto-approve.
Dependencies:   dbo.TradeDataExport, dbo.LastRun, dbo.TradeDataTimestamps, dbo.TradeSubjects
		dbo.TradeCoreAttributes, dbo.TradeDataPriority, dbo.refProductFormToRetailCategorization
Run Method:	exec dbo.TradeAutoApproval @SAPVendorID = '701215'
Create Date:    2018/06/13
Change History: 2018/06/13 : Jonathan Pearce - Initial Revision
Design Notes:
    * If an ISBN13 does not have a record in TradeDataPriority for region 'US' or '',
      a priority 1 entry will be added for the 'US' region
    * If an ISBN13 has a priority 1 record for 'US' and a priority 1 record for '', 
      only the 'US' one will be looked at.
    * If an ISBN13 has a priority 1 record ('' or 'US', based on previous note) in 
      TradeDataPriority from a different vendor, no updates will happen
    * Requires article has at least 1 BISAC code
    * Requires that there is a mapping found between the following fields:
      -> dbo.TradeSubjects : Scheme = '10' ( SubjectCode )
      -> dbo.TradeCoreAttributes (ProductFormId, ProductFormDetail, PrimaryLanguages[0])
      and
      -> dbo.refProductFormToRetailCategorization (BISACCode, ProductFormId, ProductFormDetailId, LanguageCode)
    * NULL values in TradeCoreAttributes for ProductFormId or ProductFormDetail will
      be mapped to '' (empty string) when the join to refProductFormToRetailCategorization
      is done.
************************************************************************************/
CREATE PROCEDURE dbo.TradeAutoApproval
(
	@SAPVendorID VARCHAR(20) = '701215'
)
AS
BEGIN
	IF @SAPVendorID IS NULL OR LTRIM(RTRIM(@SAPVendorID)) = ''
	BEGIN
		RAISERROR('An SAPVendorId must be provided.', 16, 1);
		RETURN;
	END

	DECLARE @errorMessage NVARCHAR(MAX);

	-- For Auto-Approval, we need to wait until all items are pushed before pushing
	-- another batch. Otherwise you can't be sure all updates are being sent.
	IF EXISTS ( SELECT TOP 1 1 FROM dbo.TradeDataExport WITH (NOLOCK) WHERE ExportStatus IN (2, 6) )
	BEGIN
		RETURN;
	END

	DECLARE @ProcessName VARCHAR(255) = 'TradeAutoApproval'
	IF NOT EXISTS ( SELECT TOP 1 1 FROM dbo.LastRun WHERE ProcessName = @ProcessName )
	BEGIN
		INSERT dbo.LastRun (ProcessName, LastRunTime) VALUES(@ProcessName, '2001-01-01');
	END

	DECLARE @CurrentTime DATETIME2(3) = SYSDATETIME();
	DECLARE @LastRunTime DATETIME2(3);
	
	CREATE TABLE #Updated ( ISBN13 VARCHAR(13) NOT NULL, SAPVendorId VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL PRIMARY KEY CLUSTERED(ISBN13, SAPVendorId, VSRCode) );
	CREATE TABLE #BISACs ( ISBN13 VARCHAR(13) NOT NULL, SAPVendorId VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL, Ordinal TINYINT NOT NULL, SubjectCode VARCHAR(MAX) NOT NULL PRIMARY KEY CLUSTERED (ISBN13, SAPVendorId, VSRCode, Ordinal) );
	CREATE TABLE #Binding ( ISBN13 VARCHAR(13) NOT NULL, SAPVendorId VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL, ProductForm CHAR(2) NULL, ProductFormDetail CHAR(4) NULL, PrimaryLanguage CHAR(3) NULL PRIMARY KEY CLUSTERED (ISBN13, SAPVendorId, VSRCode) );
	CREATE TABLE #Priority ( ISBN13 VARCHAR(13) NOT NULL, SAPVendorID VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL, RegionId VARCHAR(10) NOT NULL PRIMARY KEY CLUSTERED (ISBN13, SAPVendorId, VSRCode, RegionId) );
	CREATE TABLE #New_Priority ( ISBN13 VARCHAR(13) NOT NULL, SAPVendorId VARCHAR(20) NOT NULL, VSRCode VARCHAR(20) NOT NULL PRIMARY KEY CLUSTERED(ISBN13, SAPVendorId, VSRCode) );
	CREATE TABLE #TradeDataExport ( ISBN13 VARCHAR(13) NOT NULL, RegionId VARCHAR(10) NOT NULL, MerchCategoryId VARCHAR(10) NULL, LayoutModuleId VARCHAR(10) NULL PRIMARY KEY CLUSTERED (ISBN13, RegionId) )

	-- Data Collection
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		SELECT	@LastRunTime = LastRunTime FROM dbo.LastRun WHERE ProcessName = @ProcessName;

		-- Get changed items
		INSERT	#Updated ( ISBN13, SAPVendorId, VSRCode )
		SELECT	tdt.ISBN13, tdt.SAPVendorId, tdt.VSRCode
		FROM	dbo.TradeDataTimestamps as tdt
		WHERE	SAPVendorId = @SAPVendorID
		AND	DateChanged >= @LastRunTime;

		-- Get BISAC data
		INSERT	#BISACs ( ISBN13, SAPVendorId, VSRCode, Ordinal, SubjectCode )
		SELECT	s.ISBN13, s.SAPVendorId, s.VSRCode, s.Ordinal, s.SubjectCode
		FROM	#Updated u
		JOIN	dbo.TradeSubjects s ON u.ISBN13 = s.ISBN13 and u.SAPVendorId = s.SAPVendorId and u.VSRCode = s.VSRCode
		WHERE	s.SubjectScheme = '10';

		-- Get binding/language data
		INSERT	#Binding ( ISBN13, SAPVendorId, VSRCode, ProductForm, ProductFormDetail, PrimaryLanguage )
		SELECT	c.ISBN13, c.SAPVendorId, c.VSRCode, c.ProductForm, c.ProductFormDetail, json_value(c.PrimaryLanguage, '$[0]')
		FROM	#Updated u
		JOIN	dbo.TradeCoreAttributes as c ON u.ISBN13 = c.ISBN13 and u.SAPVendorId = c.SAPVendorId and c.VSRCode = u.VSRCode;

		-- Get data priority items
		INSERT	#Priority ( ISBN13, SAPVendorID, VSRCode, RegionId )
		SELECT	DISTINCT p.ISBN13, p.SAPVendorId, p.VSRCode, p.RegionId
		FROM	dbo.TradeDataPriority as p
		JOIN	#Updated T1 on p.ISBN13 = T1.ISBN13
		WHERE	p.Priority = 1
		AND	p.RegionId IN ('', 'US')
		
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRAN;
		END
		
		SET	@errorMessage = 
			N' (' + ISNULL(CAST(ERROR_NUMBER() AS NVARCHAR), N'EN') + N', ' + ISNULL(CAST(ERROR_SEVERITY() AS NVARCHAR), N'ESe') + N', ' + ISNULL(CAST(ERROR_STATE() AS NVARCHAR), N'ESt') + N') ' +
			N'Procedure: ' + ISNULL(ERROR_PROCEDURE(), N'') + N', Line: ' + ISNULL(CAST(ERROR_LINE() AS NVARCHAR), N'') + N', Message: ' + ISNULL(ERROR_MESSAGE(), N'')

		RAISERROR(@errorMessage, 16, 1);
		RETURN;
	END CATCH
	SET XACT_ABORT OFF

	-- Remove multi-region priority rows where there is a US exclusive
	DELETE	a
	FROM	#Priority a
	JOIN	#Priority b ON a.ISBN13 = b.ISBN13
	WHERE	a.RegionId = ''
	AND	b.RegionId = 'US';

	-- Remove items where there is a P1 for that region, but, the updated item isn't it.
	DELETE	#Updated
	FROM	#Updated u
	JOIN	#Priority p ON u.ISBN13 = p.ISBN13
		LEFT JOIN #Priority x on u.ISBN13 = x.ISBN13 and u.SAPVendorId = x.SAPVendorID and u.VSRCode = x.VSRCode
	WHERE	x.VSRCode IS NULL;

	-- New P1 rows:
	INSERT	#New_Priority ( ISBN13, SAPVendorId, VSRCode )
	SELECT	DISTINCT u.ISBN13, u.SAPVendorId, u.VSRCode
	FROM	#Updated u
		LEFT JOIN #Priority p on u.ISBN13 = p.ISBN13
	WHERE	p.ISBN13 is NULL;

	-- Get MC/LM data for the Products
	WITH MCLMMAP AS (
		SELECT	s.ISBN13, s.SAPVendorId, s.VSRCode, s.Ordinal, rc.MerchandiseCategory, rc.LayoutModule
		,	RN = ROW_NUMBER() OVER (PARTITION BY s.ISBN13 ORDER BY s.Ordinal)
		FROM	#BISACs s
		JOIN	#Binding b ON s.ISBN13 = b.ISBN13 and s.SAPVendorId = b.SAPVendorId and s.VSRCode = b.VSRCode
		JOIN	dbo.refProductFormToRetailCategorization as rc ON 
				rc.BisacCode = s.SubjectCode 
			and	rc.ProductFormId = ISNULL(b.ProductForm, '')
			and	rc.ProductFormDetailId = ISNULL(b.ProductFormDetail, '')
			and	isnull(b.PrimaryLanguage, 'eng') = rc.LanguageCode
	), RowFilter AS (
		SELECT	*
		FROM	MCLMMAP
		WHERE	RN = 1
	)
	INSERT	#TradeDataExport ( ISBN13, RegionId, MerchCategoryId, LayoutModuleId )
	SELECT	u.ISBN13, 'US', r.MerchandiseCategory, r.LayoutModule
	FROM	#Updated AS u
	JOIN	RowFilter AS r on u.ISBN13 = r.ISBN13 and u.SAPVendorId = r.SAPVendorId and u.VSRCode = r.VSRCode;

	-- Data Processing
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		-- New items for the Priority Table
		INSERT	dbo.TradeDataPriority (ISBN13, SAPVendorId, VSRCode, RegionId, Priority, IndigoOverride)
		SELECT	n.ISBN13, n.SAPVendorId, n.VSRCode, 'US', 1, 0
		FROM	#New_Priority as n;

		-- Update Existing records to set them to Export again
		UPDATE	dbo.TradeDataExport
		SET	ExportStatus =
			CASE
				WHEN t.ExportStatus IN (0, 1, 2, 3) THEN 1
				WHEN t.ExportStatus IN (4, 5, 6, 7) THEN 5
				ELSE t.ExportStatus
			END
		,	MerchCategoryId = e.MerchCategoryId
		,	LayoutModuleId = e.LayoutModuleId
		FROM	dbo.TradeDataExport as t
		JOIN	#TradeDataExport as e on t.ISBN13 = e.ISBN13 and t.RegionId = e.RegionId;
		
		-- Insert new records into the Export Table
		INSERT	dbo.TradeDataExport ( ISBN13, RegionId, MerchCategoryId, LayoutModuleId, ExportStatus )
		SELECT	e.ISBN13, e.RegionId, e.MerchCategoryId, e.LayoutModuleId, 1
		FROM	#TradeDataExport as e
			LEFT JOIN dbo.TradeDataExport as t ON e.ISBN13 = t.ISBN13 and e.RegionId = t.RegionId
		WHERE	t.RegionId IS NULL;

		UPDATE	dbo.LastRun SET LastRunTime = @CurrentTime WHERE ProcessName = @ProcessName;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRAN;
		END
		
		SET	@errorMessage = 
			N' (' + ISNULL(CAST(ERROR_NUMBER() AS NVARCHAR), N'EN') + N', ' + ISNULL(CAST(ERROR_SEVERITY() AS NVARCHAR), N'ESe') + N', ' + ISNULL(CAST(ERROR_STATE() AS NVARCHAR), N'ESt') + N') ' +
			N'Procedure: ' + ISNULL(ERROR_PROCEDURE(), N'') + N', Line: ' + ISNULL(CAST(ERROR_LINE() AS NVARCHAR), N'') + N', Message: ' + ISNULL(ERROR_MESSAGE(), N'')

		RAISERROR(@errorMessage, 16, 1);
		RETURN;
	END CATCH

	DROP TABLE #Updated;
	DROP TABLE #BISACs;
	DROP TABLE #Binding;
	DROP TABLE #Priority;
	DROP TABLE #New_Priority;
	DROP TABLE #TradeDataExport;
END
GO

GRANT EXECUTE ON dbo.TradeAutoApproval TO  [TWRExporter];