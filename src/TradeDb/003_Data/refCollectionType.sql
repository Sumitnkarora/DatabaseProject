IF OBJECT_ID('tempdb..[#refCollectionType]') IS NOT NULL DROP TABLE [#refCollectionType];

CREATE TABLE [#refCollectionType]
(
	[Id] VARCHAR(16) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refCollectionType] ([Id], [Description]) VALUES ('series', 'Series collection');
INSERT INTO [#refCollectionType] ([Id], [Description]) VALUES ('set', 'Set collection');

DELETE dst
FROM [dbo].[refCollectionType] dst   
	LEFT JOIN [#refCollectionType] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refCollectionType] dst  
	JOIN [#refCollectionType] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refCollectionType] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refCollectionType] src
	LEFT JOIN [dbo].[refCollectionType] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;