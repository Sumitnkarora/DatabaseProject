IF OBJECT_ID('tempdb..[#refBisacBindingTypes]') IS NOT NULL DROP TABLE [#refBisacBindingTypes];    

CREATE TABLE [#refBisacBindingTypes]  
(   
	[BISACBindingTypeID] char(3) NOT NULL  , 
	[Description] varchar(50) NOT NULL  , 
	[IsDeleted] bit NOT NULL  , 
	[InternalOnly] bit NOT NULL  
);    

INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('AA ', 'Audio Book (Cassette)', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BA ', 'Cloth/Bath Books', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BC ', 'Book & CD-Rom', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BD ', 'Board Books', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BG ', 'Board Games', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BI ', 'Big Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BL ', 'Bonded Leather', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BM ', 'Betamax', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BS ', 'Book & Software', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BV ', 'Book & Video', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('BX ', 'Boxed Set/Slip Case/Casebound', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('C1 ', 'Cassette Abridged', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('C2 ', 'Cassette Unabridged', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('C3 ', 'CD Abridged', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('C4 ', 'CD Unabridged', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CA ', 'Calendar', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CC ', 'Children''s Cloth', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CD ', 'Audio Book (CD)', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CG ', 'Cartridge for Computer Games', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CM ', 'Multimedia', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CO ', 'Coloring Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CR ', 'CD-ROM', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('CT ', 'Cloth Text', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('DA ', 'Digital Audio Cassette', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('DL ', 'Book and Doll', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('DS ', 'Diskette, general', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('DV ', 'Digital Videodisk', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('EB ', 'eBooks', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('FB ', 'Fabric', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('FF ', 'Folded', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('FI ', 'Fiche, Microfiche', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('FM ', 'Filmstrip', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('FU ', 'Fuzzy Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('GG ', 'Globe', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('H3 ', '1.44M, 3.5 Disk, DOS', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('H5 ', '1.2M, 5.25 Disk, DOS', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('IL ', 'Imitation Leather', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('KI ', 'Kivar (or comparable)', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('L3 ', '720K, 3.5 Disk, DOS', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('L5 ', '360K, 5.25 Disk, DOS', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('LB ', 'Leather/Fine Binding', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('LE ', 'Leather', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('LL ', 'Loose Leaf', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('LP ', 'Record/Album/LP', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('MA ', 'Multimedia', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('MI ', 'Miniature Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('MM ', 'Mass Market Paperbound', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('MN ', 'Mini', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('MO ', 'Movable Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('MP ', 'Map', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('MU ', 'Book and Music', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('NA ', 'unknown', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('OB ', 'Otabind', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('OO ', 'Other', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('OT ', 'Otabind', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('PD ', 'Page-A-Day', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('PF ', 'Perfect', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('PI ', 'Picture Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('PL ', 'Book and Plush Toy', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('PO ', 'Paper over Board', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('PT ', 'Paper Text', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('Q  ', 'Trade Paper', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('RB ', 'Ringbound', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('RL ', 'Reinforced Library Binding', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('SB ', 'Scented Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('SC ', 'Slipcased', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('SD ', 'Sound Storybooks', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('SI ', 'Sidelines', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('SL ', 'Slides', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('SP ', 'Spiral Bound', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('ST ', 'Sticker Books', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('TA ', 'Tape, Reel', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('TC ', 'Trade Cloth', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('TP ', 'Trade Paper', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('TR ', 'Transparencies', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('TY ', 'Book and Toy (not plush)', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('VA ', 'Laserdisk-CAV', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('VB ', 'Vinyl-bound', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('VD ', 'Video (VHS)', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('VK ', 'Video (DVD)', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('VL ', 'Laserdisk-CLV', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('W} ', 'Audio Prod.', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('WB ', 'Workbook', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('WC ', 'Wire Coil/Wire Combination', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('XB ', 'Dispalys SAP Only ', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('XC ', 'Dispalys SAP Only', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('XX ', 'Other', 0, 1);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('XZ ', 'Dispalys SAP Only', 0, 0);
INSERT [#refBisacBindingTypes]([BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]) VALUES('YA ', 'Book & Audio', 0, 0); 

DELETE dst  
FROM [dbo].[refBisacBindingTypes] dst   
	LEFT JOIN [#refBisacBindingTypes] src ON dst.[BISACBindingTypeID] = src.[BISACBindingTypeID]  
WHERE src.[BISACBindingTypeID] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[IsDeleted] = src.[IsDeleted]  , 
	[InternalOnly] = src.[InternalOnly]  
FROM [dbo].[refBisacBindingTypes] dst  
	JOIN [#refBisacBindingTypes] src ON dst.[BISACBindingTypeID] = src.[BISACBindingTypeID]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[IsDeleted] <> dst.[IsDeleted]  OR 
	src.[InternalOnly] <> dst.[InternalOnly];    
	
INSERT [dbo].[refBisacBindingTypes] (   
	[BISACBindingTypeID], [Description], [IsDeleted], [InternalOnly]  
)  
SELECT src.[BISACBindingTypeID], src.[Description], src.[IsDeleted], src.[InternalOnly]  
FROM [#refBisacBindingTypes] src   
	LEFT JOIN [dbo].[refBisacBindingTypes] dst ON dst.[BISACBindingTypeID] = src.[BISACBindingTypeID]  
WHERE dst.[BISACBindingTypeID] IS NULL;    