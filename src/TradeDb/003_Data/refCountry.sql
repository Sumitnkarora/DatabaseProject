IF OBJECT_ID('tempdb..[#refcountry]') IS NOT NULL DROP TABLE [#refcountry];

CREATE TABLE [#refCountry]  
(   
	[CountryName] varchar(100) NULL  , 
	[CountryCode] varchar(2) NOT NULL  , 
	[Display] bit NULL  
);

INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Andorra', 'AD', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('United Arab Emirates', 'AE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Afghanistan', 'AF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Antigua And Barbuda', 'AG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Anguilla', 'AI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Albania', 'AL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Armenia', 'AM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Netherlands Antilles', 'AN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Angola', 'AO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Antarctica', 'AQ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Argentina', 'AR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('American Samoa', 'AS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Austria', 'AT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Australia', 'AU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Aruba', 'AW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Åland Islands', 'AX', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Azerbaijan', 'AZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bosnia And Herzegovina', 'BA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Barbados', 'BB', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bangladesh', 'BD', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Belgium', 'BE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Burkina Faso', 'BF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bulgaria', 'BG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bahrain', 'BH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Burundi', 'BI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Benin', 'BJ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saint Barthélemy', 'BL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bermuda', 'BM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Brunei Darussalam', 'BN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bolivia', 'BO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Brazil', 'BR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bahamas', 'BS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bhutan', 'BT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Bouvet Island', 'BV', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Botswana', 'BW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Belarus', 'BY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Belize', 'BZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Canada', 'CA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cocos (Keeling) Islands', 'CC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Congo, DR', 'CD', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Central African Republic', 'CF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Congo', 'CG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Switzerland', 'CH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Côte D''ivoire', 'CI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cook Islands', 'CK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Chile', 'CL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cameroon', 'CM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('China', 'CN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Colombia', 'CO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Costa Rica', 'CR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cuba', 'CU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cape Verde', 'CV', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Christmas Island', 'CX', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cyprus', 'CY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Czech Republic', 'CZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Germany', 'DE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Djibouti', 'DJ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Denmark', 'DK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Dominica', 'DM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Dominican Republic', 'DO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Algeria', 'DZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Ecuador', 'EC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Estonia', 'EE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Egypt', 'EG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Western Sahara', 'EH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Eritrea', 'ER', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Spain', 'ES', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Ethiopia', 'ET', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Finland', 'FI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Fiji', 'FJ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Falkland Islands (Malvinas)', 'FK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Micronesia, Federated States Of', 'FM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Faroe Islands', 'FO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('France', 'FR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Gabon', 'GA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('United Kingdom', 'GB', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Grenada', 'GD', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Georgia', 'GE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('French Guiana', 'GF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Guernsey', 'GG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Ghana', 'GH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Gibraltar', 'GI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Greenland', 'GL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Gambia', 'GM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Guinea', 'GN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Guadeloupe', 'GP', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Equatorial Guinea', 'GQ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Greece', 'GR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('South Georgia And The South Sandwich Islands', 'GS', 0);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Guatemala', 'GT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Guam', 'GU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Guinea-Bissau', 'GW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Guyana', 'GY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Hong Kong', 'HK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Heard Island And Mcdonald Islands', 'HM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Honduras', 'HN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Croatia', 'HR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Haiti', 'HT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Hungary', 'HU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Indonesia', 'ID', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Ireland', 'IE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Israel', 'IL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Isle Of Man', 'IM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('India', 'IN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('British Indian Ocean Territory', 'IO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Iraq', 'IQ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Iran, Islamic Republic Of', 'IR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Iceland', 'IS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Italy', 'IT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Jersey', 'JE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Jamaica', 'JM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Jordan', 'JO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Japan', 'JP', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Kenya', 'KE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Kyrgyzstan', 'KG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cambodia', 'KH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Kiribati', 'KI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Comoros', 'KM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saint Kitts And Nevis', 'KN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Korea, DPR', 'KP', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Korea, Republic Of', 'KR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Kuwait', 'KW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Cayman Islands', 'KY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Kazakhstan', 'KZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Lao People''s Democratic Republic', 'LA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Lebanon', 'LB', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saint Lucia', 'LC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Liechtenstein', 'LI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Sri Lanka', 'LK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Liberia', 'LR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Lesotho', 'LS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Lithuania', 'LT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Luxembourg', 'LU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Latvia', 'LV', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Libyan Arab Jamahiriya', 'LY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Morocco', 'MA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Monaco', 'MC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Moldova, Republic Of', 'MD', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Montenegro', 'ME', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saint Martin', 'MF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Madagascar', 'MG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Marshall Islands', 'MH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Macedonia', 'MK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Mali', 'ML', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Myanmar', 'MM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Mongolia', 'MN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Macao', 'MO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Northern Mariana Islands', 'MP', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Martinique', 'MQ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Mauritania', 'MR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Montserrat', 'MS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Malta', 'MT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Mauritius', 'MU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Maldives', 'MV', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Malawi', 'MW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Mexico', 'MX', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Malaysia', 'MY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Mozambique', 'MZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Namibia', 'NA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('New Caledonia', 'NC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Niger', 'NE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Norfolk Island', 'NF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Nigeria', 'NG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Nicaragua', 'NI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Netherlands', 'NL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Norway', 'NO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Nepal', 'NP', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Nauru', 'NR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Niue', 'NU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('New Zealand', 'NZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Oman', 'OM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Panama', 'PA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Peru', 'PE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('French Polynesia', 'PF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Papua New Guinea', 'PG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Philippines', 'PH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Pakistan', 'PK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Poland', 'PL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saint Pierre And Miquelon', 'PM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Pitcairn', 'PN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Puerto Rico', 'PR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Palestinian Territory, Occupied', 'PS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Portugal', 'PT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Palau', 'PW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Paraguay', 'PY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Qatar', 'QA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Reunion', 'RE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Romania', 'RO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Serbia', 'RS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Russian Federation', 'RU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Rwanda', 'RW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saudi Arabia', 'SA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Solomon Islands', 'SB', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Seychelles', 'SC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Sudan', 'SD', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Sweden', 'SE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Singapore', 'SG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saint Helena', 'SH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Slovenia', 'SI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Svalbard And Jan Mayen', 'SJ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Slovakia', 'SK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Sierra Leone', 'SL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('San Marino', 'SM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Senegal', 'SN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Somalia', 'SO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('SuriCountryName', 'SR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Sao Tome And Principe', 'ST', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('El Salvador', 'SV', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Syrian Arab Republic', 'SY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Swaziland', 'SZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Turks And Caicos Islands', 'TC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Chad', 'TD', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('French Southern Territories', 'TF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Togo', 'TG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Thailand', 'TH', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Tajikistan', 'TJ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Tokelau', 'TK', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Timor-Leste', 'TL', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Turkmenistan', 'TM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Tunisia', 'TN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Tonga', 'TO', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Turkey', 'TR', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Trinidad And Tobago', 'TT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Tuvalu', 'TV', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Taiwan, Province Of China', 'TW', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Tanzania, United Republic Of', 'TZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Ukraine', 'UA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Uganda', 'UG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('US Minor Outlying Islands', 'UM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('United States', 'US', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Uruguay', 'UY', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Uzbekistan', 'UZ', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Holy See (Vatican City State)', 'VA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Saint Vincent And The Grenadines', 'VC', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Venezuela', 'VE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Virgin Islands, British', 'VG', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Virgin Islands, U.S.', 'VI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Viet Nam', 'VN', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Vanuatu', 'VU', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Wallis And Futuna', 'WF', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Samoa', 'WS', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Yemen', 'YE', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Kosovo', 'YI', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Mayotte', 'YT', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('South Africa', 'ZA', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Zambia', 'ZM', 1);
INSERT [#refCountry]([CountryName], [CountryCode], [Display]) VALUES('Zimbabwe', 'ZW', 1);

DELETE dst  
FROM [dbo].[refcountry] dst   
	LEFT JOIN [#refcountry] src ON dst.[CountryCode] = src.[CountryCode]  
WHERE src.[CountryCode] IS NULL;    

UPDATE dst  
SET [CountryName] = src.[CountryName]  , 
	[Display] = src.[Display]  
FROM [dbo].[refcountry] dst  
	JOIN [#refcountry] src ON dst.[CountryCode] = src.[CountryCode]  
WHERE	(src.[CountryName] IS NULL AND dst.[CountryName] IS NOT NULL) OR
		(src.[CountryName] IS NOT NULL AND dst.[CountryName] IS NULL) OR 
		src.[CountryName] <> dst.[CountryName]  OR 
		(src.[Display] IS NULL AND dst.[Display] IS NOT NULL) OR 
		(src.[Display] IS NOT NULL AND dst.[Display] IS NULL) OR 
		src.[Display] <> dst.[Display];   
		
INSERT [dbo].[refcountry] (   
	[CountryName], [CountryCode], [Display]  
)  
SELECT src.[CountryName], src.[CountryCode], src.[Display]  
FROM [#refcountry] src   
	LEFT JOIN [dbo].[refcountry] dst ON dst.[CountryCode] = src.[CountryCode]  
WHERE dst.[CountryCode] IS NULL;    
