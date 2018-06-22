CREATE PROCEDURE [dbo].[spGetNOTESTATUSCODES]

AS
 
SELECT [DescriptionTypeID] as NoteTypeID
      ,[IsActive]
      ,[Description]
      ,[ProductTypeID]
      ,[CreatedBy]
      ,[ChangedBy]
      ,[DateCreated]
      ,[DateChanged]
      ,[IsDeleted]
  FROM [dbo].[refDescriptionTypes]
  
GO