CREATE TABLE [syme].[InStockPositionInfolog](
	[VendorID] [varchar](50) NOT NULL,
	[PID] [decimal](18, 0) NOT NULL,
	[CartonQuantity] [int] NULL,
	[UnitsAvailable] [int] NULL,
	[DateCreated] [datetime] NULL,
	[DateChanged] [datetime] NULL,
	[LoggingID] [int] NOT NULL
) ON [PRIMARY]