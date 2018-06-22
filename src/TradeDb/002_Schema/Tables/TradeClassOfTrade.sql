CREATE TABLE [dbo].[TradeClassOfTrade](
	[SAPVendorID] [varchar](12) NOT NULL,
	[ClassOfTrade] [varchar](50) NOT NULL,
	[ClassOfTradeCode] [varchar](4) NOT NULL,
	[Discount] [varchar](20) NULL,
	[ClassOfTradeDescription] [char](50) NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TradeClassOfTrade] PRIMARY KEY CLUSTERED 
(
	[SAPVendorID] ASC,
	[ClassOfTrade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]