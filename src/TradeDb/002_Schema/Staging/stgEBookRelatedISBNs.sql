CREATE TABLE [dbo].[stgEBookRelatedISBNs]
(
	[eBookID] [varchar](36) NOT NULL,
	[KoboContentType] [tinyint] NOT NULL,
	[RelatedISBN] [varchar](50) NOT NULL
) ON [PRIMARY]
