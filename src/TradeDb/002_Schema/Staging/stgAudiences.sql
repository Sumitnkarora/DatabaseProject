CREATE TABLE [dbo].[stgAudiences](
	[PID] [decimal](12, 0) NOT NULL,
	[MinAudienceAge] [tinyint] NULL,
	[MaxAudienceAge] [tinyint] NULL,
	[MinAudienceGrade] [char](2) NULL,
	[MaxAudienceGrade] [char](2) NULL,
	[AudienceCode] [varchar](20) NULL
)
