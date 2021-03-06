IF OBJECT_ID('tempdb..[#refDiscountType]') IS NOT NULL DROP TABLE [#refDiscountType];    

CREATE TABLE [#refDiscountType]
(
	[ResultTypeCode] [CHAR](1) NOT NULL,
	[ResultType] [VARCHAR](20) NOT NULL
);

INSERT [#refDiscountType] ([ResultTypeCode], [ResultType]) VALUES (N'D', N'Dollars')
INSERT [#refDiscountType] ([ResultTypeCode], [ResultType]) VALUES (N'F', N'Fixed')
INSERT [#refDiscountType] ([ResultTypeCode], [ResultType]) VALUES (N'P', N'Percent')

DELETE dst  
FROM [dbo].[refDiscountType] dst   
	LEFT JOIN [#refDiscountType] src ON dst.[ResultTypeCode] COLLATE Latin1_General_CI_AS  = src.[ResultTypeCode]  
WHERE src.[ResultTypeCode] IS NULL;    

UPDATE dst  
SET [ResultType] = src.ResultType
FROM [dbo].[refDiscountType] dst  
	JOIN [#refDiscountType] src ON dst.[ResultTypeCode] COLLATE Latin1_General_CI_AS  = src.[ResultTypeCode]  
WHERE src.[ResultType] COLLATE Latin1_General_CI_AS  <> dst.[ResultType]   
	
INSERT [dbo].[refDiscountType] (   
	[ResultTypeCode], [ResultType]
)  
SELECT src.[ResultTypeCode], src.[ResultType]
FROM [#refDiscountType] src   
	LEFT JOIN [dbo].[refDiscountType] dst ON dst.[ResultTypeCode] COLLATE Latin1_General_CI_AS  = src.[ResultTypeCode]  
WHERE dst.[ResultTypeCode] IS NULL;   
