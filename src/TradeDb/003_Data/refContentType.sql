IF OBJECT_ID('tempdb..[#refContentType]') IS NOT NULL DROP TABLE [#refContentType];

CREATE TABLE [#refContentType]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('00', 'ASCII text');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('01', 'SGML');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('02', 'HTML');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('03', 'XML');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('04', 'PDF');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('05', 'XHTML');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('06', 'Default text format');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('07', 'Basic ASCII text');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('08', 'PDF');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('09', 'Microsoft rich text format (RTF)');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('10', 'Microsoft Word binary format (DOC)');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('11', 'ECMA 376 WordprocessingML');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('12', 'ISO 26300 ODF');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('13', 'Corel Wordperfect binary format (DOC)');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('14', 'EPUB');
INSERT INTO [#refContentType] ([Id], [Description]) VALUES ('15', 'XPS');

DELETE dst
FROM [dbo].[refContentType] dst   
	LEFT JOIN [#refContentType] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refContentType] dst  
	JOIN [#refContentType] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refContentType] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refContentType] src
	LEFT JOIN [dbo].[refContentType] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;