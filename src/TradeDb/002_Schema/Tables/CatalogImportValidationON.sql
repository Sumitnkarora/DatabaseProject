﻿CREATE TABLE [dbo].[CatalogImportValidationON](
	[SAPVendorID] [varchar](50) NOT NULL,
	[UseImprint] [bit] NULL,
	[UseSeries] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SAPVendorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]