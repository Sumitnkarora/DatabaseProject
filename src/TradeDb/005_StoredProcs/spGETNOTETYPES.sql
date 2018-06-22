CREATE PROCEDURE [dbo].[spGETNOTETYPES]

AS

SELECT [DescriptionTypeID] as NoteTypeID
      ,[IsActive]
      , CAST([DescriptionTypeID] AS varchar) + '-' +[Description] AS [Description]
      ,[CreatedBy]
      ,[ChangedBy]
      ,[DateCreated]
      ,[DateChanged]
      ,[IsDeleted]
  FROM  [dbo].[refDescriptionTypes]
  ORDER BY [DescriptionTypeID]

GO