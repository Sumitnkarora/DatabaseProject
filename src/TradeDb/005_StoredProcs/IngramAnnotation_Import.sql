CREATE PROCEDURE [dbo].[IngramAnnotation_Import]
AS

--DECLARE a local variable which will Hold the Inserted row COUNT
DECLARE @bigInserted bigint, @RecordsFlagged smallint;
--DECLARE a local variable which will Hold the Email Message String
DECLARE @MessageString varchar(8000);

-- If there is a duplicate, delete the second or more records from the staging table
-- This leaves only the first record per PID
WITH ROWP AS (
	SELECT PID, 
	ROW_NUMBER() OVER (Partition by PID order by (Select 1)) as RN
	from stgIngramAnnotations)
delete FROM ROWP where RN > 1;

delete dbo.stgIngramAnnotations
from dbo.stgIngramAnnotations a  
JOIN TradeDataByVendor v with (nolock)
		ON v.pid = a.PID AND
		v.SAPVendorId = 706954 -- only for INGRAM INTERNATIONAL INC products
JOIN dbo.TradeDescriptionData d with (nolock)
	ON d.ISBN13 = v.ISBN13 AND 
		d.SAPVendorId = v.SAPVendorId AND
		d.VSRCode = v.VSRCode AND 
		d.DescriptionTypeId = 11
WHERE cast(d.DescriptionText as varchar(8000)) like '%' + substring (ltrim(rtrim(cast(a.note as varchar(8000)))), 5, len(cast(a.note as varchar(8000))) - 5) + '%' --+ cast(c.note as varchar(8000)) + '%' --  like '''%' + cast(c.note as varchar(8000)) + '%''' --substring (ltrim(rtrim(cast(a.note as varchar(8000)))), 10, len(cast(a.note as varchar(8000)))) + '%'''
	and len(cast(a.note as varchar(8000))) > 50

SET @BigInserted = 0
SET ROWCOUNT 1000 --- To do this in batches of 1000
---Mark Next 1000  or Less Rocords For Processing
UPDATE dbo.stgIngramAnnotations
SET Flag = '1'
WHERE Flag = '0'
SET @RecordsFlagged  = @@ROWCOUNT

WHILE  @RecordsFlagged > 0 
BEGIN
	/*Insert Rows in TradeDescriptionData from table AntingrmTemp
	Which have a matching product in TradeDataByVendor But do not exist in
	table TradeDescriptionData*/

	Insert Into dbo.TradeDescriptionData(ISBN13, SAPVendorId, VSRCode, DescriptionTypeId,DescriptionText,
		DescriptionStatusId,ProviderID,IsDeleted, DateCreated, DateChanged, CreatedBy, ChangedBy)
	select 
		v.ISBN13,
		v.SAPVendorId, -- always 706954
		v.VSRCode,
		33, 
		ANT.Note,
		3,
		3,
		0,
		GETDATE(),
		GETDATE(),
		USER_NAME(),
		USER_NAME()
	from dbo.stgIngramAnnotations ANT  with (nolock)
	JOIN TradeDataByVendor v with (nolock)
		ON v.pid = ANT.PID AND
		v.SAPVendorId = 706954 -- update only for INGRAM INTERNATIONAL INC products
	LEFT JOIN dbo.TradeDescriptionData d with (nolock)
		ON d.ISBN13 = v.ISBN13 AND 
			d.SAPVendorId = v.SAPVendorId AND
			d.VSRCode = v.VSRCode AND
			d.DescriptionTypeId = 33 AND
			d.ProviderID = 3
	WHERE d.ISBN13 is Null -- insert only to those that do not have records
	AND ANT.Flag = '1'

	/* Assign the Number Of Rows Inserted to @biginserted*/
	SELECT @bigInserted = @biginserted  + @@ROWCOUNT
	/*Mark Records That Have Been Processed*/
	UPDATE dbo.stgIngramAnnotations
	SET Flag = '2'
	WHERE Flag =' 1'
	/*Flag Next 1000 or next records*/
	UPDATE dbo.stgIngramAnnotations
	SET Flag = '1'
	WHERE Flag = '0'
	/*Update RecordsFlagged Var*/
	SET @recordsFlagged = @@ROWCOUNT
END
/*Send Email to Notify about the number of records inserted*/
SELECT @MessageString = 'Package Name: Indigo.IngramImporter.Annotation.Console' + Char(13)
	+'Date: ' + Cast(getdate() as varchar(21)) + Char(13)
       	+'Package Run By: ' + User_Name() + Char(13)
	+'Source: ftp1.ingrambook.com/titleswk ' + char(13)
	+'Source File: Antingrm.txt'  + Char(13)
	+'Destination Server: ' + @@SERVERNAME + Char(13)
	+'Destination Database: TradeDB' + Char(13)
	+'Destination Table: TradeDescriptionData' + char(13)
	+'No of Records Processed from Source File: ' + (Select cast(Count(*) as varchar(21))From dbo.stgIngramAnnotations) + Char(13)
	+'No Of New Records Inserted In table TradeDescriptionData: ' + cast(@bigInserted as varchar(21)) +Char(13)
	+'Status: Weekly Ingram annotation execution ran successfully without any errors.'

--exec master..xp_SendMail 'electronicdata@Indigo.ca',  @SUBJECT = 'IngramImporter.Annotation Summary',
--@Message = @MessageString

select cast(Count(*) as varchar(21)) as TotalProcessed,
	@bigInserted as TotalInserted,
	0 as TotalUpdated,
	@MessageString as Message
from dbo.stgIngramAnnotations
GO

GRANT EXECUTE ON [dbo].[IngramAnnotation_Import] TO [IngramImportApp]; 
GO