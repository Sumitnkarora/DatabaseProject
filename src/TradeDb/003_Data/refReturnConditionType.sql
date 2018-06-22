IF OBJECT_ID('tempdb..[#refReturnConditionType]') IS NOT NULL DROP TABLE [#refReturnConditionType];

CREATE TABLE [#refReturnConditionType]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refReturnConditionType] ([Id], [Description]) VALUES ('00', 'Proprietary');
INSERT INTO [#refReturnConditionType] ([Id], [Description]) VALUES ('01', 'French book trade returns conditions code');
INSERT INTO [#refReturnConditionType] ([Id], [Description]) VALUES ('02', 'BISAC Returnable Indicator code');
INSERT INTO [#refReturnConditionType] ([Id], [Description]) VALUES ('03', 'UK book trade returns conditions code');
INSERT INTO [#refReturnConditionType] ([Id], [Description]) VALUES ('04', 'ONIX Returns conditions code');

DELETE dst
FROM [dbo].[refReturnConditionType] dst   
	LEFT JOIN [#refReturnConditionType] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refReturnConditionType] dst  
	JOIN [#refReturnConditionType] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refReturnConditionType] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refReturnConditionType] src
	LEFT JOIN [dbo].[refReturnConditionType] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;