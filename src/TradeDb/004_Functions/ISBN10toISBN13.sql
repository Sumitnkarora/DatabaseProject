CREATE     Function [dbo].[ISBN10toISBN13]
( @strISBN varchar(13) )
RETURNS varchar(13)  AS  
BEGIN 

DECLARE @strISBN13 VARCHAR(13)
DECLARE @strISBNWithoutCheckDigit VARCHAR(12)
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


-- If the input already ISBN-13, then just return it
IF  LEN(@strISBN) = 13  
	RETURN @strISBN

-- return NULL if the input is NULL. It's required by SymeDB-> CatDB import validation logic.
IF @strISBN IS NULL 
	RETURN NULL

-- Get ISBN without check digit
SET @strISBNWithoutCheckDigit = SUBSTRING(@strISBN,1,9)

-- Build first part of ISBN13
SET @strISBN13 = '978' + @strISBNWithoutCheckDigit

-- Calculate check digit
SET @intVar1 = CAST( SUBSTRING(@strISBN13,1,1) AS INT )
SET @intVar2 = CAST( SUBSTRING(@strISBN13,2,1) AS INT )
SET @intVar3 = CAST( SUBSTRING(@strISBN13,3,1) AS INT )
SET @intVar4 = CAST( SUBSTRING(@strISBN13,4,1) AS INT )
SET @intVar5 = CAST( SUBSTRING(@strISBN13,5,1) AS INT )
SET @intVar6 = CAST( SUBSTRING(@strISBN13,6,1) AS INT )
SET @intVar7 = CAST( SUBSTRING(@strISBN13,7,1) AS INT )
SET @intVar8 = CAST( SUBSTRING(@strISBN13,8,1) AS INT )
SET @intVar9 = CAST( SUBSTRING(@strISBN13,9,1) AS INT )
SET @intVar10 = CAST( SUBSTRING(@strISBN13,10,1) AS INT )
SET @intVar11 = CAST( SUBSTRING(@strISBN13,11,1) AS INT )
SET @intVar12 = CAST( SUBSTRING(@strISBN13,12,1) AS INT )

SET @intCheckSum = @intVar1 + @intVar3 + @intVar5 + @intVar7 + @intVar9 + @intVar11
SET @intCheckSum = @intCheckSum +  (@intVar2 +  @intVar4  +  @intVar6 +  @intVar8  +  @intVar10  +  @intVar12 ) * 3  

-- get last digit of sum as varchar

SET @chrCheckDigit = RIGHT(CAST(@intCheckSum AS VARCHAR(3)),1 )

IF @chrCheckDigit= 0 
      SET @chrCheckDigit = 0	
ELSE
      SET @chrCheckDigit = 10 - CAST ( @chrCheckDigit AS INT)

-- add check digit to the end
SET @strISBN13 = @strISBN13 + @chrCheckDigit

RETURN ISNULL(@strISBN13,'')   

END 







