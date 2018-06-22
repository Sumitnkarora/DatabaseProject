IF OBJECT_ID('tempdb..[#refSubjectScheme]') IS NOT NULL DROP TABLE [#refSubjectScheme];

CREATE TABLE [#refSubjectScheme]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
);

INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('01', 'Dewey');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('02', 'Abridged Dewey');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('03', 'LC classification');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('04', 'LC subject heading');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('05', 'NLM classification');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('06', 'MeSH heading');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('07', 'NAL subject heading');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('08', 'AAT');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('09', 'UDC');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('10', 'BISAC Subject Heading');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('11', 'BISAC region code');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('12', 'BIC subject category');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('13', 'BIC geographical qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('14', 'BIC language qualifier (language as subject)');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('15', 'BIC time period qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('16', 'BIC educational purpose qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('17', 'BIC reading level and special interest qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('18', 'DDC-Sachgruppen der Deutschen Nationalbibliografie');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('19', 'LC fiction genre heading');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('20', 'Keywords');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('21', 'BIC children’s book marketing category');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('22', 'BISAC Merchandising Theme');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('23', 'Publisher’s own category code');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('24', 'Proprietary subject scheme');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('25', 'Tabla de materias ISBN');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('26', 'Warengruppen-Systematik des deutschen Buchhandels');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('27', 'SWD');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('28', 'Thèmes Electre');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('29', 'CLIL');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('30', 'DNB-Sachgruppen');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('31', 'NUGI');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('32', 'NUR');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('33', 'ECPA Christian Book Category');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('34', 'SISO');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('35', 'Korean Decimal Classification (KDC)');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('36', 'DDC Deutsch 22');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('37', 'Bokgrupper');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('38', 'Varegrupper');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('39', 'Læreplaner');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('40', 'Nippon Decimal Classification');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('41', 'BSQ');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('42', 'ANELE Materias');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('43', 'Utdanningsprogram');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('44', 'Programområde');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('45', 'Undervisningsmateriell');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('46', 'Norsk DDK');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('47', 'Varugrupper');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('48', 'SAB');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('49', 'Läromedelstyp');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('50', 'Förhandsbeskrivning');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('51', 'Spanish ISBN UDC subset');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('52', 'ECI subject categories');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('53', 'Soggetto CCE');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('54', 'Qualificatore geografico CCE');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('55', 'Qualificatore di lingua CCE');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('56', 'Qualificatore di periodo storico CCE');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('57', 'Qualificatore di livello scolastico CCE');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('58', 'Qualificatore di età di lettura CCE');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('59', 'VdS Bildungsmedien Fächer');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('60', 'Fagkoder');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('61', 'JEL classification');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('62', 'CSH');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('63', 'RVM');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('64', 'YSA');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('65', 'Allärs');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('66', 'YKL');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('67', 'MUSA');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('68', 'CILLA');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('69', 'Kaunokki');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('70', 'Bella');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('71', 'YSO');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('72', 'Paikkatieto ontologia');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('73', 'Suomalainen kirja-alan luokitus');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('74', 'Sears');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('75', 'BIC E4L');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('76', 'CSR');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('77', 'Suomalainen oppiaineluokitus');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('78', 'Japanese book trade C-Code');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('79', 'Japanese book trade Genre Code');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('80', 'Fiktiivisen aineiston lisäluokitus');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('81', 'Arabic Subject heading scheme');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('82', 'Arabized BIC subject category');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('83', 'Arabized LC subject headings');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('84', 'Bibliotheca Alexandrina Subject Headings');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('85', 'Postal code');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('86', 'GeoNames ID');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('87', 'NewBooks Subject Classification');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('88', 'Chinese Library Classification');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('89', 'NTCPDSAC Classification');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('90', 'Season and Event Indicator');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('91', 'GND');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('92', 'BIC UKSLC');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('93', 'Thema subject category');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('94', 'Thema geographical qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('95', 'Thema language qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('96', 'Thema time period qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('97', 'Thema educational purpose qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('98', 'Thema interest age / special interest qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('99', 'Thema style qualifier');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A2', 'Ämnesord');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A3', 'Statystyka Ksi??ek Papierowych, Mówionych I Elektronicznych');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A4', 'CCSS');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A5', 'Rameau');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A6', 'Nomenclature discipline scolaire');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A7', 'ISIC');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A8', 'LC Children’s Subject Headings');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('A9', 'Ny Läromedel');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('B0', 'EuroVoc');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('B1', 'BISG Educational Taxonomy');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('B2', 'Keywords (not for display)');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('B3', 'Nomenclature Diplôme');
INSERT INTO [#refSubjectScheme] ([Id], [Description]) VALUES ('B4', 'Key character names');

DELETE dst
FROM [dbo].[refSubjectScheme] dst   
	LEFT JOIN [#refSubjectScheme] src ON dst.[Id] = src.[Id]
WHERE src.[Id] IS NULL;

UPDATE dst
SET [Description] = src.[Description]
FROM [dbo].[refSubjectScheme] dst  
	JOIN [#refSubjectScheme] src ON dst.[Id] = src.[Id]
WHERE src.[Description] <> dst.[Description];
	
INSERT [dbo].[refSubjectScheme] (
	[Id], [Description]
)
SELECT src.[Id], src.[Description]
FROM [#refSubjectScheme] src
	LEFT JOIN [dbo].[refSubjectScheme] dst ON dst.[Id] = src.[Id]
WHERE dst.[Id] IS NULL;