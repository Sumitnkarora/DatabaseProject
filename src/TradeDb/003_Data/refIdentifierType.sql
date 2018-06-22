IF OBJECT_ID('tempdb..[#refIdentifierType]') IS NOT NULL DROP TABLE [#refIdentifierType];

CREATE TABLE [#refIdentifierType]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('01', 'Proprietary');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('02', 'ISBN-10');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('03', 'GTIN-13');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('04', 'UPC');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('05', 'ISMN-10');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('06', 'DOI');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('13', 'LCCN');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('14', 'GTIN-14');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('15', 'ISBN-13');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('17', 'Legal deposit number');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('22', 'URN');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('23', 'OCLC number');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('24', 'Co-publisher’s ISBN-13');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('25', 'ISMN-13');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('26', 'ISBN-A');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('27', 'JP e-code');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('28', 'OLCC number');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('29', 'JP Magazine ID');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('30', 'UPC12+5');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('31', 'BNF Control number');
INSERT INTO [#refIdentifierType] ([Id], [Description]) VALUES ('35', 'ARK');

DELETE dst
FROM [dbo].[refIdentifierType] dst   
	LEFT JOIN [#refIdentifierType] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refIdentifierType] dst  
	JOIN [#refIdentifierType] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refIdentifierType] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refIdentifierType] src
	LEFT JOIN [dbo].[refIdentifierType] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;