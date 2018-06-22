﻿IF OBJECT_ID('tempdb..[#refProductFormDetail]') IS NOT NULL DROP TABLE [#refProductFormDetail];

CREATE TABLE [#refProductFormDetail]
(
	[Id] CHAR(4) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A101', 'CD standard audio format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A102', 'SACD super audio format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A103', 'MP3 format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A104', 'WAV format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A105', 'Real Audio format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A106', 'WMA');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A107', 'AAC');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A108', 'Ogg/Vorbis');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A109', 'Audible');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A110', 'FLAC');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A111', 'AIFF');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A112', 'ALAC');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A201', 'DAISY 2: full audio with title only (no navigation)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A202', 'DAISY 2: full audio with navigation (no text)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A203', 'DAISY 2: full audio with navigation and partial text');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A204', 'DAISY 2: full audio with navigation and full text');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A205', 'DAISY 2: full text with navigation and partial audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A206', 'DAISY 2: full text with navigation and no audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A207', 'DAISY 3: full audio with title only (no navigation)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A208', 'DAISY 3: full audio with navigation (no text)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A209', 'DAISY 3: full audio with navigation and partial text');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A210', 'DAISY 3: full audio with navigation and full text');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A211', 'DAISY 3: full text with navigation and some audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A212', 'DAISY 3: full text with navigation (no audio)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A301', 'Standalone audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A302', 'Readalong audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A303', 'Playalong audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A304', 'Speakalong audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A305', 'Synchronised audio');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A410', 'Mono');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A420', 'Stereo');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A421', 'Stereo 2.1');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A441', 'Surround 4.1');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('A451', 'Surround 5.1');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B101', 'Mass market (rack) paperback');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B102', 'Trade paperback (US)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B103', 'Digest format paperback');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B104', 'A-format paperback');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B105', 'B-format paperback');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B106', 'Trade paperback (UK)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B107', 'Tall rack paperback (US)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B108', 'A5 size Tankobon');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B109', 'JIS B5 size Tankobon');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B110', 'JIS B6 size Tankobon');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B111', 'A6 size Bunko');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B112', 'B40-dori Shinsho');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B113', 'Pocket (Sweden, Norway, France)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B114', 'Storpocket (Sweden)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B115', 'Kartonnage (Sweden)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B116', 'Flexband (Sweden)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B117', 'Mook / Bookazine');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B118', 'Dwarsligger');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B119', '46 size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B120', '46-Henkei size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B121', 'A4');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B122', 'A4-Henkei size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B123', 'A5-Henkei size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B124', 'B5-Henkei size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B125', 'B6-Henkei size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B126', 'AB size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B127', 'JIS B7 size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B128', 'Kiku size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B129', 'Kiku-Henkei size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B130', 'JIS B4 size');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B131', 'Paperback (DE)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B201', 'Coloring / join-the-dot book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B202', 'Lift-the-flap book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B203', 'Fuzzy book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B204', 'Miniature book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B205', 'Moving picture / flicker book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B206', 'Pop-up book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B207', 'Scented / ‘smelly’ book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B208', 'Sound story / ‘noisy’ book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B209', 'Sticker book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B210', 'Touch-and-feel book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B211', 'Toy / die-cut book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B212', 'Die-cut book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B213', 'Book-as-toy');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B214', 'Soft-to-touch book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B215', 'Fuzzy-felt book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B221', 'Picture book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B222', '‘Carousel’ book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B301', 'Loose leaf – sheets and binder');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B302', 'Loose leaf – binder only');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B303', 'Loose leaf – sheets only');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B304', 'Sewn');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B305', 'Unsewn / adhesive bound');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B306', 'Library binding');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B307', 'Reinforced binding');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B308', 'Half bound');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B309', 'Quarter bound');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B310', 'Saddle-sewn');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B311', 'Comb bound');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B312', 'Wire-O');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B313', 'Concealed wire');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B314', 'Coiled wire bound');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B315', 'Trade binding');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B400', 'Self-cover');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B401', 'Cloth over boards');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B402', 'Paper over boards');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B403', 'Leather, real');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B404', 'Leather, imitation');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B405', 'Leather, bonded');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B406', 'Vellum');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B407', 'Plastic');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B408', 'Vinyl');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B409', 'Cloth');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B410', 'Imitation cloth');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B411', 'Velvet');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B412', 'Flexible plastic/vinyl cover');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B413', 'Plastic-covered');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B414', 'Vinyl-covered');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B415', 'Laminated cover');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B416', 'Card cover');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B501', 'With dust jacket');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B502', 'With printed dust jacket');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B503', 'With translucent dust cover');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B504', 'With flaps');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B505', 'With thumb index');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B506', 'With ribbon marker(s)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B507', 'With zip fastener');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B508', 'With button snap fastener');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B509', 'With leather edge lining');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B510', 'Rough front');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B511', 'With foldout');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B512', 'Wide margin');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B513', 'With fastening strap');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B514', 'With perforated pages');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B601', 'Turn-around book');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B602', 'Unflipped manga format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B610', 'Syllabification');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B701', 'UK Uncontracted Braille');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B702', 'UK Contracted Braille');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B703', 'US Braille');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B704', 'US Uncontracted Braille');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B705', 'US Contracted Braille');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B706', 'Unified English Braille');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('B707', 'Moon');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D101', 'Real Video format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D102', 'Quicktime format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D103', 'AVI format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D104', 'Windows Media Video format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D105', 'MPEG-4');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D201', 'MS-DOS');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D202', 'Windows');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D203', 'Macintosh');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D204', 'UNIX / LINUX');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D205', 'Other operating system(s)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D206', 'Palm OS');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D207', 'Windows Mobile');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D301', 'Microsoft XBox');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D302', 'Nintendo Gameboy Color');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D303', 'Nintendo Gameboy Advanced');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D304', 'Nintendo Gameboy');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D305', 'Nintendo Gamecube');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D306', 'Nintendo 64');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D307', 'Sega Dreamcast');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D308', 'Sega Genesis/Megadrive');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D309', 'Sega Saturn');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D310', 'Sony PlayStation 1');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D311', 'Sony PlayStation 2');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D312', 'Nintendo Dual Screen');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D313', 'Sony PlayStation 3');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D314', 'Xbox 360');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D315', 'Nintendo Wii');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('D316', 'Sony PlayStation Portable (PSP)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E200', 'Reflowable');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E201', 'Fixed format');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E202', 'Readable offline');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E203', 'Requires network connection');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E204', 'Content removed');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E210', 'Landscape');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E211', 'Portrait');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E221', '5:04');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E222', '4:03');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E223', '3:02');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E224', '16:10');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('E225', '16:09');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('L101', 'Laminated');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P101', 'Desk calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P102', 'Mini calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P103', 'Engagement calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P104', 'Day by day calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P105', 'Poster calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P106', 'Wall calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P107', 'Perpetual calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P108', 'Advent calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P109', 'Bookmark calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P110', 'Student calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P111', 'Project calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P112', 'Almanac calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P113', 'Other calendar');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P114', 'Other calendar or organiser product');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P120', 'Picture story cards');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P201', 'Hardback (stationery)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P202', 'Paperback / softback (stationery)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P203', 'Spiral bound (stationery)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P204', 'Leather / fine binding (stationery)');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('P301', 'With hanging strips');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('V201', 'PAL');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('V202', 'NTSC');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('V203', 'SECAM');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('V220', 'Home use');
INSERT INTO [#refProductFormDetail] ([Id], [Description]) VALUES ('V221', 'Classroom use');

DELETE dst
FROM [dbo].[refProductFormDetail] dst   
	LEFT JOIN [#refProductFormDetail] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refProductFormDetail] dst  
	JOIN [#refProductFormDetail] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refProductFormDetail] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refProductFormDetail] src
	LEFT JOIN [dbo].[refProductFormDetail] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;