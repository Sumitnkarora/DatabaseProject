IF OBJECT_ID('tempdb..[#refReturnFormatSAPMap]') IS NOT NULL DROP TABLE [#refReturnFormatSAPMap];

CREATE TABLE [#refReturnFormatSAPMap]
(
	[RFSMID] int NOT NULL IDENTITY(1,1)
,	[ReturnFormat] char(2) NULL
,	[StripCover] char(2) NULL
,	[Returnable] char(1) NULL
);

SET IDENTITY_INSERT [#refReturnFormatSAPMap] ON

INSERT [#refReturnFormatSAPMap] (RFSMID, ReturnFormat, StripCover, Returnable) VALUES(1, NULL, 'FI', 'X')
INSERT [#refReturnFormatSAPMap] (RFSMID, ReturnFormat, StripCover, Returnable) VALUES(2, ' ', 'FI', 'X')
INSERT [#refReturnFormatSAPMap] (RFSMID, ReturnFormat, StripCover, Returnable) VALUES(3, 'Y', 'FI', 'X')
INSERT [#refReturnFormatSAPMap] (RFSMID, ReturnFormat, StripCover, Returnable) VALUES(4, 'C', 'CR', 'X')
INSERT [#refReturnFormatSAPMap] (RFSMID, ReturnFormat, StripCover, Returnable) VALUES(5, 'S', 'SC', 'X')
INSERT [#refReturnFormatSAPMap] (RFSMID, ReturnFormat, StripCover, Returnable) VALUES(6, 'N', 'NR', ' ')

SET IDENTITY_INSERT [#refReturnFormatSAPMap] OFF

DELETE	dst
FROM	[dbo].[refReturnFormatSAPMap] dst
	LEFT JOIN [#refReturnFormatSAPMap] src ON dst.[RFSMID] = src.[RFSMID]
WHERE	src.[RFSMID] IS NULL;

UPDATE	dst
SET	[ReturnFormat] = src.[ReturnFormat]
,	[StripCover] = src.[StripCover]
,	[Returnable] = src.[Returnable]
FROM	[dbo].[refReturnFormatSAPMap] dst
JOIN	[#refReturnFormatSAPMap] src ON dst.[RFSMID] = src.[RFSMID]
WHERE	(src.[ReturnFormat] IS NULL AND dst.[ReturnFormat] IS NOT NULL) OR (src.[ReturnFormat] IS NOT NULL AND dst.[ReturnFormat] IS NULL) OR src.[ReturnFormat] <> dst.[ReturnFormat]
OR	(src.[StripCover] IS NULL AND dst.[StripCover] IS NOT NULL) OR (src.[StripCover] IS NOT NULL AND dst.[StripCover] IS NULL) OR src.[StripCover] <> dst.[StripCover]
OR	(src.[Returnable] IS NULL AND dst.[Returnable] IS NOT NULL) OR (src.[Returnable] IS NOT NULL AND dst.[Returnable] IS NULL) OR src.[Returnable] <> dst.[Returnable];

SET IDENTITY_INSERT [dbo].[refReturnFormatSAPMap] ON

INSERT	[dbo].[refReturnFormatSAPMap] (
	[RFSMID], [ReturnFormat], [StripCover], [Returnable]
)
SELECT	src.[RFSMID], src.[ReturnFormat], src.[StripCover], src.[Returnable]
FROM	[#refReturnFormatSAPMap] src
	LEFT JOIN [dbo].[refReturnFormatSAPMap] dst ON dst.[RFSMID] = src.[RFSMID]
WHERE	dst.[RFSMID] IS NULL;

SET IDENTITY_INSERT [dbo].[refReturnFormatSAPMap] OFF
