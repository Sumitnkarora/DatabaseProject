IF OBJECT_ID('tempdb..[#refBisacMediaTypes]') IS NOT NULL DROP TABLE [#refBisacMediaTypes];   

CREATE TABLE [#refBisacMediaTypes]  
(   
	[BISACMediaTypeID] char(1) NOT NULL  , 
	[Description] varchar(50) NOT NULL  , 
	[IsDeleted] bit NOT NULL  , 
	[InternalOnly] bit NOT NULL  
);    

INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('A', 'Audio Product', 0, 0);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('B', 'Book', 0, 0);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('C', 'Calendar', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('D', 'Diskette', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('F', 'Film', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('J', 'Journal', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('K', 'Map', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('M', 'Microform', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('N', 'Books and Things', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('O', 'Other', 0, 0);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('R', 'CD-ROM', 0, 1);
INSERT [#refBisacMediaTypes]([BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('V', 'Video Product', 0, 1);

DELETE dst  
FROM [dbo].[refBisacMediaTypes] dst   
	LEFT JOIN [#refBisacMediaTypes] src ON dst.[BISACMediaTypeID] = src.[BISACMediaTypeID]  
WHERE src.[BISACMediaTypeID] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[IsDeleted] = src.[IsDeleted]  , 
	[InternalOnly] = src.[InternalOnly]  
FROM [dbo].[refBisacMediaTypes] dst  
	JOIN [#refBisacMediaTypes] src ON dst.[BISACMediaTypeID] = src.[BISACMediaTypeID]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[IsDeleted] <> dst.[IsDeleted]  OR 
	src.[InternalOnly] <> dst.[InternalOnly];    

INSERT [dbo].[refBisacMediaTypes] (   
	[BISACMediaTypeID], [Description], [IsDeleted], [InternalOnly]  
)  
SELECT src.[BISACMediaTypeID], src.[Description], src.[IsDeleted], src.[InternalOnly]  
FROM [#refBisacMediaTypes] src   
	LEFT JOIN [dbo].[refBisacMediaTypes] dst ON dst.[BISACMediaTypeID] = src.[BISACMediaTypeID]  
WHERE dst.[BISACMediaTypeID] IS NULL;    