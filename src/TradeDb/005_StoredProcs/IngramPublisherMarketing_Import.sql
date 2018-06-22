CREATE PROCEDURE [dbo].[IngramPublisherMarketing_Import]
AS

--Declare local Vars to hold values for records processed, updated, records inserted and email message
DECLARE @bigInsert bigint, @bigUpdate bigint, 
@MessageString varchar(8000), @bigTotalRecords bigint, @RecordsFlagged smallint;

SET @bigInsert = 0;
SET @bigUpdate =0;

-- If there is a duplicate, delete the second or more records from the staging table
-- This leaves only the first record per PID
WITH ROWP AS (
	SELECT PID, 
	ROW_NUMBER() OVER (Partition by PID order by (Select 1)) as RN
	from stgIngramPublisherMarketing)
delete FROM ROWP where RN > 1;

------Create Index on PID Column
delete  stgIngramPublisherMarketing
from  stgIngramPublisherMarketing A  
JOIN TradeDataByVendor v with (nolock)
		ON v.pid = a.PID AND
		v.SAPVendorId = 706954 -- only for INGRAM INTERNATIONAL INC products
JOIN dbo.TradeDescriptionData d with (nolock)
	ON d.ISBN13 = v.ISBN13 AND 
		d.SAPVendorId = v.SAPVendorId AND
		d.VSRCode = v.VSRCode AND 
		d.DescriptionTypeId = 33
WHERE cast(d.DescriptionText as varchar(8000)) like '%' + substring (ltrim(rtrim(cast(a.note as varchar(8000)))), 5, len(cast(a.note as varchar(8000))) - 5) + '%' --+ cast(c.note as varchar(8000)) + '%' --  like '''%' + cast(c.note as varchar(8000)) + '%''' --substring (ltrim(rtrim(cast(a.note as varchar(8000)))), 10, len(cast(a.note as varchar(8000)))) + '%'''
	and len(cast(a.note as varchar(8000))) > 50

--Initialize Total records processed with the # of records in  stgIngramPublisherMarketing
SELECT @bigTotalrecords = Count(*) from  stgIngramPublisherMarketing

/*DELETE ROWS FROM  stgIngramPublisherMarketing FOR THOSE ROWS 
WHICH HAVE NOTETYPEID = and ProviderID = in tbl_CMN_ChaptersNotes
We will do an inner join on PID*/

/*Set Number of records processed to a max of 1000 per transaction
using @RecordsFlagged and doing it in a while loop*/
SET ROWCOUNT 1000
/*Flag Records for processsing which have not been processed yet
with a max of 1000 records*/
UPDATE  stgIngramPublisherMarketing
SET Flag = '1'
WHERE Flag = '0'
SET @RecordsFlagged = @@ROWCOUNT
WHILE @RecordsFlagged > 0
BEGIN
	/*Update Existing Rows In tbl_CMN_ChaptesrNotes which have matching
	PID in  stgIngramPublisherMarketing and have NoteTypeID  = 11*/

	UPDATE TradeDescriptionData
	SET DescriptionText = PMt.Note,
		DateChanged = GETDATE(),
		ChangedBy = USER_NAME()
	FROM stgIngramPublisherMarketing PMT
		JOIN TradeDataByVendor v
		ON v.pid = PMT.PID AND
			v.SAPVendorId = 706954 -- only for INGRAM INTERNATIONAL INC products
		JOIN TradeDescriptionData d
		ON d.ISBN13 = v.ISBN13 AND 
			d.SAPVendorId = v.SAPVendorId AND
			d.VSRCode = v.VSRCode
	where d.ISDELETED = 0
		AND d.ProviderID = 3
		AND d.DescriptionTypeId = 11
		AND Cast(d.DescriptionText as Varchar(8000)) <>  Cast(PMT.Note as varchar(8000))
		AND PMT.Flag = '1'

	--Initialize @bigUpdate with records updated in tbl_CMN_ChaptersNotes
	Select @bigUpdate = @bigUpdate + @@ROWCOUNT
	/*Insert Rows in tbl_CMN_ChaptersNotes from table  stgIngramPublisherMarketing
	Which have a matching PID in tbl_CMN_Core But do not exist in
	table tbl_CMN_ChaptersNotes*/

	Insert Into dbo.TradeDescriptionData(ISBN13, SAPVendorId, VSRCode, DescriptionTypeId,DescriptionText,
		DescriptionStatusId,ProviderID,IsDeleted, DateCreated, DateChanged, CreatedBy, ChangedBy)
	select 
		v.ISBN13,
		v.SAPVendorId, -- always 706954
		v.VSRCode,
		11, 
		PMT.Note,
		3,
		3,
		0,
		GETDATE(),
		GETDATE(),
		USER_NAME(),
		USER_NAME()
	from dbo.stgIngramPublisherMarketing PMT  with (nolock)
	JOIN TradeDataByVendor v with (nolock)
		ON v.pid = PMT.PID AND
		v.SAPVendorId = 706954 -- update only for INGRAM INTERNATIONAL INC products
	LEFT JOIN dbo.TradeDescriptionData d with (nolock)
		ON d.ISBN13 = v.ISBN13 AND 
			d.SAPVendorId = v.SAPVendorId AND
			d.VSRCode = v.VSRCode AND
			d.DescriptionTypeId = 11 AND
			d.ProviderID = 3
	WHERE d.ISBN13 is Null -- insert only to those that do not have records
	AND PMT.Flag = '1'

	--Initialize @bigInsert with records updated in tbl_CMN_ChaptersNotes
	Select @bigInsert = @bigInsert +@@ROWCOUNT
	---Change Flag for processed records from 1 to 2
	UPDATE  stgIngramPublisherMarketing
	SET Flag = '2'
	WHERE Flag = '1'
	--Flag New Records For Processing
	UPDATE  stgIngramPublisherMarketing
	SET Flag = '1'
	WHERE Flag = '0'
	SET @RecordsFlagged = @@ROWCOUNT
END
SET ROWCOUNT 0
/*Send Email to Notify about the number of records inserted*/
SELECT @MessageString = 'Application Name: Indigo.IngramImporter.PublisherMarketing.Console' + Char(13)
	+'Date: ' + Cast(getdate() as varchar(21)) + Char(13)
       	+'Application Run By: ' + User_Name() + Char(13)
	+'Source: ftp1.ingrambook.com/pubsdescripa ' + char(13)
	+'Source File: pmdaily.txt'  + Char(13)
	+'Destination Server: ' + @@SERVERNAME + Char(13)
	+'Destination Database: TradeDB' + Char(13)
	+'Destination Table: TradeDescriptionData' + char(13)
	+'No of Records Processed from Source File: ' + (Select cast(@bigTotalRecords as varchar(21)))+ Char(13)
	+'No Of New Records Inserted In table TradeDescriptionData: ' + (Select  cast(@bigInsert as varchar(21))) +Char(13)
	+'No Of Records Updated In table TradeDescriptionData: ' + (Select  cast(@bigUpdate as varchar(21))) +Char(13)
	+'Status: Daily Ingram publisher marketing execution ran successfully without any errors.'

--exec master..xp_SendMail 'electronicdata@Indigo.ca',  @SUBJECT = 'IngramImporter.PublisherMarketing Summary',
--@Message = @MessageString

select @bigTotalRecords as TotalProcessed,
	@bigInsert as TotalInserted,
	@bigUpdate as TotalUpdated,
	@MessageString as Message

/*Drop table  stgIngramPublisherMarketing*/
-- Do not uncomment Else Package will not start
--DROP Table dbo. stgIngramPublisherMarketing
GO

GRANT EXECUTE ON [dbo].[IngramPublisherMarketing_Import] TO [IngramImportApp]; 
GO