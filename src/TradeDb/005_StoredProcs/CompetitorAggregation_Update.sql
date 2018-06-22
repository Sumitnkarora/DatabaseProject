CREATE PROCEDURE [dbo].[CompetitorAggregation_Update] 
AS
BEGIN

SET NOCOUNT ON;
	
-- Create temp. table to extract skus' from the List.
IF OBJECT_ID('tempdb..#CompetitorAggregation_Temp') IS NOT NULL DROP TABLE [#CompetitorAggregation_Temp];
CREATE TABLE [#CompetitorAggregation_Temp](
PID decimal(12,0),
Sku varchar(13),
AggregationId varchar(32));

INSERT INTO #CompetitorAggregation_Temp (Sku,AggregationId)
SELECT value, 'A' + Isbn10
FROM stgCompetitorAggregation  
    CROSS APPLY STRING_SPLIT(AggregatedSKUList, '|');  

DELETE	[#CompetitorAggregation_Temp] WHERE Sku = '' OR Sku IS NULL;

INSERT	INTO [#CompetitorAggregation_Temp] (Sku,AggregationId)
SELECT	distinct Sku = Isbn10,
	AggregationId = 'A' + Isbn10
FROM	dbo.stgCompetitorAggregation AS S
LEFT	JOIN [#CompetitorAggregation_Temp] AS T ON S.Isbn10 = T.Sku
WHERE	T.Sku IS NULL;

UPDATE	[#CompetitorAggregation_Temp]
SET	PID = CASE WHEN LEN(Sku) = 10 THEN '978' + LEFT(Sku, 9) ELSE LEFT(Sku, LEN(Sku) - 1) END
WHERE	PID IS NULL;

-- Fixing Duplicate PID
IF OBJECT_ID('tempdb..#DuplicatePIDs') IS NOT NULL DROP TABLE [#DuplicatePIDs]
SELECT	PID
INTO	[#DuplicatePIDs]
FROM	[#CompetitorAggregation_Temp]
GROUP	BY PID
HAVING	COUNT(*) > 1;

IF OBJECT_ID('tempdb..#Duplicates') IS NOT NULL DROP TABLE [#Duplicates]
SELECT	T.PID,
	T.Sku
INTO	[#Duplicates]
FROM	[#CompetitorAggregation_Temp] AS T
JOIN	[#DuplicatePIDs] AS D ON T.PID = D.PID
GROUP	BY T.PID,T.Sku;

DELETE	T
FROM	[#CompetitorAggregation_Temp] AS T
JOIN	[#Duplicates] AS D ON T.PID = D.PID AND T.Sku = D.Sku
LEFT	JOIN dbo.TradeDataByVendor AS C WITH (NOLOCK) ON T.PID = C.PID  --AND T.Sku = ISNULL(C.ISBNString,C.UPC)
WHERE	C.PID IS NULL;

-- Create final Amazon Aggregation table.
IF OBJECT_ID('tempdb..#CompetitorAggregation') IS NOT NULL DROP TABLE [#CompetitorAggregation];
CREATE TABLE [#CompetitorAggregation](
PID decimal(12,0) NOT NULL PRIMARY KEY CLUSTERED,
Sku varchar(13) NOT NULL,
AggregationId varchar(32) NULL);

INSERT	INTO [#CompetitorAggregation] (PID,Sku,AggregationId)
SELECT	PID,
	Sku,
	AggregationId
FROM	[#CompetitorAggregation_Temp] AS T
GROUP	BY PID,	Sku, AggregationId

-- Insert/Update "dbo.CompetitorAggregation".
INSERT	INTO dbo.CompetitorAggregation (ISBN13,Sku,AggregationId,DateChanged)
SELECT	[dbo].[fnPIDToISBN13](A.PID),
	A.Sku,
	A.AggregationId,
	DateChanged = GETDATE()
FROM	[#CompetitorAggregation] AS A
LEFT	JOIN dbo.CompetitorAggregation AS B ON [dbo].[fnPIDToISBN13](A.PID) = B.ISBN13
WHERE	B.ISBN13 IS NULL;

UPDATE	A
SET	AggregationId = B.AggregationId,
	DateChanged = GETDATE()
FROM	dbo.CompetitorAggregation AS A
JOIN	[#CompetitorAggregation] AS B ON A.ISBN13 = [dbo].[fnPIDToISBN13](B.PID)
WHERE	A.AggregationId <> B.AggregationId;

END
GO

GRANT EXECUTE ON [dbo].[CompetitorAggregation_Update] TO [AggregationImporterApp]; 
GO
