IF OBJECT_ID('tempdb..[#refDiscountEligibilityParameterGroup]') IS NOT NULL DROP TABLE [#refDiscountEligibilityParameterGroup];    

CREATE TABLE [#refDiscountEligibilityParameterGroup]
(
	[ParameterGroupCode] [CHAR](1) NOT NULL,
	[ParameterGroup] [VARCHAR](20) NOT NULL
);


INSERT [#refDiscountEligibilityParameterGroup] ([ParameterGroupCode], [ParameterGroup]) VALUES (N'A', N'Any')
INSERT [#refDiscountEligibilityParameterGroup] ([ParameterGroupCode], [ParameterGroup]) VALUES (N'D', N'Department')
INSERT [#refDiscountEligibilityParameterGroup] ([ParameterGroupCode], [ParameterGroup]) VALUES (N'M', N'MCAT')
INSERT [#refDiscountEligibilityParameterGroup] ([ParameterGroupCode], [ParameterGroup]) VALUES (N'U', N'UPC')


DELETE dst  
FROM [dbo].[refDiscountEligibilityParameterGroup] dst   
	LEFT JOIN [#refDiscountEligibilityParameterGroup] src ON dst.[ParameterGroupCode] COLLATE Latin1_General_CI_AS  = src.[ParameterGroupCode]  
WHERE src.[ParameterGroupCode] IS NULL;    

UPDATE dst  
SET [ParameterGroup] = src.ParameterGroup
FROM [dbo].[refDiscountEligibilityParameterGroup] dst  
	JOIN [#refDiscountEligibilityParameterGroup] src ON dst.[ParameterGroupCode] COLLATE Latin1_General_CI_AS  = src.[ParameterGroupCode]  
WHERE src.[ParameterGroup] COLLATE Latin1_General_CI_AS  <> dst.[ParameterGroup]   
	
INSERT [dbo].[refDiscountEligibilityParameterGroup] (   
	[ParameterGroupCode], [ParameterGroup]
)  
SELECT src.[ParameterGroupCode], src.[ParameterGroup]
FROM [#refDiscountEligibilityParameterGroup] src   
	LEFT JOIN [dbo].[refDiscountEligibilityParameterGroup] dst ON dst.[ParameterGroupCode] COLLATE Latin1_General_CI_AS  = src.[ParameterGroupCode]  
WHERE dst.[ParameterGroupCode] IS NULL;   