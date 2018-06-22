﻿CREATE TABLE [dbo].[BowkerWorks](
	[PID] [decimal](12, 0) NOT NULL,
	[WorkID] [int] NULL,
	[DateChanged] [datetime] NULL,
 CONSTRAINT [PK_BowkerWorks] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
)
