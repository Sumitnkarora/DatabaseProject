CREATE PROCEDURE [dbo].[sp_BowkerUpload] 
AS

/***************  Works **************************/

select  distinct '978' + left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9) as PID, p.IDValue as ISBN, max(w.IDValue) as WorkID
into #tmp
from stgBowkerProductIdentifier p 
join stgBowkerWorkIdentifier w on p.RecordReference = w.RecordReference
where ProductIDType = '02' and len(ltrim(rtrim(replace(p.IDValue, ' ', '')))) = 10 
group by p.IDValue

MERGE INTO BowkerWorks bw
USING (SELECT PID, MIN(WorkID) as WorkID FROM #tmp GROUP BY PID) bwtmp
	ON bw.pid = bwtmp.pid
WHEN MATCHED
THEN UPDATE SET	
	WorkID = bwtmp.WorkID,
	DateChanged = GETDATE()
WHEN NOT MATCHED BY TARGET
THEN INSERT (PID, WorkID, DateChanged) 
	VALUES(bwtmp.PID, bwtmp.WorkID, GETDATE());

drop table #tmp

/***************  Categories **************************/

delete stgBowkerSubject
where SubjectHeadingText is null or rtrim(ltrim(SubjectHeadingText)) = ''

select distinct '978' + left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9) as PID, SubjectCode, SubjectHeadingText  
into #tmp1
from stgBowkerProductIdentifier p 
join stgBowkerSubject w on p.RecordReference = w.RecordReference
where SubjectSchemeIdentifier = '24' and isnumeric(left(ltrim(rtrim(p.IDValue)), 9))<>0 
	and ProductIDType = '02' and len(ltrim(rtrim(replace(p.IDValue, ' ', '')))) = 10 

select PID, SubjectCode
into #dup
from #tmp1
group by PID, SubjectCode
having count(*) > 1

delete #tmp1
from #tmp1 t 
join #dup d on t.PID = d.pid and t.SubjectCode = d.SubjectCode

update #tmp1
set SubjectHeadingText = replace(SubjectHeadingText, '_', ' ')
where SubjectHeadingText like '%_%'

MERGE INTO BowkerCategories bc
USING (SELECT PID, SubjectCode, SubjectHeadingText FROM #tmp1 where SubjectCode IS NOT NULL) bctmp
	ON bc.pid = bctmp.pid AND bc.SubjectCode  = bctmp.SubjectCode
WHEN MATCHED
THEN UPDATE SET	
	Category = bctmp.SubjectHeadingText,
	DateChanged = GETDATE()
WHEN NOT MATCHED BY TARGET
THEN INSERT (PID, SubjectCode, Category, DateChanged) 
	VALUES(bctmp.PID, bctmp.SubjectCode, bctmp.SubjectHeadingText, GETDATE());

drop table #tmp1

/***************  Audience NOTE: REMOVE CONSTRAINT TO tbl_001_titles **************************/
truncate table stgAudiences

SELECT  distinct '978' + left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9) as PID, RangesXML, AudienceRangeQualifier
into #AR
FROM stgBowkerProductIdentifier p 
join stgBowkerAudienceRange w on p.RecordReference = w.RecordReference
WHERE ProductIDType = '02' and len(ltrim(rtrim(replace(p.IDValue, ' ', '')))) = 10 
	and RangesXML is not null and ltrim(rtrim(RangesXML)) <> '' 


UPDATE #AR
SET RangesXML = REPLACE (RangesXML,'<audiencerange><b075>', '')

UPDATE #AR
SET RangesXML = REPLACE (RangesXML,'</audiencerange>', '')

select 	PID,
	AudienceRangeQualifier,
	SUBSTRING  (RangesXML, 1, PATINDEX ( '%</b075>%' , RangesXML )-1) AS B075A,
	SUBSTRING  (RangesXML, PATINDEX ( '%<b076>%' , RangesXML ) + 6, PATINDEX ( '%</b076>%' , RangesXML ) - PATINDEX ( '%<b076>%' , RangesXML ) - 6) AS BO76A, 
	CAST (NULL AS VARCHAR(10)) AS B075B,
	CAST (NULL AS VARCHAR(10)) AS B076B,
	RIGHT(RangesXML, LEN (RangesXML) - (PATINDEX ( '%</b076>%' , RangesXML ) + 6)) AS TMP,
	RangesXML
INTO #AR1
from #ar

UPDATE  #AR1
SET B075B = SUBSTRING  (TMP, PATINDEX ( '%<b075>%' , TMP ) + 6, PATINDEX ( '%</b075>%' , TMP ) - PATINDEX ( '%<b075>%' , TMP ) - 6),
	B076B = SUBSTRING  (TMP, PATINDEX ( '%<b076>%' , TMP ) + 6, PATINDEX ( '%</b076>%' , TMP ) - PATINDEX ( '%<b076>%' , TMP ) - 6)
WHERE LTRIM(RTRIM(TMP)) <> ''

update #ar1
set B076B = BO76A 
where B075A = '01'

update #ar1
set B076B = BO76A,  BO76A = null
where B076B is null
and B075A = '04'

update #ar1
set BO76A = null
where isnumeric(BO76A) = 0
	and AudienceRangeQualifier in (17, 18)

update #ar1
set B076B = null
where isnumeric(B076B) = 0
	and AudienceRangeQualifier in (17, 18)

insert into stgAudiences (PID)
select distinct PID from #ar1

update stgAudiences
set MinAudienceAge = BO76A, MaxAudienceAge = B076B 
from #ar1 t
join stgAudiences a on t.pid = a.pid
where AudienceRangeQualifier = 17

update stgAudiences
set MinAudienceGrade = BO76A, MaxAudienceGrade = B076B
from #ar1 t
join stgAudiences a on t.pid = a.pid
where AudienceRangeQualifier = 11

update stgAudiences
set MinAudienceGrade = BO76A, MaxAudienceGrade = B076B
from #ar1 t
join stgAudiences a on t.pid = a.pid
where AudienceRangeQualifier = 18 and BO76A is null and B076B is null

SELECT  '978' + left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9) as PID, AudienceCode
into #AC
FROM stgBowkerProductIdentifier p 
join stgBowkerAudience w on p.RecordReference = w.RecordReference
where ProductIDType = '02' and len(ltrim(rtrim(replace(p.IDValue, ' ', '')))) = 10 

UPDATE stgAudiences
set AudienceCode = a.AudienceCode
from stgAudiences c
join #AC t on c.pid = t.pid
join refAudienceCodes a on t.AudienceCode = a.AudienceCode

UPDATE stgAudiences
SET MinAudienceGrade = RIGHT('00' + LTRIM(RTRIM(MinAudienceGrade)), 2)
WHERE ISNUMERIC(MinAudienceGrade) <> 0

UPDATE stgAudiences
SET MaxAudienceGrade = RIGHT('00' + LTRIM(RTRIM(MaxAudienceGrade)), 2)
WHERE ISNUMERIC(MaxAudienceGrade) <> 0 

UPDATE stgAudiences
SET MinAudienceGrade = '0P'
WHERE MinAudienceGrade = 'ps' OR MinAudienceGrade = '00'

UPDATE stgAudiences
SET MaxAudienceGrade = '0P'
WHERE MaxAudienceGrade = 'ps' OR MaxAudienceGrade = '00'

delete stgAudiences
where MaxAudienceGrade not in (select AudienceGrade from refAudienceGrades)

delete  stgAudiences
where MinAudienceGrade not in (select AudienceGrade from refAudienceGrades)


MERGE INTO BowkerAudiences ba
USING (SELECT PID, MinAudienceAge, MaxAudienceAge, MinAudienceGrade, MaxAudienceGrade, AudienceCode FROM stgAudiences) batmp
	ON ba.pid = batmp.pid
WHEN MATCHED
THEN UPDATE SET	
	MinAudienceAge = batmp.MinAudienceAge,
	MaxAudienceAge = batmp.MaxAudienceAge,
	MinAudienceGrade = batmp.MinAudienceGrade,
	MaxAudienceGrade = batmp.MaxAudienceGrade,
	AudienceCode = batmp.AudienceCode,
	ChangedBy = USER_NAME(),
	DateChanged = GETDATE()
WHEN NOT MATCHED BY TARGET
THEN INSERT (PID, MinAudienceAge, MaxAudienceAge, MinAudienceGrade, MaxAudienceGrade, 
		AudienceCode, CreatedBy, ChangedBy, DateCreated, DateChanged) 
	VALUES(batmp.PID, batmp.MinAudienceAge, batmp.MaxAudienceAge, batmp.MinAudienceGrade, batmp.MaxAudienceGrade, 
		batmp.AudienceCode, USER_NAME(), USER_NAME(), GETDATE(), GETDATE());

drop table #AC
drop table #ar
drop table #ar1



/***************  Awards **************************/

select distinct '978' + left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9) as PID, PrizeCode, PrizeName, PrizeYear, PrizeCountry
into #tmp2
from stgBowkerProductIdentifier p 
join stgBowkerPrize w on p.RecordReference = w.RecordReference
where ProductIDType = '02' and isnumeric(left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9)) <> 0 

insert into BowkerAwards(PID, PrizeCode, PrizeName, PrizeYear, PrizeCountry, DateCreated)
select t.PID, t.PrizeCode, t.PrizeName, t.PrizeYear, t.PrizeCountry, getdate()
from #tmp2 t
left join BowkerAwards a on t.PID = a.PID 
	and t.PrizeCode = a.PrizeCode 
	and t.PrizeName = a.PrizeName 
	and t.PrizeYear = a.PrizeYear 
	and t.PrizeCountry = a.PrizeCountry
where a.pid is null

/***************  Other Notes NoteTypeID 11 **************************/

select '978' + left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9) as PID, [Text]
into #PUB
FROM stgBowkerProductIdentifier p 
join stgBowkerOtherText w on p.RecordReference = w.RecordReference
where ProductIDType = '02' and len(ltrim(rtrim(replace(p.IDValue, ' ', '')))) = 10 
	and [Text] is not null

create table #PUB1 (
	PID decimal(12,0) null,
	Note text null
)

insert into #pub1(PID)
select distinct pid 
from #pub
where [text] is not null

update #pub1
set Note = [text]
from #pub p
join #pub1 t on p.pid = t.pid

insert into BowkerMissingPID(PID, CreatedDate)
select p.PID, GETDATE()
from #pub1 p 
left join TradeDataByVendor c on p.pid = c.pid
where c.pid IS NULL

MERGE INTO BowkerDescriptionData d
USING (SELECT p.PID, 11 AS TypeId, Note, 3 AS StatusId, 4 AS ProviderId
		FROM #pub1 p 
		JOIN TradeDataByVendor c ON p.pid = c.pid) pp
	 ON d.pid = pp.pid AND d.DescriptionTypeId = pp.TypeId
WHEN MATCHED
THEN UPDATE SET	
	DescriptionText = pp.Note,
	DescriptionTypeId = pp.TypeId,
	DescriptionStatusId = pp.StatusId,
	ProviderId = pp.ProviderId,
	ChangedBy = USER_NAME(),
	DateChanged = GETDATE()
WHEN NOT MATCHED BY TARGET
THEN INSERT (PID, DescriptionTypeId, DescriptionText, DescriptionStatusId, ProviderId) 
	VALUES(pp.PID, pp.TypeId, pp.Note, pp.StatusId, pp.ProviderId);



drop table #pub
drop table #pub1

/***************  BIOS NoteTypeID 14 **************************/

select '978' + left(ltrim(rtrim(replace(p.IDValue, ' ', ''))),9) as PID, SequenceNumber, BiographicalNote
into #BO
FROM stgBowkerProductIdentifier p 
join stgBowkerContributor w on p.RecordReference = w.RecordReference
where ProductIDType = '02' and len(ltrim(rtrim(replace(p.IDValue, ' ', '')))) = 10 
	and BiographicalNote is not null

Create Table #Cnt(
	PID decimal(12,0), 
	Ord int IDENTITY ,
	SequenceNumber int, 
	BiographicalNote ntext, 
	Bio varchar(8000), 
	PRIMARY KEY CLUSTERED (PID, Ord)
)

INSERT INTO #Cnt (PID, SequenceNumber, BiographicalNote)
SELECT PID, SequenceNumber, BiographicalNote
FROM #BO
ORDER BY PID, SequenceNumber

DECLARE @Bio varchar(8000), @OldPID decimal(12,0)
SELECT @OldPID = 0

UPDATE #Cnt
SET @Bio = CASE WHEN @OldPID = PID 
		THEN 
			case when len(@Bio) + len(cast(BiographicalNote as varchar(8000))) < 8000 then @Bio + '<br><br> ' + cast(BiographicalNote as varchar(8000)) else @Bio end
  		ELSE 
   			cast(BiographicalNote as varchar(8000))
		END,
    Bio = @Bio,
    @OldPID = PID
FROM #Cnt

SELECT PID, MAX(Ord) AS Ordinal
INTO #Cnt1
FROM #Cnt
GROUP BY PID 

SELECT C.PID, C.Bio
INTO #Cnt2
FROM #Cnt C 
INNER JOIN #Cnt1 L ON C.PID = L.PID AND C.Ord = L.Ordinal

MERGE INTO BowkerDescriptionData d
USING (SELECT p.PID, 14 AS TypeId, Bio as Note, 3 AS StatusId, 4 AS ProviderId
		FROM #Cnt2 p 
		JOIN TradeDataByVendor c ON p.pid = c.pid) pp
	 ON d.pid = pp.pid AND d.DescriptionTypeId = pp.TypeId
WHEN MATCHED
THEN UPDATE SET	
	DescriptionText = pp.Note,
	DescriptionTypeId = pp.TypeId,
	DescriptionStatusId = pp.StatusId,
	ProviderId = pp.ProviderId,
	ChangedBy = USER_NAME(),
	DateChanged = GETDATE()
WHEN NOT MATCHED BY TARGET
THEN INSERT (PID, DescriptionTypeId, DescriptionText, DescriptionStatusId, ProviderId) 
	VALUES(pp.PID, pp.TypeId, pp.Note, pp.StatusId, pp.ProviderId);

drop table #Cnt
drop table #Cnt1
drop table #Cnt2
drop table #BO
GO

GRANT EXECUTE ON [dbo].[sp_BowkerUpload] TO [BowkerApp]; 
GO