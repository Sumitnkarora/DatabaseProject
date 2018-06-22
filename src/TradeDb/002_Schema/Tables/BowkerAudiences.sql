CREATE TABLE [dbo].[BowkerAudiences](
	[PID] [decimal](12, 0) NOT NULL,
	[MinAudienceAge] [tinyint] NULL,
	[MaxAudienceAge] [tinyint] NULL,
	[MinAudienceGrade] [char](2) NULL,
	[MaxAudienceGrade] [char](2) NULL,
	[CreatedBy] [varchar](30) NULL,
	[ChangedBy] [varchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateChanged] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DefDel0926185121]  DEFAULT (0),
	[AudienceCode] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[BowkerAudiences]  WITH NOCHECK ADD  CONSTRAINT [FK_BowkerAudiences_BowkerAudienceCodes] FOREIGN KEY([AudienceCode])
REFERENCES [dbo].[refAudienceCodes] ([AudienceCode])
GO

ALTER TABLE [dbo].[BowkerAudiences] CHECK CONSTRAINT [FK_BowkerAudiences_BowkerAudienceCodes]
GO

ALTER TABLE [dbo].[BowkerAudiences]  WITH NOCHECK ADD  CONSTRAINT [FK_BowkerAudiences_BowkerAudienceGrades] FOREIGN KEY([MinAudienceGrade])
REFERENCES [dbo].[refAudienceGrades] ([AudienceGrade])
GO

ALTER TABLE [dbo].[BowkerAudiences] CHECK CONSTRAINT [FK_BowkerAudiences_BowkerAudienceGrades]
GO

ALTER TABLE [dbo].[BowkerAudiences]  WITH NOCHECK ADD  CONSTRAINT [FK_BowkerAudiences_BowkerAudienceGrades1] FOREIGN KEY([MaxAudienceGrade])
REFERENCES [dbo].[refAudienceGrades] ([AudienceGrade])
GO

ALTER TABLE [dbo].[BowkerAudiences] CHECK CONSTRAINT [FK_BowkerAudiences_BowkerAudienceGrades1]
GO



