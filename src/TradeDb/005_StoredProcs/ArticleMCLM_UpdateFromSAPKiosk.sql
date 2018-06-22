CREATE PROCEDURE [dbo].[ArticleMCLM_UpdateFromSAPKiosk]
@ProcessType char(1)
AS

DECLARE @DeletionLimit AS INT = 25000
DECLARE @MessageString varchar(8000) = ''
DECLARE @TotalArticles AS INT
DECLARE @ArticlesToDelete AS INT

SELECT @TotalArticles = COUNT(*) FROM stgArticleMCLMSAPKiosk

SELECT @ArticlesToDelete = COUNT(*) 
	FROM 	dbo.TradeArticleMCLM
	WHERE 	UPC NOT IN (
			SELECT	UPC 
			FROM 	dbo.stgArticleMCLMSAPKiosk
			)

IF @ProcessType = 'F'
-- Full refresh
BEGIN
	IF (@ArticlesToDelete <= @DeletionLimit)
	BEGIN
		-- insert into del table
		INSERT INTO dbo.TradeArticleMCLMDeleted
		(UPC,
		PID, 
		MerchCategoryID, 
		MerchCategoryDesc, 
		LayoutModuleID, 
		LayoutModuleDesc
		)
		SELECT UPC,
		PID, 
		MerchCategoryID, 
		MerchCategoryDesc, 
		LayoutModuleID, 
		LayoutModuleDesc
		FROM dbo.TradeArticleMCLM
		WHERE UPC NOT IN (SELECT UPC FROM dbo.stgArticleMCLMSAPKiosk)

		-- delete from main table
		DELETE FROM dbo.TradeArticleMCLM
		WHERE UPC NOT IN (SELECT UPC FROM dbo.stgArticleMCLMSAPKiosk)
	END
	ELSE BEGIN
		SELECT @MessageString = 'ArticleMCLM job tried to delete too many items (more than ' + CAST(@DeletionLimit as varchar) +'). The deletion did not occur, but, updates and inserts will be processed as normal.'
			--@subject = '[Error] SAPKiosk Deletion Limit Exceeded', 
	END
END

-- update
UPDATE B
SET B.PID = S.PID,
B.MerchCategoryID = S.MerchCategoryID, 
B.MerchCategoryDesc = S.MerchCategoryDesc, 
B.LayoutModuleID = S.LayoutModuleID, 
B.LayoutModuleDesc = S.LayoutModuleDesc,
B.OriginalPrice = cast(S.OriginalPrice as money)
FROM dbo.TradeArticleMCLM B
INNER JOIN dbo.stgArticleMCLMSAPKiosk S
ON B.UPC = S.UPC
WHERE B.PID <> S.PID or
B.MerchCategoryID <> S.MerchCategoryID or
B.MerchCategoryDesc <> S.MerchCategoryDesc or
B.LayoutModuleID <> S.LayoutModuleID or
B.LayoutModuleDesc <> S.LayoutModuleDesc or
B.OriginalPrice <> cast(S.OriginalPrice as money)

-- insert
INSERT INTO dbo.TradeArticleMCLM
(UPC,
PID, 
MerchCategoryID, 
MerchCategoryDesc, 
LayoutModuleID, 
LayoutModuleDesc,
OriginalPrice
)
SELECT UPC, 
--MerchCategoryID, 
--MerchCategoryDesc, 
--LayoutModuleID, 
--LayoutModuleDesc
MAX(PID),
MIN(MerchCategoryID), 
MIN(MerchCategoryDesc), 
MIN(LayoutModuleID), 
MIN(LayoutModuleDesc),
MAX(cast(OriginalPrice as money))
FROM dbo.stgArticleMCLMSAPKiosk
WHERE UPC NOT IN (SELECT UPC FROM dbo.TradeArticleMCLM)
GROUP BY UPC

Select @TotalArticles as TotalProcessed,
	@ArticlesToDelete as TotalPidsToDelete,
	@MessageString as Message

GO
GRANT EXECUTE ON [dbo].[ArticleMCLM_UpdateFromSAPKiosk] TO [ArticleMCLMApp]; 
GO