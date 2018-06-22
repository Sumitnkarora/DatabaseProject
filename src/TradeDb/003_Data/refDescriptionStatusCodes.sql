IF OBJECT_ID('tempdb..[#refDescriptionStatusCodes]') IS NOT NULL DROP TABLE [#refDescriptionStatusCodes];    

CREATE TABLE [#refDescriptionStatusCodes]  
(   
	[DescriptionStatusID] tinyint NOT NULL  , 
	[Description] varchar(50) NULL  
);    

INSERT [#refDescriptionStatusCodes]([DescriptionStatusID], [Description]) VALUES(0, 'Not Written');
INSERT [#refDescriptionStatusCodes]([DescriptionStatusID], [Description]) VALUES(1, 'Written');
INSERT [#refDescriptionStatusCodes]([DescriptionStatusID], [Description]) VALUES(2, 'Not Edited');
INSERT [#refDescriptionStatusCodes]([DescriptionStatusID], [Description]) VALUES(3, 'Edited');

DELETE dst  
FROM [dbo].[refDescriptionStatusCodes] dst   
	LEFT JOIN [#refDescriptionStatusCodes] src ON dst.[DescriptionStatusID] = src.[DescriptionStatusID]
WHERE src.[DescriptionStatusID] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]
FROM [dbo].[refDescriptionStatusCodes] dst  
	JOIN [#refDescriptionStatusCodes] src ON dst.[DescriptionStatusID] = src.[DescriptionStatusID] 
WHERE (src.[Description] IS NULL AND dst.[Description] IS NOT NULL) OR 
	(src.[Description] IS NOT NULL AND dst.[Description] IS NULL) OR 
	src.[Description] <> dst.[Description]  
	
INSERT [dbo].[refDescriptionStatusCodes] (   
[DescriptionStatusID], [Description]
)  
SELECT src.[DescriptionStatusID], src.[Description]
FROM [#refDescriptionStatusCodes] src   
	LEFT JOIN [dbo].[refDescriptionStatusCodes] dst ON dst.[DescriptionStatusID] = src.[DescriptionStatusID]  
WHERE dst.[DescriptionStatusID] IS NULL;    