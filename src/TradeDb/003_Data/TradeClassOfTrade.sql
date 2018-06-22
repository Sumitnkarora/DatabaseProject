IF OBJECT_ID('tempdb..[#TradeClassOfTrade]') IS NOT NULL DROP TABLE [#TradeClassOfTrade];

CREATE TABLE [#TradeClassOfTrade]
(
	[SAPVendorID] varchar(12) NOT NULL
,	[ClassOfTrade] varchar(50) NOT NULL
,	[ClassOfTradeCode] varchar(4) NOT NULL
,	[Discount] varchar(20) NULL
,	[ClassOfTradeDescription] char(50) NULL
,	[CreationDate] datetime NOT NULL
);

INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', '3', '', '10.0', 'B&T USA General Short                             ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', '4', '', '25.5', 'B&T USA Textbooks in Enhanced Discount Program    ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', '5', '', '10.0', 'B&T USA Professional Medical Titles               ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', '6', '', '24.0', 'B&T USA Professional Medical Titles               ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', '8', '', '30.0', 'B&T USA Professional Medical Titles               ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'D', '', '0.0', 'B&T USA Net                                       ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'E', '', '25.0', 'B&T USA General Short                             ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'F', '', '35.0', 'B&T USA Imported Foreign Language Editions        ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'K', '', '25.0', 'B&T USA General Short                             ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'N', '', '5.0', 'B&T USA Text, Technical, Reference Editions       ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'O', '', '32.5', 'B&T USA Textbooks in Enhanced Discount Program    ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'Q', '', '5.0', 'B&T USA Enhanced Services Program                 ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'S', '', '25.0', 'B&T USA Non-Returnable Titles                     ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'T', '', '10.0', 'B&T USA Specialty Textbooks                       ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'U', '', '25.0', 'B&T USA Textbooks in Enhanced Discount Program    ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'V', '', '15.0', 'B&T USA Specialty Textbooks                       ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'W', '', '21.5', 'B&T USA Textbooks in Enhanced Discount Program    ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'X', '', '20.0', 'B&T USA Text, Technical, Reference Editions       ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'Y', '', '0.0', 'B&T USA Net                                       ', GETDATE());
INSERT [#TradeClassOfTrade]([SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]) VALUES('724543', 'Z', '', '15.0', 'B&T USA Publisher''s Library Editions              ', GETDATE());

DELETE	dst
FROM	[dbo].[TradeClassOfTrade] dst
	LEFT JOIN [#TradeClassOfTrade] src ON dst.[ClassOfTrade] = src.[ClassOfTrade] AND dst.[SAPVendorID] = src.[SAPVendorID]
WHERE	src.[ClassOfTrade] IS NULL;

UPDATE	dst
SET	[ClassOfTradeCode] = src.[ClassOfTradeCode]
,	[Discount] = src.[Discount]
,	[ClassOfTradeDescription] = src.[ClassOfTradeDescription]
,	[CreationDate] = src.[CreationDate]
FROM	[dbo].[TradeClassOfTrade] dst
JOIN	[#TradeClassOfTrade] src ON dst.[ClassOfTrade] = src.[ClassOfTrade] AND dst.[SAPVendorID] = src.[SAPVendorID]
WHERE	src.[ClassOfTradeCode] <> dst.[ClassOfTradeCode]
OR	(src.[Discount] IS NULL AND dst.[Discount] IS NOT NULL) OR (src.[Discount] IS NOT NULL AND dst.[Discount] IS NULL) OR src.[Discount] <> dst.[Discount]
OR	(src.[ClassOfTradeDescription] IS NULL AND dst.[ClassOfTradeDescription] IS NOT NULL) OR (src.[ClassOfTradeDescription] IS NOT NULL AND dst.[ClassOfTradeDescription] IS NULL) OR src.[ClassOfTradeDescription] <> dst.[ClassOfTradeDescription];

INSERT	[dbo].[TradeClassOfTrade] (
	[SAPVendorID], [ClassOfTrade], [ClassOfTradeCode], [Discount]
,	[ClassOfTradeDescription], [CreationDate]
)
SELECT	src.[SAPVendorID], src.[ClassOfTrade], src.[ClassOfTradeCode], src.[Discount]
,	src.[ClassOfTradeDescription], src.[CreationDate]
FROM	[#TradeClassOfTrade] src
	LEFT JOIN [dbo].[TradeClassOfTrade] dst ON dst.[ClassOfTrade] = src.[ClassOfTrade] AND dst.[SAPVendorID] = src.[SAPVendorID]
WHERE	dst.[ClassOfTrade] IS NULL;

