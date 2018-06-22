CREATE TABLE [dbo].[CatalogImportStatFile](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](500) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_CatalogImportStatFile_FileID] PRIMARY KEY NONCLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[CatalogImportStatFile] TO [CatalogImportApp];
GO