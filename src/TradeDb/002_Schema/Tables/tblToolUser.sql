﻿CREATE TABLE [syme].[tblToolUser](
	[ToolID] [INT] NOT NULL,
	[UserID] [INT] NOT NULL,
 CONSTRAINT [PK_tblToolUser] PRIMARY KEY CLUSTERED 
(
	[ToolID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [syme].[tblToolUser]  WITH CHECK ADD  CONSTRAINT [FK_tblToolUser_tblTool1] FOREIGN KEY([ToolID])
REFERENCES [syme].[tblTool] ([ToolID])
GO

ALTER TABLE [syme].[tblToolUser] CHECK CONSTRAINT [FK_tblToolUser_tblTool1]
GO

ALTER TABLE [syme].[tblToolUser]  WITH NOCHECK ADD  CONSTRAINT [FK_tblToolUser_tblUser1] FOREIGN KEY([UserID])
REFERENCES [syme].[tblUser] ([UserID])
GO

ALTER TABLE [syme].[tblToolUser] CHECK CONSTRAINT [FK_tblToolUser_tblUser1]
GO