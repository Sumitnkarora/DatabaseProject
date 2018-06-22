CREATE TABLE [dbo].[stgBowkerONIXmessage](
	[MessageNumber] [varchar](12) NULL,
	[SentDate] [varchar](12) NULL,
	[DefaultLanguageOfText] [char](3) NULL,
	[DefaultPriceTypeCode] [char](2) NULL,
	[DefaultCurrencyCode] [char](3) NULL,
	[DefaultLinearUnit] [char](2) NULL,
	[DefaultWeightUnit] [char](2) NULL,
	[DefaultClassOfTrade] [nvarchar](50) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerONIXmessage] TO [BowkerApp];
GO