IF OBJECT_ID('tempdb..[#refDiscountEligibilityParameterType]') IS NOT NULL DROP TABLE [#refDiscountEligibilityParameterType];    

CREATE TABLE [#refDiscountEligibilityParameterType]
(
	[ParameterTypeCode] [CHAR](1) NOT NULL,
	[ParameterType] [VARCHAR](20) NOT NULL
);


INSERT [#refDiscountEligibilityParameterType] ([ParameterTypeCode], [ParameterType]) VALUES (N'E', N'Exclusion')
INSERT [#refDiscountEligibilityParameterType] ([ParameterTypeCode], [ParameterType]) VALUES (N'I', N'Inclusion')

DELETE dst  
FROM [dbo].[refDiscountEligibilityParameterType] dst   
	LEFT JOIN [#refDiscountEligibilityParameterType] src ON dst.[ParameterTypeCode] COLLATE Latin1_General_CI_AS  = src.[ParameterTypeCode]  
WHERE src.[ParameterTypeCode] IS NULL;    

UPDATE dst  
SET [ParameterType] = src.ParameterType
FROM [dbo].[refDiscountEligibilityParameterType] dst  
	JOIN [#refDiscountEligibilityParameterType] src ON dst.[ParameterTypeCode] COLLATE Latin1_General_CI_AS  = src.[ParameterTypeCode]  
WHERE src.[ParameterType] COLLATE Latin1_General_CI_AS  <> dst.[ParameterType]   
	
INSERT [dbo].[refDiscountEligibilityParameterType] (   
	[ParameterTypeCode], [ParameterType]
)  
SELECT src.[ParameterTypeCode], src.[ParameterType]
FROM [#refDiscountEligibilityParameterType] src   
	LEFT JOIN [dbo].[refDiscountEligibilityParameterType] dst ON dst.[ParameterTypeCode] COLLATE Latin1_General_CI_AS  = src.[ParameterTypeCode]  
WHERE dst.[ParameterTypeCode] IS NULL;   