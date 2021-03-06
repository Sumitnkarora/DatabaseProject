﻿CREATE TABLE [dbo].[stgTradeSubjects]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[SubjectScheme] VARCHAR(2) NOT NULL
,	[SubjectSchemeName] VARCHAR(MAX) NOT NULL DEFAULT('')
,	[Ordinal] TINYINT NOT NULL
,	[SubjectCode] VARCHAR(MAX) NULL
,	[SubjectText] VARCHAR(MAX) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeSubjects TO OnixImportApp;
GO