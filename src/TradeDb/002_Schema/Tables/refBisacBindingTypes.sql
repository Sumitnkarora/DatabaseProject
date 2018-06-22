CREATE TABLE [dbo].[refBisacBindingTypes](
	[BISACBindingTypeID] [char](3) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_refBisacBindingTypes_IsDeleted]  DEFAULT (0),
	[InternalOnly] [bit] NOT NULL DEFAULT (1),
PRIMARY KEY CLUSTERED 
(
	[BISACBindingTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]