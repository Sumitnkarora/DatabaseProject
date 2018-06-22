CREATE FUNCTION [dbo].[fnPIDToISBN13]
	(
		@PID DECIMAL 		
	)
RETURNS CHAR(13) 
AS
BEGIN

/******************************************************************************
**		File: fnPIDToISBN13.sql
**		Name: dbo.fnPIDToISBN13
**		Desc:  
**
**		This template can be customized:
**              
**		Return values:
** 
**		Called by:   
**              
**		Parameters:
**		Input							Output
**     ----------							-----------
**		PID	  							Convert PID to ISBN 13 if applicable. 
**		Auth: 
**		Date: 
*******************************************************************************
**		Change History
*******************************************************************************
**		Date:		Author:				Description:
**		--------	--------				-------------------------------------------
**    Dec 12, 2007   Victor Guo				ISBN 13. G3. Created
*******************************************************************************/

DECLARE @PIDstr VARCHAR(50) 
DECLARE @ISBN13 CHAR(13) 

SET @PIDstr = CAST( @PID AS VARCHAR(50) )
SET @ISBN13 = NULL

-- check if PID is from ISBN
DECLARE @prefix CHAR(3)
DECLARE @ISBN13WOCheck CHAR(12)

IF ( LEN(@PIDstr) > 3 )
	BEGIN
		SET @prefix = SUBSTRING(@PIDstr,1,3)
		SET @ISBN13WOCheck = SUBSTRING(@PIDstr,1,12)
		
		IF @prefix = '978' OR @prefix = '979'
			SET @ISBN13 = @ISBN13WOCheck + [dbo].fnCalcISBN13CheckDigit(@ISBN13WOCheck + '9') 
	END

RETURN @ISBN13

END
GO