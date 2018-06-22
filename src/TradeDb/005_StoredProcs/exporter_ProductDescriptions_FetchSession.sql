/* =============================================
 Author:		Irene Kondryna
 Create date:	November 15, 2017
 Parameters:	SessionId
				TopRecords
 Description:	Updates top X records to StatusId = 1 (Processing) for exclusive export lock specified by SessionId;
				Returns updated records for exporting

 Revision history:
 				Feb 01, 2018 Dariusz Holc
				Fix for fetching only lowest version records.
				Feb 08, 2018 Dariusz Holc
				Fix fetching with ordering by change version (first in, first out).
				Feb 21, 2018 Dariusz Holc
				Make fetch only selection and move the marking of records to start session.
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_ProductDescriptions_FetchSession]
    @SessionId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ProductsToExport TABLE(isbn13 varchar(13), EBookID varchar(36), vendorId varchar(12), vsrCode varchar(12), descriptionTypeId tinyint, UpdateType varchar(1), FromPrimaryVendor bit); 

	INSERT INTO @ProductsToExport (iSBN13, EBookID, vendorId, vsrCode, descriptionTypeId, updateType, fromPrimaryVendor)
	SELECT f.ISBN13, f.EBookID, f.VendorId, f.VSRCode, f.DescriptionTypeId, f.UpdateType, f.FromPrimaryVendor 
	FROM FeedExportProductDescriptions f WITH (NOLOCK)
	WHERE f.StatusId = 1 AND f.SessionId = @SessionId;
	
	-- Return the data we want, joining our list of ISBN13/KoboEBookId with the source data for actual values
	SELECT
		e.isbn13 AS ISBN13,
		'' AS KoboEBookID,
		r.ExportDescriptionTypeId AS DescriptionTypeId,
		p.DescriptionText AS DescriptionText,
		CASE
			WHEN p.ISBN13 IS NULL OR p.IsDeleted = 1 THEN 'D' 
			ELSE e.UpdateType 
		END AS UpdateType,
		e.FromPrimaryVendor,
		CAST(0 AS BIT) AS IsKobo
	FROM @ProductsToExport e 
	LEFT JOIN TradeDescriptionData p WITH (NOLOCK) ON p.ISBN13 = e.isbn13 AND p.SAPVendorId = e.vendorId AND p.VSRCode = e.vsrCode AND p.DescriptionTypeId = e.descriptionTypeId
	INNER JOIN refDescriptionTypes r WITH (NOLOCK) ON e.descriptionTypeId = r.DescriptionTypeId
	WHERE e.ISBN13 <> ''
	AND r.ExportDescriptionTypeId IS NOT NULL
	UNION
	SELECT
		'' AS ISBN13,
		e.EBookID AS KoboEBookID,
		'11' AS DescriptionTypeId, -- 11 is "From the Publisher" in this case Kobo
		b.[Description] AS DescriptionText,
		CASE
			WHEN b.EBookID IS NULL THEN 'D' 
			ELSE e.UpdateType 
		END AS UpdateType,
		CAST(1 AS BIT) AS FromPrimaryVendor,
		CAST(1 AS BIT) AS IsKobo
	FROM @ProductsToExport e 
	LEFT JOIN KoboBooks b WITH (NOLOCK) ON b.EBookID = e.EBookID
	WHERE e.EBookID <> ''

END
GO

GRANT EXECUTE ON [dbo].[exporter_ProductDescriptions_FetchSession] TO [FeedsExporter]; 
GO