CREATE TABLE [syme].[tblUserActivityLog](
	[LoggingID] [INT] IDENTITY(1,1) NOT NULL,
	[UserID] [INT] NOT NULL,
	[ActivityID] [INT] NOT NULL,
	[Timestmp] [DATETIME] NOT NULL,
 CONSTRAINT [PK_tblUserActivityLog] PRIMARY KEY CLUSTERED 
(
	[LoggingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [syme].[tblUserActivityLog]  WITH CHECK ADD  CONSTRAINT [FK_tblUserActivityLog_tblActivity] FOREIGN KEY([ActivityID])
REFERENCES [syme].[tblActivity] ([ActivityID])
GO

ALTER TABLE [syme].[tblUserActivityLog] CHECK CONSTRAINT [FK_tblUserActivityLog_tblActivity]
GO

ALTER TABLE [syme].[tblUserActivityLog]  WITH NOCHECK ADD  CONSTRAINT [FK_tblUserActivityLog_tblUser] FOREIGN KEY([UserID])
REFERENCES [syme].[tblUser] ([UserID])
GO

ALTER TABLE [syme].[tblUserActivityLog] CHECK CONSTRAINT [FK_tblUserActivityLog_tblUser]
GO