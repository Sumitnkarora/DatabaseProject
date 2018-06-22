CREATE PROCEDURE [dbo].[spGetPaperCertificationType]
 AS

SELECT PaperCertificationTypeCode, PaperCertificationTypeCode as 'PaperCertificationTypeName' FROM refPaperCertificationType where Display=1 order by 
PaperCertificationTypeName
GO