CREATE PROCEDURE [dbo].[IndigoAggregation_Update] 
AS
BEGIN

SET NOCOUNT ON;
	
-- Create temp Indigo Aggregation table.
IF OBJECT_ID('tempdb..#IndigoAggregation') IS NOT NULL DROP TABLE [#IndigoAggregation];
CREATE	TABLE [#IndigoAggregation](
PID decimal(12,0) NOT NULL PRIMARY KEY CLUSTERED,
CompetitorAggregationId varchar(32) NULL,
BowkerWorkId int NULL,
IndigoAggregationId varchar(32) NULL);

-- Get Items to create aggregation.
INSERT	INTO [#IndigoAggregation] (PID)
SELECT	C.PID
FROM	dbo.CompetitorAggregation AS A WITH (NOLOCK)
JOIN	dbo.TradeDataByVendor AS C WITH (NOLOCK) ON A.ISBN13 = [dbo].[fnPIDToISBN13](C.PID)
UNION
SELECT	B.PID
FROM	dbo.BowkerWorks AS B WITH (NOLOCK)
JOIN	dbo.TradeDataByVendor AS C WITH (NOLOCK) ON B.PID = C.PID

UPDATE	I
SET	CompetitorAggregationId = A.AggregationId
FROM	[#IndigoAggregation] AS I
JOIN	dbo.CompetitorAggregation AS A ON [dbo].[fnPIDToISBN13](I.PID) = A.ISBN13
WHERE	I.CompetitorAggregationId IS NULL; -- first setting

UPDATE	I
SET	BowkerWorkId = B.WorkId
FROM	[#IndigoAggregation] AS I
JOIN	dbo.BowkerWorks AS B ON I.PID = B.PID
WHERE	I.BowkerWorkId IS NULL; 


-- Get distinct Amazon & Indigo AggregationIDs.
IF OBJECT_ID('tempdb..#Aggregation') IS NOT NULL DROP TABLE [#Aggregation];
SELECT	distinct 
	CompetitorAggregationId,
	BowkerWorkId
INTO	[#Aggregation]
FROM	[#IndigoAggregation]
WHERE	CompetitorAggregationId IS NOT NULL;

UPDATE	[#IndigoAggregation]
SET	CompetitorAggregationId = A.CompetitorAggregationId
FROM	[#IndigoAggregation] AS I
JOIN	[#Aggregation] AS A ON I.BowkerWorkId = A.BowkerWorkId
WHERE	I.CompetitorAggregationId IS NULL;

IF OBJECT_ID('tempdb..#FinalIndigoAggregation') IS NOT NULL DROP TABLE [#FinalIndigoAggregation]
SELECT	CompetitorAggregationId,
	BowkerWorkId = MAX(BowkerWorkId)
INTO	[#FinalIndigoAggregation]
FROM	[#IndigoAggregation]
WHERE	CompetitorAggregationId IS NOT NULL
AND	BowkerWorkId IS NOT NULL
GROUP	BY CompetitorAggregationId;

UPDATE	I
SET	IndigoAggregationId = 'B' + CAST(F.BowkerWorkId AS varchar)
FROM	[#IndigoAggregation] AS I
JOIN	[#FinalIndigoAggregation] AS F ON I.CompetitorAggregationId = F.CompetitorAggregationId
WHERE	I.IndigoAggregationId IS NULL;

UPDATE	I
SET	IndigoAggregationId = I.CompetitorAggregationId
FROM	[#IndigoAggregation] AS I
WHERE	I.IndigoAggregationId IS NULL
AND	I.BowkerWorkId IS NULL
AND	I.CompetitorAggregationId IS NOT NULL;

UPDATE	I
SET	IndigoAggregationId = 'B' + CAST(I.BowkerWorkId AS varchar)
FROM	[#IndigoAggregation] AS I
WHERE	I.IndigoAggregationId IS NULL
AND	I.CompetitorAggregationId IS NULL
AND	I.BowkerWorkId IS NOT NULL;

INSERT	INTO dbo.IndigoAggregation (ISBN13,CompetitorAggregationId,BowkerWorkID,IndigoAggregationId,DateChanged)
SELECT	[dbo].[fnPIDToISBN13](I1.PID),
	I1.CompetitorAggregationId,
	I1.BowkerWorkID,
	I1.IndigoAggregationID,
	DateChanged = GETDATE()
FROM	[#IndigoAggregation] AS I1
LEFT	JOIN dbo.IndigoAggregation AS I2 ON [dbo].[fnPIDToISBN13](I1.PID) = I2.ISBN13
WHERE	I2.ISBN13 IS NULL;

UPDATE	I1
SET	CompetitorAggregationId = I2.CompetitorAggregationId,
	BowkerWorkID = I2.BowkerWorkID,
	IndigoAggregationId = I2.IndigoAggregationId,
	DateChanged = GETDATE()
FROM	dbo.IndigoAggregation AS I1
JOIN	[#IndigoAggregation] AS I2 ON I1.ISBN13 = [dbo].[fnPIDToISBN13](I2.PID)
WHERE	ISNULL(I1.CompetitorAggregationId, '') <> ISNULL(I2.CompetitorAggregationId,'')
OR	ISNULL(I1.BowkerWorkID,-1) <> ISNULL(I2.BowkerWorkID,-1) -- -1 only used for comparing, not for setting
OR	ISNULL(I1.IndigoAggregationId,'') <> ISNULL(I2.IndigoAggregationId,'');

--*** TradeDataByVendor does not have IsDeleted as of writing this.
--DELETE	I
--FROM	dbo.IndigoAggregation AS I
--JOIN	dbo.TradeDataByVendor AS C WITH (NOLOCK) ON I.PID = C.PID
----WHERE	C.IsDeleted = 1;
END
GO

GRANT EXECUTE ON [dbo].[IndigoAggregation_Update] TO [AggregationImporterApp]; 
GO