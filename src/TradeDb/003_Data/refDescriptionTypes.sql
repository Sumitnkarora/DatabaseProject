IF OBJECT_ID('tempdb..[#refDescriptionTypes]') IS NOT NULL DROP TABLE [#refDescriptionTypes];    

CREATE TABLE [#refDescriptionTypes]  
(   
	[DescriptionTypeId] tinyint NOT NULL IDENTITY(1,1), 
	[IsActive] bit NOT NULL  , 
	[Description] varchar(MAX) NULL  , 
	[ProductTypeID] smallint NULL  , 
	[CreatedBy] varchar(30) NULL  , 
	[ChangedBy] varchar(30) NULL  , 
	[DateCreated] datetime NULL  , 
	[DateChanged] datetime NULL  , 
	[IsDeleted] bit NOT NULL,
	[ExportDescriptionTypeId] varchar(6) NOT NULL
);    

SET IDENTITY_INSERT [#refDescriptionTypes] ON

INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(0, 1, 'Note Type Not Assigned', NULL, 'dbo', 'C_ABlair', '2000-03-08 17:31:56', '2001-07-26 12:50:32', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(1, 0, 'Annotation', NULL, 'NULL', 'C_ABlair', NULL, '2001-07-25 12:23:57', 0, '01');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(2, 1, 'Feature Annotation', NULL, 'NULL', 'C_ABlair', NULL, '2001-07-26 12:50:32', 0, '02');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(3, 1, 'Editorial', NULL, 'NULL', 'C_ABlair', NULL, '2001-07-26 12:50:32', 0, '03');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(4, 0, 'January Magazine Review', NULL, 'coryc', 'MLefebvre', '1999-10-07 13:52:14', '2001-04-27 10:25:57', 0, '04');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(5, 1, 'Pull Quote', NULL, 'dbo', 'dbo', '2004-09-15 20:47:50', '2004-09-15 20:47:50', 0, '05');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(6, 1, 'Heather''''s Reviews', NULL, 'dbo', 'dbo', '2004-10-31 00:54:46', '2004-10-31 00:54:46', 0, '06');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(7, 1, 'Our Junior Booklovers'' Review', NULL, 'dbo', 'dbo', '2005-10-23 04:38:02', '2005-10-23 04:38:02', 0, '07');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(8, 1, 'Julie Recommends Mystery', NULL, 'dbo', 'dbo', '2005-10-23 04:38:10', '2005-10-23 04:38:10', 0, '08');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(9, 1, 'From Our Trusted Advisor', NULL, 'dbo', 'dbo', '1999-11-22 14:56:43', '2005-10-23 04:39:41', 0, '09');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(10, 0, 'CBC', NULL, 'dbo', 'MLefebvre', '2000-02-03 15:30:04', '2001-04-27 10:04:07', 0, '10');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(11, 1, 'From The Publisher', NULL, 'da-zana', 'dbo', '2000-02-23 13:18:43', '2004-09-10 15:15:17', 0, '11');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(12, 1, 'Off the Jacket', NULL, 'da-zana', 'C_ABlair', '2000-02-23 13:18:43', '2001-07-26 12:50:32', 0, '12');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(13, 1, 'Table of Contents', NULL, 'da-zana', 'C_ABlair', '2000-02-23 13:18:43', '2001-07-26 12:50:32', 0, '13');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(14, 1, 'About the Author', NULL, 'da-zana', 'C_ABlair', '2000-02-23 13:18:43', '2001-07-26 12:50:32', 0, '14');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(15, 1, 'Read a Chapter', NULL, 'da-zana', 'C_ABlair', '2000-02-23 13:18:43', '2001-07-26 12:50:32', 0, '15');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(16, 1, 'Author’s Comments', NULL, 'da-zana', 'C_ABlair', '2000-02-23 13:18:43', '2001-07-26 12:50:32', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(17, 1, 'About the Illustrator', NULL, 'da-zana', 'C_ABlair', '2000-02-23 13:18:43', '2001-07-26 12:50:32', 0, '17');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(18, 1, 'Tips for your Reading Group', NULL, 'da-zana', 'C_ABlair', '2000-02-23 13:18:43', '2001-07-26 12:50:32', 0, '18');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(19, 1, 'Billboard', NULL, 'da-zana', 'C_ABlair', '2000-03-24 15:27:28', '2001-07-26 12:50:32', 0, '19');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(20, 1, 'Reviews', NULL, 'da-derek', 'C_ABlair', '2000-04-08 12:58:44', '2001-07-26 12:50:32', 0, '20');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(21, 1, 'Home & Garden Notes', NULL, 'da-zana', 'C_ABlair', '2000-04-27 13:30:48', '2001-07-26 12:50:33', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(22, 1, 'Shipping Notes (Home & Garden)', 20, 'da-zana', 'C_ABlair', '2000-04-27 13:32:02', '2001-07-26 12:50:33', 0, '22');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(23, 1, 'Home & Garden Notes', 20, 'da-zana', 'C_ABlair', '2000-04-27 13:33:23', '2001-07-26 12:50:33', 0, '23');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(24, 1, 'Chapters Ink Bookseller Review', NULL, 'da-derek', 'C_ABlair', '2000-05-05 14:00:30', '2001-07-26 12:50:33', 0, '24');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(25, 1, 'Games - Annotation', NULL, 'LeonardT', 'C_ABlair', '2000-05-08 15:28:52', '2001-07-26 12:50:33', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(26, 1, 'Games - System Requirements', NULL, 'LeonardT', 'C_ABlair', '2000-05-08 15:29:19', '2001-07-26 12:50:33', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(27, 1, 'Recipes', NULL, 'dbo', 'C_ABlair', '2000-05-17 10:58:48', '2001-07-26 12:50:33', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(28, 1, 'Video Notes', NULL, 'da-leon', 'C_ABlair', '2000-05-31 11:43:38', '2001-07-26 12:50:33', 0, '28');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(29, 1, 'Music Notes', NULL, 'da-leon', 'C_ABlair', '2000-05-31 11:44:51', '2001-07-26 12:50:33', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(30, 1, 'Jazz Report', NULL, 'dbo', 'C_ABlair', '2000-06-01 12:18:54', '2001-07-26 12:50:33', 0, '30');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(31, 1, 'Interview', NULL, 'dbo', 'C_ABlair', '2000-08-14 09:13:53', '2001-07-26 12:50:33', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(33, 0, 'From Ingram', NULL, 'MLefebvre', 'dbo', '2002-09-17 09:39:43', '2004-02-10 11:01:49', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(222, 1, 'Annotation - FR', NULL, 'dbo', 'dbo', '2006-07-05 16:26:18', '2006-07-29 15:42:44', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(223, 1, 'Editorial - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:42:57', '2006-07-29 15:42:57', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(224, 1, 'January Magazine Review - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:44:22', '2006-07-29 15:44:22', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(225, 1, 'Pull Quote - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:44:31', '2006-07-29 15:44:31', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(226, 1, 'From the Publisher - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:44:39', '2006-07-29 15:44:42', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(227, 1, 'Off the Jacket - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:44:52', '2006-07-29 15:44:52', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(228, 1, 'Table of Contents - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:45:02', '2006-07-29 15:45:02', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(229, 1, 'About the Author - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:45:10', '2006-07-29 15:45:10', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(230, 1, 'Read a Chapter - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:45:22', '2006-07-29 15:45:22', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(231, 1, 'Author’s Comments - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:45:33', '2006-07-29 15:45:33', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(232, 1, 'About the Illustrator - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:45:45', '2006-07-29 15:45:45', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(233, 1, 'Tips for your Reading Group - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:45:55', '2006-07-29 15:45:55', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(234, 1, 'Reviews - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:46:07', '2006-07-29 15:46:07', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(235, 1, 'Chapters Ink Bookseller Review - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:46:16', '2006-07-29 15:46:16', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(236, 1, 'Recipes - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:46:25', '2006-07-29 15:46:28', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(237, 1, 'Video Notes - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:46:40', '2006-07-29 15:46:40', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(238, 1, 'Music Notes - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:46:50', '2006-07-29 15:46:50', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(239, 1, 'Interview - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:46:57', '2006-07-29 15:47:00', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(240, 1, 'From Ingram - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:47:13', '2006-07-29 15:47:13', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(241, 1, 'From Globe and Mail - FR', NULL, 'dbo', 'dbo', '2006-07-29 15:47:18', '2006-07-29 15:47:18', 0, '0');
INSERT [#refDescriptionTypes]([DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId]) VALUES(255, 0, 'Globe And Mail', NULL, 'dbo', 'dbo', '2005-08-17 16:02:31', '2005-08-17 16:02:31', 0, '0');

SET IDENTITY_INSERT [#refDescriptionTypes] OFF

DELETE dst  
FROM [dbo].[refDescriptionTypes] dst   
	LEFT JOIN [#refDescriptionTypes] src ON dst.[DescriptionTypeId] = src.[DescriptionTypeId]  
WHERE src.[DescriptionTypeId] IS NULL;    

UPDATE dst  
SET [IsActive] = src.[IsActive]  , 
	[Description] = src.[Description]  , 
	[ProductTypeID] = src.[ProductTypeID]  , 
	[CreatedBy] = src.[CreatedBy]  , 
	[ChangedBy] = src.[ChangedBy]  , 
	[DateCreated] = src.[DateCreated]  , 
	[DateChanged] = src.[DateChanged]  , 
	[IsDeleted] = src.[IsDeleted],
	[ExportDescriptionTypeId] = src.[ExportDescriptionTypeId]
FROM [dbo].[refDescriptionTypes] dst  
	JOIN [#refDescriptionTypes] src ON dst.[DescriptionTypeId] = src.[DescriptionTypeId]  
WHERE src.[IsActive] <> dst.[IsActive]  OR 
	(src.[Description] IS NULL AND dst.[Description] IS NOT NULL) OR 
	(src.[Description] IS NOT NULL AND dst.[Description] IS NULL) OR 
	src.[Description] <> dst.[Description]  OR 
	(src.[ProductTypeID] IS NULL AND dst.[ProductTypeID] IS NOT NULL) OR 
	(src.[ProductTypeID] IS NOT NULL AND dst.[ProductTypeID] IS NULL) OR 
	src.[ProductTypeID] <> dst.[ProductTypeID]  OR 
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
	src.[IsDeleted] <> dst.[IsDeleted] OR
	src.[ExportDescriptionTypeId] <> dst.[ExportDescriptionTypeId];  

SET IDENTITY_INSERT [dbo].[refDescriptionTypes] ON
	
INSERT [dbo].[refDescriptionTypes] (   
[DescriptionTypeId], [IsActive], [Description], [ProductTypeID]  , [CreatedBy], [ChangedBy], [DateCreated], [DateChanged], [IsDeleted], [ExportDescriptionTypeId] 
)  
SELECT src.[DescriptionTypeId], src.[IsActive], src.[Description], src.[ProductTypeID]  , src.[CreatedBy], src.[ChangedBy], src.[DateCreated], src.[DateChanged], src.[IsDeleted], src.[ExportDescriptionTypeId]
FROM [#refDescriptionTypes] src   
	LEFT JOIN [dbo].[refDescriptionTypes] dst ON dst.[DescriptionTypeId] = src.[DescriptionTypeId]  
WHERE dst.[DescriptionTypeId] IS NULL;    

SET IDENTITY_INSERT [dbo].[refDescriptionTypes] OFF
