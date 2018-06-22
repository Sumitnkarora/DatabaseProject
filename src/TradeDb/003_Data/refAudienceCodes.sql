IF OBJECT_ID('tempdb..[#refAudienceCodes]') IS NOT NULL DROP TABLE [#refAudienceCodes];    

CREATE TABLE [#refAudienceCodes]  
(   
	[AudienceCode] varchar(3) NOT NULL  , 
	[Description] varchar(100) NOT NULL  , 
	[IsDeleted] bit NOT NULL  ,
	[OnixCode] varchar(2) NULL
);    

INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('COL', 'College', 0, NULL);
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('JUV', 'Juvenile', 0, NULL);
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('PSP', 'Professional And Scholar', 0, NULL);
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('SCH', 'Elementary / High School', 0, NULL);
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('TRA', 'Trade', 0, NULL);
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('YA', 'Young Adult', 0, NULL);
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('01', 'General/trade', 0, '01');
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('02', 'Children/juvenile', 0, '02');
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('03', 'Young Adult', 0, '03');
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('04', 'Primary and secondary/elementary and high school', 0, '04');
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('05', 'College/higher education', 0, '05');
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('06', 'Professional and scholarly', 0, '06');
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('07', 'ELT/ESL', 0, '07');
INSERT [#refAudienceCodes]([AudienceCode], [Description], [IsDeleted], [OnixCode]) VALUES('08', 'Adult education', 0, '08');

DELETE dst  
FROM [dbo].[refAudienceCodes] dst  
	LEFT JOIN [#refAudienceCodes] src ON dst.[AudienceCode] = src.[AudienceCode]  
WHERE src.[AudienceCode] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[IsDeleted] = src.[IsDeleted]  ,
	[OnixCode] = src.[OnixCode]
FROM [dbo].[refAudienceCodes] dst  
	JOIN [#refAudienceCodes] src ON dst.[AudienceCode] = src.[AudienceCode]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[IsDeleted] <> dst.[IsDeleted]  OR
	(src.[OnixCode] IS NULL AND dst.[OnixCode] IS NOT NULL) OR 
	(src.[OnixCode] IS NOT NULL AND dst.[OnixCode] IS NULL) OR 
	src.[OnixCode] <> dst.[OnixCode];
	
INSERT [dbo].[refAudienceCodes] (   
	[AudienceCode], [Description], [IsDeleted], [OnixCode]
)  
SELECT src.[AudienceCode], src.[Description], src.[IsDeleted], src.[OnixCode]
FROM [#refAudienceCodes] src   
	LEFT JOIN [dbo].[refAudienceCodes] dst ON dst.[AudienceCode] = src.[AudienceCode]  
WHERE dst.[AudienceCode] IS NULL;    