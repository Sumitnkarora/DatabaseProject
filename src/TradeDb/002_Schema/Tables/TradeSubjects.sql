CREATE TABLE [dbo].[TradeSubjects] (
	[ISBN13] VARCHAR (13) NOT NULL
,	[SAPVendorId] VARCHAR (20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[SubjectScheme] CHAR(2) NOT NULL
,	[SubjectSchemeName] VARCHAR(MAX) NOT NULL DEFAULT('')
,	[Ordinal] TINYINT NOT NULL
,	[SubjectCode] VARCHAR(MAX)
,	[SubjectText] VARCHAR(MAX)
,	CONSTRAINT [PK_TradeSubjects] PRIMARY KEY CLUSTERED ([ISBN13] ASC, [SAPVendorId] ASC, [VSRCode] ASC, [Ordinal] ASC)
,	CONSTRAINT [FK_TradeSubjects_refSubjectScheme] FOREIGN KEY ([SubjectScheme]) REFERENCES [dbo].[refSubjectScheme] ([Id])
,	CONSTRAINT [FK_TradeSubjects_TradeCoreAttributes] FOREIGN KEY ([ISBN13], [SAPVendorId], [VSRCode]) REFERENCES [dbo].[TradeCoreAttributes] ([ISBN13], [SAPVendorId], [VSRCode]) ON DELETE CASCADE
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TradeSubjects TO OnixImportApp;
GO