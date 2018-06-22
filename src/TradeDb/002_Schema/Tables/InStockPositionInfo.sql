CREATE TABLE [syme].[InStockPositionInfo](
	[VendorID] [varchar](50) NOT NULL,
	[PID] [decimal](12, 0) NOT NULL,
	[CartonQuantity] [int] NULL,
	[UnitsAvailable] [int] NULL,
	[LoggingID] [int] NOT NULL DEFAULT (0),
	[DateChanged] [datetime] NULL,
 CONSTRAINT [PK_InStockPositionInfo] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC,
	[PID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO