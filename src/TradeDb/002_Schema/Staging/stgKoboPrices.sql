CREATE TABLE [dbo].[stgKoboPrices](
	[EBookID] [varchar](36) NOT NULL,
	[ListPrice] [money] NULL,
	[Discount] [money] NULL,
	[SellingPrice] [money] NULL,
	[Cogs] [money] NULL,
	[Currency] [varchar](3) NULL,
	[From] [datetime] NULL,
	[To] [datetime] NULL,
	[Region] [varchar](2) NULL, 
    [PriceType] VARCHAR(10) NULL,
	[IsPreOrder] [bit] NULL,
	[IncludesTax] [bit] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboPrices_EBookID] ON [dbo].[stgKoboPrices] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboPrices] TO [KoboImporterApp];
GO