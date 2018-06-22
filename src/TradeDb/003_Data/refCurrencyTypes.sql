IF OBJECT_ID('tempdb..[#refCurrencyTypes]') IS NOT NULL DROP TABLE [#refCurrencyTypes];    

CREATE TABLE [#refCurrencyTypes]  
(   
	[CurrencyTypeID] varchar(3) NOT NULL  , 
	[Description] varchar(30) NOT NULL  , 
	[ExchangeRate] decimal(5,4) NOT NULL  , 
	[IsDeleted] bit NOT NULL  , 
	[InternalOnly] bit NOT NULL  
);    

INSERT [#refCurrencyTypes]([CurrencyTypeID], [Description], [ExchangeRate], [IsDeleted]  , [InternalOnly]) VALUES('CAD', 'Canadian Dollar', 1.0000, 0, 0);
INSERT [#refCurrencyTypes]([CurrencyTypeID], [Description], [ExchangeRate], [IsDeleted]  , [InternalOnly]) VALUES('DEM', 'German Mark', 0.8089, 0, 1);
INSERT [#refCurrencyTypes]([CurrencyTypeID], [Description], [ExchangeRate], [IsDeleted]  , [InternalOnly]) VALUES('GBP', 'British Pound', 2.4278, 0, 1);
INSERT [#refCurrencyTypes]([CurrencyTypeID], [Description], [ExchangeRate], [IsDeleted]  , [InternalOnly]) VALUES('NLG', 'Dutch Guilder', 0.7180, 0, 1);
INSERT [#refCurrencyTypes]([CurrencyTypeID], [Description], [ExchangeRate], [IsDeleted]  , [InternalOnly]) VALUES('USD', 'American Dollar', 1.1240, 0, 0);

DELETE dst  
FROM [dbo].[refCurrencyTypes] dst   
	LEFT JOIN [#refCurrencyTypes] src ON dst.[CurrencyTypeID] = src.[CurrencyTypeID]  
WHERE src.[CurrencyTypeID] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[ExchangeRate] = src.[ExchangeRate]  , 
	[IsDeleted] = src.[IsDeleted]  , 
	[InternalOnly] = src.[InternalOnly]  
FROM [dbo].[refCurrencyTypes] dst  
	JOIN [#refCurrencyTypes] src ON dst.[CurrencyTypeID] = src.[CurrencyTypeID]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[ExchangeRate] <> dst.[ExchangeRate]  OR 
	src.[IsDeleted] <> dst.[IsDeleted]  OR 
	src.[InternalOnly] <> dst.[InternalOnly];    
	
INSERT [dbo].[refCurrencyTypes] (   
	[CurrencyTypeID], [Description], [ExchangeRate], [IsDeleted]  , [InternalOnly]  
)  
SELECT src.[CurrencyTypeID], src.[Description], src.[ExchangeRate], src.[IsDeleted]  , src.[InternalOnly]  
FROM [#refCurrencyTypes] src   
	LEFT JOIN [dbo].[refCurrencyTypes] dst ON dst.[CurrencyTypeID] = src.[CurrencyTypeID]  
WHERE dst.[CurrencyTypeID] IS NULL;    