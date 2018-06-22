IF OBJECT_ID('tempdb..[#refReturnConditionCode]') IS NOT NULL DROP TABLE [#refReturnConditionCode];

CREATE TABLE [#refReturnConditionCode]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('N', 'No, not returnable');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('Y', 'Yes, returnable, full copies only');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('S', 'Yes, returnable, stripped cover');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('C', 'Conditional');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('00', 'Unspecified');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('01', 'Consignment');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('02', 'Firm sale');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('03', 'Sale or return');
INSERT INTO [#refReturnConditionCode] ([Id], [Description]) VALUES ('04', 'Direct fulfillment');

DELETE dst
FROM [dbo].[refReturnConditionCode] dst   
	LEFT JOIN [#refReturnConditionCode] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refReturnConditionCode] dst  
	JOIN [#refReturnConditionCode] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refReturnConditionCode] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refReturnConditionCode] src
	LEFT JOIN [dbo].[refReturnConditionCode] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;