CREATE TABLE [dbo].[refAudienceGrades](
	[AudienceGrade] [char](2) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_refAudienceGrades_IsDeleted]  DEFAULT (0),
 CONSTRAINT [PK_refAudienceGrades] PRIMARY KEY NONCLUSTERED 
(
	[AudienceGrade] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]