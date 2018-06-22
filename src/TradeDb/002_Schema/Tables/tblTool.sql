CREATE TABLE [syme].[tblTool](
	[ToolID] [INT] NOT NULL,
	[Name] [VARCHAR](50) NOT NULL,
	[URL] [VARCHAR](50) NULL,
	[DisplayTool] [BIT] NOT NULL,
	[ShowOrder] [INT] NULL,
	[GroupID] [INT] NOT NULL,
	[EnabledForUserByDefault] [TINYINT] NOT NULL,
 CONSTRAINT [PK_tblTool] PRIMARY KEY CLUSTERED 
(
	[ToolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [syme].[tblTool] ADD  CONSTRAINT [DF_tblTool_DisplayTool]  DEFAULT (0) FOR [DisplayTool]
GO

ALTER TABLE [syme].[tblTool] ADD  CONSTRAINT [tblTool_DF_EnabledForUserByDefault]  DEFAULT (0) FOR [EnabledForUserByDefault]
GO

ALTER TABLE [syme].[tblTool]  WITH CHECK ADD  CONSTRAINT [FK_tblTool_tblToolGroup1] FOREIGN KEY([GroupID])
REFERENCES [syme].[tblToolGroup] ([GroupID])
GO

ALTER TABLE [syme].[tblTool] CHECK CONSTRAINT [FK_tblTool_tblToolGroup1]
GO