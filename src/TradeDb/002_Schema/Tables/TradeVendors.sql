CREATE TABLE [dbo].[TradeVendors] (
    [LegacyID]              DECIMAL (10)  NULL,
    [SAPVendorId]           VARCHAR (20)  NOT NULL,
    [VSRCode]               VARCHAR (20)  NOT NULL,
    [SAPVendorName]         VARCHAR (158) NOT NULL,
    [VSRName]               VARCHAR (50)  NULL,
    [VendorName]            VARCHAR (100) NOT NULL,
    [DateChanged]           DATETIME      CONSTRAINT [DF_tblSAPVendors_DateChanged] DEFAULT (getdate()) NOT NULL,
    [Blocked]               INT           NULL,
    [CurrencyTypeID]        VARCHAR (50)  NULL,
	[DiscountBlocked]       BIT	          NULL,
	[PurchasingBlocked]		BIT			  NULL,
	[PaymentBlocked]		BIT 		  NULL,
	[PositionBlocked]		BIT 		  NULL,
    [IsClassOfTradeExcepted] BIT NOT NULL DEFAULT 0, 
    [SymePositionEnabled] BIT NULL, 
    CONSTRAINT [PK_TradeVendors] PRIMARY KEY CLUSTERED ([SAPVendorId] ASC, [VSRCode] ASC) WITH (FILLFACTOR = 90)
);


GO
ALTER TABLE [dbo].[TradeVendors] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


GO

