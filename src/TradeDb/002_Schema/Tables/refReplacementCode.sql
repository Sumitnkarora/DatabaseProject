﻿CREATE TABLE [dbo].[refReplacementCode](
	[ReplacementCode] [varchar](5) NOT NULL,
	[ReplacementDesc] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReplacementCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]