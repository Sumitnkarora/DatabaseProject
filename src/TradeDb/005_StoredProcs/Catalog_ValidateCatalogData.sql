CREATE      PROCEDURE [dbo].[Catalog_ValidateCatalogData]
AS

set nocount on
--drop table #exceptions
--Create temporay exception table
select top 0 r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate,r.StreetDate, ISBN13, ReplacementISBN13, Imprint, r.[problem], r.ClassOfTrade, r.Contributor1CountryCode, r.Contributor2CountryCode, r.Contributor3CountryCode, r.BISACRegionCode, r.RunTime, r.ClassOfTradeName, r.ClassOfTradeCode, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage
into #exceptions
from CatalogImportExceptions r  

UPDATE stgCatalogImport
SET ITEMPRICE = REPLACE (ITEMPRICE, '$', '')
WHERE ITEMPRICE LIKE '%$%'

/* April 20, 2017 by Robert Song */
UPDATE stgCatalogImport
SET USDRetailPrice = REPLACE (USDRetailPrice, '$', '')
WHERE USDRetailPrice LIKE '%$%'

UPDATE stgCatalogImport
SET USDRetailPrice = REPLACE (USDRetailPrice, ',', '')
WHERE USDRetailPrice LIKE '%,%'

UPDATE stgCatalogImport
SET ITEMPRICE = REPLACE (ITEMPRICE, ',', '')
WHERE ITEMPRICE LIKE '%,%'

/* April 20, 2017 by Robert Song */


/* Jan. 8th, 2008 by Li Zhang
 * ISBN13 project changes: Modify the validation logic for ISBN, ReplacementISBN, ISBN13 and ReplacementISBN13 fields
**/



--Check for availability of either ISBN or ISBN13
insert into #exceptions ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate,StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem], ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage)
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate,r.StreetDate, ISBN13, ReplacementISBN13, Imprint, 'Both ISBN and ISBN13 are null', r.ClassOfTrade, r.Contributor1CountryCode, r.Contributor2CountryCode, r.Contributor3CountryCode, r.BISACRegionCode, r.RunTime, r.PaperCertificationType, r.ChainofCustody, r.CertifiedPostConsumerWaste_PCW, r.CertifiedPCWPercentage, r.UncertifiedPCW, r.UncertifiedPCWPercentage
from stgCatalogImport r  
where (r.ISBN is null) AND (r.ISBN13 is null)

--insert into CatalogImportArchive([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate,StreetDate, ISBN13, ReplacementISBN13, ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage)
--select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, ReplacementISBN, ReplacementCode, OPDate,StreetDate, ISBN13, ReplacementISBN13, r.ClassOfTrade, r.Contributor1CountryCode, r.Contributor2CountryCode, r.Contributor3CountryCode, r.BISACRegionCode, r.RunTime, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage
--from stgCatalogImport r  
--where (r.ISBN is null) AND (r.ISBN13 is null)

delete stgCatalogImport
where (ISBN is null) AND (ISBN13 is null)

--Update pids if ISBN is available
update stgCatalogImport set pid = '978'+left(isbn, len(isbn)-1) where (pid is null) AND (ISBN is NOT null)

--Update pids if ISBN13 is available
update stgCatalogImport set pid = left(ISBN13, 12) where (pid is null) AND (ISBN is null) AND (ISBN13 is NOT null)


/* Jan. 8th, 2008 by Li Zhang
 * END of ISBN13 project changes: Modify the validation logic for ISBN, ReplacementISBN, ISBN13 and ReplacementISBN13 fields
**/

-- August 13,2008 - Vasanth Petlu. Flamingo enhancements. Allow VSRCode and OPDate in tblCatalogData to be updated to NULL
-- Sept. 17,2008 - Wei Hou Business confirmed that token '~NULL~' will not be passed on insert
--update stgCatalogImport
--set VSRCode = NULL
--where VSRCODE = '~NULL~'

--update stgCatalogImport
--set OPDate = NULL
--where OPDate = '~NULL~'

-- Oct 6, 2009. Wendy Yang. Normalize Vendor ID if vendor id is not null

update stgCatalogImport
set VendorID = right('000000' + cast(VendorID as varchar(12)), 6)
where VendorID is not null


-- SAP Update LegacyID
update stgCatalogImport
set VendorID = right('000000' + cast(v.LegacyID as varchar(12)), 6)
from stgCatalogImport r
join tblSAPVendors v
on r.SAPVendorID = v.SAPVendorID and isnull(rtrim(ltrim(r.VSRCode)), '') = v.VSRCode
where r.VendorID is null 

--truncate table stgCatalogValidateData

--Insert data for validation

-- Added by JaeSung Moon on July 7, 2009
-- FSC-Recycle Content
-- Added new data fields PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage
insert stgCatalogValidateData  ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate,StreetDate, ISBN13, ReplacementISBN13, Imprint, ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage)
select [ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate,StreetDate, ISBN13, ReplacementISBN13, Imprint, ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage
from stgCatalogImport
where ProcessStatus =0

--Initialize null VSRCode records to emptyy string to prevent checking for ISNULL downstream
update stgCatalogValidateData
set VSRCode = ''
where VSRCode is null

truncate table #exceptions

--------------------------------------------------------------------------------------------------------------------------------

--Trim data for leading and trailing blanks
declare @column nvarchar(255),@sql nvarchar(MAX), @count int, @exceptionCount int, @validCount int
select colid, name 
into #t1
from syscolumns 
where id = object_id('stgCatalogValidateData') order by colid

select @count = COUNT(colid) from #t1
SET @sql = 'UPDATE dbo.stgCatalogValidateData SET ';

while @count > 0
begin
	select top 1 @column = name from #t1
	--Remove trailing and leading blanks, Carriage return and line feed characters
	set @sql = @sql + '[' + @column + '] = REPLACE(LTRIM(RTRIM([' + @column + '])), CHAR(13) + CHAR(10), ''''), ';

	delete #t1 where name = @column
	set @count = @count -1
end
drop table #t1

-- remove the last comma of the update script
set @sql = STUFF(@sql, LEN(@sql), 2, ';');
exec(@sql)

-- Safety check - set the Problem value to null before proceeding with the checks
update stgCatalogValidateData
set Problem = null

/* Jan. 8th, 2008 by Li Zhang
 * ISBN13 project changes: Modify the validation logic for ISBN, ReplacementISBN, ISBN13 and ReplacementISBN13 fields
**/

--Check for invalid ISBN in import table if it is NOT null
update stgCatalogValidateData
	set Problem = 'Invalid ISBN'
where Problem is null and (len(isbn)<>10 or dbo.CalcISBN10CheckDigit(isbn)<>substring(isbn,10,1) or isnumeric(left(isbn, len(isbn)-1))=0) AND (isbn is NOT null)

--Check for invalid OLDISBN length in import table if it is NOT null
update stgCatalogValidateData
	set Problem = 'Invalid OLDISBN length'
where Problem is null and (len(OLDISBN)<>13) AND (len(OLDISBN)<>10)

--Check for invalid OLDISBN 10 in import table if it is NOT null
update stgCatalogValidateData
	set Problem = 'Invalid OLDISBN 10'
where Problem is null and ((OLDISBN is not null) AND (len(OLDISBN)=10)) AND ((dbo.CalcISBN10CheckDigit(OLDISBN)<>substring(OLDISBN,10,1)) or isnumeric(left(OLDISBN, len(OLDISBN)-1))=0)

--Check for invalid OLDISBN 13 in import table if it is NOT null
update stgCatalogValidateData
	set Problem = 'Invalid OLDISBN 13'
where Problem is null and ((OLDISBN is not null) AND (len(OLDISBN)=13)) AND ((dbo.CalcISBN13CheckDigit(OLDISBN)<>substring(OLDISBN,13,1)) or isnumeric(left(OLDISBN, len(OLDISBN)-1))=0)

--Check ISBN for invalid characters
update stgCatalogValidateData
	set Problem = 'Invalid ISBN'
where Problem is null and (isnumeric(substring(isbn,1,9))=0 or charindex('.',isbn)>0) AND (ISBN is NOT null)

--Check for equivalent  of ISBN and ISBN13
update stgCatalogValidateData
	set Problem = 'Both ISBN and ISBN13 are not equivalent'
where Problem is null and (ISBN is not null) AND (ISBN13 is not null) AND (dbo.ISBN10toISBN13(ISBN)<>ISBN13)

--Check for equivalent  of ReplacementISBN and ReplacementISBN13
update stgCatalogValidateData
	set Problem = 'Both ReplacementISBN and ReplacementISBN13 are not equivalent'
where Problem is null and (ReplacementISBN is not null) AND (ReplacementISBN13 is not null) AND (dbo.ISBN10toISBN13(ReplacementISBN)<>ReplacementISBN13) 

--Check for replacementCode1
update stgCatalogValidateData
	set Problem = 'Both ReplacementISBN, and ReplacementISBN13 are empty, but ReplacementCode exists'
where Problem is null and (ReplacementISBN is null) AND (ReplacementISBN13 is null) and (ReplacementCode is not null)

--Check for replacementCode2
update stgCatalogValidateData
	set Problem = 'One of ReplacementISBN/ReplacementISBN13 is not empty, but ReplacementCode is empty'
where Problem is null and ((ReplacementISBN is not null) OR (ReplacementISBN13 is not null)) and (ReplacementCode is null)

--Check for invalid ReplacementISBN in import table if it is NOT null
update stgCatalogValidateData
	set Problem = 'Invalid ReplacementISBN'
where Problem is null and (len(ReplacementISBN)<>10 or dbo.CalcISBN10CheckDigit(ReplacementISBN)<>substring(ReplacementISBN,10,1) or isnumeric(left(ReplacementISBN, len(ReplacementISBN)-1))=0) AND (ReplacementISBN is NOT null)


---- Populate the missing ISBN data
--Populate the ISBN column if it is NULL while ISBN13 column is not NULL and ISBN13 staring with 978
UPDATE stgCatalogValidateData
SET ISBN = dbo.ISBN13toISBN10(ISBN13)
where (ISBN is null) AND (ISBN13 like '978%')

--Populate the ReplacementISBN column if it is NULL while ReplacementISBN13 column is not NULL and ReplacementISBN13 staring with 978
UPDATE stgCatalogValidateData
SET ReplacementISBN = dbo.ISBN13toISBN10(ReplacementISBN13)
where (ReplacementISBN is null) AND (ReplacementISBN13 like '978%')

--Populate the ISBN13 column if it is NULL while ISBN column is not NULL
UPDATE stgCatalogValidateData
SET ISBN13 = dbo.ISBN10toISBN13(ISBN)
where (ISBN is NOT null) AND (ISBN13 is null)

--Populate the ReplacementISBN13 column if it is NULL while ReplacementISBN column is not NULL
UPDATE stgCatalogValidateData
SET ReplacementISBN13 = dbo.ISBN10toISBN13(ReplacementISBN)
where (ReplacementISBN is NOT null) AND (ReplacementISBN13 is null)


--Validate ISBN13
-- For the ISBN13 validation, just examine the length and digits because it may be '978' and '979' and can not apply extensive logic check.
update stgCatalogValidateData
	set Problem = 'Invalid ISBN13'
where Problem is null and (len(ISBN13)<>13 or dbo.CalcISBN13CheckDigit(ISBN13)<>substring(ISBN13,13,1) or isnumeric(left(ISBN13, len(ISBN13)))=0) AND (ISBN13 is NOT NULL)

--validate ReplacementISBN13
update stgCatalogValidateData
	set Problem = 'Invalid ReplacementISBN13'
where Problem is null and (len(ReplacementISBN13)<>13  or dbo.CalcISBN13CheckDigit(ReplacementISBN13)<>substring(ReplacementISBN13,13,1) or isnumeric(left(ReplacementISBN13, len(ReplacementISBN13)))=0) AND (ReplacementISBN13 is NOT NULL)

/* 
 * Jan. 8th, 2008 by Li Zhang
 * END of ISBN13 project changes: Modify the validation logic for ISBN, ReplacementISBN, ISBN13 and ReplacementISBN13 fields
**/


-- Search for duplicate isbn's and remove all duplicates
select isbn13,sapvendorid,isnull(rtrim(ltrim(r.VSRCode)), '') vsrcode
into #duplicates
from stgCatalogValidateData r 
group by isbn13,sapvendorid,isnull(rtrim(ltrim(r.VSRCode)), '')
having count(*) > 1

update stgCatalogValidateData
	set Problem = 'Duplicate ISBN from the same vendor'
from stgCatalogValidateData r  
join #duplicates d on (r.isbn13 = d.isbn13 and r.sapvendorid = d.sapvendorid and r.VSRCode = d.vsrcode)
where Problem is null 

--Media code
update stgCatalogValidateData
	set Problem = 'Media'
from stgCatalogValidateData r
left join refBisacMediaTypes b on r.Media = b.bisacmediatypeid
where Problem is null and (b.bisacmediatypeid is null or r.Media is null)

--Title
update stgCatalogValidateData
	set Problem = 'Title'
where Problem is null and (title is null or len(title) >255)

--SubTitle
update stgCatalogValidateData
	set Problem = 'SubTitle'
where Problem is null and subtitle is not null and len(subtitle) >100

--ItemPrice
update stgCatalogValidateData
	set Problem = 'ItemPrice'
where Problem is null and 0=isnumeric(itemprice)

-- Added by Li Zhang on Sep. 19, 2007
--ForeignVendCADRetail validation: Is Null or is Numeric
update stgCatalogValidateData
	set Problem = 'ForeignVendCADRetail must be numeric or null'
where Problem is null and 0=isnumeric(isnull(ForeignVendCADRetail, 1))

-- End of Li's addition on Sep. 19, 2007

-- Added by Wesley Wang on May. 5, 2008
--USDRetailPrice validation: Is Null or is Numeric
update stgCatalogValidateData
	set Problem = 'USDRetailPrice must be numeric or null'
where Problem is null and 0=isnumeric(isnull(USDRetailPrice, 1))

-- End of Wesley's addition on May. 5, 2008

--itemprice currency
update stgCatalogValidateData
	set Problem = 'ItemPriceCurrency'
from stgCatalogValidateData r
left join refCurrencyTypes c
on r.itempricecurrency = c.currencytypeid
where Problem is null and c.currencytypeid is null

--vendorID
update stgCatalogValidateData
	set Problem = 'Null VendorID'
where Problem is null and Vendorid is null

--- SAP Vendor Validate
update stgCatalogValidateData
	set Problem = 'Invalid SAPVendorID'
from stgCatalogValidateData r
left join tblSAPVendors v
on r.SAPVendorID = v.SAPVendorID and r.VSRCode = v.VSRCode
where Problem is null and v.SAPVendorID is null 

/*
insert into #exceptions ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem])
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate, r.StreetDate, ISBN13, ReplacementISBN13, Imprint, 'Invalid VendorID' 
from stgCatalogValidateData r
left join(select * from retekdb.dbo.po_vendors where vendor_type_lookup_code = 'PUBLISHER' and isnumeric(segment1) = 1)v
on cast(r.vendorid as int)= v.segment1
where v.segment1 is null and isnumeric(r.vendorid)=1

delete stgCatalogValidateData
from (select * from retekdb.dbo.po_vendors where vendor_type_lookup_code = 'PUBLISHER' and isnumeric(segment1) = 1)v
right join stgCatalogValidateData r
on cast(r.vendorid as int)= v.segment1
where v.segment1 is null and isnumeric(r.vendorid)=1
*/

-- Term of Trade
update stgCatalogValidateData
set Discount = dbo.FindClassOfTradeDiscount(SAPVendorID, ClassOfTrade, Discount),
ClassOfTradeCode = dbo.FindClassOfTradeCode(SAPVendorID, ClassOfTrade, ClassOfTradeCode),
ClassOfTradeName = dbo.FindClassOfTradeName(SAPVendorID, ClassOfTrade, ClassOfTradeName)

update stgCatalogValidateData
	set Problem = 'ClassOfTradeCode could not be located based on ClassOfTrade and SAPVendorID'
where Problem is null and ClassOfTradeCode is null

-- If The Vendor does not antipciated in the ClassOfTrade, reset the ClassOfTrade to NULL
update stgCatalogValidateData
set ClassOfTrade = NULL
where ClassOfTradeCode =''

--discount
update stgCatalogValidateData
	set Problem = 'Invalid Discount value'
where Problem is null and ((isnumeric(discount)=0 and discount is not null) or (isnull(cast(discount as decimal),1) <0 or isnull(cast(discount as decimal),1) >100))

--publication date
update stgCatalogValidateData
	set Problem = 'Invalid PubDate'
where Problem is null and 0= isdate(isnull(PubDate,getdate()))


update stgCatalogValidateData 
set PubDate = convert(varchar,cast(pubdate as datetime),101) 
--- SAP RTK Bindign Removed
/*
--Binding
insert into #exceptions ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem])
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, 'Invalid Binding Code - Check the table retekdb.dbo.tbl_RTK_ProductTypeMap'
from stgCatalogValidateData r left join 
retekdb.dbo.tbl_RTK_ProductTypeMap b
on r.Binding = b.bindingtypeid
where b.bindingtypeid is null

delete stgCatalogValidateData
from stgCatalogValidateData r left join 
retekdb.dbo.tbl_RTK_ProductTypeMap b
on r.Binding = b.bindingtypeid
where b.bindingtypeid is null
*/

--publisherID
update stgCatalogValidateData
	set Problem = 'PublisherID'
from stgCatalogValidateData r
left join refPublishers p on r.publisherid = p.publisherid
where Problem is null and p.publisherid is null and r.publisherid is not null

--statuscode
update stgCatalogValidateData
	set Problem = 'StatusCode'
from stgCatalogValidateData r
left join refStatusCodes s on r.statuscode=s.statusid
where Problem is null and s.statusid is null

--language
update stgCatalogValidateData set Language ='English' where language is null

update stgCatalogValidateData
	set Problem = 'Language'
from stgCatalogValidateData r
left join refLanguage l on r.language = l.languagename
where Problem is null and l.languagename is null

--edition number
update stgCatalogValidateData
	set Problem = 'Edition Number length is greater than 5 characters'
where Problem is null and len(editionnumber)>5

--edition description
update stgCatalogValidateData
	set Problem = 'Length of edition description is greater than 50 characters'
where Problem is null and len(editiondescription) >50 and editiondescription is not null

--volume number
update stgCatalogValidateData
	set Problem = 'VolumeNumber'
where Problem is null and 0=isnumeric(isnull(volumenumber,1))

update stgCatalogValidateData set volumenumber = cast(cast(volumenumber as decimal(12,4)) as int)
--update stgCatalogValidateData set volumenumber = cast(volumenumber as int)

--number of volumes
update stgCatalogValidateData
	set Problem = 'NumberofVolumes'
where Problem is null and 0=isnumeric(isnull(numberofvolumes,1))

update stgCatalogValidateData set numberofvolumes = cast(cast(numberofvolumes as decimal(12,4)) as int)

--BISAC Subject Code

--NULL BisacSubjectCode1
update stgCatalogValidateData
	set Problem = 'BisacSubjectCode1 must not be null'
where Problem is null and bisacsubjectcode1 is null


--Identical BisacSubjectCode in ordinal 1&2 or 1&3 or 2&3
--Ordinals 1&2
update stgCatalogValidateData
	set Problem = 'Bisacsubjectcode1 is the same as Bisacsubjectcode2'
where Problem is null and bisacsubjectcode1 is not null and bisacsubjectcode2 is not null
and bisacsubjectcode1 = bisacsubjectcode2

--Ordinals 1&3
update stgCatalogValidateData
	set Problem = 'Bisacsubjectcode1 is the same as Bisacsubjectcode3'
where Problem is null and bisacsubjectcode1 is not null and bisacsubjectcode3 is not null
and bisacsubjectcode1 = bisacsubjectcode3

--Ordinals 2&3
update stgCatalogValidateData
	set Problem = 'Bisacsubjectcode2 is the same as Bisacsubjectcode3'
where Problem is null and bisacsubjectcode2 is not null and bisacsubjectcode3 is not null
and bisacsubjectcode2 = bisacsubjectcode3

--- SAP RTK BISAC removed
/*
--BisacSubject Code lookup
insert into #exceptions ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem])
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate, r.StreetDate, ISBN13, ReplacementISBN13, Imprint, 'BisacSubjectCode1 does not exist in retekdb.dbo.tbl_RTK_DeptMap'
from stgCatalogValidateData r
left join retekdb.dbo.tbl_RTK_DeptMap b
on r.BisacSubjectCode1 = b.bisaccode
where b.bisaccode is null and r.bisacsubjectcode1 is not null

delete stgCatalogValidateData  
from stgCatalogValidateData r
left join retekdb.dbo.tbl_RTK_DeptMap b
on r.BisacSubjectCode1 = b.bisaccode
where b.bisaccode is null and r.bisacsubjectcode1 is not null


insert into #exceptions ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem])
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, 'BisacSubjectCode2 does not exist in retekdb.dbo.tbl_RTK_DeptMap'
from stgCatalogValidateData r
left join retekdb.dbo.tbl_RTK_DeptMap b
on r.BisacSubjectCode2 = b.bisaccode
where b.bisaccode is null and r.bisacsubjectcode2 is not null

delete stgCatalogValidateData  
from stgCatalogValidateData r
left join retekdb.dbo.tbl_RTK_DeptMap b
on r.BisacSubjectCode2 = b.bisaccode
where b.bisaccode is null and r.bisacsubjectcode2 is not null

insert into #exceptions ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem])
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, 'BisacSubjectCode3 does not exist in retekdb.dbo.tbl_RTK_DeptMap'
from stgCatalogValidateData r
left join retekdb.dbo.tbl_RTK_DeptMap b
on r.BisacSubjectCode3 = b.bisaccode
where b.bisaccode is null and r.bisacsubjectcode3 is not null

delete stgCatalogValidateData  
from stgCatalogValidateData r
left join retekdb.dbo.tbl_RTK_DeptMap b
on r.BisacSubjectCode3 = b.bisaccode
where b.bisaccode is null and r.bisacsubjectcode3 is not null
*/

--Check bisac codes in TradeDB
update stgCatalogValidateData
	set Problem = 'BisacSubjectCode1 does not exist in Tradedb..refbisacsubjects'
from stgCatalogValidateData r
left join refBisacSubjects b on r.BisacSubjectCode1 = b.BISACCode
where Problem is null and b.BISACCode is null and r.bisacsubjectcode1 is not null

update stgCatalogValidateData
	set Problem = 'BisacSubjectCode2 does not exist in Tradedb..refbisacsubjects'
from stgCatalogValidateData r
left join refBisacSubjects b on r.BisacSubjectCode2 = b.BISACCode
where Problem is null and b.BISACCode is null and r.bisacsubjectcode2 is not null

update stgCatalogValidateData
	set Problem = 'BisacSubjectCode3 does not exist in Tradedb..refbisacsubjects'
from stgCatalogValidateData r
left join refBisacSubjects b on r.BisacSubjectCode3= b.BISACCode
where Problem is null and b.BISACCode is null and r.bisacsubjectcode3 is not null

--Check bisac codes in TradeDB
update stgCatalogValidateData
	set Problem = 'BisacSubjectCode1 does not exist in tblBisacToDeptToMerchCartMap'
from stgCatalogValidateData r
left join tblBisacToDeptToMerchCartMap b on r.BisacSubjectCode1 = b.bisaccode
where Problem is null and b.bisaccode is null and r.bisacsubjectcode1 is not null

update stgCatalogValidateData
	set Problem = 'BisacSubjectCode2 does not exist in tblBisacToDeptToMerchCartMap'
from stgCatalogValidateData r
left join tblBisacToDeptToMerchCartMap b on r.BisacSubjectCode2 = b.bisaccode
where Problem is null and b.bisaccode is null and r.bisacsubjectcode2 is not null

update stgCatalogValidateData
	set Problem = 'BisacSubjectCode3 does not exist in tblBisacToDeptToMerchCartMap'
from stgCatalogValidateData r
left join tblBisacToDeptToMerchCartMap b on r.BisacSubjectCode3 = b.bisaccode
where Problem is null and b.bisaccode is null and r.bisacsubjectcode3 is not null

-- SAP Binding Type
update stgCatalogValidateData
	set Problem = 'Binding does not exist in TradeDb.dbo.refbisacbindingtypes'
from stgCatalogValidateData r
left join refbisacbindingtypes b on r.Binding = b.bisacbindingtypeid
where Problem is null and b.bisacbindingtypeid is null and r.Binding is not null

-- SAP Return Format
update stgCatalogValidateData
	set Problem = 'Invalid Return Format'
from stgCatalogValidateData r
left join refReturnFormatSAPMap b on r.ReturnFormat = b.ReturnFormat
where Problem is null and b.ReturnFormat is null and r.ReturnFormat is not null

--number of pages
update stgCatalogValidateData
	set Problem = 'Invalid number of pages value'
where Problem is null and 0=isnumeric(isnull(numberofpages,1))

update stgCatalogValidateData
	set Problem = 'Invalid number of pages value. Do not use commas'
where Problem is null and numberofpages like '%,%'

update stgCatalogValidateData
	set Problem = 'Invalid number of pages value'
where Problem is null and convert(int, convert(decimal,numberofpages)) not between 0 and 32767

update stgCatalogValidateData set numberofpages = convert(int,convert(decimal(10,0), numberofpages))

--contributor roles
update stgCatalogValidateData
	set Problem = 'Invalid Contributor1role'
from stgCatalogValidateData r
left join refContributorRoles c on r.Contributor1role = c.roleid
where Problem is null and c.roleid is null and r.Contributor1role is not null

update stgCatalogValidateData
	set Problem = 'Invalid Contributor2role'
from stgCatalogValidateData r
left join refContributorRoles c on r.Contributor2role = c.roleid
where Problem is null and c.roleid is null and r.Contributor2role is not null

update stgCatalogValidateData
	set Problem = 'Invalid Contributor3role'
from stgCatalogValidateData r
left join refContributorRoles c on r.Contributor3role = c.roleid
where Problem is null and c.roleid is null and r.Contributor3role is not null

--contributor 1,2,3 lastname null role not null
update stgCatalogValidateData
	set Problem = 'Contributor1LastName Null, Contributor1Role not null'
where Problem is null and Contributor1LastName is null and Contributor1role is not null

update stgCatalogValidateData
	set Problem = 'Contributor2LastName Null, Contributor2Role not null'
where Problem is null and Contributor2lastname is null and Contributor2role is not null

update stgCatalogValidateData
	set Problem = 'Contributor3LastName Null, Contributor3Role not null'
where Problem is null and Contributor3LastName is null and Contributor3role is not null

update stgCatalogValidateData
	set Problem = 'Contributor1LastName not null, Contributor1Role null'
where Problem is null and Contributor1LastName is not null and Contributor1role is null

update stgCatalogValidateData
	set Problem = 'Contributor2LastName not null, Contributor2Role null'
where Problem is null and Contributor2LastName is not null and Contributor2role is null

update stgCatalogValidateData
	set Problem = 'Contributor3LastName not null, Contributor3Role null'
where Problem is null and Contributor3LastName is not null and Contributor3role is null


--lastname null, role null, firstname not null or InitialMiddleName is not null
update stgCatalogValidateData
	set Problem = 'Contributor1LastName null, Contributor1Role null and (Contributor1FirstName not null or Contributor1InitialMiddleName is not null)'
where Problem is null and Contributor1LastName is null and Contributor1role is null and (Contributor1FirstName is not null or Contributor1InitialMiddleName is not null)

update stgCatalogValidateData
	set Problem = 'Contributor2LastName null, Contributor2Role null and (Contributor2FirstName not null or Contributor2InitialMiddleName is not null)'
where Problem is null and Contributor2lastname is null and Contributor2role is null and (Contributor2firstname is not null or Contributor2InitialMiddleName is not null)

update stgCatalogValidateData
	set Problem = 'Contributor3LastName null, Contributor3Role null and (Contributor3FirstName not null or Contributor3InitialMiddleName is not null)'
where Problem is null and Contributor3lastname is null and Contributor3role is null and (Contributor3firstname is not null or Contributor3InitialMiddleName is not null)


--lastname not null, roll not null, InitialMiddleName not null, firstname null
update stgCatalogValidateData
	set Problem = 'Contributor1LastName not null, Contributor1role not null, Contributor1InitialMiddleName not null, Contributor1FirstName null'
where Problem is null and Contributor1LastName is not null and Contributor1role is not null and Contributor1InitialMiddleName is not null and Contributor1FirstName is null

update stgCatalogValidateData
	set Problem = 'Contributor2LastName not null, Contributor2role not null, Contributor2InitialMiddleName not null, Contributor2FirstName null'
where Problem is null and Contributor2lastname is not null and Contributor2role is not null and Contributor2InitialMiddleName is not null and Contributor2firstname is null

update stgCatalogValidateData
	set Problem = 'Contributor3LastName not null, Contributor3role not null, Contributor3InitialMiddleName not null, Contributor3FirstName null'
where Problem is null and Contributor3lastname is not null and Contributor3role is not null and Contributor3InitialMiddleName is not null and Contributor3firstname is null


--Duplicate Contributors in different ordinal values.
update stgCatalogValidateData
	set Problem = 'Contributor1 is the same as Contributor2'
where Problem is null and Contributor1Role + Contributor1LastName + isnull(Contributor1FirstName,'') + isnull(contributor1InitialMiddleName,'') 
= isnull(Contributor2Role,'') + isnull(Contributor2LastName,'') + isnull(Contributor2FirstName,'') + isnull(contributor2InitialMiddleName,'')

update stgCatalogValidateData
	set Problem = 'Contributor2 is the same as Contributor3'
where Problem is null and Contributor3Role + Contributor3LastName + isnull(Contributor3FirstName,'') + isnull(contributor3InitialMiddleName,'') 
= isnull(Contributor2Role,'') + isnull(Contributor2LastName,'') + isnull(Contributor2FirstName,'') + isnull(contributor2InitialMiddleName,'')

update stgCatalogValidateData
	set Problem = 'Contributor1 is the same as Contributor3'
where Problem is null and Contributor1Role + Contributor1LastName + isnull(Contributor1FirstName,'') + isnull(contributor1InitialMiddleName,'') 
= isnull(Contributor3Role,'') + isnull(Contributor3LastName,'') + isnull(Contributor3FirstName,'') + isnull(contributor3InitialMiddleName,'')


-- age lower, age upper
update stgCatalogValidateData
	set Problem = 'agelowerlimit'
where Problem is null and 0=isnumeric(isnull(agelowerlimit,1))

update stgCatalogValidateData 
	set agelowerlimit = floor(agelowerlimit)
where agelowerlimit is not null

update stgCatalogValidateData
	set Problem = 'agelowerlimit'
where Problem is null and (cast(agelowerlimit as int)>255 or cast(agelowerlimit as int) < 0) and agelowerlimit is not null

update stgCatalogValidateData set agelowerlimit = convert(int, convert(decimal,agelowerlimit))

update stgCatalogValidateData
	set Problem = 'ageupperlimit'
where Problem is null and 0=isnumeric(isnull(ageupperlimit,1))

update stgCatalogValidateData
	set ageupperlimit = floor(ageupperlimit)
where ageupperlimit is not null

update stgCatalogValidateData
	set Problem = 'ageupperlimit'
where Problem is null and (cast(ageupperlimit as int)>255 or cast(ageupperlimit as int) < 0) and ageupperlimit is not null

update stgCatalogValidateData set ageupperlimit = convert(int, convert(decimal,ageupperlimit))

--grade upper limit and lower limit
update stgCatalogValidateData
	set Problem = 'Grade Lower Limit, value must be from refAudienceGrades'
from stgCatalogValidateData r
left join refAudienceGrades a on r.gradelowerlimit = a.audiencegrade 
where Problem is null and r.gradelowerlimit is not null and a.audiencegrade is null

update stgCatalogValidateData
	set Problem = 'Grade Upper Limit, value must be from refAudienceGrades'
from stgCatalogValidateData r
left join refAudienceGrades a on r.gradeupperlimit = a.audiencegrade 
where Problem is null and r.gradeupperlimit is not null and a.audiencegrade is null

--audience code
update stgCatalogValidateData
	set Problem = 'Audience code'
from stgCatalogValidateData r 
left join refAudienceCodes au on r.audiencecode = au.audiencecode
where Problem is null and au.audiencecode is null and r.audiencecode is not null

-- height, width, depth
update stgCatalogValidateData
	set Problem = 'Height'
where Problem is null and (0=isnumeric(isnull(height,1))or height='.' or height like '%E%'  or height  like '%$%')

update stgCatalogValidateData set height = convert(decimal(12, 2), height)

update stgCatalogValidateData
	set Problem = 'Invalid Height specified'
where Problem is null and (cast(height as decimal) >2000.00 or cast(height as decimal) <0.00)


update stgCatalogValidateData
	set Problem = 'Width'
where Problem is null and (0=isnumeric(isnull(width,1)) or width='.'  or width like '%E%'  or width  like '%$%')

update stgCatalogValidateData set width = convert(decimal(12, 2), width)

update stgCatalogValidateData
	set Problem = 'Invalid Width specified'
where Problem is null and (cast(width as decimal) >2000.00 or cast(width as decimal) <0.00)


update stgCatalogValidateData
	set Problem = 'Depth'
where Problem is null and (0=isnumeric(isnull(depth,1)) or depth='.'  or depth like '%E%'  or depth  like '%$%')

update stgCatalogValidateData set depth = convert(decimal(12, 2), depth)

update stgCatalogValidateData
	set Problem = 'Invalid Depth specified'
where Problem is null and (cast(depth as decimal) >2000.00 or cast(depth as decimal) <0.00)


--May 31st Tahseen Shabab
--1. Validation for zero ItemPrice
update stgCatalogValidateData
	set Problem = 'Pricing Field Cannot Hold Zero Value Price'
where Problem is null and cast(ItemPrice as decimal) =0

--Converting all the left over entries with positive item price to 
-- the standard decimal format
update stgCatalogValidateData set ItemPrice = convert(decimal(12, 2), ItemPrice)

--2.Validation for Negative value of ItemPrice   Tahseen Shabab
update stgCatalogValidateData
	set Problem = 'Pricing Field Cannot Hold A Negative Value'
where Problem is null and cast(ItemPrice as decimal) <0

--Converting all the left over entries with positive item price to 
-- the standard decimal format
update stgCatalogValidateData set ItemPrice = convert(decimal(12, 2), ItemPrice) 

--3. Validation for Negative value of ForeignVendCadRetail     Tahsee Shabab 

update stgCatalogValidateData
	set Problem = 'ForeignVendCadRetail Field Cannot Hold A Negative Value'
where Problem is null and cast(ForeignVendCadRetail as decimal) <0

--Converting all the left over entries with positive item price to 
-- the standard decimal format
update stgCatalogValidateData set ForeignVendCadRetail = convert(decimal(12, 2), ForeignVendCadRetail) 

--4. Validation for Negative value of USDRetailPrice         Tahseen Shabab
update stgCatalogValidateData
	set Problem = 'USDRetailPrice Field Cannot Hold A Negative Value'
where Problem is null and cast(USDRetailPrice as decimal) <0

--Converting all the left over entries with positive item price to 
-- the standard decimal format
update stgCatalogValidateData set USDRetailPrice = convert(decimal(12, 2), USDRetailPrice)

--5. Validation for Characters over 10 Runtime				Tahseen Shabab
update stgCatalogValidateData
	set Problem = 'Invalid RunTime Length - Should Not Be Longer Then 10 Characters'
where Problem is null and (len(RunTime))>10

--6. Validation for Numeric Characters Runtime				Tahseen Shabab
update stgCatalogValidateData
	set Problem = 'Invalid RunTime Field Type - Should Be Numeric'
where Problem is null and (RunTime is not null) and ((isnumeric(substring(RunTime,1,3))=0) or (isnumeric(substring(RunTime,5,2))=0) or (isnumeric(substring(RunTime,8,2))=0))

--7. Validation for Null ItemPrice				Tahseen Shabab
--1. Validation for Null ItemPrice change to testing with a string rather than an int		Ester Bogod 
update stgCatalogValidateData
	set Problem = 'ItemPrice - Missing Mandatory field for Insert'
where Problem is null and ISNULL(ItemPrice,'')=''

--measurement units
update stgCatalogValidateData
	set Problem = 'Measurement Units'
from stgCatalogValidateData r
left join refLinearMeasurementUnits l on r.measurementunits = l.unitid
where Problem is null and l.unitid is null and r.measurementunits is not null

--weight
update stgCatalogValidateData
	set Problem = 'Weight'
where Problem is null and (0=isnumeric(isnull(weight,1)) or weight like '$%')

update stgCatalogValidateData
	set Problem = 'Invalid Weight Value. Must be between 0 and 10000'
where Problem is null and (cast(weight as decimal(10,2))>=10000 or cast(weight as decimal(10,2))<0)

--weight units
update stgCatalogValidateData
	set Problem = 'Weight units is greater than 2 characters'
where Problem is null and len(weightunits) >2

--cartonQuantity
update stgCatalogValidateData
	set Problem = 'CartonQuantity must be a numeric value'
where Problem is null and (isnumeric(cartonquantity)=0 or cartonquantity like '$%')

update stgCatalogValidateData
	set Problem = 'CartonQuantity must be between 0 and 255'
where Problem is null and 0=isnumeric(isnull(cartonquantity,1)) and not(convert(int, cartonquantity) between 0 and 255)

--MinimumOrderQuantity
update stgCatalogValidateData
	set Problem = 'MinimumOrderQuantity must be a numeric value'
where Problem is null and 0=isnumeric(isnull(MinimumOrderQuantity,1)) 

update stgCatalogValidateData
	set Problem = 'MinimumOrderQuantity must be between 0 and 32767'
where Problem is null and not(cast(minimumorderquantity as int)between 0 and 32767) and minimumorderquantity is not null

--SuggestedBuy
update stgCatalogValidateData
	set Problem = 'SuggestedBuy can only have a maximum of 255 characters'
where Problem is null and len(suggestedbuy) >255

--- SAP Return Format
update stgCatalogValidateData
	set Problem = 'Incorrect ReturnFormat'
from stgCatalogValidateData r
left join refReturnFormatSAPMap m on r.ReturnFormat = m.ReturnFormat
where Problem is null and r.ReturnFormat is not null and m.ReturnFormat is null

-- Added for Flamingo Phase 2 -- seriesTitle table check
update stgCatalogValidateData
set seriestitle = dbo.FindSeriesTitle(sapvendorid, seriestitle)

update stgCatalogValidateData
	set Problem = 'No SeriesTitle could be found in the SeriesTitle Reference Table'
where Problem is null and lower(seriestitle) like lower('%NoMatchFound%')

-- Added for Flamingo Phase 2 -- Imprint table check
update stgCatalogValidateData
set imprint = dbo.FindImprint(sapvendorid, imprint)

update stgCatalogValidateData
	set Problem = 'No Imprint could be found in the Imprint Reference Table'
where Problem is null and lower(imprint) like lower('%NoMatchFound%')

-- April 18, 2007
-- Added the Imprint field validation logic: input can not over 100 characters
-- Imprint 
update stgCatalogValidateData
	set Problem = 'Imprint only have a maximum of 100 characters'
where Problem is null and len(Imprint) > 100

--ReplacementCode
update stgCatalogValidateData
	set Problem = 'Incorrect ReplacementCode'
from stgCatalogValidateData r
left join refReplacementCode c on r.ReplacementCode = c.ReplacementCode 
where Problem is null and r.ReplacementCode is not null and c.ReplacementCode is null 

--OPDate
update stgCatalogValidateData
	set Problem = 'OPDate should be in valid date format MM/DD/YYYY'
where Problem is null and OPDate is not null and isdate(OPDate)= 0

--StreetDate
update stgCatalogValidateData
	set Problem = 'StreetDate should be in valid date format MM/DD/YYYY'
where Problem is null and StreetDate is not null and isdate(StreetDate)= 0

-- CartonQuantity
update stgCatalogValidateData
	set Problem = 'CartonQuantity should be less then 9999'
where Problem is null and CartonQuantity > 9999.000

-- Added by JaeSung Moon on July 2, 2009
-- FSC-Recycled Content

-- PaperCertificationType validation:	when the imported record is not empty, only accept the input with the following conditions:
--										1.	numeric input
--July 3rd, 2009. JaeSung Moon, FSC-Recycled Content
update stgCatalogValidateData
	set Problem = 'PaperCertificationType is not a numerical value'
where Problem is null and PaperCertificationType is not null and isnumeric(PaperCertificationType) = 0


-- ChainofCustody validation:	when the imported record is not empty, only accept the input with the following conditions:
--								1.	input format: "?????-COC-######", where "?????" are alpha characters  and "#######" are numeric characters
--								2.	max. 16 characters
--								3.	last ####### input must have 6 digits
--								4.	first ????? input has to be between 2~5 characters
--July 3rd, 2009. JaeSung Moon, FSC-Recycled Content

--	Values to change when the alpha(?????) input increases from 5 to ?:
--	Ex) 5 to 7
--	len(ChainofCustody) > 16															->			len(ChainofCustody) > (16 - 5 + 7)
--	len(ChainofCustody)-11 < 2 or len(ChainofCustody)-11 > 5							->			len(ChainofCustody)-11 < 2 or len(ChainofCustody)-11 > 7

--	Values to change when the numeric(######) input increases from 6 to #:
--	Ex) 6 to 12
--	substring(right(ChainofCustody, 11), 1, 5) <> '-COC-'								->			substring(right(ChainofCustody, (11 - 6 + 12)), 1, 5) <> '-COC-'
--	len(ChainofCustody) > 16															->			len(ChainofCustody) > (16 - 6 + 12)
--	isnumeric(right(ChainofCustody, 6)) = 0												->			isnumeric(right(ChainofCustody, 12)) = 0
--	patindex('%[0-9]%', substring(ChainofCustody, 1, len(ChainofCustody)-11)) <> 0		->			patindex('%[0-9]%', substring(ChainofCustody, 1, len(ChainofCustody)- (11 - 6 + 12)) <> 0
--	len(ChainofCustody)-11 < 2 or len(ChainofCustody)-11 > 5							->			len(ChainofCustody)-(11 - 6 + 12) < 2 or len(ChainofCustody)-(11 - 6 + 12) > 5
update stgCatalogValidateData
	set Problem = 'ChainofCustody is not in the right format'
where Problem is null and 
	(substring(right(ChainofCustody, 11), 1, 5) <> '-COC-' or len(ChainofCustody) > 16 or isnumeric(right(ChainofCustody, 6)) = 0 or patindex('%[0-9]%', substring(ChainofCustody, 1, len(ChainofCustody)-11)) <> 0 or (len(ChainofCustody)-11 < 2 or len(ChainofCustody)-11 > 5)) and ChainofCustody is not null



--	CertifiedPostConsumerWaste_PCW validation:	when the imported record is not empty, only accept the input with the following conditions:
--												1.	numeric input
--	July 3rd, 2009. JaeSung Moon, FSC-Recycled Content
update stgCatalogValidateData
	set Problem = 'CertifiedPostConsumerWaste_PCW is not a numerical value'
where Problem is null and CertifiedPostConsumerWaste_PCW is not null and isnumeric(CertifiedPostConsumerWaste_PCW) = 0

-- CertifiedPCWPercentage validation:	when the imported record is not empty, only accept the input with the following conditions:
--										1.	numeric input	
--										2.	no decimal (only whole numbers)
--										3.	max. 3 digits
--										4.	max. percentage of 100
--July 3rd, 2009. JaeSung Moon, FSC-Recycled Content
update stgCatalogValidateData
	set Problem = 'CertifiedPCWPercentage is not a whole number or a numerical value'
where Problem is null and 
	(isnumeric(CertifiedPCWPercentage) = 0 or charindex('.', CertifiedPCWPercentage) > 0 or len(CertifiedPCWPercentage) > 3 or CertifiedPCWPercentage > 100) and CertifiedPCWPercentage is not null

-- UncertifiedPCW validation:	when the imported record is not empty, only accept the input with the following conditions:
--								1.	numeric input
--July 3rd, 2009. JaeSung Moon, FSC-Recycled Content
update stgCatalogValidateData
	set Problem = 'UncertifiedPCW is not a numerical value'
where Problem is null and UncertifiedPCW is not null and isnumeric(UncertifiedPCW) = 0

-- UncertifiedPCWPercentage validation:		when the imported record is not empty, only accept the input with the following conditions:
--											1.	numeric input	
--											2.	no decimal (only whole numbers)
--											3.	max. 3 digits
--											4.	max. percentage of 100
--July 3rd, 2009. JaeSung Moon, FSC-Recycled Content
update stgCatalogValidateData
	set Problem = 'UncertifiedPCWPercentage is not a whole number or a numerical value'
where Problem is null and 
	(isnumeric(UncertifiedPCWPercentage) = 0 or charindex('.', UncertifiedPCWPercentage) > 0 or len(UncertifiedPCWPercentage) > 3 or UncertifiedPCWPercentage > 100) and UncertifiedPCWPercentage is not null

-- 6.      July 24,2008 - Victor Guo. US$ SOS
-- Sync ItemPrice and USDRetailPrice
UPDATE stgCatalogValidateData
SET USDRetailPrice = ItemPrice
WHERE ( USDRetailPrice IS NULL OR  RTRIM(LTRIM(USDRetailPrice)) = '' ) 
AND  ItemPriceCurrency='USD'
-- End of 6.      July 24,2008 - Victor Guo. US$ SOS

-- move all invalidated items into the #exceptions table
insert into #exceptions ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate,StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem], ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, ClassOfTradeName, ClassOfTradeCode, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage)
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate,r.StreetDate, ISBN13, ReplacementISBN13, Imprint, Problem, r.ClassOfTrade, r.Contributor1CountryCode, r.Contributor2CountryCode, r.Contributor3CountryCode, r.BISACRegionCode, r.RunTime, r.ClassOfTradeName, r.ClassOfTradeCode, r.PaperCertificationType, r.ChainofCustody, r.CertifiedPostConsumerWaste_PCW, r.CertifiedPCWPercentage, r.UncertifiedPCW, r.UncertifiedPCWPercentage
from stgCatalogValidateData r  
where Problem is not null

delete stgCatalogValidateData where Problem is not null


insert CatalogImportExceptions  ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem], ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, ClassOfTradeName, ClassOfTradeCode, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage)
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate, r.StreetDate, ISBN13, ReplacementISBN13, Imprint, r.[problem], r.ClassOfTrade, r.Contributor1CountryCode, r.Contributor2CountryCode, r.Contributor3CountryCode, r.BISACRegionCode, r.RunTime, r.ClassOfTradeName, r.ClassOfTradeCode, r.PaperCertificationType, r.ChainofCustody, r.CertifiedPostConsumerWaste_PCW, r.CertifiedPCWPercentage, r.UncertifiedPCW, r.UncertifiedPCWPercentage
from #exceptions r

insert CatalogImportUserExceptions  ([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [Problem], ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, ClassOfTradeName, ClassOfTradeCode, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage)
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate, r.StreetDate, ISBN13, ReplacementISBN13, Imprint, r.[problem], r.ClassOfTrade, r.Contributor1CountryCode, r.Contributor2CountryCode, r.Contributor3CountryCode, r.BISACRegionCode, r.RunTime, r.ClassOfTradeName, r.ClassOfTradeCode, r.PaperCertificationType, r.ChainofCustody, r.CertifiedPostConsumerWaste_PCW, r.CertifiedPCWPercentage, r.UncertifiedPCW, r.UncertifiedPCWPercentage
from #exceptions r


--select @count = count(*) from #exceptions
--declare @emailmessage varchar(255)
--if @count = 1
--begin
--	set @emailmessage = '1 new exception has been added to the table CatalogImportUserExceptions'
--	--JaeSung Moon, July 15, 2009, FSC-Recycle Content
--	--exec master.dbo.xp_sendmail @recipients = @emailrecipients, @subject = 'TradeDb - Exceptions', @message = @emailmessage
--	exec master..xp_sendmail @recipients = @emailrecipients, @subject = 'TradeDb - Exceptions', @message = @emailmessage
--end
--if @count >1
--begin
--	set @emailmessage = cast(@count as varchar(25)) +' new exceptions have been added to the table CatalogImportUserExceptions'
--	--exec master.dbo.xp_sendmail @recipients = @emailrecipients, @subject = 'TradeDb - Exceptions', @message = @emailmessage
--	exec master..xp_sendmail @recipients = @emailrecipients, @subject = 'TradeDb - Exceptions', @message = @emailmessage
--end

--Update CatalogImportStatRow for statistics
update CatalogImportStatRow set InvalidCatalogDBRows  = b.InvalidCatalogDBRows
from CatalogImportStatFile a join (
select filename, count(*) 'InvalidCatalogDBRows'
from #exceptions
group by filename)b
on a.filename = b.filename
join CatalogImportStatRow c
on c.fileid = a.fileid


update CatalogImportStatRow set ValidCatalogDBRows  = b.ValidCatalogDBRows
from CatalogImportStatFile a join (
select filename, count(*) 'ValidCatalogDBRows'
from stgCatalogValidateData
group by filename)b
on a.filename = b.filename
join CatalogImportStatRow c
on c.fileid = a.fileid

update CatalogImportStatRow set ValidCatalogDBRows = 0 where ValidCatalogDBRows is null

update CatalogImportStatRow set InvalidCatalogDBRows = 0 where InvalidCatalogDBRows is null

--Processed =1 shows that the imported data has be inserted into stgCatalogValidateData
update stgCatalogImport set ProcessStatus=1
from stgCatalogImport a 
join stgCatalogValidateData b
on a.id=b.id
where ProcessStatus = 0

-- Aug 27, 2008 - Vasanth Petlu. SCMFL-1 Catdb archive changes 
-- Insert only validated data into archive table
--Archive data
insert into CatalogImportArchive([ID], [pid], [VendorID], [ISBN], [Title], [Subtitle], [SeriesTitle], [Contributor1Role], [Contributor1LastName], [Contributor1FirstName], [Contributor1InitialMiddleName], [Contributor2Role], [Contributor2LastName], [Contributor2FirstName], [Contributor2InitialMiddleName], [Contributor3Role], [Contributor3LastName], [Contributor3FirstName], [Contributor3InitialMiddleName], [Media], [Binding], [ItemPrice], [ForeignVendCADRetail], [USDRetailPrice], [ItemPriceCurrency], [Discount], [PubDate], [StatusCode], [PublisherID], [BisacSubjectCode1], [BisacSubjectCode2], [BisacSubjectCode3], [SuggestedBuy], [PrintQuantity], [OLDISBN], [OLDISBNOutofPrintDate], [EditionNumber], [EditionDescription], [VolumeNumber], [NumberofVolumes], [NumberofPages], [Height], [Width], [Depth], [MeasurementUnits], [Weight], [WeightUnits], [CartonQuantity], [MinimumOrderQuantity], [CanadianTitle], [AudienceCode], [GradeLowerLimit], [GradeUpperLimit], [AgeLowerLimit], [AgeUpperLimit], [Language], [FileName], [DateCreated], [Catalogue Name], [Catalogue Page Number], ReturnFormat, SAPVendorID, VSRCode, ReplacementISBN, ReplacementCode, OPDate, StreetDate, ISBN13, ReplacementISBN13, Imprint, [ProcessStatus], ClassOfTrade, Contributor1CountryCode, Contributor2CountryCode, Contributor3CountryCode, BISACRegionCode, RunTime, PaperCertificationType, ChainofCustody, CertifiedPostConsumerWaste_PCW, CertifiedPCWPercentage, UncertifiedPCW, UncertifiedPCWPercentage)
select r.[ID], r.[pid], r.[VendorID], r.[ISBN], r.[Title], r.[Subtitle], r.[SeriesTitle], r.[Contributor1Role], r.[Contributor1LastName], r.[Contributor1FirstName], r.[Contributor1InitialMiddleName], r.[Contributor2Role], r.[Contributor2LastName], r.[Contributor2FirstName], r.[Contributor2InitialMiddleName], r.[Contributor3Role], r.[Contributor3LastName], r.[Contributor3FirstName], r.[Contributor3InitialMiddleName], r.[Media], r.[Binding], r.[itemPrice], r.[ForeignVendCADRetail], r.[USDRetailPrice], r.[ItemPriceCurrency], r.[Discount], r.[PubDate], r.[StatusCode], r.[PublisherID], r.[BisacSubjectCode1], r.[BisacSubjectCode2], r.[BisacSubjectCode3], r.[SuggestedBuy], r.[PrintQuantity], r.[OLDISBN], r.[OLDISBNOutofPrintDate], r.[EditionNumber], r.[EditionDescription], r.[VolumeNumber], r.[NumberofVolumes], r.[NumberofPages], r.[Height], r.[Width], r.[Depth], r.[MeasurementUnits], r.[Weight], r.[WeightUnits], r.[CartonQuantity], r.[MinimumOrderQuantity], r.[CanadianTitle], r.[AudienceCode], r.[GradeLowerLimit], r.[GradeUpperLimit], r.[AgeLowerLimit], r.[AgeUpperLimit], r.[Language], r.[FileName], r.[DateCreated], r.[Catalogue Name], r.[Catalogue Page Number], r.ReturnFormat, r.SAPVendorID, r.VSRCode, r.ReplacementISBN, r.ReplacementCode, r.OPDate, r.StreetDate, ISBN13, ReplacementISBN13, Imprint, r.[ProcessStatus], r.ClassOfTrade, r.Contributor1CountryCode, r.Contributor2CountryCode, r.Contributor3CountryCode, r.BISACRegionCode, r.RunTime, r.PaperCertificationType, r.ChainofCustody, r.CertifiedPostConsumerWaste_PCW, r.CertifiedPCWPercentage, r.UncertifiedPCW, r.UncertifiedPCWPercentage
from stgCatalogImport r  
where processstatus=1

update stgCatalogImport set ProcessStatus=1
from stgCatalogImport a 
join CatalogImportUserExceptions b
on a.id=b.id
where ProcessStatus = 0

delete stgCatalogImport where processstatus=1


select @exceptionCount = count(*) from #exceptions
select @validCount = count(*) from stgCatalogValidateData

Select @exceptionCount as ExceptionCount,
	@validCount as ValidCount
GO

GRANT EXECUTE ON [dbo].[Catalog_ValidateCatalogData] TO [CatalogImportApp]; 
GO