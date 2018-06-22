IF OBJECT_ID('tempdb..[#refBindingMap]') IS NOT NULL DROP TABLE [#refBindingMap];

CREATE TABLE [#refBindingMap]
(
	[CatalogDBBinding] char(2) NOT NULL
,	[SAPDiscountCode] char(2) NOT NULL
,	[SAPProdHierarchy] char(2) NOT NULL
,	[SAPProductType] char(2) NOT NULL
);

INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('AA', 'AU', 'AU', 'AU')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BA', 'TR', 'BA', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BC', 'TR', 'BC', 'BC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BD', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BG', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BI', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BL', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BM', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BS', 'TR', 'BS', 'BS')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BV', 'TR', 'BV', 'BV')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('BX', 'TR', 'BK', 'BX')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('C1', 'AU', 'AU', 'AU')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('C2', 'AU', 'AU', 'AU')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('C3', 'AU', 'AU', 'AU')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('C4', 'AU', 'AU', 'AU')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CA', 'CL', 'CA', 'CL')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CC', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CD', 'AU', 'AU', 'AU')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CG', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CM', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CO', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CR', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('CT', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('DA', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('DL', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('DS', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('DV', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('FB', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('FF', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('FI', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('FM', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('FU', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('GG', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('GX', '  ', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('H3', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('H5', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('IL', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('KI', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('L3', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('L5', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('LB', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('LE', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('LL', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('LP', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MA', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MC', '  ', 'VM', 'MC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MI', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MM', 'MM', 'BK', 'MM')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MN', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MO', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MP', 'TR', 'GS', 'MP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('MU', 'TR', 'BA', 'BA')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('NA', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('OB', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('OO', 'TR', 'BA', 'BA')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('OT', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('PD', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('PF', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('PI', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('PL', 'TR', 'BA', 'BA')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('PO', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('PT', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('Q ', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('RB', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('RL', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('SB', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('SC', 'TR', 'BK', 'BX')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('SD', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('SI', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('SL', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('SP', 'TR', 'BK', 'SP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('ST', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('TA', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('TC', 'TR', 'BK', 'HC')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('TP', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('TR', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('TX', 'GP', 'BT', 'BT')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('TY', 'TR', 'BT', 'BT')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('VA', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('VB', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('VD', 'TR', 'VM', 'DV')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('VK', 'TR', 'VM', 'DV')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('VL', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('VX', '  ', 'VM', 'DV')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('W}', 'AU', 'AU', 'AU')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('WB', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('WC', 'TR', 'BK', 'SP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('XB', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('XC', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('XX', 'TR', 'GS', 'GI')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('XZ', 'TR', 'BK', 'TP')
INSERT #refBindingMap (CatalogDBBinding, SAPDiscountCode, SAPProdHierarchy, SAPProductType) VALUES('YA', 'TR', 'BA', 'BA')

DELETE	dst
FROM	[dbo].[refBindingMap] dst
	LEFT JOIN [#refBindingMap] src ON dst.[CatalogDBBinding] = src.[CatalogDBBinding]
WHERE	src.[CatalogDBBinding] IS NULL;

UPDATE	dst
SET	[SAPDiscountCode] = src.[SAPDiscountCode]
,	[SAPProdHierarchy] = src.[SAPProdHierarchy]
,	[SAPProductType] = src.[SAPProductType]
FROM	[dbo].[refBindingMap] dst
JOIN	[#refBindingMap] src ON dst.[CatalogDBBinding] = src.[CatalogDBBinding]
WHERE	src.[SAPDiscountCode] <> dst.[SAPDiscountCode]
OR	src.[SAPProdHierarchy] <> dst.[SAPProdHierarchy]
OR	src.[SAPProductType] <> dst.[SAPProductType];

INSERT	[dbo].[refBindingMap] (
	[CatalogDBBinding], [SAPDiscountCode], [SAPProdHierarchy], [SAPProductType]
)
SELECT	src.[CatalogDBBinding], src.[SAPDiscountCode], src.[SAPProdHierarchy], src.[SAPProductType]
FROM	[#refBindingMap] src
	LEFT JOIN [dbo].[refBindingMap] dst ON dst.[CatalogDBBinding] = src.[CatalogDBBinding]
WHERE	dst.[CatalogDBBinding] IS NULL;
