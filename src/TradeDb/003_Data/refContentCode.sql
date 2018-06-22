IF OBJECT_ID('tempdb..[#refContentCode]') IS NOT NULL DROP TABLE [#refContentCode];

CREATE TABLE [#refContentCode]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('01', 'Main description');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('02', 'Short description/annotation');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('03', 'Long description');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('04', 'Table of contents');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('05', 'Review quote, restricted length');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('06', 'Quote from review of previous edition');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('07', 'Review text');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('08', 'Review quote');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('09', 'Promotional ‘headline’');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('10', 'Previous review quote');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('11', 'Author comments');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('12', 'Description for reader');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('13', 'Biographical note');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('14', 'Description for Reading Group Guide');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('15', 'Discussion question for Reading Group Guide');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('16', 'Competing titles');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('17', 'Flap copy');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('18', 'Back cover copy');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('19', 'Feature');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('20', 'New feature');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('21', 'Publisher’s notice');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('22', 'Index');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('23', 'Excerpt from book');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('24', 'First chapter');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('25', 'Description for sales people');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('26', 'Description for press or other media');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('27', 'Description for subsidiary rights department');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('28', 'Description for teachers/educators');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('30', 'Unpublished endorsement');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('31', 'Description for bookstore');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('32', 'Description for library');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('33', 'Introduction or preface');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('34', 'Full text');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('35', 'Promotional text');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('40', 'Author interview / QandA');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('41', 'Reading Group Guide');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('42', 'Commentary / discussion');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('43', 'Short description for series or set');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('44', 'Long description for series or set');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('45', 'Contributor event schedule');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('46', 'License');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('47', 'Open access statement');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('48', 'Digital exclusivity statement');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('49', 'Official recommendation');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('98', 'Master brand name');
INSERT INTO [#refContentCode] ([Id], [Description]) VALUES ('99', 'Country of final manufacture');

DELETE dst
FROM [dbo].[refContentCode] dst   
	LEFT JOIN [#refContentCode] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refContentCode] dst  
	JOIN [#refContentCode] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refContentCode] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refContentCode] src
	LEFT JOIN [dbo].[refContentCode] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;