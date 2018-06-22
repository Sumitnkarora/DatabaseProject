IF OBJECT_ID('tempdb..[#refHandlingIndicator]') IS NOT NULL DROP TABLE [#refHandlingIndicator];    

CREATE TABLE [#refHandlingIndicator]  
(   
	[HandlingID] varchar(4) NOT NULL  ,
	[HandlingDesc] varchar(100) NOT NULL  
);   

INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0001', 'Item requires no Special Handling');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0002', 'Item requires Special VAS Processing');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0003', 'Item requires Bagging in Plastic Bag');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0004', 'Create and Label UPC/ISBN');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0005', 'Create and Label Bargain Price');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0006', 'Security Tag Required');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0007', 'Create and Label Retail Price');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0008', 'Volume Set # do not separate');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0009', 'Apply assortment label');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('0010', 'Apply Rolling Assortment SKU');
INSERT [#refHandlingIndicator]([HandlingID], [HandlingDesc]) VALUES('zzzz', 'No Handling Indicator Applied (Default)'); 

DELETE dst  
FROM [dbo].[refHandlingIndicator] dst   
	LEFT JOIN [#refHandlingIndicator] src ON dst.[HandlingID] = src.[HandlingID]  
WHERE src.[HandlingID] IS NULL;    

UPDATE dst  
SET [HandlingDesc] = src.[HandlingDesc]  
FROM [dbo].[refHandlingIndicator] dst  
	JOIN [#refHandlingIndicator] src ON dst.[HandlingID] = src.[HandlingID]  
WHERE src.[HandlingDesc] <> dst.[HandlingDesc];    

INSERT [dbo].[refHandlingIndicator] (   
	[HandlingID], [HandlingDesc]  
)  
SELECT src.[HandlingID], src.[HandlingDesc]  
FROM [#refHandlingIndicator] src   
	LEFT JOIN [dbo].[refHandlingIndicator] dst ON dst.[HandlingID] = src.[HandlingID]  
WHERE dst.[HandlingID] IS NULL;    