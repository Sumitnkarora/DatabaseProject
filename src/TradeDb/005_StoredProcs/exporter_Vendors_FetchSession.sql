/* =============================================
 Author:		Irene Kondryna
 Create date:	November 21, 2017
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
CREATE PROCEDURE [dbo].[exporter_Vendors_FetchSession]
    @SessionId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @VendorsToExport TABLE(vendorId varchar(12), vsrCode varchar(12), isDeleted bit); 

	INSERT INTO @VendorsToExport (vendorId, vsrCode, isDeleted)
	SELECT f.VendorId, f.VSRCode, f.IsDeleted
	FROM FeedExportVendors f WITH (NOLOCK)
	WHERE f.StatusId = 1 AND f.SessionId = @SessionId;

	-- Return the data we want, joining our list of SeriesId with the source data for actual values
	SELECT
		e.VendorId AS VendorId,
		s.SAPVendorName AS VendorName,
		s.CurrencyTypeID,
		e.VSRCode,
		s.Blocked,
		CASE WHEN s.SAPVendorId IS NULL THEN CONVERT(bit, 1) ELSE e.IsDeleted END AS IsDeleted,
		s.PaymentBlocked,
		s.PositionBlocked,
		s.PurchasingBlocked,
		s.DiscountBlocked
	FROM @VendorsToExport e 
	LEFT JOIN TradeVendors s WITH (NOLOCK) ON s.SAPVendorId = e.vendorId AND s.VSRCode = e.vsrCode

END
GO

GRANT EXECUTE ON [dbo].[exporter_Vendors_FetchSession] TO [FeedsExporter]; 
GO