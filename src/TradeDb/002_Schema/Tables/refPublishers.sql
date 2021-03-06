﻿CREATE TABLE [dbo].[refPublishers](
	[PublisherID] [char](20) NOT NULL,
	[PublisherName] [varchar](255) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_refPublishers_IsDeleted]  DEFAULT (0),
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
