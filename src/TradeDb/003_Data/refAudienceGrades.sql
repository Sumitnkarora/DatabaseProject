IF OBJECT_ID('tempdb..[#refAudienceGrades]') IS NOT NULL DROP TABLE [#refAudienceGrades];    

CREATE TABLE [#refAudienceGrades]  
(   
	[AudienceGrade] char(2) NOT NULL  , 
	[Description] varchar(50) NOT NULL  , 
	[IsDeleted] bit NOT NULL  
);    

INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('01', '1st Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('02', '2nd Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('03', '3rd Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('04', '4th Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('05', '5th Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('06', '6th Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('07', '7th Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('08', '8th Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('09', '9th Grade                                         ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('0H', 'High School                                       ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('0K', 'Kindergarten                                      ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('0M', 'Middle School                                     ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('0P', 'Pre-school                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('10', '10th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('11', '11th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('12', '12th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('13', '13th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('14', '14th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('15', '15th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('16', '16th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('17', '17th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('18', '18th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('19', '19th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('20', '20th Grade                                        ', 0);
INSERT [#refAudienceGrades]([AudienceGrade], [Description], [IsDeleted]) VALUES('UP', 'Up to                                             ', 0);

DELETE dst  
FROM [dbo].[refAudienceGrades] dst   
	LEFT JOIN [#refAudienceGrades] src ON dst.[AudienceGrade] = src.[AudienceGrade]  
WHERE src.[AudienceGrade] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[IsDeleted] = src.[IsDeleted]  
FROM [dbo].[refAudienceGrades] dst  
	JOIN [#refAudienceGrades] src ON dst.[AudienceGrade] = src.[AudienceGrade]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[IsDeleted] <> dst.[IsDeleted];    
	
INSERT [dbo].[refAudienceGrades] (   
	[AudienceGrade], [Description], [IsDeleted]  
)  
SELECT src.[AudienceGrade], src.[Description], src.[IsDeleted]  
FROM [#refAudienceGrades] src   
	LEFT JOIN [dbo].[refAudienceGrades] dst ON dst.[AudienceGrade] = src.[AudienceGrade]  
WHERE dst.[AudienceGrade] IS NULL;    