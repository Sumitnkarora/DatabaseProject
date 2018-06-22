CREATE PROCEDURE [dbo].[spUPDATENODE]

	   @PID  decimal(12,0) 
      ,@NoteTypeID   tinyint 
      ,@Note    ntext 
      ,@NoteStatusID   tinyint 
      ,@ProviderID   smallint 
      ,@ChangedBy  varchar(30) 

AS


IF @ProviderID < 0
    SET @ProviderID = NULL
    
UPDATE [dbo].[tbl_CMN_ChaptersNotes]
   SET [Note] = @Note 
      ,[NoteStatusID] = @NoteStatusID 
      ,[ProviderID] = @ProviderID  
      ,[ChangedBy] = @ChangedBy 
      ,[DateChanged] = GETDATE() 
 WHERE PID = @PID 
 AND NoteTypeID = @NoteTypeID

 
GO