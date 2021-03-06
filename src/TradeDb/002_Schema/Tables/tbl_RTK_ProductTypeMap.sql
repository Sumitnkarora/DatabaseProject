﻿CREATE TABLE [syme].[tbl_RTK_ProductTypeMap](
	[BindingTypeID] [VARCHAR](3) NOT NULL,
	[ProductTypeID] [VARCHAR](4) NOT NULL,
 CONSTRAINT [PK_tbl_RTK_ProductTypeMap] PRIMARY KEY CLUSTERED 
(
	[BindingTypeID] ASC,
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO