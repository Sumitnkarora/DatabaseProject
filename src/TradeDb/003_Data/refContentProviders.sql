IF OBJECT_ID('tempdb..[#refContentProviders]') IS NOT NULL DROP TABLE [#refContentProviders];    

CREATE TABLE [#refContentProviders]  
(   
	[ProviderID] smallint NOT NULL  , 
	[ProviderName] varchar(50) NOT NULL  , 
	[Priority] tinyint NULL  , 
	[CreatedBy] varchar(30) NULL  , 
	[ChangedBy] varchar(30) NULL  , 
	[DateCreated] datetime NULL  , 
	[DateChanged] datetime NULL  , 
	[IsDeleted] bit NOT NULL  
);  

INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(1, 'In-House', 100, 'NULL', 'dbo', NULL, '1999-10-13 10:04:54', 0);
INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(2, 'Baker & Taylor', 51, 'NULL', 'dbo', NULL, '2000-07-13 16:29:58', 0);
INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(3, 'Ingram', 50, 'NULL', 'dbo', NULL, '1999-10-13 10:05:02', 0);
INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(4, 'Publisher Sources', 25, 'dbo', 'dbo', '1999-10-12 12:18:52', '1999-10-13 10:05:05', 0);
INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(5, 'January Magazine', 55, 'dbo', 'dbo', '1999-11-05 13:10:44', '2000-07-13 16:30:06', 0);
INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(6, 'Globe and Mail', 75, 'dbo', 'dbo', '1999-11-05 13:10:55', '1999-11-05 13:10:55', 0);
INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(7, 'CBC', 80, 'dbo', 'dbo', '1999-11-05 13:11:03', '1999-11-05 13:11:03', 0);
INSERT [#refContentProviders]([ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]) VALUES(8, 'Chapters Ink Bookseller Review', 76, 'da-derek', 'dbo', '2000-05-10 14:06:26', '2000-07-13 16:30:11', 0);

DELETE dst  
FROM [dbo].[refContentProviders] dst   
	LEFT JOIN [#refContentProviders] src ON dst.[ProviderID] = src.[ProviderID]  
WHERE src.[ProviderID] IS NULL;    

UPDATE dst  
SET [ProviderName] = src.[ProviderName]  , 
	[Priority] = src.[Priority]  , 
	[CreatedBy] = src.[CreatedBy]  , 
	[ChangedBy] = src.[ChangedBy]  , 
	[DateCreated] = src.[DateCreated]  , 
	[DateChanged] = src.[DateChanged]  , 
	[IsDeleted] = src.[IsDeleted]  
FROM [dbo].[refContentProviders] dst  
	JOIN [#refContentProviders] src ON dst.[ProviderID] = src.[ProviderID]  
WHERE src.[ProviderName] <> dst.[ProviderName]  OR 
	(src.[Priority] IS NULL AND dst.[Priority] IS NOT NULL) OR 
	(src.[Priority] IS NOT NULL AND dst.[Priority] IS NULL) OR 
	src.[Priority] <> dst.[Priority]  OR 
	(src.[CreatedBy] IS NULL AND dst.[CreatedBy] IS NOT NULL) OR 
	(src.[CreatedBy] IS NOT NULL AND dst.[CreatedBy] IS NULL) OR 
	src.[CreatedBy] <> dst.[CreatedBy]  OR 
	(src.[ChangedBy] IS NULL AND dst.[ChangedBy] IS NOT NULL) OR 
	(src.[ChangedBy] IS NOT NULL AND dst.[ChangedBy] IS NULL) OR 
	src.[ChangedBy] <> dst.[ChangedBy]  OR 
	(src.[DateCreated] IS NULL AND dst.[DateCreated] IS NOT NULL) OR 
	(src.[DateCreated] IS NOT NULL AND dst.[DateCreated] IS NULL) OR 
	src.[DateCreated] <> dst.[DateCreated]  OR 
	(src.[DateChanged] IS NULL AND dst.[DateChanged] IS NOT NULL) OR 
	(src.[DateChanged] IS NOT NULL AND dst.[DateChanged] IS NULL) OR 
	src.[DateChanged] <> dst.[DateChanged]  OR 
	src.[IsDeleted] <> dst.[IsDeleted];    
	
INSERT [dbo].[refContentProviders] (   
	[ProviderID], [ProviderName], [Priority], [CreatedBy]  , [ChangedBy], [DateCreated], [DateChanged], [IsDeleted]  
)  
SELECT src.[ProviderID], src.[ProviderName], src.[Priority], src.[CreatedBy]  , src.[ChangedBy], src.[DateCreated], src.[DateChanged], src.[IsDeleted]  
FROM [#refContentProviders] src   
	LEFT JOIN [dbo].[refContentProviders] dst ON dst.[ProviderID] = src.[ProviderID]  
WHERE dst.[ProviderID] IS NULL;    