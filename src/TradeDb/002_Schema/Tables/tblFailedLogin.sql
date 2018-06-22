CREATE TABLE [syme].[tblFailedLogin](
	[UserID] [INT] NOT NULL,
	[NumberOfFailedLogins] [INT] NOT NULL,
	[LastUpdated] [DATETIME] NOT NULL,
 CONSTRAINT [PK_tblFailedLogins] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [syme].[tblFailedLogin] ADD  CONSTRAINT [DF_tblFailedLogin_NumberOfFailedLogins]  DEFAULT (0) FOR [NumberOfFailedLogins]
GO

ALTER TABLE [syme].[tblFailedLogin]  WITH NOCHECK ADD  CONSTRAINT [FK_tblFailedLogin_tblUser] FOREIGN KEY([UserID])
REFERENCES [syme].[tblUser] ([UserID])
GO

ALTER TABLE [syme].[tblFailedLogin] CHECK CONSTRAINT [FK_tblFailedLogin_tblUser]
GO