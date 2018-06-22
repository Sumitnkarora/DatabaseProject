IF OBJECT_ID('tempdb..[#refFeedExportStatus]') IS NOT NULL DROP TABLE [#refFeedExportStatus];    

CREATE TABLE [#refFeedExportStatus]  
(   
	[StatusId] smallint NOT NULL  , 
	[Description] varchar(50) NOT NULL 
);    

INSERT [#refFeedExportStatus]([StatusId], [Description]) VALUES(0, 'New');
INSERT [#refFeedExportStatus]([StatusId], [Description]) VALUES(1, 'Processing');
INSERT [#refFeedExportStatus]([StatusId], [Description]) VALUES(2, 'Success');
INSERT [#refFeedExportStatus]([StatusId], [Description]) VALUES(3, 'Failed');

DELETE dst  
FROM [dbo].[refFeedExportStatus] dst  
	LEFT JOIN [#refFeedExportStatus] src ON dst.[StatusId] = src.[StatusId]  
WHERE src.[StatusId] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]
FROM [dbo].[refFeedExportStatus] dst  
	JOIN [#refFeedExportStatus] src ON dst.[StatusId] = src.[StatusId]  
WHERE src.[Description] <> dst.[Description]
	
INSERT [dbo].[refFeedExportStatus] (   
	[StatusId], [Description] 
)  
SELECT src.[StatusId], src.[Description]  
FROM [#refFeedExportStatus] src   
	LEFT JOIN [dbo].[refFeedExportStatus] dst ON dst.[StatusId] = src.[StatusId]  
WHERE dst.[StatusId] IS NULL;    