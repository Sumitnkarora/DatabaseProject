CREATE TABLE [dbo].[BowkerAwards](
	[PID] [decimal](12, 0) NOT NULL,
	[PrizeCode] [char](2) NOT NULL,
	[PrizeName] [varchar](100) NOT NULL,
	[PrizeYear] [varchar](4) NOT NULL,
	[PrizeCountry] [varchar](2) NOT NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_BowkerAwards] PRIMARY KEY CLUSTERED 
(
	[PID] ASC,
	[PrizeCode] ASC,
	[PrizeName] ASC,
	[PrizeYear] ASC,
	[PrizeCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
);
GO

CREATE TRIGGER TRG_BowkerAwards_A_Delete ON dbo.BowkerAwards
FOR DELETE
AS
BEGIN
	IF @@Rowcount = 0
		RETURN;
	
	UPDATE	dbo.TradeDataTimestamps
	SET	DateChangedAwards = GETDATE()
	FROM	dbo.TradeDataTimestamps as c
	JOIN	dbo.TradeDataByVendor as v ON c.ISBN13 = v.ISBN13 and c.SAPVendorId = v.SAPVendorId AND c.VSRCode = v.VSRCode
	JOIN	Deleted as i ON v.pid = i.PID
END
GO

CREATE TRIGGER TRG_BowkerAwards_A_InsertUpdate ON dbo.BowkerAwards
FOR INSERT, UPDATE
AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN;

	UPDATE	dbo.TradeDataTimestamps
	SET	DateChangedAwards = GETDATE()
	FROM	dbo.TradeDataTimestamps as c
	JOIN	dbo.TradeDataByVendor as v ON c.ISBN13 = v.ISBN13 and c.SAPVendorId = v.SAPVendorId AND c.VSRCode = v.VSRCode
	JOIN	Inserted as i ON v.pid = i.PID
END
GO
