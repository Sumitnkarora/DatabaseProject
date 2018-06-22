------------------------------------------------
-- MC List pulled from SAP tables T023/T023T
-- =CONCATENATE("INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/", CODE(LEFT(C2,1))-64,"/",MID(C2,2,3),"/",MID(C2,5,2),"/', '", TRIM(C2), "', '",TRIM(E2),"')")

-- LM Assignments from here : https://indigoca.sharepoint.com/sites/HomeOffice/Lists/MCATs%20and%20LMs/AllItems.aspx
-- Opened in excel, use this formula: -- =CONCATENATE("INSERT #LMMAP (MC, LM) VALUES('", [@[MCAT '#]], "', '", [@LM], "')")

------------------------------------------------
-- [Dec 14, 2017] currently 1815 rows
-- select NodeId.ToString() as 'NodeIdPath', MCLM, Description, ParentId.ToString() as 'ParentIdPath', CategoryLevel from [dbo].[refRetailTaxonomy]
-- select * from [dbo].[FullRetailTaxonomy]
------------------------------------------------

IF OBJECT_ID('tempdb..[#refRetailTaxonomy]') IS NOT NULL DROP TABLE [#refRetailTaxonomy];

CREATE TABLE [#refRetailTaxonomy]
(
	[NodeId] hierarchyid NOT NULL
,	[MCLM] VARCHAR(30) NULL
,	[Description] nvarchar(MAX) NULL
,	[ParentId] AS [NodeId].GetAncestor(1) PERSISTED
,	[CategoryLevel] AS [NodeId].GetLevel() PERSISTED
);

IF OBJECT_ID('tempdb..[#LMMAP]') IS NOT NULL DROP TABLE [#LMMAP];

CREATE TABLE [#LMMAP]
(
	[MC] VARCHAR(15) NULL
,	[LM] VARCHAR(15) NULL
);

INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/', NULL, 'Indigo')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/6/', 'F', 'Finance')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/', 'G', 'Gift & Lifestyle')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/', 'M', 'Music and Video')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/', 'P', 'Print')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/26/', 'Z', 'Other')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/6/101/', 'F101', 'Gift Cards')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/', 'G101', 'Gift Items')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/', 'G102', 'Paper')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/', 'G103', 'Promotions')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/', 'G104', 'Toy & Baby')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/', 'G105', 'Electronics')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/107/', 'G107', 'Calendars')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/', 'M101', 'Music')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/', 'M102', 'Video & DVD')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/', 'M103', 'New Business')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/', 'P101', 'Trade Books')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/', 'P102', 'Bargain Books')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/103/', 'P103', 'Magazines and Newspapers')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/104/', 'P104', 'Calendars')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/', 'P105', 'Toys')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/', 'P106', 'French')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/107/', 'P107', 'Finance Print')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/26/101/', 'Z101', 'Loyalty Income')
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/26/102/', 'Z102', 'Gift Certificates')

INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/6/101/1/', 'F10101', 'F10101');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/6/101/2/', 'F10102', 'F10102');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/6/101/3/', 'F10103', 'F10103');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/6/101/5/', 'F10105', 'F10105');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/1/', 'G10101', 'G10101');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/2/', 'G10102', 'G10102');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/3/', 'G10103', 'G10103');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/4/', 'G10104', 'G10104');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/5/', 'G10105', 'G10105');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/6/', 'G10106', 'G10106');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/7/', 'G10107', 'G10107');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/8/', 'G10108', 'G10108');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/9/', 'G10109', 'G10109');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/10/', 'G10110', 'G10110');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/11/', 'G10111', 'G10111');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/12/', 'G10112', 'G10112');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/20/', 'G10120', 'G10120');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/21/', 'G10121', 'G10121');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/22/', 'G10122', 'G10122');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/23/', 'G10123', 'G10123');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/24/', 'G10124', 'G10124');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/25/', 'G10125', 'G10125');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/26/', 'G10126', 'G10126');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/27/', 'G10127', 'G10127');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/28/', 'G10128', 'G10128');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/29/', 'G10129', 'G10129');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/30/', 'G10130', 'G10130');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/31/', 'G10131', 'G10131');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/32/', 'G10132', 'G10132');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/33/', 'G10133', 'G10133');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/34/', 'G10134', 'G10134');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/35/', 'G10135', 'G10135');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/36/', 'G10136', 'G10136');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/37/', 'G10137', 'G10137');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/38/', 'G10138', 'G10138');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/39/', 'G10139', 'G10139');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/40/', 'G10140', 'G10140');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/41/', 'G10141', 'G10141');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/42/', 'G10142', 'G10142');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/43/', 'G10143', 'G10143');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/44/', 'G10144', 'G10144');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/45/', 'G10145', 'G10145');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/46/', 'G10146', 'G10146');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/47/', 'G10147', 'G10147');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/48/', 'G10148', 'G10148');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/49/', 'G10149', 'G10149');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/50/', 'G10150', 'G10150');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/51/', 'G10151', 'G10151');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/52/', 'G10152', 'G10152');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/53/', 'G10153', 'G10153');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/54/', 'G10154', 'G10154');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/55/', 'G10155', 'G10155');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/56/', 'G10156', 'G10156');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/57/', 'G10157', 'G10157');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/58/', 'G10158', 'G10158');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/59/', 'G10159', 'G10159');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/60/', 'G10160', 'G10160');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/61/', 'G10161', 'G10161');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/62/', 'G10162', 'G10162');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/63/', 'G10163', 'G10163');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/64/', 'G10164', 'G10164');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/65/', 'G10165', 'G10165');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/66/', 'G10166', 'G10166');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/67/', 'G10167', 'G10167');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/90/', 'G10190', 'G10190');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/91/', 'G10191', 'G10191');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/98/', 'G10198', 'G10198');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/101/99/', 'G10199', 'G10199');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/1/', 'G10201', 'G10201');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/2/', 'G10202', 'G10202');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/3/', 'G10203', 'G10203');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/4/', 'G10204', 'G10204');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/5/', 'G10205', 'G10205');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/6/', 'G10206', 'G10206');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/7/', 'G10207', 'G10207');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/8/', 'G10208', 'G10208');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/9/', 'G10209', 'G10209');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/10/', 'G10210', 'G10210');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/11/', 'G10211', 'G10211');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/12/', 'G10212', 'G10212');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/13/', 'G10213', 'G10213');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/14/', 'G10214', 'G10214');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/15/', 'G10215', 'G10215');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/16/', 'G10216', 'G10216');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/17/', 'G10217', 'G10217');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/18/', 'G10218', 'G10218');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/19/', 'G10219', 'G10219');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/20/', 'G10220', 'G10220');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/21/', 'G10221', 'G10221');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/22/', 'G10222', 'G10222');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/23/', 'G10223', 'G10223');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/24/', 'G10224', 'G10224');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/25/', 'G10225', 'G10225');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/26/', 'G10226', 'G10226');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/27/', 'G10227', 'G10227');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/30/', 'G10230', 'G10230');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/31/', 'G10231', 'G10231');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/32/', 'G10232', 'G10232');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/98/', 'G10298', 'G10298');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/102/99/', 'G10299', 'G10299');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/1/', 'G10301', 'G10301');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/2/', 'G10302', 'G10302');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/3/', 'G10303', 'G10303');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/4/', 'G10304', 'G10304');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/5/', 'G10305', 'G10305');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/6/', 'G10306', 'G10306');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/103/7/', 'G10307', 'G10307');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/0/', 'G10400', 'G10400');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/1/', 'G10401', 'G10401');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/2/', 'G10402', 'G10402');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/3/', 'G10403', 'G10403');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/4/', 'G10404', 'G10404');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/5/', 'G10405', 'G10405');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/6/', 'G10406', 'G10406');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/7/', 'G10407', 'G10407');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/8/', 'G10408', 'G10408');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/9/', 'G10409', 'G10409');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/10/', 'G10410', 'G10410');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/11/', 'G10411', 'G10411');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/12/', 'G10412', 'G10412');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/13/', 'G10413', 'G10413');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/14/', 'G10414', 'G10414');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/15/', 'G10415', 'G10415');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/16/', 'G10416', 'G10416');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/17/', 'G10417', 'G10417');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/18/', 'G10418', 'G10418');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/19/', 'G10419', 'G10419');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/20/', 'G10420', 'G10420');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/21/', 'G10421', 'G10421');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/22/', 'G10422', 'G10422');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/23/', 'G10423', 'G10423');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/104/99/', 'G10499', 'G10499');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/1/', 'G10501', 'G10501');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/2/', 'G10502', 'G10502');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/3/', 'G10503', 'G10503');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/4/', 'G10504', 'G10504');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/5/', 'G10505', 'G10505');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/6/', 'G10506', 'G10506');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/7/', 'G10507', 'G10507');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/8/', 'G10508', 'G10508');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/9/', 'G10509', 'G10509');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/105/99/', 'G10599', 'G10599');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/7/107/1/', 'G10701', 'G10701');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/1/', 'M10101', 'M10101');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/3/', 'M10103', 'M10103');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/4/', 'M10104', 'M10104');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/5/', 'M10105', 'M10105');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/6/', 'M10106', 'M10106');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/7/', 'M10107', 'M10107');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/8/', 'M10108', 'M10108');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/9/', 'M10109', 'M10109');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/10/', 'M10110', 'M10110');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/11/', 'M10111', 'M10111');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/12/', 'M10112', 'M10112');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/13/', 'M10113', 'M10113');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/14/', 'M10114', 'M10114');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/15/', 'M10115', 'M10115');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/16/', 'M10116', 'M10116');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/17/', 'M10117', 'M10117');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/18/', 'M10118', 'M10118');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/19/', 'M10119', 'M10119');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/101/98/', 'M10198', 'M10198');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/1/', 'M10201', 'M10201');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/2/', 'M10202', 'M10202');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/3/', 'M10203', 'M10203');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/4/', 'M10204', 'M10204');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/5/', 'M10205', 'M10205');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/6/', 'M10206', 'M10206');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/7/', 'M10207', 'M10207');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/8/', 'M10208', 'M10208');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/9/', 'M10209', 'M10209');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/10/', 'M10210', 'M10210');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/11/', 'M10211', 'M10211');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/102/12/', 'M10212', 'M10212');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/1/', 'M10301', 'M10301');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/2/', 'M10302', 'M10302');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/3/', 'M10303', 'M10303');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/4/', 'M10304', 'M10304');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/5/', 'M10305', 'M10305');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/6/', 'M10306', 'M10306');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/7/', 'M10307', 'M10307');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/8/', 'M10308', 'M10308');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/9/', 'M10309', 'M10309');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/10/', 'M10310', 'M10310');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/11/', 'M10311', 'M10311');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/12/', 'M10312', 'M10312');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/13/', 'M10313', 'M10313');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/13/103/14/', 'M10314', 'M10314');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/0/', 'P10100', 'P10100');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/1/', 'P10101', 'P10101');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/2/', 'P10102', 'P10102');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/3/', 'P10103', 'P10103');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/4/', 'P10104', 'P10104');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/5/', 'P10105', 'P10105');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/6/', 'P10106', 'P10106');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/7/', 'P10107', 'P10107');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/9/', 'P10109', 'P10109');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/10/', 'P10110', 'P10110');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/11/', 'P10111', 'P10111');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/12/', 'P10112', 'P10112');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/13/', 'P10113', 'P10113');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/14/', 'P10114', 'P10114');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/15/', 'P10115', 'P10115');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/16/', 'P10116', 'P10116');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/17/', 'P10117', 'P10117');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/18/', 'P10118', 'P10118');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/20/', 'P10120', 'P10120');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/21/', 'P10121', 'P10121');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/22/', 'P10122', 'P10122');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/23/', 'P10123', 'P10123');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/24/', 'P10124', 'P10124');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/40/', 'P10140', 'P10140');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/41/', 'P10141', 'P10141');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/42/', 'P10142', 'P10142');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/43/', 'P10143', 'P10143');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/44/', 'P10144', 'P10144');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/45/', 'P10145', 'P10145');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/46/', 'P10146', 'P10146');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/47/', 'P10147', 'P10147');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/48/', 'P10148', 'P10148');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/49/', 'P10149', 'P10149');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/50/', 'P10150', 'P10150');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/51/', 'P10151', 'P10151');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/52/', 'P10152', 'P10152');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/53/', 'P10153', 'P10153');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/54/', 'P10154', 'P10154');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/55/', 'P10155', 'P10155');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/56/', 'P10156', 'P10156');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/57/', 'P10157', 'P10157');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/58/', 'P10158', 'P10158');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/59/', 'P10159', 'P10159');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/60/', 'P10160', 'P10160');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/61/', 'P10161', 'P10161');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/67/', 'P10167', 'P10167');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/68/', 'P10168', 'P10168');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/69/', 'P10169', 'P10169');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/70/', 'P10170', 'P10170');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/71/', 'P10171', 'P10171');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/72/', 'P10172', 'P10172');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/73/', 'P10173', 'P10173');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/74/', 'P10174', 'P10174');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/75/', 'P10175', 'P10175');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/76/', 'P10176', 'P10176');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/77/', 'P10177', 'P10177');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/78/', 'P10178', 'P10178');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/79/', 'P10179', 'P10179');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/80/', 'P10180', 'P10180');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/81/', 'P10181', 'P10181');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/82/', 'P10182', 'P10182');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/83/', 'P10183', 'P10183');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/84/', 'P10184', 'P10184');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/85/', 'P10185', 'P10185');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/90/', 'P10190', 'P10190');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/91/', 'P10191', 'P10191');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/97/', 'P10197', 'P10197');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/98/', 'P10198', 'P10198');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/101/99/', 'P10199', 'P10199');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/1/', 'P10201', 'P10201');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/2/', 'P10202', 'P10202');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/3/', 'P10203', 'P10203');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/4/', 'P10204', 'P10204');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/5/', 'P10205', 'P10205');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/6/', 'P10206', 'P10206');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/7/', 'P10207', 'P10207');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/8/', 'P10208', 'P10208');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/9/', 'P10209', 'P10209');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/10/', 'P10210', 'P10210');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/11/', 'P10211', 'P10211');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/12/', 'P10212', 'P10212');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/13/', 'P10213', 'P10213');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/14/', 'P10214', 'P10214');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/15/', 'P10215', 'P10215');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/16/', 'P10216', 'P10216');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/17/', 'P10217', 'P10217');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/18/', 'P10218', 'P10218');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/19/', 'P10219', 'P10219');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/20/', 'P10220', 'P10220');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/21/', 'P10221', 'P10221');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/22/', 'P10222', 'P10222');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/23/', 'P10223', 'P10223');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/24/', 'P10224', 'P10224');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/25/', 'P10225', 'P10225');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/26/', 'P10226', 'P10226');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/102/99/', 'P10299', 'P10299');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/103/1/', 'P10301', 'P10301');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/103/2/', 'P10302', 'P10302');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/104/1/', 'P10401', 'P10401');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/104/2/', 'P10402', 'P10402');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/104/3/', 'P10403', 'P10403');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/104/4/', 'P10404', 'P10404');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/104/5/', 'P10405', 'P10405');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/104/98/', 'P10498', 'P10498');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/1/', 'P10501', 'P10501');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/10/', 'P10510', 'P10510');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/11/', 'P10511', 'P10511');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/12/', 'P10512', 'P10512');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/13/', 'P10513', 'P10513');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/14/', 'P10514', 'P10514');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/15/', 'P10515', 'P10515');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/16/', 'P10516', 'P10516');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/17/', 'P10517', 'P10517');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/18/', 'P10518', 'P10518');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/19/', 'P10519', 'P10519');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/20/', 'P10520', 'P10520');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/21/', 'P10521', 'P10521');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/22/', 'P10522', 'P10522');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/30/', 'P10530', 'P10530');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/31/', 'P10531', 'P10531');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/32/', 'P10532', 'P10532');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/34/', 'P10534', 'P10534');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/36/', 'P10536', 'P10536');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/37/', 'P10537', 'P10537');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/38/', 'P10538', 'P10538');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/39/', 'P10539', 'P10539');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/105/40/', 'P10540', 'P10540');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/0/', 'P10600', 'P10600');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/1/', 'P10601', 'P10601');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/2/', 'P10602', 'P10602');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/3/', 'P10603', 'P10603');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/4/', 'P10604', 'P10604');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/5/', 'P10605', 'P10605');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/6/', 'P10606', 'P10606');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/7/', 'P10607', 'P10607');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/10/', 'P10610', 'P10610');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/11/', 'P10611', 'P10611');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/20/', 'P10620', 'P10620');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/21/', 'P10621', 'P10621');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/22/', 'P10622', 'P10622');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/30/', 'P10630', 'P10630');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/31/', 'P10631', 'P10631');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/32/', 'P10632', 'P10632');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/33/', 'P10633', 'P10633');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/40/', 'P10640', 'P10640');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/41/', 'P10641', 'P10641');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/42/', 'P10642', 'P10642');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/43/', 'P10643', 'P10643');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/44/', 'P10644', 'P10644');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/45/', 'P10645', 'P10645');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/46/', 'P10646', 'P10646');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/47/', 'P10647', 'P10647');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/50/', 'P10650', 'P10650');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/51/', 'P10651', 'P10651');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/52/', 'P10652', 'P10652');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/53/', 'P10653', 'P10653');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/54/', 'P10654', 'P10654');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/60/', 'P10660', 'P10660');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/106/70/', 'P10670', 'P10670');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/107/1/', 'P10701', 'P10701');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/16/107/2/', 'P10702', 'P10702');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/26/101/1/', 'Z10101', 'Z10101');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/26/101/2/', 'Z10102', 'Z10102');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/26/101/3/', 'Z10103', 'Z10103');
INSERT #refRetailTaxonomy (NodeId, MCLM, Description) VALUES('/26/102/1/', 'Z10201', 'Z10201');

INSERT #LMMAP (MC, LM) VALUES('G10122', 'BARACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10122', 'DECANT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10122', 'DRKGLAS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10122', 'HYDRAT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10122', 'WNGLASS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10123', 'CHEWY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10123', 'CONFECT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10123', 'HARDCDY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10123', 'IMCANDY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10123', 'NOVCNDY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10123', 'SAMPCAN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10126', 'BBATH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10126', 'GELWASH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10126', 'HANDCR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10126', 'OTHERBC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10126', 'PERFRAG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10126', 'SALTBOM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10126', 'TRVLMUG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'GLOVES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'HATS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'PERMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'SCARVES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'MITTEN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'WRAPS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'SNOODS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10127', 'EARMUF01Z')
INSERT #LMMAP (MC, LM) VALUES('G10129', 'CANACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10129', 'CANDLES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10129', 'DIFFUSE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10129', 'POTPOUR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10129', 'SCEMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10129', 'SPRAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10129', 'UNSCENT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10133', 'MONOMUG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10133', 'NOVLMUG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10133', 'TRVLMUG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10134', 'BAGMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10134', 'BAGS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10134', 'BKTOTE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10134', 'TECH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10134', 'TOTE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10136', 'CONTAIN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10136', 'LUNCHBG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10136', 'LUNCHBX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10136', 'UTENSIL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10137', 'BARS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10137', 'BOXED01Z')
INSERT #LMMAP (MC, LM) VALUES('G10137', 'CHOCOVG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10137', 'GHOTCHO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10137', 'GIFTBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10137', 'IMPULSE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10137', 'NOVCHOG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'CLOCK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'DSKFRAM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'EXPRESS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'GALLERY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'LEDGES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'MIRRORS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'NOVPHOT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'WALLACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'WALLART01Z')
INSERT #LMMAP (MC, LM) VALUES('G10138', 'WALLETR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10141', 'BOWLS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10141', 'CHARGER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10141', 'PLATES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10142', 'PLATTER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10142', 'SBOWLS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10142', 'SERVACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10142', 'WOODBRD01Z')
INSERT #LMMAP (MC, LM) VALUES('G10142', 'KITCHEL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10143', 'NPKIN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10143', 'NPKINRG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10143', 'OTHTBL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10143', 'PLACEMT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10144', 'BBQ01Z')
INSERT #LMMAP (MC, LM) VALUES('G10144', 'SEASACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10144', 'BEER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10144', 'SPIRITS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10144', 'WINE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10145', 'TEACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10145', 'TEAMUGS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10145', 'TEAPOT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10145', 'BREWER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10145', 'COFFACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10145', 'COFFCUP01Z')
INSERT #LMMAP (MC, LM) VALUES('G10145', 'ESPRESO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10146', 'BOXCHOC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10146', 'CHOCBAR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10146', 'CHOCCOV01Z')
INSERT #LMMAP (MC, LM) VALUES('G10146', 'CHOCMIX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10146', 'IMCHOCO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10146', 'NOVCHOC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10146', 'SAMPCHO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'GIFTCO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'IMPCO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'INDVCO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'CRACKER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'JAMS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'NOVMIXES01')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'NOVOTHR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'PASTA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10147', 'SAUCES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10148', 'HOTCHOC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10148', 'MIXTEA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10148', 'SMPLTEA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10148', 'SPTEA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10148', 'TEA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PILLOW01Z')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PCEXP01A')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PCFFUR01A')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PCINSRT01A')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PCNOV01A')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PCSOLID01Z')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PCTEXT01A')
INSERT #LMMAP (MC, LM) VALUES('G10151', 'PCOUTDR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'BASKETS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'BOOKEND01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'BOXES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'DESKACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'GLOBE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'GVASE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'MISCSTO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'OBJET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'SORG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'VASE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10152', 'FRNTR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'DECHOLI01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'GAMES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'GARDEN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'GARMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'GROWKIT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'LITDECO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'MISCHOL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'ORNAMNT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10154', 'STOCKNG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10155', 'HWB01Z')
INSERT #LMMAP (MC, LM) VALUES('G10155', 'ROBES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10155', 'SHAWL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10155', 'SLIPPER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10155', 'SOCKS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10155', 'SLPWEAR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'BARSOAP01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'BBATH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'BLOTION01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'GELWASH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'GIFTSET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'HANDCR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'HANDWA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'LIPBAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'NAILPOL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'OTHERBC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'PERCARE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'PERFRAG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10156', 'SALTBOM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'BANGLES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'SMACCES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'SLPMSK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'PERSACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'BRACELET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'NECKLC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'RINGS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10162', 'EARRING01Z')
INSERT #LMMAP (MC, LM) VALUES('G10163', 'TFFUR01A')
INSERT #LMMAP (MC, LM) VALUES('G10163', 'THROW01Z')
INSERT #LMMAP (MC, LM) VALUES('G10163', 'TNOV01A')
INSERT #LMMAP (MC, LM) VALUES('G10163', 'TSOLID01A')
INSERT #LMMAP (MC, LM) VALUES('G10163', 'TTEXT01A')
INSERT #LMMAP (MC, LM) VALUES('G10163', 'TTOWEL01A')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'COLDCUP01Z')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'HYDACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'HYDGLAS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'HYDSPOR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'INFUSE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'INSULAT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'SWELL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10164', 'THERMOS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10166', 'COSMETI01Z')
INSERT #LMMAP (MC, LM) VALUES('G10166', 'POUCH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10166', 'WALLETS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'CLNKIT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'FGX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'NIGHTL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'RDMETAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'RDPLSTC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'RDRACSS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'RDRMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'RDRNKLC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'READCAS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'READER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10167', 'RIMLESS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10190', '')
INSERT #LMMAP (MC, LM) VALUES('G10191', 'IREUSE0Z')
INSERT #LMMAP (MC, LM) VALUES('G10199', '')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'AUTUMN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'BABY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'BTHDAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'EASTER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'EVRYDAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'FDAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'FRNDSHP01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'HOLIDAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'MDAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'OCCASN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'PCCMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'RELIG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'VALENTI01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'WEDDING01Z')
INSERT #LMMAP (MC, LM) VALUES('G10201', 'WELLNES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'BABYBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'DSKNTPP01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'EVRYBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'HOLIBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'INVITE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'POPPIN01')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'SEASBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'STATSET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'TYBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10202', 'WDDBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10203', 'BACMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10203', 'BKCOVER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10203', 'BKHLDR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10203', 'BKLIGHT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10203', 'BKMK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10203', 'LAPDESK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10204', 'HARDCVR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10204', 'JNLMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10204', 'LEATHR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10204', 'MLSKINE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10204', 'POPPIN02')
INSERT #LMMAP (MC, LM) VALUES('G10204', 'SOFTCVR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10204', 'SPIRAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10207', '16MAGEN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10207', '18MAGEN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10207', 'ACDAGEN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10207', 'CLRAGEN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10208', 'ARTCRFT02Z')
INSERT #LMMAP (MC, LM) VALUES('G10208', 'PERSACS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10208', 'SOHMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10208', 'TECHACS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10208', 'NOVELTS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'BAG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'BOW01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'CANDLE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'DECO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'ENCLTAG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'GELGEM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'HAT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'NAPKIN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'NOVPRTY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'PARMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'PRTYACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'PRTYKIT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'RIBBON01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'TISSUE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10211', 'WRAP01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'ALBMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'ARTCRFT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'BRAGBKS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'GENALB01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'PHTBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'RECBIND01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'RECBOX01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'RECCARD01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'SCRAPBK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'TRVALB01Z')
INSERT #LMMAP (MC, LM) VALUES('G10212', 'WEDDALB01Z')
INSERT #LMMAP (MC, LM) VALUES('G10217', 'BKMARK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10217', 'BOOKPLA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10217', 'JOURNAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10217', 'NBKMARK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10217', 'VBKMIS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'AUTUMN02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'BABY02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'BTHDAY02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'CCMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'EASTER02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'EVRYDAY02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'FDAY02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'FRNDSHP02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'HOLIDAY02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'MDAY02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'OCCASN02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'PEACEK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'RELIG02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'TREASUR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'VALENTI02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'WEDDING02Z')
INSERT #LMMAP (MC, LM) VALUES('G10218', 'WELLNES02Z')
INSERT #LMMAP (MC, LM) VALUES('G10219', 'BAG02Z')
INSERT #LMMAP (MC, LM) VALUES('G10219', 'BOW02Z')
INSERT #LMMAP (MC, LM) VALUES('G10219', 'ENCLTAG02Z')
INSERT #LMMAP (MC, LM) VALUES('G10219', 'PAPMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10219', 'RIBBON02Z')
INSERT #LMMAP (MC, LM) VALUES('G10219', 'TISSUE02Z')
INSERT #LMMAP (MC, LM) VALUES('G10219', 'WRAP02Z')
INSERT #LMMAP (MC, LM) VALUES('G10222', 'NOTEPAD01Z')
INSERT #LMMAP (MC, LM) VALUES('G10222', 'SSMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10223', 'WRTGACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10223', 'WRTGINS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10224', 'DESKACS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10224', 'MEMOACS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10224', 'OFFACCS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10224', 'FURNITR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10225', 'ADDRSBK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10225', 'GUESTBK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10225', 'SKTCHBK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10225', 'THMJOUR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10226', 'COLOUR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10227', 'BOXXCAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10227', 'MINICAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10227', 'PCKTCAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10227', 'WALLCAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10227', 'ENGAGCA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10227', 'OVWACAL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10299', '')
INSERT #LMMAP (MC, LM) VALUES('G10303', '')
INSERT #LMMAP (MC, LM) VALUES('G10401', 'MPLUSH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10401', 'PLUSH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'BABYFRM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'BBKND01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'BDECOR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'BWALART01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'COINBNK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'DISHSET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'GCHART01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'KEEPSK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10402', 'MBOOKS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10403', 'FEEDING01Z')
INSERT #LMMAP (MC, LM) VALUES('G10403', 'FORMOM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10403', 'INFCARE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10403', 'NURSERY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10403', 'PACFIER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10403', 'SENSTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10403', 'TETHTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'BABYACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'BABYSTO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'CARRIER01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'CLOTHIN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'DBAGACC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'DBAGS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'LAYETTE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10404', 'NURSING01Z')
INSERT #LMMAP (MC, LM) VALUES('G10405', 'BLANKET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10405', 'MOBILES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10405', 'NDECOR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10405', 'SBLANKT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10405', 'SNDMACH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10405', 'SSACKS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10405', 'SWADDLE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10406', 'BATHTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10406', 'SKIN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10406', 'TOWEL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10406', 'WASHSET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'BACKPCK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'DVPTTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'ELECTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'MEALTIM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'PRESCTY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'TOYBATH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'WOODTOY02Z')
INSERT #LMMAP (MC, LM) VALUES('G10407', 'WOODTOY03Z')
INSERT #LMMAP (MC, LM) VALUES('G10408', 'ACTBK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10408', 'ARTSUPP02Z')
INSERT #LMMAP (MC, LM) VALUES('G10408', 'CRAFTS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10408', 'PRTPLAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10408', 'PUZZLE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10408', 'SEASNL02Z')
INSERT #LMMAP (MC, LM) VALUES('G10408', 'WOODTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10409', 'COSTUM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10409', 'FIGURN01Z')
INSERT #LMMAP (MC, LM) VALUES('G10409', 'KIDMUS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10409', 'PLAYMOB01Z')
INSERT #LMMAP (MC, LM) VALUES('G10409', 'PRTDPL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10409', 'JEWELS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10410', 'GRSSSCI01Z')
INSERT #LMMAP (MC, LM) VALUES('G10410', 'HEXBUG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10410', 'SCI10101Z')
INSERT #LMMAP (MC, LM) VALUES('G10410', 'SCIEQMT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10412', 'DIECAST01Z')
INSERT #LMMAP (MC, LM) VALUES('G10412', 'REMCTRL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10412', 'TRKSET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10412', 'VEHICLS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10413', 'BLDCNST01Z')
INSERT #LMMAP (MC, LM) VALUES('G10413', 'INDACT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10413', 'OUTACT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10413', 'RIDEBIK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10413', 'SPRTGDS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10413', 'SUMACT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10413', 'WINACT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10414', 'ACTSTCK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10414', 'ARTSUPP01Z')
INSERT #LMMAP (MC, LM) VALUES('G10414', 'CRFTKIT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10414', 'CRVTKIT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10414', 'SNLCRFT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10415', 'DOLLS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10415', 'PUPPETS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10415', 'TOYPLSH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10415', 'TYBRAND01Z')
INSERT #LMMAP (MC, LM) VALUES('G10417', 'AGACCES01Z')
INSERT #LMMAP (MC, LM) VALUES('G10417', 'AGDOLLS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10417', 'AGFURNT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10417', 'BEFOREV01Z')
INSERT #LMMAP (MC, LM) VALUES('G10417', 'BITTYBB01Z')
INSERT #LMMAP (MC, LM) VALUES('G10417', 'KIDCLTH01Z')
INSERT #LMMAP (MC, LM) VALUES('G10418', 'NA')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'CHIMA01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'CITY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'CLASSIC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'CREATOR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'DISCNTD01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'DUPLO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'FMINIFIG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'FRIENDS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'LICNCED01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'NEW01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'NINJAGO1Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'SEASNL03Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'STARWAR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'SUPHERO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'TMNT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'ARCHIT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'IDEAS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'JUNIORS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'MNCRFT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'MOVIE01Z')
INSERT #LMMAP (MC, LM) VALUES('G10419', 'NEXO01Z')
INSERT #LMMAP (MC, LM) VALUES('G10420', 'ADLTGAM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10420', 'ADLTPUZ01Z')
INSERT #LMMAP (MC, LM) VALUES('G10420', 'FAMCRD01Z')
INSERT #LMMAP (MC, LM) VALUES('G10420', 'FAMGAME01Z')
INSERT #LMMAP (MC, LM) VALUES('G10420', 'KIDCARD01Z')
INSERT #LMMAP (MC, LM) VALUES('G10420', 'KIDGAME01Z')
INSERT #LMMAP (MC, LM) VALUES('G10420', 'KIDPUZ01Z')
INSERT #LMMAP (MC, LM) VALUES('G10421', 'CLSLOOT01Z')
INSERT #LMMAP (MC, LM) VALUES('G10421', 'KIDSTNR01Z')
INSERT #LMMAP (MC, LM) VALUES('G10421', 'LTTLWHL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10421', 'NOVTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10421', 'STICKRS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10421', 'TRNDCOL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10422', 'APPAREL01Z')
INSERT #LMMAP (MC, LM) VALUES('G10422', 'BACKPCK01Z')
INSERT #LMMAP (MC, LM) VALUES('G10422', 'BSKETS01Z')
INSERT #LMMAP (MC, LM) VALUES('G10422', 'MEALTIM01Z')
INSERT #LMMAP (MC, LM) VALUES('G10422', 'ROOMDEC01Z')
INSERT #LMMAP (MC, LM) VALUES('G10423', 'ACTFIG01Z')
INSERT #LMMAP (MC, LM) VALUES('G10423', 'PLAYSET01Z')
INSERT #LMMAP (MC, LM) VALUES('G10423', 'ROLPLAY01Z')
INSERT #LMMAP (MC, LM) VALUES('G10499', '')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'BLUSMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'BRNDMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'CLASMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'COMEDY01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'COUNMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'DVDSEAS01T')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'FOLK01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'FRANCO01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'GOSPEL01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'HOLMUSC01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'JAZZMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'KIDSMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'MOVIES01T')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'MUSCDVD13A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'MUSICAA04A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'NWAGMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'POP03A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'POP05A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'POPMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'REGGAE01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'REMAIND01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'REMAIND02A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'SDTKS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'SNDMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'SNDMUS01T')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'SPECDVD01T')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'TVDVDS01T')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALBLUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALCLAS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALCTRY01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALFOLK01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALFRN01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALJAZZ01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALKIDS01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALNWAG01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALOST01T')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALPOP01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALRB01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALREGG01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'VALWRLD01A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'WORLD02A')
INSERT #LMMAP (MC, LM) VALUES('M10101', 'WRLDMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'ACTION01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'CLASMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'COMEDY01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'DRAMA04T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'DVDSEAS01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'HLTHDVD01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'KIDSDVD01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'KIDSMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'MOVIES01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'MUSCDVD13A')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'MUSICAL01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'PETSCAR04Z')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'POPMUS01A')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'REMAIND01A')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'SNDMUS01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'SPECDVD01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'SPECINT02T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'TA_LF_HEAL')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'TVDVDS01T')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'VALUE01A')
INSERT #LMMAP (MC, LM) VALUES('M10201', 'VALUE01T')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'ARC01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'AURA01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'GLO01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'MINI01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'NEXUS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'TOUCH01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'VOX01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'EREADER01Z')
INSERT #LMMAP (MC, LM) VALUES('M10303', 'EREACC01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'CABLE01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'CHRGR01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'CLEANER01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'KEEPERS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'PSOURCE01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'STYLUS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'CABCHAR01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'BATTERY01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'STYSTND01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'CLEANER01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'MISCACC01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'DRIVER01Z')
INSERT #LMMAP (MC, LM) VALUES('M10304', 'PERIPH01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'GAMES01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'HEALTH01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'HOME01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'KIDS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'MISCP01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'SMRTWTC01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'VR01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'FTNBAND01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'FTNASSC01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'HLTHMON01Z')
INSERT #LMMAP (MC, LM) VALUES('M10306', 'SMSPORT01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'ALLGAME01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'CONSOLE01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'ELECACCS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'ELECHRD01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'ELECSFTW01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'EREADHW01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'EREADSW01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'GAMACCS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'MATRGAM01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'VIDGMHW01Z')
INSERT #LMMAP (MC, LM) VALUES('M10307', 'VIDGMSW01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'CASE01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'ICASE401Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'ICASE501Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IMINICS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPADCS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPHON601Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPHN6PL01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'GALAXY01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'ANDROID01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPAD01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPHONE601Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPHONE701Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPHONE801Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'LPSLEEV01Z')
INSERT #LMMAP (MC, LM) VALUES('M10309', 'IPADPRO01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'APTV01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IMINI01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPAD01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPAD201Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPOD01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPADAIS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPADPRO01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPODTOU01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPODOTH01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPADCAS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'IPHOCAS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10310', 'APPACCS01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'EPHONE01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'HPHONE01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'SPKR01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'KIDAUDIO01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'EARBDWD01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'EARBDWL01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'HEADPWD01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'HEADPWL01Z')
INSERT #LMMAP (MC, LM) VALUES('M10311', 'TURNTAB01Z')
INSERT #LMMAP (MC, LM) VALUES('M10313', 'CONHOME01Z')
INSERT #LMMAP (MC, LM) VALUES('M10313', 'CREATE01Z')
INSERT #LMMAP (MC, LM) VALUES('M10313', 'MSTREAM01Z')
INSERT #LMMAP (MC, LM) VALUES('M10313', 'PHOTOGR01Z')
INSERT #LMMAP (MC, LM) VALUES('M10314', 'CODING01Z')
INSERT #LMMAP (MC, LM) VALUES('M10314', 'DRONES01Z')
INSERT #LMMAP (MC, LM) VALUES('M10314', 'EREADSW01Z')
INSERT #LMMAP (MC, LM) VALUES('M10314', 'ERLDEV01Z')
INSERT #LMMAP (MC, LM) VALUES('M10314', 'LICTECH01Z')
INSERT #LMMAP (MC, LM) VALUES('M10314', 'SMRTTOY01Z')
INSERT #LMMAP (MC, LM) VALUES('P10101', 'BIOGENR01Z')
INSERT #LMMAP (MC, LM) VALUES('P10102', 'CULSTUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10102', 'CULSTUD02A')
INSERT #LMMAP (MC, LM) VALUES('P10102', 'CULSTUD03A')
INSERT #LMMAP (MC, LM) VALUES('P10102', 'CULSTUD04A')
INSERT #LMMAP (MC, LM) VALUES('P10102', 'CULSTUD06A')
INSERT #LMMAP (MC, LM) VALUES('P10102', 'CULSTUD07A')
INSERT #LMMAP (MC, LM) VALUES('P10102', 'CULSTUD08A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'CANHIST01A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'HISTGEN01A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'MILIHIS01A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'WORHIST02A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'WORHIST04A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'WORHIST05A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'WORHIST06A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'WORHIST07A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'WORHIST08A')
INSERT #LMMAP (MC, LM) VALUES('P10103', 'WORHIST11A')
INSERT #LMMAP (MC, LM) VALUES('P10105', 'WESPHIL01A')
INSERT #LMMAP (MC, LM) VALUES('P10106', 'CANPOET01A')
INSERT #LMMAP (MC, LM) VALUES('P10106', 'GENDRAM01A')
INSERT #LMMAP (MC, LM) VALUES('P10106', 'GENDRAM02A')
INSERT #LMMAP (MC, LM) VALUES('P10106', 'GENPOET01A')
INSERT #LMMAP (MC, LM) VALUES('P10106', 'LITCRIT01A')
INSERT #LMMAP (MC, LM) VALUES('P10107', 'BIBSTUD02Z')
INSERT #LMMAP (MC, LM) VALUES('P10107', 'CHRISTI01A')
INSERT #LMMAP (MC, LM) VALUES('P10107', 'CHRSFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10107', 'EASTREL01A')
INSERT #LMMAP (MC, LM) VALUES('P10107', 'GENRELI01A')
INSERT #LMMAP (MC, LM) VALUES('P10107', 'ISLAMA01A')
INSERT #LMMAP (MC, LM) VALUES('P10107', 'JUDAICA01A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSICAR01A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSICAR02A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIGEN03A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIGEN04A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIHUR04A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIINV01A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIMGT02A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIMGT03A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIMKT01A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIMKT03A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIPER01A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIPER02A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIPRO01Z')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSIREF03A')
INSERT #LMMAP (MC, LM) VALUES('P10110', 'BUSISML02A')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'COMPGEN01S')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'ADOBEPH01Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'CERTIFI01Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'DATABAS06Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'GRAPHIC01Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'MACINTO03Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'MICROSO01Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'NETWORK03Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'PROGRAM01Z')
INSERT #LMMAP (MC, LM) VALUES('P10111', 'WEBDESN01Z')
INSERT #LMMAP (MC, LM) VALUES('P10112', 'GENLANG01Z')
INSERT #LMMAP (MC, LM) VALUES('P10112', 'ESLLANG01A')
INSERT #LMMAP (MC, LM) VALUES('P10112', 'ROSETTA01S')
INSERT #LMMAP (MC, LM) VALUES('P10113', 'CDNMPBK01Z')
INSERT #LMMAP (MC, LM) VALUES('P10113', 'CDNMPBK02Z')
INSERT #LMMAP (MC, LM) VALUES('P10113', 'INTMPBK01Z')
INSERT #LMMAP (MC, LM) VALUES('P10113', 'NAMMPBK01Z')
INSERT #LMMAP (MC, LM) VALUES('P10113', 'USAMPBK01Z')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'CDNMAPS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'CDNMAPS02Z')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'CDNMPBK02Z')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'INTMAPS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'TRAVGEN01A')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'TRAVUSA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'USAMAPS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10114', 'WALMAPS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10115', 'ANIMLIF01A')
INSERT #LMMAP (MC, LM) VALUES('P10115', 'PETSCAR02A')
INSERT #LMMAP (MC, LM) VALUES('P10115', 'PETSCAR03A')
INSERT #LMMAP (MC, LM) VALUES('P10116', 'REFTRAN01Z')
INSERT #LMMAP (MC, LM) VALUES('P10116', 'STDYGDE02Z')
INSERT #LMMAP (MC, LM) VALUES('P10116', 'GENREFE01A')
INSERT #LMMAP (MC, LM) VALUES('P10116', 'STDYGDE01Z')
INSERT #LMMAP (MC, LM) VALUES('P10117', 'SCIENCE01A')
INSERT #LMMAP (MC, LM) VALUES('P10120', 'GAMECOM01S')
INSERT #LMMAP (MC, LM) VALUES('P10120', 'GAMEGEN01Z')
INSERT #LMMAP (MC, LM) VALUES('P10120', 'PUZZLES01Z')
INSERT #LMMAP (MC, LM) VALUES('P10120', 'ROLPLAY01S')
INSERT #LMMAP (MC, LM) VALUES('P10121', 'HUMGENE01A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'DRAMAAA01A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'DRAMAAA02A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'DRAMAAA04T')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA01A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA02A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA03A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA04A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA06A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA07A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA08A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA09Z')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA10Z')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA11A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'MUSICAA12A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART02A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART03Z')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART04A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART06A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART08Z')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART09A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART10A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART12A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'PERFART13A')
INSERT #LMMAP (MC, LM) VALUES('P10122', 'VINYL01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORATO01Z')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORBBG01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORBKT01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORBOX01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORBSB01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORCYC01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORFTB01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORGLF01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORHKY01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPOROTH01Z')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPOROUT01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORFIS01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORRNG01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORSCR01A')
INSERT #LMMAP (MC, LM) VALUES('P10123', 'SPORTGN01A')
INSERT #LMMAP (MC, LM) VALUES('P10124', 'TRUCRIM01A')
INSERT #LMMAP (MC, LM) VALUES('P10140', 'ANTHLGY01A')
INSERT #LMMAP (MC, LM) VALUES('P10140', 'CLASFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10140', 'EROTICA01A')
INSERT #LMMAP (MC, LM) VALUES('P10140', 'FICTION01A')
INSERT #LMMAP (MC, LM) VALUES('P10140', 'FICTION03A')
INSERT #LMMAP (MC, LM) VALUES('P10140', 'FICTION04A')
INSERT #LMMAP (MC, LM) VALUES('P10141', 'LARGEPR01A')
INSERT #LMMAP (MC, LM) VALUES('P10142', 'MYSTANT01A')
INSERT #LMMAP (MC, LM) VALUES('P10142', 'MYSTGEN01A')
INSERT #LMMAP (MC, LM) VALUES('P10143', 'ROMANTH01A')
INSERT #LMMAP (MC, LM) VALUES('P10143', 'ROMGENR01A')
INSERT #LMMAP (MC, LM) VALUES('P10144', 'ROLPLAY01S')
INSERT #LMMAP (MC, LM) VALUES('P10144', 'SCFIANT01A')
INSERT #LMMAP (MC, LM) VALUES('P10144', 'SCFIANT02A')
INSERT #LMMAP (MC, LM) VALUES('P10144', 'SCFIGEN01A')
INSERT #LMMAP (MC, LM) VALUES('P10144', 'SCFIGEN02A')
INSERT #LMMAP (MC, LM) VALUES('P10144', 'SCFISER01S')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'BIOGAUD01Z')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'BUSIAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'CBCAUD01Z')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'DRAMAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'FICTAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'HEALAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'HUMOAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'NEWAAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'NFAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'RELIAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10145', 'SELFAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10146', 'ANTHLGY01A')
INSERT #LMMAP (MC, LM) VALUES('P10146', 'EROTICA01A')
INSERT #LMMAP (MC, LM) VALUES('P10146', 'FICTION01A')
INSERT #LMMAP (MC, LM) VALUES('P10146', 'FICTION03A')
INSERT #LMMAP (MC, LM) VALUES('P10146', 'FICTION04A')
INSERT #LMMAP (MC, LM) VALUES('P10147', 'MYSTANT01A')
INSERT #LMMAP (MC, LM) VALUES('P10147', 'MYSTGEN01A')
INSERT #LMMAP (MC, LM) VALUES('P10148', 'ROMANTH01A')
INSERT #LMMAP (MC, LM) VALUES('P10148', 'ROMGENR01A')
INSERT #LMMAP (MC, LM) VALUES('P10148', 'ROMSERI01S')
INSERT #LMMAP (MC, LM) VALUES('P10149', 'ROLPLAY01S')
INSERT #LMMAP (MC, LM) VALUES('P10149', 'SCFIANT01A')
INSERT #LMMAP (MC, LM) VALUES('P10149', 'SCFIANT02A')
INSERT #LMMAP (MC, LM) VALUES('P10149', 'SCFIGEN01A')
INSERT #LMMAP (MC, LM) VALUES('P10149', 'SCFIGEN02A')
INSERT #LMMAP (MC, LM) VALUES('P10149', 'SCFISER01S')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'ACTIVIT01A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'ANIMAL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'CRAFTSH01Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'CRAFTSH02A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'FAVFRND12T')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'GAMEPUZ01Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'GAMEPUZ02A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'HOLXMAS01A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'KIDSREF01A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'KIDSREF02Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'KLUTZBK01T')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'LEARNPL01A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'LEGOBKS01A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'LIFESKI03A')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'MOVIETV01Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'STDYGDE15Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'STICKER01Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'STICKER03Z')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'WORKBKS01S')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'WORKBKS02S')
INSERT #LMMAP (MC, LM) VALUES('P10150', 'AMERGRL01T')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'BATHBKS01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'BOARDBK01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'FAVFRND05T')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'FAVFRND12T')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'GROWING03Z')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'GROWING04A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'KIDSMUS01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'KIDSREF01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'LEARNPL01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'LIFESKI01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'LIFESKI02A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'NURSERY01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'POPUPSL01A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'STORYTM03A')
INSERT #LMMAP (MC, LM) VALUES('P10151', 'STORYTM17T')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'EARLYRD01A')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'EARLYRD02T')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'ERDSERI01S')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'KIDSREF01A')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'LEVELED01S')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'LEVELED02S')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'LEVELED03S')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'LIFESKI03A')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'PERFART01Z')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'SCIENCE07A')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'STORYTM06A')
INSERT #LMMAP (MC, LM) VALUES('P10152', 'VALUETP01S')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'HOLEAST01A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'HOLHALL01A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'HOLIDAY01A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'HOLJUDA01A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'HOLVALE01A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'HOLXMAS01A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'JUDAICA01A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'KLUTZBK01T')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'STORYTM03A')
INSERT #LMMAP (MC, LM) VALUES('P10153', 'STORYTM06A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'ACADEMC01Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'ACTIVIT01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'ANIMAL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'ANIMAL05Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'ANIMLIF01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'ANIMLIF04Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'DKEYEWT01T')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'GRAPHIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'HUMOAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'KIDSREF01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'KIDSREF02Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'KIDSREF03A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'KIDSREF05A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'LIFESKI04A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'NATGEOK01S')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'PEOPLE03Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'PEOPLEP01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'PEOPLEP02A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'PEOPLEP04Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'PEOPLEP05A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'PERFART01Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'RDRMISC01Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'RELIGIO01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'RELIGIO02A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SCIEJUV01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SCIEJUV02A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SCIEJUV03A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SCIEJUV04A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SCIEJUV05A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SCIENCE07A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SCIENCE08A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SPORTBK01A')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'SPORTBK02Z')
INSERT #LMMAP (MC, LM) VALUES('P10154', 'VALUETP01S')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'FAVFRND05T')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'FAVFRND12T')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'KIDS02S')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'KIDSDVD01T')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'LEVELED03S')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'LIFESKI03A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'POPUPSL01A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'PRESAUD01A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STICKER01Z')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM01A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM02A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM03A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM05A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM06A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM07A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM08A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM09A')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM11T')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'STORYTM17T')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'VALUETP01S')
INSERT #LMMAP (MC, LM) VALUES('P10155', 'VALUETP01Z')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'FICTION01A')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'GRAPHIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'LIFESKI04A')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'TEENFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'TEENFIC02T')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'TEENLIF03A')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'TEENFIC02A')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'TEENFIC03S')
INSERT #LMMAP (MC, LM) VALUES('P10156', 'TEENLIF04A')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'AMERGRL01T')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'LITTBKS01P')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'YRDCSCD01A')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'YRDFICT01A')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'YRDFICT02A')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'YRDFICT03T')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'YRDSERI01S')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'YRDFICT03S')
INSERT #LMMAP (MC, LM) VALUES('P10157', 'YRDFICT04A')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'CLASSRM01Z')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'CLASSRM02Z')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'CLASSRM04Z')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'KIDSREF01A')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'KIDSREF02Z')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'PTRGEN04Z')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'PTRGENE01A')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'SCIEJUV01A')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'SCIEJUV03A')
INSERT #LMMAP (MC, LM) VALUES('P10158', 'STDYGDE15Z')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'CHILDWB01A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'CHILDWB02A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'CHILDWB03A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'CHILDWB04A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'CHILDWB05A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'CHILDWB06A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PARENTI01A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PARENTI02A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PARENTI03A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PARENTI05A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PARENTI06A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PARENTI07A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PREGNAN01A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PREGNAN02A')
INSERT #LMMAP (MC, LM) VALUES('P10159', 'PREGNAN03A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'BEAUTGR01A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'GIFTBKS01P')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'LIFESTY01A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'LIFESTY02A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'LIFESTY03A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'LIFESTY04A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'LIFESTY05A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'LIFESTY10Z')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'FASHION01A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'FASHION02A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'FASHION03A')
INSERT #LMMAP (MC, LM) VALUES('P10168', 'FASHION04A')
INSERT #LMMAP (MC, LM) VALUES('P10169', 'ANTCOL01A')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'ARTHIST01A')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'ARCHITE02Z')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'ARTISTS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'ARTISTS02Z')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'ARTISTS03Z')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'COLLECT01A')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'GRAPDS01A')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'ARCH01A')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'COLOUR01A')
INSERT #LMMAP (MC, LM) VALUES('P10170', 'PAINT01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'BAKING01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'BEVERAG01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'BEVERAG03A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'BEVERAG04A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'BEVERAG05Z')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'BEVERAG02A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'CASSER01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'CHEESE01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'CHEFRES01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'COOKING03A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'CUISINE01Z')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'DESSERT01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'DIET01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'ENTERTA01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'FRUITVE01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'GRAINS01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'GRILL01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'MEAT01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'PRESERV01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'REFEREN01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'SERIESC01S')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'SLOW01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'SOUP01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'SPECFDI01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'TOOLS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'VEGETAR01A')
INSERT #LMMAP (MC, LM) VALUES('P10171', 'WRITE01A')
INSERT #LMMAP (MC, LM) VALUES('P10172', 'CRAFT01A')
INSERT #LMMAP (MC, LM) VALUES('P10172', 'PAPER01A')
INSERT #LMMAP (MC, LM) VALUES('P10172', 'KNITSEW01A')
INSERT #LMMAP (MC, LM) VALUES('P10172', 'WOOD01A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'FLOWERG01A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'GARDDES01A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'GARDDES03A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'GARDREF01A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'INDOORG04A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'SPECIAL04A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'SPECIAL06A')
INSERT #LMMAP (MC, LM) VALUES('P10173', 'SPECIAL12A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'AGINGAN01A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'ALTERNA01A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'ALTERNA03A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'SELFHEL09A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'TOXIN01A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'DIETNUT01A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'DIETNUT03A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'EXCERFT01A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'EXCERFT02A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'SELFHEL01A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'SELFHEL02A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'SELFHEL03A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'SELFHEL04A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'SEXUALI01A')
INSERT #LMMAP (MC, LM) VALUES('P10174', 'MEDITAT01A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECPROJ01A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECPROJ02A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECPROJ05A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECPROJ06A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECPROJ11A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECSTYL01A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECSTYL02A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'DECSTYL03A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'GREEN13Z')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES01A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES02A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES03A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES04A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES05A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES06A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES08A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES11Z')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOMEDES12A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOUSKEE01A')
INSERT #LMMAP (MC, LM) VALUES('P10175', 'HOUSKEE02A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'ASTROLY01A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'ASTROLY02S')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'CONKNOW01A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'CONKNOW02A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'DIVINAT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'NAGEOCC01A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'NAGEOCC02A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'NAGEOCC03A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'NAGEOCC04A')
INSERT #LMMAP (MC, LM) VALUES('P10176', 'NAGEOCC05A')
INSERT #LMMAP (MC, LM) VALUES('P10177', 'PHOTO01A')
INSERT #LMMAP (MC, LM) VALUES('P10177', 'PHOTCOL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10177', 'PHOTCOL02A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'ADHD01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'PSYCH01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'ABUSE0A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'ADDICT01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'BRAIN01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'CANCER01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'DEPRES01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'DIABET01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'AILMDIS09A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'GASTRO01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'HEART01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'STRESS01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'SLEEP01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'AILMDIS16A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'AILMDIS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'MEDLREF01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'MEDLREF03A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'MENHEAL01A')
INSERT #LMMAP (MC, LM) VALUES('P10178', 'WOMHEAL01A')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVCAN01A')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVCAN02Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVCAN03Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVCAN06Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVCAN07Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVCAN08Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVGEN01A')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT02Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT03Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT04Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT05Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT06Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT08Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT09Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT10Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVINT11Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVLIT01A')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVUSA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10179', 'TRAVUSA02Z')
INSERT #LMMAP (MC, LM) VALUES('P10180', 'LITTBKS01P')
INSERT #LMMAP (MC, LM) VALUES('P10180', 'MINIKIT01P')
INSERT #LMMAP (MC, LM) VALUES('P10181', 'MANGAEN01S')
INSERT #LMMAP (MC, LM) VALUES('P10182', 'GRAPHIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10182', 'GRAPLIT01A')
INSERT #LMMAP (MC, LM) VALUES('P10182', 'GRAPNOV01S')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ARAFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ARAKIDS06A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ARANFIT02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI03A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI04A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI05A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI06A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI07A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ATLANTI08A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'BRITCOL01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'BRITCOL02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'BRITCOL03A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'BRITCOL04A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CDNPICT01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CHICOOK05A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CHIFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CHIKIDS06A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CHINFIT02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CHIREL03A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CHITEEN08A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'CHIWELLB07')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ITACOOK05A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ITAFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ITAKIDS06A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ITANFIT02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ITARELG03A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'LIAMZSP01Z')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'LOAUFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'LOAUKID01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'LOAUTNF01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'LOCLINT01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'NORTHER01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ONTARIO01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ONTARIO02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ONTARIO03A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ONTARIO04A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ONTARIO05A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ONTARIO06A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'ONTARIO07A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE03A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE04A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE05A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE06A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE07A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE08A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'PRAIRIE09A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'QUEBECC01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'QUEBECC02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPABIO04A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPAFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPAKIDS06A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPANFIT02A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPANISH01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPAREL03A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPATEEN08A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'SPAWELB07A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'WESTERN01A')
INSERT #LMMAP (MC, LM) VALUES('P10185', 'WESTERN02A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'ATLANTI02A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'ATLANTI04A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'ATLANTI05A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'ATLANTI07A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'BRITCOL01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'BRITCOL02A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'BRITCOL03A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'CDNPICT01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'CHINFIT02A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'LOAUFIC01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'LOAUKID01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'LOAUTNF01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'LOCLINT01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'NORTHER01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'ONTARIO03A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'ONTARIO04A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'ONTARIO07A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE02A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE03A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE04A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE05A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE06A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE08A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'PRAIRIE09A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'WESTERN01A')
INSERT #LMMAP (MC, LM) VALUES('P10198', 'WESTERN02A')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARBB2501Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARCREA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARGAME01Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARGG2501Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARHIST01Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARHIST02Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARHTWW01Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARLVW01Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARNFRB01Z')
INSERT #LMMAP (MC, LM) VALUES('P10201', 'BARPROM01Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARFICT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARFICT02Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARFICT04Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARGG1001Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARGG2501Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARMYST01Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARRBST01Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARSCIF01Z')
INSERT #LMMAP (MC, LM) VALUES('P10204', 'BARTEEN02Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARFAVF01Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARHOLI01Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARKIDS02Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARKIDS05Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARKIDS06Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARKIDS07Z')
INSERT #LMMAP (MC, LM) VALUES('P10205', 'BARKIDS08Z')
INSERT #LMMAP (MC, LM) VALUES('P10206', 'BARBB2501Z')
INSERT #LMMAP (MC, LM) VALUES('P10206', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10206', 'BARFOOD01Z')
INSERT #LMMAP (MC, LM) VALUES('P10206', 'BARFOOD02Z')
INSERT #LMMAP (MC, LM) VALUES('P10206', 'BARGG2501Z')
INSERT #LMMAP (MC, LM) VALUES('P10206', 'BARHEAL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10206', 'BARLVWL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARCREA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARGG2501Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARHIST01Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARHIST02Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARHTWW01Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARLVWL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10208', 'BARPROM01Z')
INSERT #LMMAP (MC, LM) VALUES('P10211', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10211', 'BARFICT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10211', 'BARFICT02Z')
INSERT #LMMAP (MC, LM) VALUES('P10211', 'BARGG2501Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARFAVF01Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARHOLI01Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARKIDS02Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARKIDS05Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARKIDS06Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARKIDS07Z')
INSERT #LMMAP (MC, LM) VALUES('P10212', 'BARKIDS08Z')
INSERT #LMMAP (MC, LM) VALUES('P10213', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10213', 'BARCREA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10213', 'BARFOOD01Z')
INSERT #LMMAP (MC, LM) VALUES('P10213', 'BARFOOD02Z')
INSERT #LMMAP (MC, LM) VALUES('P10213', 'BARGG250Z')
INSERT #LMMAP (MC, LM) VALUES('P10213', 'BARLVWL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10219', 'COLOUR01A')
INSERT #LMMAP (MC, LM) VALUES('P10299', 'BARCLEA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10600', 'BIOGRAP01Z')
INSERT #LMMAP (MC, LM) VALUES('P10600', 'BIOGRAP02Z')
INSERT #LMMAP (MC, LM) VALUES('P10600', 'BIOGRAP03A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOIR01Z')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOIR02Z')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOIR04Z')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOIR05Z')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOIR06Z')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOIR07Z')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOQC01A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'HISTOQC02A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'PHILOSO01A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'RELIDIV01A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'RELIGIO03A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'RELIGIO04A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'RELIGIO05A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'RELIGIO06A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'SCPOLIT01A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'SOCIOLO01A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'SOCIOLO02A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'SOCIOLO03A')
INSERT #LMMAP (MC, LM) VALUES('P10601', 'SOCIOLO04A')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'ANGLAIS01Z')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'BILINGU01A')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'FRANCAI01Z')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'LANGETR01Z')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'LANGETR02Z')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'LANGETR03Z')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'LANGETR04Z')
INSERT #LMMAP (MC, LM) VALUES('P10610', 'LANGETR05Z')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'AFFAIRE01A')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'AFFAIRE02A')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'ECONOMI01A')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'INFORMA03Z')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'INFORMA09Z')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'INFORMG01Z')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'INFORMG02Z')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'INTERNE01A')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'JURIDIQ01Z')
INSERT #LMMAP (MC, LM) VALUES('P10611', 'REFFRNC01A')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'ARTZZZZZ06Z')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'ARCHIFR01A')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'ARTSPEC01Z')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'ARTZZZZ01Z')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'ARTZZZZ02Z')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'ARTZZZZ03Z')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'ARTZZZZ04Z')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'CINEMAZ01A')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'MUSIQUE01A')
INSERT #LMMAP (MC, LM) VALUES('P10620', 'PHOTOGR01A')
INSERT #LMMAP (MC, LM) VALUES('P10621', 'BRICOLA02Z')
INSERT #LMMAP (MC, LM) VALUES('P10621', 'BRICOLA03Z')
INSERT #LMMAP (MC, LM) VALUES('P10621', 'JARDEXT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10621', 'JARDINT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10621', 'JEUXZZZ01Z')
INSERT #LMMAP (MC, LM) VALUES('P10621', 'PASSETE01Z')
INSERT #LMMAP (MC, LM) VALUES('P10621', 'TRAVAIG01Z')
INSERT #LMMAP (MC, LM) VALUES('P10622', 'ENVIRON01A')
INSERT #LMMAP (MC, LM) VALUES('P10622', 'SCIEFRN01A')
INSERT #LMMAP (MC, LM) VALUES('P10622', 'VIEANIM01Z')
INSERT #LMMAP (MC, LM) VALUES('P10622', 'VIEANIM02Z')
INSERT #LMMAP (MC, LM) VALUES('P10622', 'VIEANIM03Z')
INSERT #LMMAP (MC, LM) VALUES('P10622', 'VIEANIM04Z')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'AUDIOLI01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'EROTIQU01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'ESSLITT01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'GDCARAC01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'POESIEZ01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'ROMANES01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'ROMANGF01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'ROMANPO01A')
INSERT #LMMAP (MC, LM) VALUES('P10630', 'THEATRE01A')
INSERT #LMMAP (MC, LM) VALUES('P10631', 'LITTQGF01A')
INSERT #LMMAP (MC, LM) VALUES('P10631', 'LITTQPO01A')
INSERT #LMMAP (MC, LM) VALUES('P10632', 'ROMPOLI01A')
INSERT #LMMAP (MC, LM) VALUES('P10632', 'ROMPOLI02A')
INSERT #LMMAP (MC, LM) VALUES('P10633', 'EPOUVAN01A')
INSERT #LMMAP (MC, LM) VALUES('P10633', 'FANTASI01A')
INSERT #LMMAP (MC, LM) VALUES('P10633', 'FANTASI02S')
INSERT #LMMAP (MC, LM) VALUES('P10633', 'SCIFICT01A')
INSERT #LMMAP (MC, LM) VALUES('P10633', 'SCIFICT02S')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT02Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT03Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT04Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT05A')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT09A')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT10Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT15Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'ACTIVIT16Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'SAISONN01Z')
INSERT #LMMAP (MC, LM) VALUES('P10640', 'SAISONN02Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN01Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN02Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN03Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN04Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN05Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN06Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN07Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN08Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN09Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN11Z')
INSERT #LMMAP (MC, LM) VALUES('P10641', 'REFJEUN14A')
INSERT #LMMAP (MC, LM) VALUES('P10642', 'PTENFAN01A')
INSERT #LMMAP (MC, LM) VALUES('P10642', 'PTENFAN02A')
INSERT #LMMAP (MC, LM) VALUES('P10642', 'PTENFAN03A')
INSERT #LMMAP (MC, LM) VALUES('P10642', 'PTENFAN04S')
INSERT #LMMAP (MC, LM) VALUES('P10642', 'PTENFAN05Z')
INSERT #LMMAP (MC, LM) VALUES('P10643', 'PRESCOL01A')
INSERT #LMMAP (MC, LM) VALUES('P10643', 'PRESCOL05Z')
INSERT #LMMAP (MC, LM) VALUES('P10643', 'PRESCOL07A')
INSERT #LMMAP (MC, LM) VALUES('P10643', 'PRESCOL08A')
INSERT #LMMAP (MC, LM) VALUES('P10643', 'PRESCOL09S')
INSERT #LMMAP (MC, LM) VALUES('P10644', 'FRIMMER01A')
INSERT #LMMAP (MC, LM) VALUES('P10644', 'PRLECTU01A')
INSERT #LMMAP (MC, LM) VALUES('P10644', 'PRLECTU03A')
INSERT #LMMAP (MC, LM) VALUES('P10644', 'PRLECTU04A')
INSERT #LMMAP (MC, LM) VALUES('P10644', 'PRLECTU05S')
INSERT #LMMAP (MC, LM) VALUES('P10645', 'FRIMMER02A')
INSERT #LMMAP (MC, LM) VALUES('P10645', 'JEUNLEC01A')
INSERT #LMMAP (MC, LM) VALUES('P10645', 'JEUNLEC02S')
INSERT #LMMAP (MC, LM) VALUES('P10645', 'JEUNLEC03A')
INSERT #LMMAP (MC, LM) VALUES('P10645', 'JEUNLEC04A')
INSERT #LMMAP (MC, LM) VALUES('P10646', 'ADOLESC01A')
INSERT #LMMAP (MC, LM) VALUES('P10646', 'ADOLESC02S')
INSERT #LMMAP (MC, LM) VALUES('P10646', 'ADOLESC03A')
INSERT #LMMAP (MC, LM) VALUES('P10646', 'ADOLESC04A')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'BANDESS01S')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'BANDESS02S')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'BANDESS03A')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'BANDESS04A')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'HUMOURZ01A')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'MANGASZ01S')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'MANGASZ02S')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'MANGASZ03A')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'BANDESS05A')
INSERT #LMMAP (MC, LM) VALUES('P10647', 'MANGASZ04A')
INSERT #LMMAP (MC, LM) VALUES('P10650', 'ARTSDIV01A')
INSERT #LMMAP (MC, LM) VALUES('P10650', 'ARTSDIV02A')
INSERT #LMMAP (MC, LM) VALUES('P10650', 'ARTSDIV04Z')
INSERT #LMMAP (MC, LM) VALUES('P10650', 'ARTSDIV05A')
INSERT #LMMAP (MC, LM) VALUES('P10650', 'ARTSDIV07A')
INSERT #LMMAP (MC, LM) VALUES('P10650', 'ARTSDIV08A')
INSERT #LMMAP (MC, LM) VALUES('P10650', 'NOUVAGE01A')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI01Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI02Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI05Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'BOISSON01Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'BOISSON02Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'BOISSON04Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'COFFRET01Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'CUISINT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'CUISINT02Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'CUISINT03Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'CUISINT06Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'CUISINT10Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'CUISINT17Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI04Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI06Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI07Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI08Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI09Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI10Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI11Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI12Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI13Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI14Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI15Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI16Z')
INSERT #LMMAP (MC, LM) VALUES('P10651', 'ARTCULI17Z')
INSERT #LMMAP (MC, LM) VALUES('P10652', 'AUDIOLI02A')
INSERT #LMMAP (MC, LM) VALUES('P10652', 'PSYCHOL01A')
INSERT #LMMAP (MC, LM) VALUES('P10652', 'PSYCHOL02A')
INSERT #LMMAP (MC, LM) VALUES('P10652', 'PSYCHOL03A')
INSERT #LMMAP (MC, LM) VALUES('P10652', 'PSYCHOL04A')
INSERT #LMMAP (MC, LM) VALUES('P10652', 'SEXUALT01A')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'ENTRPHY04Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'FORMEPH02Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'FORMEPH03Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'MALADIE01Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'MATERNI01Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'PUERICU02A')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'SANTEZZ01A')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'SANTEZZ02Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'SPORTSZ01Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'SPORTSZ02Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'SPORTSZ04Z')
INSERT #LMMAP (MC, LM) VALUES('P10653', 'SPORTSZ07Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURATL01Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURCAN01Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURCAN03Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT01Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT02Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT04Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT05Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT06Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT08Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT09Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURINT11Z')
INSERT #LMMAP (MC, LM) VALUES('P10654', 'TOURISM01Z')
INSERT #LMMAP (MC, LM) VALUES('P10660', 'SOLDESA01Z')
INSERT #LMMAP (MC, LM) VALUES('P10660', 'SOLDESJ01Z')
INSERT #LMMAP (MC, LM) VALUES('P10670', 'PAPETER01S')
INSERT #LMMAP (MC, LM) VALUES('P10670', 'PAPETER02S')
INSERT #LMMAP (MC, LM) VALUES('P10670', 'PAPETER03S')
INSERT #LMMAP (MC, LM) VALUES('P10670', 'PAPETER04S')
INSERT #LMMAP (MC, LM) VALUES('P10670', 'PAPETER05S')
INSERT #LMMAP (MC, LM) VALUES('P10670', 'PAPETER06S')

DELETE #LMMAP WHERE LTRIM(RTRIM(LM)) = ''

------------
INSERT	#refRetailTaxonomy
(
    NodeId,
    MCLM,
    Description
)
SELECT	r.NodeId.ToString() + CAST(ROW_NUMBER() OVER (PARTITION BY map.MC ORDER BY map.LM) AS VARCHAR) + '/'
,	map.MC + '-' + map.LM
,	map.MC + '-' + map.LM
FROM	#LMMAP map
JOIN	#refRetailTaxonomy AS r ON map.mc = r.MCLM;

------------

DELETE	dst
FROM	[dbo].[refRetailTaxonomy] dst
	LEFT JOIN [#refRetailTaxonomy] src ON dst.[NodeId] = src.[NodeId]
WHERE	src.[NodeId] IS NULL;

UPDATE	dst
SET	[MCLM] = src.[MCLM]
,	[Description] = src.[Description]
FROM	[dbo].[refRetailTaxonomy] dst
JOIN	[#refRetailTaxonomy] src ON dst.[NodeId] = src.[NodeId]
WHERE	(src.[MCLM] IS NULL AND dst.[MCLM] IS NOT NULL) OR (src.[MCLM] IS NOT NULL AND dst.[MCLM] IS NULL) OR src.[MCLM] <> dst.[MCLM]
OR	(src.[Description] IS NULL AND dst.[Description] IS NOT NULL) OR (src.[Description] IS NOT NULL AND dst.[Description] IS NULL) OR src.[Description] <> dst.[Description];


INSERT	[dbo].[refRetailTaxonomy] (
	[NodeId], [MCLM], [Description]
)
SELECT	src.[NodeId], src.[MCLM], src.[Description]
FROM	[#refRetailTaxonomy] src
	LEFT JOIN [dbo].[refRetailTaxonomy] dst ON dst.[NodeId] = src.[NodeId]
WHERE	dst.[NodeId] IS NULL;
