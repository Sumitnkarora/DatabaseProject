IF OBJECT_ID('tempdb..[#refProductForm]') IS NOT NULL DROP TABLE [#refProductForm];

CREATE TABLE [#refProductForm]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('00', 'Undefined');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AA', 'Audio');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AB', 'Audio cassette');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AC', 'CD-Audio');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AD', 'DAT');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AE', 'Audio disc');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AF', 'Audio tape');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AG', 'MiniDisc');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AH', 'CD-Extra');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AI', 'DVD Audio');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AJ', 'Downloadable audio file');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AK', 'Pre-recorded digital audio player');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AL', 'Pre-recorded SD card');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AM', 'LP');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AN', 'Downloadable and online audio file');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AO', 'Online audio file');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('AZ', 'Other audio format');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BA', 'Book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BB', 'Hardback');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BC', 'Paperback / softback');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BD', 'Loose-leaf');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BE', 'Spiral bound');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BF', 'Pamphlet');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BG', 'Leather / fine binding');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BH', 'Board book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BI', 'Rag book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BJ', 'Bath book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BK', 'Novelty book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BL', 'Slide bound');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BM', 'Big book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BN', 'Part-work (fascículo)');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BO', 'Fold-out book or chart');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BP', 'Foam book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('BZ', 'Other book format');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('CA', 'Sheet map');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('CB', 'Sheet map, folded');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('CC', 'Sheet map, flat');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('CD', 'Sheet map, rolled');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('CE', 'Globe');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('CZ', 'Other cartographic');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DA', 'Digital (on physical carrier)');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DB', 'CD-ROM');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DC', 'CD-I');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DE', 'Game cartridge');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DF', 'Diskette');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DI', 'DVD-ROM');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DJ', 'Secure Digital (SD) Memory Card');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DK', 'Compact Flash Memory Card');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DL', 'Memory Stick Memory Card');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DM', 'USB Flash Drive');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DN', 'Double-sided CD/DVD');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('DZ', 'Other digital carrier');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('EA', 'Digital (delivered electronically)');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('EB', 'Digital download and online');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('EC', 'Digital online');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ED', 'Digital download');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('FA', 'Film or transparency');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('FC', 'Slides');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('FD', 'OHP transparencies');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('FE', 'Filmstrip');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('FF', 'Film');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('FZ', 'Other film or transparency format');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('LA', 'Digital product license');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('LB', 'Digital product license key');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('LC', 'Digital product license code');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('MA', 'Microform');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('MB', 'Microfiche');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('MC', 'Microfilm');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('MZ', 'Other microform');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PA', 'Miscellaneous print');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PB', 'Address book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PC', 'Calendar');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PD', 'Cards');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PE', 'Copymasters');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PF', 'Diary');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PG', 'Frieze');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PH', 'Kit');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PI', 'Sheet music');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PJ', 'Postcard book or pack');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PK', 'Poster');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PL', 'Record book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PM', 'Wallet or folder');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PN', 'Pictures or photographs');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PO', 'Wallchart');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PP', 'Stickers');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PQ', 'Plate (lámina)');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PR', 'Notebook / blank book');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PS', 'Organizer');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PT', 'Bookmark');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('PZ', 'Other printed item');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('SA', 'Multiple-item retail product');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('SB', 'Multiple-item retail product, boxed');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('SC', 'Multiple-item retail product, slip-cased');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('SD', 'Multiple-item retail product, shrink-wrapped');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('SE', 'Multiple-item retail product, loose');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('SF', 'Multiple-item retail product, part(s) enclosed');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VA', 'Video');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VF', 'Videodisc');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VI', 'DVD video');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VJ', 'VHS video');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VK', 'Betamax video');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VL', 'VCD');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VM', 'SVCD');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VN', 'HD DVD');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VO', 'Blu-ray');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VP', 'UMD Video');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VQ', 'CBHD');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('VZ', 'Other video format');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XA', 'Trade-only material');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XB', 'Dumpbin – empty');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XC', 'Dumpbin – filled');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XD', 'Counterpack – empty');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XE', 'Counterpack – filled');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XF', 'Poster, promotional');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XG', 'Shelf strip');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XH', 'Window piece');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XI', 'Streamer');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XJ', 'Spinner');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XK', 'Large book display');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XL', 'Shrink-wrapped pack');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XM', 'Boxed pack');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('XZ', 'Other point of sale');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZA', 'General merchandise');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZB', 'Doll');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZC', 'Soft toy');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZD', 'Toy');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZE', 'Game');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZF', 'T-shirt');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZG', 'E-book reader');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZH', 'Tablet computer');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZI', 'Audiobook player');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZJ', 'Jigsaw');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZK', 'Mug');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZL', 'Tote bag');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZM', 'Tableware');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZN', 'Umbrella');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZY', 'Other apparel');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('ZZ', 'Other merchandise');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('WW', 'Mixed media product');
INSERT INTO [#refProductForm] ([Id], [Description]) VALUES ('WX', 'Multiple copy pack');

DELETE dst
FROM [dbo].[refProductForm] dst   
	LEFT JOIN [#refProductForm] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refProductForm] dst  
	JOIN [#refProductForm] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refProductForm] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refProductForm] src
	LEFT JOIN [dbo].[refProductForm] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;