CREATE PROCEDURE [dbo].[spGETPROVIDERS]

AS

SELECT [ProviderID]
      ,Cast([ProviderID] AS Varchar) + '-'+ [ProviderName]AS [ProviderName]
      ,[Priority]
      ,[CreatedBy]
      ,[ChangedBy]
      ,[DateCreated]
      ,[DateChanged]
      ,[IsDeleted]
  FROM [dbo].[refContentProviders]
  ORDER BY [ProviderID]
  
GO