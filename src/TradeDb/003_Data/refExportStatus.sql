IF OBJECT_ID('tempdb..[#refExportStatus]') IS NOT NULL DROP TABLE [#refExportStatus];    

CREATE TABLE [#refExportStatus]
(
	[ExportStatusCode] [int] NOT NULL,
	[ExportStatus] [VARCHAR](50) NOT NULL
);

INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (0, N'New Item (Not Approved for Export)')
INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (1, N'Ready for Creation')
INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (2, N'Sent for Creation')
INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (3, N'Failed to Create Item')
INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (4, N'Export Successful')
INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (5, N'Ready for Update')
INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (6, N'Sent for Update')
INSERT [#refExportStatus] ([ExportStatusCode], [ExportStatus]) VALUES (7, N'Failed Update')


DELETE dst  
FROM [dbo].[refExportStatus] dst   
	LEFT JOIN [#refExportStatus] src ON dst.[ExportStatusCode] = src.[ExportStatusCode]  
WHERE src.[ExportStatusCode] IS NULL;    

UPDATE dst  
SET [ExportStatus] = src.ExportStatus
FROM [dbo].[refExportStatus] dst  
	JOIN [#refExportStatus] src ON dst.[ExportStatusCode] = src.[ExportStatusCode]  
WHERE src.[ExportStatus] COLLATE Latin1_General_CI_AS <> dst.[ExportStatus]   
	
INSERT [dbo].[refExportStatus] (   
	[ExportStatusCode], [ExportStatus]
)  
SELECT src.[ExportStatusCode], src.[ExportStatus]
FROM [#refExportStatus] src   
	LEFT JOIN [dbo].[refExportStatus] dst ON dst.[ExportStatusCode]   = src.[ExportStatusCode]  
WHERE dst.[ExportStatusCode] IS NULL;   