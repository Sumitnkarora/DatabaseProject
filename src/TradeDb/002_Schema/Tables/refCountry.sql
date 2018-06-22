﻿CREATE TABLE [dbo].[refCountry](
	[CountryName] [varchar](100) NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[Display] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO