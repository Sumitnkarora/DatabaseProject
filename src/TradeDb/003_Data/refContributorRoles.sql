IF OBJECT_ID('tempdb..[#refContributorRoles]') IS NOT NULL DROP TABLE [#refContributorRoles];

CREATE TABLE [#refContributorRoles]
(
	[RoleId] char(2) NOT NULL
,	[Description] varchar(MAX) NULL
,	[KoboType] varchar(30) NULL
,	[RoleCode] varchar(3) NULL
);

INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('AB', 'Abridged by', NULL, 'B04')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('AF', 'Afterword by', NULL, 'A19')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('AN', 'Annotations by', NULL, '01')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('AO', 'with', NULL, 'A02')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('AR', 'Arranged by', NULL, 'B25')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('AU', 'Author', 'Author', 'A01')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('AY', 'As told by', NULL, 'B07')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('CB', 'Contribution by', NULL, 'A32')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('ED', 'Editor', 'Editor', 'B01')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('EP', 'Epilogue by', 'EpilogueAuthor', 'A22')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('FR', 'Foreword by', 'ForewordAuthor', 'A23')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('IL', 'Illustrator', 'Illustrator', 'A12')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('IN', 'Introduction by', 'IntroductionAuthor', 'A24')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('ME', 'Memoir by', NULL, 'A26')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('NB', 'Narrated by', NULL, 'E03')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('NO', 'Notes by', NULL, 'A20')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('OT', 'Other', 'Other', 'Z99')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('PF', 'Preface by', NULL, 'A15')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('PH', 'Photographed by', 'Photographer', 'A13')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('PL', 'Prologue by', NULL, 'A16')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('RE', 'Read by', 'Reader', 'E07')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('RT', 'Retold by', NULL, 'B03')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('RV', 'Revised by', NULL, 'B02')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('TE', 'Text by', 'GhostwriterBiographer', 'A14')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('TR', 'Translated by', 'Translator', 'B06')
INSERT #refContributorRoles ([RoleId], [Description], [KoboType], [RoleCode]) VALUES('TS', 'Transcribed by', NULL, 'B08')

DELETE	dst
FROM	[dbo].[refContributorRoles] dst
	LEFT JOIN [#refContributorRoles] src ON dst.[RoleId] = src.[RoleId]
WHERE	src.[RoleId] IS NULL;

UPDATE	dst
SET	[Description] = src.[Description]
,   [KoboType]    = src.[KoboType]
,	[RoleCode]    = src.[RoleCode]
FROM	[dbo].[refContributorRoles] dst
JOIN	[#refContributorRoles] src ON dst.[RoleId] = src.[RoleId]
WHERE	(src.[Description] IS NULL AND dst.[Description] IS NOT NULL) OR (src.[Description] IS NOT NULL AND dst.[Description] IS NULL) OR src.[Description] <> dst.[Description]
   OR	(src.[KoboType] IS NULL AND dst.[KoboType] IS NOT NULL) OR (src.[KoboType] IS NOT NULL AND dst.[KoboType] IS NULL) OR src.[KoboType] <> dst.[KoboType]
   OR	(src.[RoleCode] IS NULL AND dst.[RoleCode] IS NOT NULL) OR (src.[RoleCode] IS NOT NULL AND dst.[RoleCode] IS NULL) OR src.[RoleCode] <> dst.[RoleCode];

INSERT	[dbo].[refContributorRoles] (
	[RoleId], [Description], [KoboType], [RoleCode]
)
SELECT	src.[RoleId], src.[Description], src.[KoboType], src.[RoleCode]
FROM	[#refContributorRoles] src
	LEFT JOIN [dbo].[refContributorRoles] dst ON dst.[RoleId] = src.[RoleId]
WHERE	dst.[RoleId] IS NULL;

