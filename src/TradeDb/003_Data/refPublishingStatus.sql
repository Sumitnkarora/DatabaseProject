IF OBJECT_ID('tempdb..[#refPublishingStatus]') IS NOT NULL DROP TABLE [#refPublishingStatus];

CREATE TABLE [#refPublishingStatus]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('00', 'Unspecified');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('01', 'Cancelled');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('02', 'Forthcoming');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('03', 'Postponed indefinitely');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('04', 'Active');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('05', 'No longer our product');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('06', 'Out of stock indefinitely');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('07', 'Out of print');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('08', 'Inactive');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('09', 'Unknown');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('10', 'Remaindered');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('11', 'Withdrawn from sale');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('12', 'Recalled');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('13', 'Active, but not sold separately');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('15', 'Recalled');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('16', 'Temporarily withdrawn from sale');
INSERT INTO [#refPublishingStatus] ([Id], [Description]) VALUES ('17', 'Permanently withdrawn from sale');

DELETE dst
FROM [dbo].[refPublishingStatus] dst   
	LEFT JOIN [#refPublishingStatus] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refPublishingStatus] dst  
	JOIN [#refPublishingStatus] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refPublishingStatus] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refPublishingStatus] src
	LEFT JOIN [dbo].[refPublishingStatus] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;