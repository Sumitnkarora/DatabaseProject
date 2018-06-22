CREATE FUNCTION [dbo].[fnPIDToISBN10]
	(
		@PID DECIMAL 		
	)
RETURNS CHAR(10) 
AS
BEGIN

/******************************************************************************
**		File: fnPIDToISBN10.sql
**		Name: dbo.fnPIDToISBN10
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
**		PID	  							Convert PID to ISBN 10 if applicable. 
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
DECLARE @ISBN10 CHAR(10) 

SET @PIDstr = CAST( @PID AS VARCHAR(50) )
SET @ISBN10 = NULL

-- check if PID is from ISBN
DECLARE @prefix CHAR(3)
DECLARE @ISBN10WOCheck CHAR(9)

IF ( LEN(@PIDstr) > 3 )
	BEGIN
		SET @prefix = SUBSTRING(@PIDstr,1,3)
		SET @ISBN10WOCheck = SUBSTRING(@PIDstr,4,9)
		
		IF @prefix = '978' 
			SET @ISBN10 = @ISBN10WOCheck + [dbo].fnCalcISBN10CheckDigit(@ISBN10WOCheck + 'X') 
	END

RETURN @ISBN10

END
GO