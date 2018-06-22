-- Previously known as [ProductsDb].[dbo].[tbl_CMN_ChaptersNotesStatusCodes] 
CREATE TABLE [dbo].[refDescriptionStatusCodes](
	[DescriptionStatusId] [tinyint] NOT NULL,
	[Description] [varchar](50) NULL,
    CONSTRAINT [PK_refDescriptionStatusCodes] PRIMARY KEY ([DescriptionStatusId])
) 
