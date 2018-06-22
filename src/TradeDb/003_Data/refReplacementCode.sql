IF OBJECT_ID('tempdb..[#refReplacementCode]') IS NOT NULL DROP TABLE [#refReplacementCode];    

CREATE TABLE [#refReplacementCode]  
(   
	[ReplacementCode] varchar(5) NOT NULL  , 
	[ReplacementDesc] varchar(50) NULL  
);    

INSERT [#refReplacementCode]([ReplacementCode], [ReplacementDesc]) VALUES('03', 'Replaces');
INSERT [#refReplacementCode]([ReplacementCode], [ReplacementDesc]) VALUES('05', 'Replaced by');   

DELETE dst  
FROM [dbo].[refReplacementCode] dst   
	LEFT JOIN [#refReplacementCode] src ON dst.[ReplacementCode] = src.[ReplacementCode]  
WHERE src.[ReplacementCode] IS NULL;    

UPDATE dst  
SET [ReplacementDesc] = src.[ReplacementDesc]  
FROM [dbo].[refReplacementCode] dst  
	JOIN [#refReplacementCode] src ON dst.[ReplacementCode] = src.[ReplacementCode]  
WHERE (src.[ReplacementDesc] IS NULL AND dst.[ReplacementDesc] IS NOT NULL) OR 
	(src.[ReplacementDesc] IS NOT NULL AND dst.[ReplacementDesc] IS NULL) OR 
	src.[ReplacementDesc] <> dst.[ReplacementDesc];    
	
INSERT [dbo].[refReplacementCode] (   
	[ReplacementCode], [ReplacementDesc]  
)  
SELECT src.[ReplacementCode], src.[ReplacementDesc]  
FROM [#refReplacementCode] src   
	LEFT JOIN [dbo].[refReplacementCode] dst ON dst.[ReplacementCode] = src.[ReplacementCode]  
WHERE dst.[ReplacementCode] IS NULL;    