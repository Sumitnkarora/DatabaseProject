CREATE PROCEDURE [dbo].[spGetCountryCodes]

 AS

SELECT CountryCode, CountryName FROM refCountry where Display=1 order by CountryName
GO