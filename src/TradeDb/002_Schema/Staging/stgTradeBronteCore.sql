﻿CREATE TABLE [dbo].[stgTradeBronteCore](
	[PID] [decimal](12, 0) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Subtitle] [nvarchar](100) NULL,
	[CurrencyTypeID] [varchar](3) NULL,
	[ItemCost] [varchar](20) NULL,
	[CostOverridden] [varchar](3) NULL,
	[SourcePrice] [varchar](20) NULL,
	[ListPrice] [varchar](20) NULL,
	[ListPriceOverridden] [varchar](3) NULL,
	[AdjustedPrice] [varchar](20) NULL,
	[AdjustedPriceOverridden] [varchar](3) NULL,
	[VendorID] [varchar](50) NULL,
	[CostFactorID] [varchar](3) NULL,
	[StatusID] [varchar](3) NULL,
	[OnSaleDate] [varchar](20) NULL,
	[IsDeleted] [varchar](3) NULL,
	[FileName] [varchar](255) NULL, 
    [Reason] [varchar](255) NULL
) ON [PRIMARY]
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgTradeBronteCore] TO [CoreFileImporterApp];
GO