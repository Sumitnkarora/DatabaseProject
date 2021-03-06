﻿CREATE TABLE [syme].[tblActivity](
	[ActivityID] [INT] NOT NULL,
	[Description] [VARCHAR](50) NOT NULL,
 CONSTRAINT [PK_tblActivity] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO