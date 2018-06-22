CREATE  FUNCTION [dbo].[fnValidateISBN]
( @strISBN VARCHAR(13) )
RETURNS CHAR  AS  
BEGIN 

/******************************************************************************
**		File: 
**		Name: dbo.fnValidateISBN
**		Desc: validate if ISBN10 or ISBN13 is valid.
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
**		ISBN 10 or ISBN-13					Y if it's valid
**		Auth: 
**		Date: 
*******************************************************************************
**		Change History
*******************************************************************************
**		Date:		Author:				Description:
**		--------		--------				-------------------------------------------
**    Nov 6, 2007   Victor Guo				ISBN 13. G3. Created

*******************************************************************************/

DECLARE @valid CHAR(1)

SET @valid = 'N'

	
SET @strISBN = LTRIM(RTRIM(@strISBN))
IF  (LEN(@strISBN) = 10) AND (SUBSTRING(@strISBN,10,1)  = [dbo].fnCalcISBN10CheckDigit(@strISBN) )
		SET @valid = 'Y'
ELSE IF  (LEN(@strISBN)) = 13 AND (SUBSTRING(@strISBN,13,1)  = [dbo].fnCalcISBN13CheckDigit(@strISBN))
		SET @valid = 'Y'
	 

RETURN @valid   

END 
GO