IF OBJECT_ID('tempdb..[#refBowkerAwardCodes]') IS NOT NULL DROP TABLE [#refBowkerAwardCodes];

CREATE TABLE [#refBowkerAwardCodes]
(
	[PrizeCode] [varchar](2) NOT NULL,
	[Description] [varchar](100) NULL
);

INSERT [#refBowkerAwardCodes] ( [PrizeCode], [Description] ) VALUES ( '01', 'Winner' );
INSERT [#refBowkerAwardCodes] ( [PrizeCode], [Description] ) VALUES ( '02', 'Runner-up' );
INSERT [#refBowkerAwardCodes] ( [PrizeCode], [Description] ) VALUES ( '03', 'Commended' );
INSERT [#refBowkerAwardCodes] ( [PrizeCode], [Description] ) VALUES ( '04', 'Shortlisted' );  


DELETE dst  
FROM [dbo].	[BowkerAwardCodes] dst  
	LEFT JOIN [#refBowkerAwardCodes] src ON dst.[PrizeCode] = src.[PrizeCode]  
WHERE src.[PrizeCode] IS NULL;   

UPDATE dst  
SET [Description] = src.[Description]
FROM [dbo].[BowkerAwardCodes] dst  
	JOIN [#refBowkerAwardCodes] src ON dst.[PrizeCode] = src.[PrizeCode]  
WHERE src.[Description] <> dst.[Description]
	
INSERT [dbo].[BowkerAwardCodes] (   
	[PrizeCode], [Description]  
)  
SELECT src.[PrizeCode], src.[Description]  
FROM [#refBowkerAwardCodes] src   
	LEFT JOIN [dbo].[BowkerAwardCodes] dst ON dst.[PrizeCode] = src.[PrizeCode]  
WHERE dst.[PrizeCode] IS NULL;