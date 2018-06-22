CREATE TABLE [dbo].[refAudienceCodes](
	[AudienceCode] [varchar](3) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_refAudienceCodes_IsDeleted]  DEFAULT (0),
	[OnixCode] VARCHAR(2) NULL, 
    CONSTRAINT [PK_refAudienceCodes] PRIMARY KEY NONCLUSTERED 
(
	[AudienceCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
