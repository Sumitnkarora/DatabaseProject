CREATE TABLE [dbo].[KoboPrices](
	[EBookID] [varchar](36) NOT NULL,
	[ListPrice] [money] NULL,
	[Discount] [money] NULL,
	[SellingPrice] [money] NULL,
	[Cogs] [money] NULL,
	[Currency] [varchar](3) NULL,
	[From] [datetime] NULL,
	[To] [datetime] NULL,
	[Region] [varchar](2) NULL,
	[PriceType] [VARCHAR] (10) NULL,
	[IsPreOrder] [bit] NULL,
	[IncludesTax] [bit] NULL,
	[DateChanged] [datetime] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboPrices_EBookID] ON [dbo].[KoboPrices] ([EBookID]) WITH (FILLFACTOR=90);
GO

CREATE NONCLUSTERED INDEX [IX_KoboPrices_From] ON [dbo].[KoboPrices] ([From]) WITH (FILLFACTOR=90);
GO

CREATE NONCLUSTERED INDEX [IX_KoboPrices_To] ON [dbo].[KoboPrices] ([To]) WITH (FILLFACTOR=90);
GO