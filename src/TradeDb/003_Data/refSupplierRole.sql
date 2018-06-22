IF OBJECT_ID('tempdb..[#refSupplierRole]') IS NOT NULL DROP TABLE [#refSupplierRole];

CREATE TABLE [#refSupplierRole]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('00', 'Unspecified');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('01', 'Publisher to retailers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('02', 'Publisher’s exclusive distributor to retailers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('03', 'Publisher’s non-exclusive distributor to retailers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('04', 'Wholesaler');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('05', 'Sales agent');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('06', 'Publisher’s distributor to retailers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('07', 'POD supplier');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('08', 'Retailer');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('09', 'Publisher to end-customers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('10', 'Exclusive distributor to end-customers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('11', 'Non-exclusive distributor to end-customers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('12', 'Distributor to end-customers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('13', 'Exclusive distributor to retailers and end-customers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('14', 'Non-exclusive distributor to retailers and end-customers');
INSERT INTO [#refSupplierRole] ([Id], [Description]) VALUES ('15', 'Distributor to retailers and end-customers');

DELETE dst
FROM [dbo].[refSupplierRole] dst   
	LEFT JOIN [#refSupplierRole] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refSupplierRole] dst  
	JOIN [#refSupplierRole] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refSupplierRole] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refSupplierRole] src
	LEFT JOIN [dbo].[refSupplierRole] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;