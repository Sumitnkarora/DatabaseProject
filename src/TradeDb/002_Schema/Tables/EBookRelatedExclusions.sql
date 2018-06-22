CREATE TABLE [dbo].[EBookRelatedExclusions](
	[EBookID] [varchar](36) NOT NULL,
	[ISBN] [varchar](36) NOT NULL,
	[Reason] [varchar](50) NULL,
 CONSTRAINT [PK_EBookRelatedExclusions] PRIMARY KEY CLUSTERED 
(
	[EBookID] ASC,
	[ISBN] ASC
)
);
GO