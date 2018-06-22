IF OBJECT_ID('tempdb..[#refPaperCertificationType]') IS NOT NULL DROP TABLE [#refPaperCertificationType];

CREATE TABLE [#refPaperCertificationType]  
(   
	[PaperCertificationTypeName] varchar(255) NULL  , 
	[PaperCertificationTypeCode] varchar(255) NOT NULL  , 
	[Display] bit NOT NULL  
);

INSERT [#refPaperCertificationType]([PaperCertificationTypeName], [PaperCertificationTypeCode], [Display]) VALUES('Canadian Standards Association', 'CSA', 1);
INSERT [#refPaperCertificationType]([PaperCertificationTypeName], [PaperCertificationTypeCode], [Display]) VALUES('Forest Stewardship Council', 'FSC', 1);
INSERT [#refPaperCertificationType]([PaperCertificationTypeName], [PaperCertificationTypeCode], [Display]) VALUES('Programme for the Endorsement of Forest Certification schemes', 'PEFC', 1);
INSERT [#refPaperCertificationType]([PaperCertificationTypeName], [PaperCertificationTypeCode], [Display]) VALUES('Sustainable Forestry Initiative', 'SFI', 1);

 DELETE dst  
 FROM [dbo].[refPaperCertificationType] dst   
	LEFT JOIN [#refPaperCertificationType] src ON dst.[PaperCertificationTypeCode] = src.[PaperCertificationTypeCode]  
WHERE src.[PaperCertificationTypeCode] IS NULL;    

UPDATE dst  
SET [PaperCertificationTypeName] = src.[PaperCertificationTypeName]  , 
	[Display] = src.[Display]  
FROM [dbo].[refPaperCertificationType] dst  
	JOIN [#refPaperCertificationType] src ON dst.[PaperCertificationTypeCode] = src.[PaperCertificationTypeCode]  
WHERE (src.[PaperCertificationTypeName] IS NULL AND dst.[PaperCertificationTypeName] IS NOT NULL) OR 
	(src.[PaperCertificationTypeName] IS NOT NULL AND dst.[PaperCertificationTypeName] IS NULL) OR 
	src.[PaperCertificationTypeName] <> dst.[PaperCertificationTypeName]  OR 
	src.[Display] <> dst.[Display];    
	
INSERT [dbo].[refPaperCertificationType] (   
	[PaperCertificationTypeName], [PaperCertificationTypeCode], [Display]  
)  
SELECT src.[PaperCertificationTypeName], src.[PaperCertificationTypeCode], src.[Display]  
FROM [#refPaperCertificationType] src   
	LEFT JOIN [dbo].[refPaperCertificationType] dst ON dst.[PaperCertificationTypeCode] = src.[PaperCertificationTypeCode]  
WHERE dst.[PaperCertificationTypeCode] IS NULL;    