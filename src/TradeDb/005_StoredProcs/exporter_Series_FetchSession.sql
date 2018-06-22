/* =============================================
 Author:		Irene Kondryna
 Create date:	November 15, 2017
 Parameters:	SessionId
				TopRecords
 Description:	Updates top X records to StatusId = 1 (Processing) for exclusive export lock specified by SessionId;
				Returns updated records for exporting

 Revision history: 
				Dec 06, 2017 Dariusz Holc
				Update error handling with proper cast.
				Feb 01, 2018 Dariusz Holc
				Fix for fetching only lowest version records.
				Feb 08, 2018 Dariusz Holc
				Fix fetching with ordering by change version (first in, first out).
				Feb 21, 2018 Dariusz Holc
				Make fetch only selection and move the marking of records to start session.
 ============================================= */
CREATE PROCEDURE [dbo].[exporter_Series_FetchSession]
    @SessionId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @SeriesToExport TABLE(seriesId int, koboSeriesId varchar(64), isDeleted bit); 
	
	INSERT INTO @SeriesToExport (seriesId, koboSeriesId, isDeleted)
	SELECT f.SeriesId, f.KoboSeriesId, f.IsDeleted
	FROM FeedExportSeries f WITH (NOLOCK)
	WHERE f.StatusId = 1 AND f.SessionId = @SessionId;

	-- Return the data we want, joining our list of SeriesId with the source data for actual values
	SELECT
		e.SeriesId,
		NULL AS KoboSeriesId,
		s.SeriesTitle,
		s.DateCreated,
		s.DateChanged,
		CASE WHEN s.SeriesId IS NULL THEN CONVERT(bit, 1) ELSE e.IsDeleted END AS IsDeleted,
		CONVERT(bit, 0) AS IsKobo
	FROM @SeriesToExport e 
	LEFT JOIN TradeSeries s WITH (NOLOCK) ON s.SeriesId = e.seriesId
	WHERE e.seriesId <> 0
	UNION
	SELECT
		NULL AS SeriesId,
		e.KoboSeriesId,
		k.SeriesName AS SeriesTitle,
		NULL AS DateCreated,
		k.DateChanged,
		CASE WHEN k.SeriesId IS NULL THEN CONVERT(bit, 1) ELSE e.IsDeleted END AS IsDeleted,
		CONVERT(bit, 1) AS IsKobo
	FROM @SeriesToExport e 
	LEFT JOIN KoboSeries k WITH (NOLOCK) ON k.SeriesId = e.koboSeriesId
	WHERE e.koboSeriesId <> ''

END
GO

GRANT EXECUTE ON [dbo].[exporter_Series_FetchSession] TO [FeedsExporter]; 
GO