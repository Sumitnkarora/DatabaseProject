CREATE TABLE [dbo].[refCurrencyTypes](
	[CurrencyTypeID] [varchar](3) NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[ExchangeRate] [decimal](5, 4) NOT NULL,
	[CreatedBy] [varchar](30) NULL,
	[ChangedBy] [varchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateChanged] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_refCurrencyTypes_IsDeleted]  DEFAULT (0),
	[InternalOnly] [bit] NOT NULL DEFAULT (1),
 CONSTRAINT [PK_refCurrencyTypes] PRIMARY KEY NONCLUSTERED 
(
	[CurrencyTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]