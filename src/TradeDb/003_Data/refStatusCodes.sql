IF OBJECT_ID('tempdb..[#refStatusCodes]') IS NOT NULL DROP TABLE [#refStatusCodes];    

CREATE TABLE [#refStatusCodes]  
(   
	[StatusID] varchar(3) NOT NULL  , 
	[Description] varchar(50) NOT NULL  , 
	[IsDeleted] bit NOT NULL  , 
	[InternalOnly] bit NOT NULL  
);    

INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('ACT', 'Active', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('AND', 'Andrew''s Code', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('BB ', 'Bargain Book', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('CAL', 'Calendar', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('CSA', 'Coming Soon', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('CSS', 'Coming Soon - Strict On Sale', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('IPO', 'Import to Order', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('NCR', 'No Canadian Rights', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('NOP', 'Not Our Publication', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('NYP', 'Not Yet Published', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('OP ', 'Out of Print', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('OS ', 'Out of Stock', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('OSI', 'Out of Stock Indefinitely', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('PC ', 'Publication Cancelled', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('PD', 'Print on Demand', 0, 0);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S01', 'ALWAYS 24 Hours', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S02', 'Force 1-2 weeks', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S03', 'Force 3-5 weeks', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S14', 'Sold Out', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S20', 'Force 2-4 days', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S21', 'Force 1 week', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S22', 'Force 1-3 weeks', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S23', 'Force 2-4 weeks', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S24', 'Force 4-6 weeks', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S25', 'Force 1-2 months', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('S45', 'Respect Street Date', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('UNA', 'Currently Unavailable', 0, 1);
INSERT [#refStatusCodes]([StatusID], [Description], [IsDeleted], [InternalOnly]) VALUES('UNC', 'Unconfirmed', 0, 1);

DELETE dst  
FROM [dbo].[refStatusCodes] dst   
	LEFT JOIN [#refStatusCodes] src ON dst.[StatusID] = src.[StatusID]  
WHERE src.[StatusID] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[IsDeleted] = src.[IsDeleted]  , 
	[InternalOnly] = src.[InternalOnly]  
FROM [dbo].[refStatusCodes] dst  
	JOIN [#refStatusCodes] src ON dst.[StatusID] = src.[StatusID]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[IsDeleted] <> dst.[IsDeleted]  OR 
	src.[InternalOnly] <> dst.[InternalOnly];    
	
INSERT [dbo].[refStatusCodes] (   
	[StatusID], [Description], [IsDeleted], [InternalOnly]  
)  
SELECT src.[StatusID], src.[Description], src.[IsDeleted], src.[InternalOnly]  
FROM [#refStatusCodes] src   
	LEFT JOIN [dbo].[refStatusCodes] dst ON dst.[StatusID] = src.[StatusID]  
WHERE dst.[StatusID] IS NULL;    