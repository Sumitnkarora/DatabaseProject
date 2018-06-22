CREATE PROCEDURE dbo.spINSERTNOTE

           @PID decimal(12,0), 
           @NoteTypeID tinyint, 
           @Note ntext, 
           @NoteStatusID tinyint, 
           @HyperLink varchar(255) = NULL, 
           @AuthorFirstName varchar(75) = NULL, 
           @AuthorLastName varchar(75) = NULL, 
           @ProviderID smallint = NULL, 
           @CreatedBy varchar(30) = NULL, 
           @IsDeleted bit  

AS

/*

	Purpose:
	Insert node for a given PID

	Revision History:

	Nov 5, 2007     -- Victor Guo		-- ISBN13 G3

*/

IF @ProviderID < 0
    SET @ProviderID = NULL

IF EXISTS (  SELECT * FROM [dbo].[TradeDataByVendor] WHERE  PID =  @PID )
BEGIN

    IF EXISTS (SELECT * FROM [dbo].[tbl_CMN_ChaptersNotes] WHERE  PID =  @PID AND NoteTypeID = @NoteTypeID)
        UPDATE [dbo].[tbl_CMN_ChaptersNotes]
           SET [Note] = @Note 
              ,[NoteStatusID] = @NoteStatusID 
              ,[ProviderID] = @ProviderID  
              ,[ChangedBy] = @CreatedBy
              ,[DateChanged] = GETDATE() 
         WHERE PID = @PID 
         AND NoteTypeID = @NoteTypeID
    ELSE
    INSERT INTO [dbo].[tbl_CMN_ChaptersNotes]
               ([PID]
               ,[NoteTypeID]
               ,[Note]
               ,[NoteStatusID]
               ,[HyperLink]
               ,[AuthorFirstName]
               ,[AuthorLastName]
               ,[ProviderID]
               ,[CreatedBy]
               ,[DateCreated]
               ,[IsDeleted])
         VALUES
               (@PID 
               ,@NoteTypeID 
               ,@Note
               ,@NoteStatusID
               ,@HyperLink
               ,@AuthorFirstName
               ,@AuthorLastName
               ,@ProviderID
               ,@CreatedBy
               ,GETDATE()
               ,@IsDeleted)
END
ELSE
     RAISERROR ('The note can not be added if the article is not in the system.', 16, 1)
 
GO