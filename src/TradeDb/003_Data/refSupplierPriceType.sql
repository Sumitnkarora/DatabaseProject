IF OBJECT_ID('tempdb..[#refSupplierPriceType]') IS NOT NULL DROP TABLE [#refSupplierPriceType];

CREATE TABLE [#refSupplierPriceType]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('01', 'RRP excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('02', 'RRP including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('03', 'Fixed retail price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('04', 'Fixed retail price including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('05', 'Supplier’s net price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('06', 'Supplier’s net price excluding tax: rental goods');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('07', 'Supplier’s net price including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('08', 'Supplier’s alternative net price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('09', 'Supplier’s alternative net price including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('11', 'Special sale RRP excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('12', 'Special sale RRP including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('13', 'Special sale fixed retail price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('14', 'Special sale fixed retail price including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('15', 'Supplier’s net price for special sale excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('17', 'Supplier’s net price for special sale including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('21', 'Pre-publication RRP excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('22', 'Pre-publication RRP including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('23', 'Pre-publication fixed retail price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('24', 'Pre-publication fixed retail price including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('25', 'Supplier’s pre-publication net price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('27', 'Supplier’s pre-publication net price including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('31', 'Freight-pass-through RRP excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('32', 'Freight-pass-through billing price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('33', 'Importer’s Fixed retail price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('34', 'Importer’s Fixed retail price including tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('41', 'Publishers retail price excluding tax');
INSERT INTO [#refSupplierPriceType] ([Id], [Description]) VALUES ('42', 'Publishers retail price including tax');

DELETE dst
FROM [dbo].[refSupplierPriceType] dst   
	LEFT JOIN [#refSupplierPriceType] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refSupplierPriceType] dst  
	JOIN [#refSupplierPriceType] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refSupplierPriceType] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refSupplierPriceType] src
	LEFT JOIN [dbo].[refSupplierPriceType] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;