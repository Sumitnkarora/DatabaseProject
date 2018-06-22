IF OBJECT_ID('tempdb..[#refDiscountCodeMapping]') IS NOT NULL DROP TABLE [#refDiscountCodeMapping];

CREATE TABLE [#refDiscountCodeMapping]
(
	[Id] INT NOT NULL IDENTITY(1, 1)
,	[SAPVendorId] VARCHAR(20) NOT NULL
,	[DiscountCodeType] CHAR(2) NULL
,	[DiscountCodeValue] VARCHAR(255) NULL
,	[Discount] DECIMAL(9, 5) NOT NULL
);

-- Discount codes for B&T
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'E', 25.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'D', 0.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'Y', 0.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', '3', 10.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', '4', 25.5);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', '5', 10.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', '6', 24.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', '8', 30.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'F', 35.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'K', 25.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'N', 5.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'O', 32.5);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'Q', 5.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'S', 25.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'T', 10.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'U', 25.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'V', 15.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'W', 21.5);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'X', 20.0);
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]) VALUES ('701215', '02', 'Z', 15.0);

-- Discount codes for B&T QA
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount])
SELECT '723125' as [SAPVendorID], [DiscountCodeType], [DiscountCodeValue], [Discount]
FROM #refDiscountCodeMapping WHERE [SAPVendorId] = '701215'

-- Discount codes for B&T Prod
INSERT INTO [#refDiscountCodeMapping] ([SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount])
SELECT '724543' as [SAPVendorID], [DiscountCodeType], [DiscountCodeValue], [Discount]
FROM #refDiscountCodeMapping WHERE [SAPVendorId] = '701215'

DELETE dst
FROM [dbo].[refDiscountCodeMapping] dst
	LEFT JOIN [#refDiscountCodeMapping] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET	[SAPVendorId] = src.[SAPVendorId],
	[DiscountCodeType] = src.[DiscountCodeType],
	[DiscountCodeValue] = src.[DiscountCodeValue],
	[Discount] = src.[Discount]
FROM [dbo].[refDiscountCodeMapping] dst
	JOIN [#refDiscountCodeMapping] src ON dst.[Id] = src.[Id]
WHERE src.[SAPVendorId] <> dst.[SAPVendorId]
	OR src.[DiscountCodeType] <> dst.[DiscountCodeType]
	OR src.[DiscountCodeValue] <> dst.[DiscountCodeValue]
	OR src.[Discount] <> dst.[Discount];
	
INSERT [dbo].[refDiscountCodeMapping] (
	[SAPVendorId], [DiscountCodeType], [DiscountCodeValue], [Discount]
)
SELECT src.[SAPVendorId], src.[DiscountCodeType], src.[DiscountCodeValue], src.[Discount]
FROM [#refDiscountCodeMapping] src
	LEFT JOIN [dbo].[refDiscountCodeMapping] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;