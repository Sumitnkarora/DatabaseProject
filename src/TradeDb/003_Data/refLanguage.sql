IF OBJECT_ID('tempdb..[#refLanguage]') IS NOT NULL DROP TABLE [#refLanguage];    

CREATE TABLE [#refLanguage]  
(   
	[LanguageID] smallint NOT NULL  , 
	[LanguageName] varchar(50) NOT NULL  , 
	[IsDeleted] bit NOT NULL  ,
	[LanguageCode] varchar(2) NULL,
	[OnixCode] varchar(3) NULL
);    

INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(-3, 'Urdu', 0, 'ur', 'urd');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(-2, 'Gujarati', 0, 'gu', 'guj');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(-1, 'Aztec', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(1, 'Acholi', 0, null, 'ach');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(3, 'Afrikaans', 0, 'af', 'afr');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(5, 'Albanian', 0, 'sq', 'alb');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(8, 'Amharic', 0, 'am', 'amh');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(10, 'Apache', 0, null, 'apa');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(11, 'Arabic', 0, 'ar', 'ara');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(12, 'Aramaic', 0, null, 'arc');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(13, 'Armenian', 0, 'hy', 'arm');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(17, 'Assamese', 0, 'as', 'asm');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(22, 'Bashkir', 0, 'ba', 'bak');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(23, 'Baluchi', 0, null, 'bal');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(24, 'Bambara', 0, 'bm', 'bam');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(26, 'Baltic', 0, null, 'bat');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(30, 'Bengali', 0, 'bn', 'ben');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(31, 'Berber Group', 0, null, 'ber');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(35, 'Bulgarian', 0, 'bg', 'bul');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(36, 'Burmese', 0, 'my', 'bur');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(37, 'Caddo', 0, null, 'cad');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(39, 'Cambodian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(41, 'Catalan', 0, 'ca', 'cat');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(45, 'Chechen', 0, 'ce', 'che');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(46, 'Chinese/Mandarin', 0, null, 'cmn');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(52, 'Cheyenne', 0, null, 'chy');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(56, 'Croatian', 0, 'hr', 'hrv');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(57, 'Creole, Creoles', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(59, 'Czech', 0, 'cs', 'cze');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(60, 'Dakota', 0, null, 'dak');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(61, 'Danish', 0, 'da', 'dan');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(63, 'Dinka', 0, null, 'din');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(65, 'Duala', 0, null, 'dua');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(66, 'Dutch', 0, 'nl', 'dut');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(67, 'Efik', 0, null, 'efi');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(68, 'Egyptian', 0, null, 'egy');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(69, 'Elamite', 0, null, 'elx');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(70, 'English', 0, 'en', 'eng');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(71, 'English, Middle', 0, null, 'enm');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(72, 'Eskimo', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(73, 'Esperanto', 0, 'eo', 'epo');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(74, 'Estonian', 0, 'et', 'est');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(75, 'Ethiopic', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(76, 'Ewe', 0, 'ee', 'ewe');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(77, 'Farsi', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(78, 'Faroese', 0, 'fo', 'fao');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(79, 'French, Middle', 0, null, 'frm');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(80, 'Finnish', 0, 'fi', 'fin');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(82, 'Flemish', 0, null, 'dut');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(83, 'Fon', 0, null, 'fon');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(84, 'French', 0, 'fr', 'fre');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(86, 'French, Old', 0, null, 'fro');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(88, 'Gaelic', 0, 'gd', 'gla');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(93, 'Georgian', 0, 'ka', 'geo');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(94, 'German', 0, 'de', 'ger');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(98, 'Greek', 0, 'el', 'gre');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(99, 'Guarani', 0, 'gn', 'grn');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(101, 'Hausa', 0, 'ha', 'hau');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(102, 'Hawaiian', 0, null, 'hau');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(103, 'Hebrew', 0, 'he', 'heb');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(105, 'Hindi', 0, 'hi', 'hin');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(106, 'Hungarian', 0, 'hu', 'hun');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(108, 'Icelandic', 0, 'is', 'ice');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(111, 'Indonesian', 0, 'id', 'ind');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(114, 'Iranian', 0, null, 'ira');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(115, 'Irish', 0, 'ga', 'gle');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(117, 'Italian', 0, 'it', 'ita');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(118, 'Javanese', 0, 'jv', 'jav');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(119, 'Japanese', 0, 'ja', 'jpn');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(123, 'Kannada', 0, 'kn', 'kan');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(124, 'Karen', 0, null, 'kar');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(127, 'Kazakh', 0, 'kk', 'kaz');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(128, 'Kikuyu', 0, 'ki', 'kik');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(129, 'Kinyarwanda', 0, 'rw', 'kin');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(130, 'Kirghiz', 0, 'ky', 'kir');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(131, 'Kongo', 0, 'kg', 'kon');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(132, 'Korean', 0, 'ko', 'kor');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(136, 'Kurdish', 0, 'ku', 'kur');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(137, 'Ladino', 0, null, 'lad');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(140, 'Laotian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(141, 'Lapp', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(142, 'Latin', 0, 'la', 'lat');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(143, 'Latvian', 0, 'lv', 'lav');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(144, 'Lithuanian', 0, 'lt', 'lit');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(149, 'Macedonian', 0, 'mk', 'mac');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(150, 'Malayalam', 0, 'ml', 'mal');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(153, 'Malayo-Polynesian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(156, 'Malay', 0, 'ms', 'may');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(157, 'Mende', 0, null, 'men');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(159, 'Malagasy', 0, 'mg', 'mlg');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(163, 'Mongol', 0, 'mn', 'mon');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(165, 'Multilingual', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(167, 'Mayan', 0, null, 'myn');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(170, 'Nepali', 0, 'ne', 'nep');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(171, 'Newari', 0, null, 'new');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(173, 'Norwegian', 0, 'no', 'nor');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(179, 'Ojibwa', 0, 'oj', 'oji');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(184, 'Pahari', 0, null, 'him');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(188, 'Persian, Modern', 0, 'fa', 'per');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(190, 'Polish', 0, 'pl', 'pol');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(191, 'Portuguese', 0, 'pt', 'por');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(194, 'Quechua', 0, 'qu', 'que');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(195, 'Rajasthani', 0, null, 'raj');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(198, 'Romany', 0, null, 'rom');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(199, 'Romanian', 0, 'ro', 'rum');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(200, 'Rundi', 0, 'rn', 'run');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(201, 'Russian', 0, 'ru', 'rus');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(204, 'South American Indian', 0, null, 'sai');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(205, 'Samaritan', 0, null, 'sam');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(209, 'Serbo-Croatian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(211, 'Shona', 0, 'sn', 'sna');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(215, 'Slovak', 0, 'sk', 'slo');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(216, 'Slovene', 0, 'sl', 'slv');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(218, 'Singhalese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(220, 'Somali', 0, 'so', 'som');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(221, 'Songhai', 0, null, 'son');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(222, 'Spanish', 0, 'es', 'spa');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(225, 'Sukuma', 0, null, 'suk');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(228, 'Swahili', 0, 'sw', 'swa');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(229, 'Swedish', 0, 'sv', 'swe');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(231, 'Tagalog', 0, 'tl', 'tgl');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(232, 'Tajik', 0, 'tg', 'rgk');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(233, 'Tamil', 0, 'ta', 'tam');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(235, 'Teluga', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(238, 'Thai', 0, 'th', 'tha');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(239, 'Tibetan', 0, 'bo', 'tib');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(243, 'Tswana', 0, 'tn', 'tsn');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(245, 'Turkish', 0, 'tr', 'tur');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(248, 'Ugaritic', 0, null, 'uga');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(250, 'Ukrainian', 0, 'uk', 'ukr');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(252, 'Undetermined', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(253, 'Urdu', 0, 'ur', 'urd');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(255, 'Vietnamese', 0, 'vi', 'vie');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(259, 'Welsh', 0, 'cy', 'wel');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(261, 'Wolof', 0, 'wo', 'wol');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(262, 'Xhosa', 0, 'xh', 'xho');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(264, 'Yiddish', 0, 'yi', 'yid');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(265, 'Yoruba', 0, 'yo', 'yor');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(266, 'Zapotec', 0, null, 'zap');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(268, 'Zulu', 0, 'zu', 'zul');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(270, 'Senegalese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(272, 'Chinese/Cantonese', 0, null, 'yue');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(273, 'Chinese/Taiwanese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(274, 'More', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(277, 'American Sign Language', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(280, 'Gullah', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(281, 'Chinese', 0, 'zh', 'chi');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(282, 'Belgian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(283, 'Bangla', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(284, 'Indian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(286, 'Cantonese', 0, null, 'yue');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(287, 'Mandarin', 0, null, 'cmn');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(288, 'Danish/French', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(289, 'English/German', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(290, 'English/Russian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(291, 'French/Dutch', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(292, 'French/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(293, 'German/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(294, 'German/Russian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(295, 'Hebrew/Arabic', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(296, 'Khmer', 0, 'km', 'khm');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(297, 'Mongolian', 0, 'mn', 'mon');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(298, 'Mandarin/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(299, 'Ukranian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(301, 'Africaans', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(302, 'English/Italian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(303, 'English/Spanish', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(305, 'French/Italian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(306, 'French/German', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(309, 'French/Flemish', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(311, 'Japanese/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(313, 'Gaelic/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(317, 'Catalan/Spanish', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(318, 'Cantonese/Chinese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(319, 'Cantonese/Mandarin', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(320, 'Danish/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(323, 'Polish/Russian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(324, 'Spanish/Italian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(325, 'Japanese/French', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(327, 'Hindi/Punjabi', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(328, 'English/Japanese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(329, 'English/French/Italian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(330, 'French/Polish', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(331, 'French/Polish/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(332, 'English/Chinese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(333, 'English/Swedish', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(340, 'German/Italian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(341, 'French/Russian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(342, 'English/Dutch', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(344, 'Spanish/Dutch', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(348, 'English/Khmer', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(350, 'English/Armenian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(351, 'Swedish/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(352, 'French/German/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(360, 'Polish/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(364, 'French, Indigenous', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(366, 'Serbian', 0, 'sr', 'srp');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(370, 'Mandarin/Japanese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(371, 'Portuguese/German', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(373, 'English/Serbian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(374, 'Natural sound/Music', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(375, 'Natural sound', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(376, 'Hindi/Urdu', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(377, 'Hebrew/English', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(378, 'Moore/More', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(382, 'English/Mand./Cantonese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(383, 'English/French/Portug', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(384, 'Hebrew/Yiddish', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(386, 'Spanish/Russian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(387, 'English/Vietnamese', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(388, 'English/Arabic', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(389, 'Pashtu', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(390, 'Asturian', 0, null, 'ast');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(391, 'French/Quebecois', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(393, ' ', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(394, 'French, Canadian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(395, 'French, Parisian', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(396, 'Hassanya', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(397, 'Filipino', 0, null, 'fil');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(398, 'Jula', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(399, 'Plautdietsch', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(400, 'Swiss German', 0, null, 'gsw');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(401, 'Bosnian', 0, 'bs', 'bos');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(402, 'Dari', 0, null, 'prs');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(403, 'Nanet', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(404, 'SiSwati', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(405, 'Sinhala', 0, 'si', 'sin');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(406, 'Telugu', 0, 'te', 'tel');
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(408, 'Aboriginal', 0, null, null);
INSERT [#refLanguage]([LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]) VALUES(410, 'Castilian', 0, null, null);    

DELETE dst  
FROM [dbo].[refLanguage] dst   
	LEFT JOIN [#refLanguage] src ON dst.[LanguageID] = src.[LanguageID]  
WHERE src.[LanguageID] IS NULL;    

UPDATE dst  
SET [LanguageName] = src.[LanguageName]  , 
	[IsDeleted] = src.[IsDeleted],
	[LanguageCode] = src.[LanguageCode], 
	[OnixCode] = src.[OnixCode]
FROM [dbo].[refLanguage] dst  
	JOIN [#refLanguage] src ON dst.[LanguageID] = src.[LanguageID]  
WHERE src.[LanguageName] <> dst.[LanguageName]  OR 
	src.[IsDeleted] <> dst.[IsDeleted] OR
	ISNULL(src.[LanguageCode], '') <> ISNULL(dst.[LanguageCode], '') OR
	ISNULL(src.[OnixCode], '') <> ISNULL(dst.[OnixCode], '');    
	
INSERT [dbo].[refLanguage] (   
	[LanguageID], [LanguageName], [IsDeleted], [LanguageCode], [OnixCode]  
)  
SELECT src.[LanguageID], src.[LanguageName], src.[IsDeleted], src.[LanguageCode], src.[OnixCode]
FROM [#refLanguage] src   
	LEFT JOIN [dbo].[refLanguage] dst ON dst.[LanguageID] = src.[LanguageID]  
WHERE dst.[LanguageID] IS NULL;    