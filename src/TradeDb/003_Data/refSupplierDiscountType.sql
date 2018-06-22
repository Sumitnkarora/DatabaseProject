IF OBJECT_ID('tempdb..[#refSupplierDiscountType]') IS NOT NULL DROP TABLE [#refSupplierDiscountType];

CREATE TABLE [#refSupplierDiscountType]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refSupplierDiscountType] ([Id], [Description]) VALUES ('01', 'BIC discount group code');
INSERT INTO [#refSupplierDiscountType] ([Id], [Description]) VALUES ('02', 'Proprietary discount code');
INSERT INTO [#refSupplierDiscountType] ([Id], [Description]) VALUES ('03', 'Boeksoort');
INSERT INTO [#refSupplierDiscountType] ([Id], [Description]) VALUES ('04', 'German terms code');
INSERT INTO [#refSupplierDiscountType] ([Id], [Description]) VALUES ('05', 'Proprietary commission code');
INSERT INTO [#refSupplierDiscountType] ([Id], [Description]) VALUES ('06', 'BIC commission group code');

DELETE dst
FROM [dbo].[refSupplierDiscountType] dst   
	LEFT JOIN [#refSupplierDiscountType] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refSupplierDiscountType] dst  
	JOIN [#refSupplierDiscountType] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refSupplierDiscountType] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refSupplierDiscountType] src
	LEFT JOIN [dbo].[refSupplierDiscountType] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;