CREATE PROCEDURE [dbo].[spAddNotes]

  @ISBN varchar(13)
 ,@NoteTypeID  tinyint 
 ,@Note  ntext 
 ,@SourceType smallint 

AS

DECLARE @PID decimal(12,0)

IF   (LEN(@ISBN)  = 10) 
	SET @PID = CAST ( '978'  + SUBSTRING(@ISBN,1,9) AS decimal(12,0)  )
ELSE
	SET @PID = CAST ( SUBSTRING(@ISBN,1,12) AS decimal(12,0)  )
	
IF exists (select * from [dbo].[tbl_ChaptersNotes]
			where PID = @PID and NoteType = @NoteTypeID)
	UPDATE [dbo].[tbl_ChaptersNotes]
	   SET [Note] = @Note 
		  ,[SourceType] = @SourceType 
	 WHERE PID = @PID and NoteType = @NoteTypeID
ELSE
INSERT INTO [dbo].[tbl_ChaptersNotes]
           ( [PID]
           ,[ISBN]
           ,[NoteType]
           ,[Note]
           ,[SourceType])
     VALUES
           (@PID
           ,@ISBN 
           ,@NoteTypeID 
           ,@Note 
           ,@SourceType )
 
GO