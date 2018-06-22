CREATE  Function [dbo].[ISBN13toISBN10]
( @strISBN varchar(13) )
RETURNS varchar(255)  AS  
BEGIN 

DECLARE @strISBN10 VARCHAR(10)
DECLARE @strISBNWithoutCheckDigit VARCHAR(9)
DECLARE @intCheckSum INT
DECLARE @chrCheckDigit CHAR(1)

DECLARE @intVar1 INT
DECLARE @intVar2 INT
DECLARE @intVar3 INT
DECLARE @intVar4 INT
DECLARE @intVar5 INT
DECLARE @intVar6 INT
DECLARE @intVar7 INT
DECLARE @intVar8 INT
DECLARE @intVar9 INT
DECLARE @intVar10 INT
DECLARE @intVar11 INT
DECLARE @intVar12 INT


-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.
IF @strISBN IS NULL 
	RETURN NULL

IF   LEN(LTRIM(RTRIM(@strISBN))) = 0
	RETURN NULL
 
-- Remove '978' and last check digit
SET @strISBNWithoutCheckDigit = SUBSTRING(@strISBN,4,9)

-- Calculate check digit
SET @intVar1 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,1,1) AS INT )
SET @intVar2 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,2,1) AS INT )
SET @intVar3 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,3,1) AS INT )
SET @intVar4 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,4,1) AS INT )
SET @intVar5 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,5,1) AS INT )
SET @intVar6 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,6,1) AS INT )
SET @intVar7 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,7,1) AS INT )
SET @intVar8 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,8,1) AS INT )
SET @intVar9 = CAST( SUBSTRING(@strISBNWithoutCheckDigit,9,1) AS INT )


SET @intCheckSum = @intVar1*1 +  @intVar2*2 + @intVar3*3 + @intVar4*4 + @intVar5*5 + @intVar6*6 +@intVar7*7 +  @intVar8*8  + @intVar9*9  
 

-- get last digit of sum as varchar

SET @intCheckSum = @intCheckSum % 11 

IF @intCheckSum = 10 
      SET @chrCheckDigit = 'X'	
ELSE
      SET @chrCheckDigit =  CAST(@intCheckSum AS CHAR)

-- add check digit to the end
SET @strISBN10 = @strISBNWithoutCheckDigit +  @chrCheckDigit

RETURN @strISBN10   

END 




