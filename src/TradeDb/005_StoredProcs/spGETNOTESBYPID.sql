CREATE PROCEDURE [dbo].[spGETNOTESBYPID]

@PID Decimal(12,0),
@ProviderID smallint = NULL 

AS

IF @ProviderID IS NULL 
	SELECT [PID]
		  ,[NoteTypeID]
		  ,[Note]
		  ,[NoteStatusID]
		  ,[HyperLink]
		  ,[AuthorFirstName]
		  ,[AuthorLastName]
		  ,ISNULL([ProviderID],-1) AS [ProviderID]
		  ,[CreatedBy]
		  ,[ChangedBy]
		  ,[DateCreated]
		  ,[DateChanged]
		  ,[IsDeleted]
	  FROM [dbo].[tbl_CMN_ChaptersNotes]
	  WHERE PID = @PID
	  ORDER BY [NoteTypeID]
ELSE
	SELECT [PID]
		  ,[NoteTypeID]
		  ,[Note]
		  ,[NoteStatusID]
		  ,[HyperLink]
		  ,[AuthorFirstName]
		  ,[AuthorLastName]
		  ,ISNULL([ProviderID],-1) AS [ProviderID]
		  ,[CreatedBy]
		  ,[ChangedBy]
		  ,[DateCreated]
		  ,[DateChanged]
		  ,[IsDeleted]
	  FROM [dbo].[tbl_CMN_ChaptersNotes] 
	  WHERE PID = @PID
	  AND [ProviderID] = @ProviderID
	  ORDER BY [NoteTypeID]
 
GO