-- CREATES INITIAL DATABASE WITH TABLES VERSION 1.0
-- should at least work with sqlite3 and mysql!

CREATE TABLE buddy_chatMessages (
    idBuddy VARCHAR( 20 ),
    idIncoming VARCHAR( 20 ),
    message TEXT,
    dateSend Date,
    PRIMARY KEY( idBuddy, idIncoming )
 );

--idBuddy,idIncoming,message,dateSend from buddy_chatMessages
--firstName,lastName,email,idPreferredCountryFirst,idPreferredCountrySecond,idPreferredCountryThird,idStudy,tandem,preferredInfoEvening,buddyBefore,authHash,locked,dateAvailable,dateAdded) 



CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(13) NOT NULL auto_increment, --TODO: sequence
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
);

--INSERT INTO `accounts` (`id`, `vorname`, `nachname`, `email`, `username`, `PASSWORD`) VALUES
--(560, 'Example', 'Example', '', 'example', anadminpasswordhereplease);

CREATE TABLE IF NOT EXISTS `buddy_buddy` (
  `id` integer primary key autoincrement,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `idPreferredCountryFirst` int(13) NOT NULL,
  `idPreferredCountrySecond` int(13) NOT NULL,
  `idPreferredCountryThird` int(13) NOT NULL,
  `idStudy` int(13) NOT NULL,
  `idGroup` int(13) default NULL,
  `tandem` int(13) NOT NULL,
  `preferredInfoEvening` int(13) NOT NULL,
  `buddyBefore` int(13) NOT NULL,
  `authHash` varchar(255) NOT NULL,
  `locked` int(13) NOT NULL,
  `dateAdded` timestamp NULL default '0000-00-00 00:00:00',
  `dateLogin` datetime default NULL,
  `dateAvailable` datetime NOT NULL,
  `mailed` int(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS `buddy_chatMessages` (
  `id` int(13) NOT NULL auto_increment,
  `idGroup` int(13) NOT NULL COMMENT 'id of buddy_group table',
  `message` text collate utf8_bin,
  `idBuddy` int(13) NOT NULL COMMENT 'id of buddy_buddy - sender',
  `idIncoming` int(13) NOT NULL,
  `dateSend` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
);


CREATE TABLE IF NOT EXISTS `buddy_incoming` (
  `id` int(13) NOT NULL, -- auto_increment,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255)  NOT NULL,
  `email` varchar(255) NOT NULL,
  `idNationality` int(13) NOT NULL,
  `preferredLanguage` int(13) NOT NULL,
  `dateArrival` datetime NOT NULL,
  `dateAdded` timestamp NOT NULL,
  `idStudy` int(13) NOT NULL,
  `authHash` varchar(255) NOT NULL,
  `locked` int(11) NOT NULL,
  `dateLogin` datetime NOT NULL,
  `idGroup` int(13) NOT NULL,
  `mailed` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `buddy_nationality` (
  `id` int(5) NOT NULL, -- auto_increment,
  `iso2` varchar(2) default NULL,
  `short_name` varchar(80) NOT NULL default '',
  `long_name` varchar(80)  NOT NULL default '',
  `iso3` varchar(3) default NULL,
  `numcode` smallint(6) default NULL,
  `un_member` varchar(12) default NULL,
  PRIMARY KEY  (`id`)
);

INSERT INTO `buddy_nationality` (`id`, `iso2`, `short_name`, `long_name`, `iso3`, `numcode`, `un_member`) VALUES
--(1, 'AF', 'Afghanistan', 'Islamic Republic of Afghanistan', 'AFG', 4, 'yes'),
--(2, 'AL', 'Albania', 'Republic of Albania', 'ALB', 8, 'yes'),
--(3, 'DZ', 'Algeria', 'People''s Democratic Republic of Algeria', 'DZA', 12, 'yes'),
--(4, 'AS', 'American Samoa', 'American Samoa', 'ASM', 16, 'no'),
--(5, 'AD', 'Andorra', 'Principality of Andorra', 'AND', 20, 'yes'),
(6, 'AO', 'Angola', 'Republic of Angola', 'AGO', 24, 'yes'),
--(7, 'AI', 'Anguilla', 'Anguilla', 'AIA', 660, 'no'),
--(8, 'AQ', 'Antarctica', 'Antarctica', NULL, NULL, 'no'),
--(9, 'AG', 'Antigua and Barbuda', 'Antigua and Barbuda', 'ATG', 28, 'yes'),
--(10, 'AR', 'Argentina', 'Argentine Republic', 'ARG', 32, 'yes'),
--(11, 'AM', 'Armenia', 'Republic of Armenia', 'ARM', 51, 'yes'),
--(12, 'AW', 'Aruba', 'Aruba', 'ABW', 533, 'no'),
--(13, 'AU', 'Australia', 'Commonwealth of Australia', 'AUS', 36, 'yes'),
(14, 'AT', 'Austria', 'Republic of Austria', 'AUT', 40, 'yes'),
--(15, 'AZ', 'Azerbaijan', 'Republic of Azerbaijan', 'AZE', 31, 'yes'),
--(16, 'BS', 'Bahamas', 'Commonwealth of The Bahamas', 'BHS', 44, 'yes'),
--(17, 'BH', 'Bahrain', 'Kingdom of Bahrain', 'BHR', 48, 'yes'),
--(18, 'BD', 'Bangladesh', 'People''s Republic of Bangladesh', 'BGD', 50, 'yes'),
--(19, 'BB', 'Barbados', 'Barbados', 'BRB', 52, 'yes'),
--(20, 'BY', 'Belarus', 'Republic of Belarus', 'BLR', 112, 'yes'),
--(21, 'BE', 'Belgium', 'Kingdom of Belgium', 'BEL', 56, 'yes'),
--(22, 'BZ', 'Belize', 'Belize', 'BLZ', 84, 'yes'),
--(23, 'BJ', 'Benin', 'Republic of Benin', 'BEN', 204, 'yes'),
--(24, 'BM', 'Bermuda', 'Bermuda Islands', 'BMU', 60, 'no'),
--(25, 'BT', 'Bhutan', 'Kingdom of Bhutan', 'BTN', 64, 'yes'),
--(26, 'BO', 'Bolivia', 'Plurinational State of Bolivia', 'BOL', 68, 'yes'),
--(27, 'BA', 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'BIH', 70, 'yes'),
--(28, 'BW', 'Botswana', 'Republic of Botswana', 'BWA', 72, 'yes'),
--(29, 'BV', 'Bouvet Island', 'Bouvet Island', 'BVT', 74, 'no'),
--(30, 'BR', 'Brazil', 'Federative Republic of Brazil', 'BRA', 76, 'yes'),
--(31, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'IOT', 86, 'no'),
--(32, 'BN', 'Brunei', 'State of Brunei Darussalam', 'BRN', 96, 'yes'),
--(33, 'BG', 'Bulgaria', 'Republic of Bulgaria', 'BGR', 100, 'yes'),
--(34, 'BF', 'Burkina Faso', 'Burkina Faso', 'BFA', 854, 'yes'),
--(35, 'BI', 'Burundi', 'Republic of Burundi', 'BDI', 108, 'yes'),
--(36, 'KH', 'Cambodia', 'Kingdom of Cambodia', 'KHM', 116, 'yes'),
--(37, 'CM', 'Cameroon', 'Republic of Cameroon', 'CMR', 120, 'yes'),
--(38, 'CA', 'Canada', 'Canada', 'CAN', 124, 'yes'),
--(39, 'CV', 'Cape Verde', 'Republic of Cape Verde', 'CPV', 132, 'yes'),
--(40, 'KY', 'Cayman Islands', 'The Cayman Islands', 'CYM', 136, 'no'),
--(41, 'CF', 'Central African Republic', 'Central African Republic', 'CAF', 140, 'yes'),
--(42, 'TD', 'Chad', 'Republic of Chad', 'TCD', 148, 'yes'),
--(43, 'CL', 'Chile', 'Republic of Chile', 'CHL', 152, 'yes'),
--(44, 'CN', 'China', 'People''s Republic of China', 'CHN', 156, 'yes'),
--(45, 'CX', 'Christmas Island', 'Christmas Island', 'CXR', 162, 'no'),
--(46, 'CC', 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'CCK', 166, 'no'),
--(47, 'CO', 'Colombia', 'Republic of Colombia', 'COL', 170, 'yes'),
--(48, 'KM', 'Comoros', 'Union of the Comoros', 'COM', 174, 'yes'),
--(49, 'CG', 'Congo', 'Republic of the Congo', 'COG', 178, 'yes'),
--(50, 'CD', 'Democratic Republic of the Congo', 'Democratic Republic of the Congo', 'COD', 180, 'yes'),
--(51, 'CK', 'Cook Islands', 'Cook Islands', 'COK', 184, 'no'),
--(52, 'CR', 'Costa Rica', 'Republic of Costa Rica', 'CRI', 188, 'yes'),
--(53, 'CI', 'Cote d''ivoire', 'C&ocirc;te D''Ivoire', 'CIV', 384, 'yes'),
--(54, 'HR', 'Croatia', 'Republic of Croatia', 'HRV', 191, 'yes'),
(55, 'CU', 'Cuba', 'Republic of Cuba', 'CUB', 192, 'yes'),
--(56, 'CY', 'Cyprus', 'Republic of Cyprus', 'CYP', 196, 'yes'),
--(57, 'CZ', 'Czech Republic', 'Czech Republic', 'CZE', 203, 'yes'),
--(58, 'DK', 'Denmark', 'Kingdom of Denmark', 'DNK', 208, 'yes'),
--(59, 'DJ', 'Djibouti', 'Republic of Djibouti', 'DJI', 262, 'yes'),
--(60, 'DM', 'Dominica', 'Commonwealth of Dominica', 'DMA', 212, 'yes'),
--(61, 'DO', 'Dominican Republic', 'Dominican Republic', 'DOM', 214, 'yes'),
--(62, 'EC', 'Ecuador', 'Republic of Ecuador', 'ECU', 218, 'yes'),
--(63, 'EG', 'Egypt', 'Arab Republic of Egypt', 'EGY', 818, 'yes'),
--(64, 'SV', 'El Salvador', 'Republic of El Salvador', 'SLV', 222, 'yes'),
--(65, 'GQ', 'Equatorial Guinea', 'Republic of Equatorial Guinea', 'GNQ', 226, 'yes'),
--(66, 'ER', 'Eritrea', 'State of Eritrea', 'ERI', 232, 'yes'),
--(67, 'EE', 'Estonia', 'Republic of Estonia', 'EST', 233, 'yes'),
--(68, 'ET', 'Ethiopia', 'Federal Democratic Republic of Ethiopia', 'ETH', 231, 'yes'),
--(69, 'FK', 'Falkland Islands (Malvinas)', 'The Falkland Islands (Malvinas)', 'FLK', 238, 'no'),
--(70, 'FO', 'Faroe Islands', 'The Faroe Islands', 'FRO', 234, 'no'),
--(71, 'FJ', 'Fiji', 'Republic of the Fiji Islands', 'FJI', 242, 'yes'),
--(72, 'FI', 'Finland', 'Republic of Finland', 'FIN', 246, 'yes'),
(73, 'FR', 'France', 'French Republic', 'FRA', 250, 'yes'),
--(74, 'GF', 'French Guiana', 'French Guiana', 'GUF', 254, 'no'),
--(75, 'PF', 'French Polynesia', 'French Polynesia', 'PYF', 258, 'no'),
--(76, 'TF', 'French Southern Territories', 'French Southern Territories', 'ATF', 260, 'no'),
--(77, 'GA', 'Gabon', 'Gabonese Republic', 'GAB', 266, 'yes'),
--(78, 'GM', 'Gambia', 'Republic of The Gambia', 'GMB', 270, 'yes'),
--(79, 'GE', 'Georgia', 'Georgia', 'GEO', 268, 'yes'),
--(80, 'DE', 'Germany', 'Federal Republic of Germany', 'DEU', 276, 'yes'),
--(81, 'GH', 'Ghana', 'Republic of Ghana', 'GHA', 288, 'yes'),
--(82, 'GI', 'Gibraltar', 'Gibraltar', 'GIB', 292, 'no'),
(83, 'GR', 'Greece', 'Hellenic Republic', 'GRC', 300, 'yes'),
--(84, 'GL', 'Greenland', 'Greenland', 'GRL', 304, 'no'),
--(85, 'GD', 'Grenada', 'Grenada', 'GRD', 308, 'yes'),
--(86, 'GP', 'Guadaloupe', 'Guadeloupe', 'GLP', 312, 'no'),
--(87, 'GU', 'Guam', 'Guam', 'GUM', 316, 'no'),
(88, 'GT', 'Guatemala', 'Republic of Guatemala', 'GTM', 320, 'yes'),
--(89, 'GN', 'Guinea', 'Republic of Guinea', 'GIN', 324, 'yes'),
--(90, 'GW', 'Guinea-Bissau', 'Republic of Guinea-Bissau', 'GNB', 624, 'yes'),
--(91, 'GY', 'Guyana', 'Co-operative Republic of Guyana', 'GUY', 328, 'yes'),
--(92, 'HT', 'Haiti', 'Republic of Haiti', 'HTI', 332, 'yes'),
--(93, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', 'HMD', 334, 'no'),
(94, 'VA', 'Vatican City', 'State of the Vatican City', 'VAT', 336, 'no'),
--(95, 'HN', 'Honduras', 'Republic of Honduras', 'HND', 340, 'yes'),
--(96, 'HK', 'Hong Kong', 'Hong Kong', 'HKG', 344, 'no'),
--(97, 'HU', 'Hungary', 'Republic of Hungary', 'HUN', 348, 'yes'),
--(98, 'IS', 'Iceland', 'Republic of Iceland', 'ISL', 352, 'yes'),
--(99, 'IN', 'India', 'Republic of India', 'IND', 356, 'yes'),
--(100, 'ID', 'Indonesia', 'Republic of Indonesia', 'IDN', 360, 'yes'),
--(101, 'IR', 'Iran', 'Islamic Republic of Iran', 'IRN', 364, 'yes'),
--(102, 'IQ', 'Iraq', 'Republic of Iraq', 'IRQ', 368, 'yes'),
--(103, 'IE', 'Ireland', 'Ireland', 'IRL', 372, 'yes'),
--(104, 'IL', 'Israel', 'State of Israel', 'ISR', 376, 'yes'),
--(105, 'IT', 'Italy', 'Italian Republic', 'ITA', 380, 'yes'),
--(106, 'JM', 'Jamaica', 'Jamaica', 'JAM', 388, 'yes'),
(107, 'JP', 'Japan', 'Japan', 'JPN', 392, 'yes'),
--(108, 'JO', 'Jordan', 'Hashemite Kingdom of Jordan', 'JOR', 400, 'yes'),
--(109, 'KZ', 'Kazakhstan', 'Republic of Kazakhstan', 'KAZ', 398, 'yes'),
--(110, 'KE', 'Kenya', 'Republic of Kenya', 'KEN', 404, 'yes'),
--(111, 'KI', 'Kiribati', 'Republic of Kiribati', 'KIR', 296, 'yes'),
--(112, 'KP', 'North Korea', 'Democratic People''s Republic of Korea', 'PRK', 408, 'yes'),
--(113, 'KR', 'South Korea', 'Republic of Korea', 'KOR', 410, 'yes'),
--(114, 'KW', 'Kuwait', 'State of Kuwait', 'KWT', 414, 'yes'),
--(115, 'KG', 'Kyrgyzstan', 'Kyrgyz Republic', 'KGZ', 417, 'yes'),
--(116, 'LA', 'Laos', 'Lao People''s Democratic Republic', 'LAO', 418, 'yes'),
--(117, 'LV', 'Latvia', 'Republic of Latvia', 'LVA', 428, 'yes'),
--(118, 'LB', 'Lebanon', 'Republic of Lebanon', 'LBN', 422, 'yes'),
--(119, 'LS', 'Lesotho', 'Kingdom of Lesotho', 'LSO', 426, 'yes'),
--(120, 'LR', 'Liberia', 'Republic of Liberia', 'LBR', 430, 'yes'),
--(121, 'LY', 'Libya', 'Socialist People''s Libyan Arab Great Jamahiriya', 'LBY', 434, 'yes'),
--(122, 'LI', 'Liechtenstein', 'Principality of Liechtenstein', 'LIE', 438, 'yes'),
--(123, 'LT', 'Lithuania', 'Republic of Lithuania', 'LTU', 440, 'yes'),
--(124, 'LU', 'Luxembourg', 'Grand Duchy of Luxembourg', 'LUX', 442, 'yes'),
--(125, 'MO', 'Macao', 'The Macao Special Administrative Region', 'MAC', 446, 'no'),
--(126, 'MK', 'Macedonia', 'The Former Yugoslav Republic of Macedonia', 'MKD', 807, 'yes'),
--(127, 'MG', 'Madagascar', 'Republic of Madagascar', 'MDG', 450, 'yes'),
--(128, 'MW', 'Malawi', 'Republic of Malawi', 'MWI', 454, 'yes'),
--(129, 'MY', 'Malaysia', 'Malaysia', 'MYS', 458, 'yes'),
--(130, 'MV', 'Maldives', 'Republic of Maldives', 'MDV', 462, 'yes'),
--(131, 'ML', 'Mali', 'Republic of Mali', 'MLI', 466, 'yes'),
--(132, 'MT', 'Malta', 'Republic of Malta', 'MLT', 470, 'yes'),
--(133, 'MH', 'Marshall Islands', 'Republic of the Marshall Islands', 'MHL', 584, 'yes'),
--(134, 'MQ', 'Martinique', 'Martinique', 'MTQ', 474, 'no'),
--(135, 'MR', 'Mauritania', 'Islamic Republic of Mauritania', 'MRT', 478, 'yes'),
--(136, 'MU', 'Mauritius', 'Republic of Mauritius', 'MUS', 480, 'yes'),
--(137, 'YT', 'Mayotte', 'Mayotte', 'MYT', 175, 'no'),
--(138, 'MX', 'Mexico', 'United Mexican States', 'MEX', 484, 'yes'),
--(139, 'FM', 'Micronesia', 'Federated States of Micronesia', 'FSM', 583, 'yes'),
--(140, 'MD', 'Moldava', 'Republic of Moldova', 'MDA', 498, 'yes'),
--(141, 'MC', 'Monaco', 'Principality of Monaco', 'MCO', 492, 'yes'),
--(142, 'MN', 'Mongolia', 'Mongolia', 'MNG', 496, 'yes'),
--(143, 'ME', 'Montenegro', 'Montenegro', 'MNE', 499, 'yes'),
--(144, 'MS', 'Montserrat', 'Montserrat', 'MSR', 500, 'no'),
--(145, 'MA', 'Morocco', 'Kingdom of Morocco', 'MAR', 504, 'yes'),
--(146, 'MZ', 'Mozambique', 'Republic of Mozambique', 'MOZ', 508, 'yes'),
--(147, 'MM', 'Myanmar', 'Myanmar', 'MMR', 104, 'yes'),
--(148, 'NA', 'Namibia', 'Republic of Namibia', 'NAM', 516, 'yes'),
--(149, 'NR', 'Nauru', 'Republic of Nauru', 'NRU', 520, 'yes'),
--(150, 'NP', 'Nepal', 'Federal Democratic Republic of Nepal', 'NPL', 524, 'yes'),
(151, 'NL', 'Netherlands', 'Kingdom of the Netherlands', 'NLD', 528, 'yes'),
--(152, 'AN', 'Netherlands Antilles', 'Netherlands Antilles', 'ANT', 530, 'no'),
--(153, 'NC', 'New Caledonia', 'New Caledonia', 'NCL', 540, 'no'),
--(154, 'NZ', 'New Zealand', 'New Zealand', 'NZL', 554, 'yes'),
--(155, 'NI', 'Nicaragua', 'Republic of Nicaragua', 'NIC', 558, 'yes'),
--(156, 'NE', 'Niger', 'Republic of Niger', 'NER', 562, 'yes'),
--(157, 'NG', 'Nigeria', 'Federal Republic of Nigeria', 'NGA', 566, 'yes'),
--(158, 'NU', 'Niue', 'Niue', 'NIU', 570, 'no'),
--(159, 'NF', 'Norfolk Island', 'Norfolk Island', 'NFK', 574, 'no'),
--(160, 'MP', 'Northern Mariana Islands', 'Northern Mariana Islands', 'MNP', 580, 'no'),
--(161, 'NO', 'Norway', 'Kingdom of Norway', 'NOR', 578, 'yes'),
--(162, 'OM', 'Oman', 'Sultanate of Oman', 'OMN', 512, 'yes'),
--(163, 'PK', 'Pakistan', 'Islamic Republic of Pakistan', 'PAK', 586, 'yes'),
--(164, 'PW', 'Palau', 'Republic of Palau', 'PLW', 585, 'yes'),
--(165, 'PS', 'Palestinian Territory', 'Occupied Palestinian Territory', 'PSE', 275, 'no'),
--(166, 'PA', 'Panama', 'Republic of Panama', 'PAN', 591, 'yes'),
--(167, 'PG', 'Papua New Guinea', 'Independent State of Papua New Guinea', 'PNG', 598, 'yes'),
--(168, 'PY', 'Paraguay', 'Republic of Paraguay', 'PRY', 600, 'yes'),
--(169, 'PE', 'Peru', 'Republic of Peru', 'PER', 604, 'yes'),
--(170, 'PH', 'Phillipines', 'Republic of the Philippines', 'PHL', 608, 'yes'),
--(171, 'PN', 'Pitcairn', 'Pitcairn, Henderson, Ducie, and Oeno Islands', 'PCN', 612, 'no'),
--(172, 'PL', 'Poland', 'Republic of Poland', 'POL', 616, 'yes'),
--(173, 'PT', 'Portugal', 'Portuguese Republic', 'PRT', 620, 'yes'),
--(174, 'PR', 'Puerto Rico', 'Commonwealth of Puerto Rico', 'PRI', 630, 'no'),
--(175, 'QA', 'Qatar', 'State of Qatar', 'QAT', 634, 'yes'),
--(176, 'RE', 'Reunion', 'R&eacute;union', 'REU', 638, 'no'),
--(177, 'RO', 'Romania', 'Romania', 'ROM', 642, 'yes'),
--(178, 'RU', 'Russia', 'Russian Federation', 'RUS', 643, 'yes'),
--(179, 'RW', 'Rwanda', 'Republic of Rwanda', 'RWA', 646, 'yes'),
--(180, 'SH', 'Saint Helena', 'Saint Helena', 'SHN', 654, 'no'),
--(181, 'KN', 'Saint Kitts and Nevis', 'Federation of Saint Christopher and Nevis', 'KNA', 659, 'yes'),
--(182, 'LC', 'Saint Lucia', 'Saint Lucia', 'LCA', 662, 'yes'),
--(183, 'PM', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'SPM', 666, 'no'),
--(184, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'VCT', 670, 'yes'),
--(185, 'WS', 'Samoa', 'Independent State of Samoa', 'WSM', 882, 'yes'),
--(186, 'SM', 'San Marino', 'Republic of San Marino', 'SMR', 674, 'yes'),
--(187, 'ST', 'Sao Tome and Principe', 'Democratic Republic of S&auml;o Tom&eacute; and Principe', 'STP', 678, 'yes'),
--(188, 'SA', 'Saudi Arabia', 'Kingdom of Saudi Arabia', 'SAU', 682, 'yes'),
--(189, 'SN', 'Senegal', 'Republic of Senegal', 'SEN', 686, 'yes'),
--(190, 'RS', 'Serbia', 'Republic of Serbia', 'SRB', 688, 'yes'),
--(191, 'SC', 'Seychelles', 'Republic of Seychelles', 'SYC', 690, 'yes'),
--(192, 'SL', 'Sierra Leone', 'Republic of Sierra Leone', 'SLE', 694, 'yes'),
--(193, 'SG', 'Singapore', 'Republic of Singapore', 'SGP', 702, 'yes'),
--(194, 'SK', 'Slovakia', 'Slovak Republic', 'SVK', 703, 'yes'),
(195, 'SI', 'Slovenia', 'Republic of Slovenia', 'SVN', 705, 'yes'),
--(196, 'SB', 'Solomon Islands', 'Solomon Islands', 'SLB', 90, 'yes'),
--(197, 'SO', 'Somalia', 'Federal Republic of Somalia', 'SOM', 706, 'yes'),
--(198, 'ZA', 'South Africa', 'Republic of South Africa', 'ZAF', 710, 'yes'),
--(199, 'GS', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'SGS', 239, 'no'),
--(200, 'ES', 'Spain', 'Kingdom of Spain', 'ESP', 724, 'yes'),
--(201, 'LK', 'Sri Lanka', 'Democratic Socialist Republic of Sri Lanka', 'LKA', 144, 'yes'),
--(202, 'SD', 'Sudan', 'Republic of the Sudan', 'SDN', 736, 'yes'),
--(203, 'SR', 'Suriname', 'Republic of Suriname', 'SUR', 740, 'yes'),
--(204, 'SJ', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'SJM', 744, 'no'),
--(205, 'SZ', 'Swaziland', 'Kingdom of Swaziland', 'SWZ', 748, 'yes'),
--(206, 'SE', 'Sweden', 'Kingdom of Sweden', 'SWE', 752, 'yes'),
--(207, 'CH', 'Switzerland', 'Swiss Confederation', 'CHE', 756, 'yes'),
--(208, 'SY', 'Syria', 'Syrian Arab Republic', 'SYR', 760, 'yes'),
--(209, 'TW', 'Taiwan', 'Taiwan, Province of China', 'TWN', 158, 'no'),
--(210, 'TJ', 'Tajikistan', 'Republic of Tajikistan', 'TJK', 762, 'yes'),
--(211, 'TZ', 'Tanzania', 'United Republic of Tanzania', 'TZA', 834, 'no'),
--(212, 'TH', 'Thailand', 'Kingdom of Thailand', 'THA', 764, 'yes'),
--(213, 'TL', 'Timor-Leste', 'Democratic Republic of Timor-Leste', 'TLS', 626, 'yes'),
--(214, 'TG', 'Togo', 'Togolese Republic', 'TGO', 768, 'yes'),
--(215, 'TK', 'Tokelau', 'Tokelau', 'TKL', 772, 'no'),
--(216, 'TO', 'Tonga', 'Kingdom of Tonga', 'TON', 776, 'yes'),
--(217, 'TT', 'Trinidad and Tobago', 'Republic of Trinidad and Tobago', 'TTO', 780, 'yes'),
--(218, 'TN', 'Tunisia', 'Republic of Tunisia', 'TUN', 788, 'yes'),
--(219, 'TR', 'Turkey', 'Republic of Turkey', 'TUR', 792, 'yes'),
--(220, 'TM', 'Turkmenistan', 'Turkmenistan', 'TKM', 795, 'yes'),
--(221, 'TC', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'TCA', 796, 'no'),
--(222, 'TV', 'Tuvalu', 'Tuvalu', 'TUV', 798, 'yes'),
--(223, 'UG', 'Uganda', 'Republic of Uganda', 'UGA', 800, 'yes'),
--(224, 'UA', 'Ukraine', 'Ukraine', 'UKR', 804, 'yes'),
--(225, 'AE', 'United Arab Emirates', 'United Arab Emirates', 'ARE', 784, 'yes'),
--(226, 'GB', 'United Kingdom', 'United Kingdom of Great Britain and Nothern Ireland', 'GBR', 826, 'yes'),
--(227, 'US', 'United States', 'United States of America', 'USA', 840, 'yes'),
--(228, 'UM', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 'UMI', 581, 'no'),
--(229, 'UY', 'Uruguay', 'Eastern Republic of Uruguay', 'URY', 858, 'yes'),
--(230, 'UZ', 'Uzbekistan', 'Republic of Uzbekistan', 'UZB', 860, 'yes'),
--(231, 'VU', 'Vanuatu', 'Republic of Vanuatu', 'VUT', 548, 'yes'),
--(232, 'VE', 'Venezuela', 'Bolivarian Republic of Venezuela', 'VEN', 862, 'yes'),
--(233, 'VN', 'Vietnam', 'Socialist Republic of Vietnam', 'VNM', 704, 'yes'),
--(234, 'VG', 'Virgin Islands, British', 'Virgin Islands, British', 'VGB', 92, 'no'),
--(235, 'VI', 'Virgin Islands, US', 'Virgin Islands, U.s.', 'VIR', 850, 'no'),
--(236, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'WLF', 876, 'no'),
--(237, 'EH', 'Western Sahara', 'Western Sahara', 'ESH', 732, 'no'),
--(239, 'ZM', 'Zambia', 'Republic of Zambia', 'ZMB', 894, 'yes'),
--(240, 'ZW', 'Zimbabwe', 'Republic of Zimbabwe', 'ZWE', 716, 'yes'),
--(241, 'AX', 'Aland Islands', '&Aring;land Islands', 'ALA', 248, 'no'),
--(242, 'IM', 'Isle of Man', 'Isle of Man', 'IMN', 833, 'no'),
--(243, 'JE', 'Jersey', 'The Bailiwick of Jersey', 'JEY', 832, 'no'),
--(244, 'BL', 'Saint Barthelemy', 'Saint Barth&eacute;lemy', 'BLM', 652, 'no'),
--(245, 'MF', 'Saint Martin', 'Saint Martin', 'MAF', 663, 'no'),
(246, NULL, 'unspecified', 'unspecified', NULL, NULL, NULL);

CREATE TABLE IF NOT EXISTS `buddy_study` (
  `id` int(13) NOT NULL, --auto increment
  `study` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
);

INSERT INTO `buddy_study` (`id`, `study`) VALUES
(1, 'Holy Crap (Heiliges)'),
(2, 'Some Useless Bachelor (Publizistik)'),
(3, 'Technical Sociology (Technische Soziologie)'),
(4, 'Cooking Sciences (Kochkunst)'),
(5, 'Jedi Master (Jedimeister)'),
(6, 'Sexual Engineering (Kunststudium)'),
(7, 'Mental Masturbation (Technische Mathematik)'),
(8, 'Professional *ssholedom (Jus)');