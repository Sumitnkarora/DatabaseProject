CREATE TABLE [dbo].[refLanguage](
	[LanguageID] [smallint] NOT NULL,
	[LanguageName] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_refLanguage_IsDeleted]  DEFAULT (0),
	[LanguageCode] VARCHAR(2) NULL, 
	[OnixCode] VARCHAR(3) NULL, 
    CONSTRAINT [PK_refLanguage] PRIMARY KEY NONCLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_refLanguage_LanguageCode] ON [dbo].[refLanguage]([LanguageCode]) INCLUDE ([OnixCode]) WHERE [LanguageCode] IS NOT NULL;
GO

CREATE NONCLUSTERED INDEX [IX_refLanguage_LanguageName] ON [dbo].[refLanguage]([LanguageName]) INCLUDE ([OnixCode]);
GO