IF OBJECT_ID('tempdb..[#refAudienceCode]') IS NOT NULL DROP TABLE [#refAudienceCode];

CREATE TABLE [#refAudienceCode]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('01', 'General/trade');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('02', 'Children/juvenile');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('03', 'Young adult');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('04', 'Primary and secondary/elementary and high school');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('05', 'College/higher education');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('06', 'Professional and scholarly');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('07', 'ELT/ESL');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('08', 'Adult education');
INSERT INTO [#refAudienceCode] ([Id], [Description]) VALUES ('09', 'Second language teaching');

DELETE dst
FROM [dbo].[refAudienceCode] dst   
	LEFT JOIN [#refAudienceCode] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refAudienceCode] dst  
	JOIN [#refAudienceCode] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refAudienceCode] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refAudienceCode] src
	LEFT JOIN [dbo].[refAudienceCode] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;