CREATE PROCEDURE [dbo].[OnixImportUpdateCollections]
AS
BEGIN
	-- Set collection total items from TradeCollectionData:
	UPDATE dst
	SET CollectionTotalItems = src.TotalItems
	FROM
	(SELECT CollectionId, COUNT(Ordinal) AS 'TotalItems' FROM TradeCollectionData GROUP BY CollectionId) src
	JOIN TradeCollections dst ON dst.CollectionId = src.CollectionId;
END
GO

GRANT EXECUTE ON OnixImportUpdateCollections TO OnixImportApp;
GO