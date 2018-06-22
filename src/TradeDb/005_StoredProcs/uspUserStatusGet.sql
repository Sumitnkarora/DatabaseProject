CREATE procedure [dbo].[uspUserStatusGet]
as

SELECT 'True' AS sValue ,'Active' AS sText
UNION
SELECT 'False' AS sValue ,'Non-Active' AS sText