-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2020 at 02:38 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marasielodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `name`, `value`, `domain`, `created_at`, `updated_at`) VALUES
(6, 'receive-noti-4new-users', '0', NULL, NULL, '2019-12-09 13:14:03'),
(7, 'notifications-show-limit', '9', NULL, '2019-12-10 15:33:31', '2019-12-20 08:29:47'),
(10, 'new-user-welcome-email', '1', NULL, '2019-12-10 15:38:22', '2019-12-10 15:38:22'),
(11, 'drivers_welcome_message', 'Hi @[name],\r\nWelcome to Marasiel App. We’re thrilled to see you here!\r\n[br]\r\nOur team will contact you as soon as possible taking you to the next step.\r\n[br]\r\nYou can also find more of our guides here to learn more about Marasiel App.', NULL, '2019-12-20 11:59:39', '2019-12-21 09:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `iso` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nicename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numcode` int(11) NOT NULL,
  `phonecode` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `numcode`, `phonecode`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 4, 93, NULL, NULL),
(2, 'AL', 'ALBANIA', 'Albania', 8, 355, NULL, NULL),
(3, 'DZ', 'ALGERIA', 'Algeria', 12, 213, NULL, NULL),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 16, 1684, NULL, NULL),
(5, 'AD', 'ANDORRA', 'Andorra', 20, 376, NULL, NULL),
(6, 'AO', 'ANGOLA', 'Angola', 24, 244, NULL, NULL),
(7, 'AI', 'ANGUILLA', 'Anguilla', 660, 1264, NULL, NULL),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', 0, 0, NULL, NULL),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 28, 1268, NULL, NULL),
(10, 'AR', 'ARGENTINA', 'Argentina', 32, 54, NULL, NULL),
(11, 'AM', 'ARMENIA', 'Armenia', 51, 374, NULL, NULL),
(12, 'AW', 'ARUBA', 'Aruba', 533, 297, NULL, NULL),
(13, 'AU', 'AUSTRALIA', 'Australia', 36, 61, NULL, NULL),
(14, 'AT', 'AUSTRIA', 'Austria', 40, 43, NULL, NULL),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 31, 994, NULL, NULL),
(16, 'BS', 'BAHAMAS', 'Bahamas', 44, 1242, NULL, NULL),
(17, 'BH', 'BAHRAIN', 'Bahrain', 48, 973, NULL, NULL),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 50, 880, NULL, NULL),
(19, 'BB', 'BARBADOS', 'Barbados', 52, 1246, NULL, NULL),
(20, 'BY', 'BELARUS', 'Belarus', 112, 375, NULL, NULL),
(21, 'BE', 'BELGIUM', 'Belgium', 56, 32, NULL, NULL),
(22, 'BZ', 'BELIZE', 'Belize', 84, 501, NULL, NULL),
(23, 'BJ', 'BENIN', 'Benin', 204, 229, NULL, NULL),
(24, 'BM', 'BERMUDA', 'Bermuda', 60, 1441, NULL, NULL),
(25, 'BT', 'BHUTAN', 'Bhutan', 64, 975, NULL, NULL),
(26, 'BO', 'BOLIVIA', 'Bolivia', 68, 591, NULL, NULL),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 70, 387, NULL, NULL),
(28, 'BW', 'BOTSWANA', 'Botswana', 72, 267, NULL, NULL),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', 0, 0, NULL, NULL),
(30, 'BR', 'BRAZIL', 'Brazil', 76, 55, NULL, NULL),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 0, 246, NULL, NULL),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 96, 673, NULL, NULL),
(33, 'BG', 'BULGARIA', 'Bulgaria', 100, 359, NULL, NULL),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 854, 226, NULL, NULL),
(35, 'BI', 'BURUNDI', 'Burundi', 108, 257, NULL, NULL),
(36, 'KH', 'CAMBODIA', 'Cambodia', 116, 855, NULL, NULL),
(37, 'CM', 'CAMEROON', 'Cameroon', 120, 237, NULL, NULL),
(38, 'CA', 'CANADA', 'Canada', 124, 1, NULL, NULL),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 132, 238, NULL, NULL),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 136, 1345, NULL, NULL),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 140, 236, NULL, NULL),
(42, 'TD', 'CHAD', 'Chad', 148, 235, NULL, NULL),
(43, 'CL', 'CHILE', 'Chile', 152, 56, NULL, NULL),
(44, 'CN', 'CHINA', 'China', 156, 86, NULL, NULL),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 0, 61, NULL, NULL),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 0, 672, NULL, NULL),
(47, 'CO', 'COLOMBIA', 'Colombia', 170, 57, NULL, NULL),
(48, 'KM', 'COMOROS', 'Comoros', 174, 269, NULL, NULL),
(49, 'CG', 'CONGO', 'Congo', 178, 242, NULL, NULL),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 180, 242, NULL, NULL),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 184, 682, NULL, NULL),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 188, 506, NULL, NULL),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 384, 225, NULL, NULL),
(54, 'HR', 'CROATIA', 'Croatia', 191, 385, NULL, NULL),
(55, 'CU', 'CUBA', 'Cuba', 192, 53, NULL, NULL),
(56, 'CY', 'CYPRUS', 'Cyprus', 196, 357, NULL, NULL),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 203, 420, NULL, NULL),
(58, 'DK', 'DENMARK', 'Denmark', 208, 45, NULL, NULL),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 262, 253, NULL, NULL),
(60, 'DM', 'DOMINICA', 'Dominica', 212, 1767, NULL, NULL),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 214, 1809, NULL, NULL),
(62, 'EC', 'ECUADOR', 'Ecuador', 218, 593, NULL, NULL),
(63, 'EG', 'EGYPT', 'Egypt', 818, 20, NULL, NULL),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 222, 503, NULL, NULL),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 226, 240, NULL, NULL),
(66, 'ER', 'ERITREA', 'Eritrea', 232, 291, NULL, NULL),
(67, 'EE', 'ESTONIA', 'Estonia', 233, 372, NULL, NULL),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 231, 251, NULL, NULL),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 238, 500, NULL, NULL),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 234, 298, NULL, NULL),
(71, 'FJ', 'FIJI', 'Fiji', 242, 679, NULL, NULL),
(72, 'FI', 'FINLAND', 'Finland', 246, 358, NULL, NULL),
(73, 'FR', 'FRANCE', 'France', 250, 33, NULL, NULL),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 254, 594, NULL, NULL),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 258, 689, NULL, NULL),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', 0, 0, NULL, NULL),
(77, 'GA', 'GABON', 'Gabon', 266, 241, NULL, NULL),
(78, 'GM', 'GAMBIA', 'Gambia', 270, 220, NULL, NULL),
(79, 'GE', 'GEORGIA', 'Georgia', 268, 995, NULL, NULL),
(80, 'DE', 'GERMANY', 'Germany', 276, 49, NULL, NULL),
(81, 'GH', 'GHANA', 'Ghana', 288, 233, NULL, NULL),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 292, 350, NULL, NULL),
(83, 'GR', 'GREECE', 'Greece', 300, 30, NULL, NULL),
(84, 'GL', 'GREENLAND', 'Greenland', 304, 299, NULL, NULL),
(85, 'GD', 'GRENADA', 'Grenada', 308, 1473, NULL, NULL),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 312, 590, NULL, NULL),
(87, 'GU', 'GUAM', 'Guam', 316, 1671, NULL, NULL),
(88, 'GT', 'GUATEMALA', 'Guatemala', 320, 502, NULL, NULL),
(89, 'GN', 'GUINEA', 'Guinea', 324, 224, NULL, NULL),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 624, 245, NULL, NULL),
(91, 'GY', 'GUYANA', 'Guyana', 328, 592, NULL, NULL),
(92, 'HT', 'HAITI', 'Haiti', 332, 509, NULL, NULL),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', 0, 0, NULL, NULL),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 336, 39, NULL, NULL),
(95, 'HN', 'HONDURAS', 'Honduras', 340, 504, NULL, NULL),
(96, 'HK', 'HONG KONG', 'Hong Kong', 344, 852, NULL, NULL),
(97, 'HU', 'HUNGARY', 'Hungary', 348, 36, NULL, NULL),
(98, 'IS', 'ICELAND', 'Iceland', 352, 354, NULL, NULL),
(99, 'IN', 'INDIA', 'India', 356, 91, NULL, NULL),
(100, 'ID', 'INDONESIA', 'Indonesia', 360, 62, NULL, NULL),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 364, 98, NULL, NULL),
(102, 'IQ', 'IRAQ', 'Iraq', 368, 964, NULL, NULL),
(103, 'IE', 'IRELAND', 'Ireland', 372, 353, NULL, NULL),
(104, 'IL', 'ISRAEL', 'Israel', 376, 972, NULL, NULL),
(105, 'IT', 'ITALY', 'Italy', 380, 39, NULL, NULL),
(106, 'JM', 'JAMAICA', 'Jamaica', 388, 1876, NULL, NULL),
(107, 'JP', 'JAPAN', 'Japan', 392, 81, NULL, NULL),
(108, 'JO', 'JORDAN', 'Jordan', 400, 962, NULL, NULL),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 398, 7, NULL, NULL),
(110, 'KE', 'KENYA', 'Kenya', 404, 254, NULL, NULL),
(111, 'KI', 'KIRIBATI', 'Kiribati', 296, 686, NULL, NULL),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 408, 850, NULL, NULL),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 410, 82, NULL, NULL),
(114, 'KW', 'KUWAIT', 'Kuwait', 414, 965, NULL, NULL),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 417, 996, NULL, NULL),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 418, 856, NULL, NULL),
(117, 'LV', 'LATVIA', 'Latvia', 428, 371, NULL, NULL),
(118, 'LB', 'LEBANON', 'Lebanon', 422, 961, NULL, NULL),
(119, 'LS', 'LESOTHO', 'Lesotho', 426, 266, NULL, NULL),
(120, 'LR', 'LIBERIA', 'Liberia', 430, 231, NULL, NULL),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 434, 218, NULL, NULL),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 438, 423, NULL, NULL),
(123, 'LT', 'LITHUANIA', 'Lithuania', 440, 370, NULL, NULL),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 442, 352, NULL, NULL),
(125, 'MO', 'MACAO', 'Macao', 446, 853, NULL, NULL),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 807, 389, NULL, NULL),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 450, 261, NULL, NULL),
(128, 'MW', 'MALAWI', 'Malawi', 454, 265, NULL, NULL),
(129, 'MY', 'MALAYSIA', 'Malaysia', 458, 60, NULL, NULL),
(130, 'MV', 'MALDIVES', 'Maldives', 462, 960, NULL, NULL),
(131, 'ML', 'MALI', 'Mali', 466, 223, NULL, NULL),
(132, 'MT', 'MALTA', 'Malta', 470, 356, NULL, NULL),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 584, 692, NULL, NULL),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 474, 596, NULL, NULL),
(135, 'MR', 'MAURITANIA', 'Mauritania', 478, 222, NULL, NULL),
(136, 'MU', 'MAURITIUS', 'Mauritius', 480, 230, NULL, NULL),
(137, 'YT', 'MAYOTTE', 'Mayotte', 0, 269, NULL, NULL),
(138, 'MX', 'MEXICO', 'Mexico', 484, 52, NULL, NULL),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 583, 691, NULL, NULL),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 498, 373, NULL, NULL),
(141, 'MC', 'MONACO', 'Monaco', 492, 377, NULL, NULL),
(142, 'MN', 'MONGOLIA', 'Mongolia', 496, 976, NULL, NULL),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 500, 1664, NULL, NULL),
(144, 'MA', 'MOROCCO', 'Morocco', 504, 212, NULL, NULL),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 508, 258, NULL, NULL),
(146, 'MM', 'MYANMAR', 'Myanmar', 104, 95, NULL, NULL),
(147, 'NA', 'NAMIBIA', 'Namibia', 516, 264, NULL, NULL),
(148, 'NR', 'NAURU', 'Nauru', 520, 674, NULL, NULL),
(149, 'NP', 'NEPAL', 'Nepal', 524, 977, NULL, NULL),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 528, 31, NULL, NULL),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 530, 599, NULL, NULL),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 540, 687, NULL, NULL),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 554, 64, NULL, NULL),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 558, 505, NULL, NULL),
(155, 'NE', 'NIGER', 'Niger', 562, 227, NULL, NULL),
(156, 'NG', 'NIGERIA', 'Nigeria', 566, 234, NULL, NULL),
(157, 'NU', 'NIUE', 'Niue', 570, 683, NULL, NULL),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 574, 672, NULL, NULL),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 580, 1670, NULL, NULL),
(160, 'NO', 'NORWAY', 'Norway', 578, 47, NULL, NULL),
(161, 'OM', 'OMAN', 'Oman', 512, 968, NULL, NULL),
(162, 'PK', 'PAKISTAN', 'Pakistan', 586, 92, NULL, NULL),
(163, 'PW', 'PALAU', 'Palau', 585, 680, NULL, NULL),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', 0, 970, NULL, NULL),
(165, 'PA', 'PANAMA', 'Panama', 591, 507, NULL, NULL),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 598, 675, NULL, NULL),
(167, 'PY', 'PARAGUAY', 'Paraguay', 600, 595, NULL, NULL),
(168, 'PE', 'PERU', 'Peru', 604, 51, NULL, NULL),
(169, 'PH', 'PHILIPPINES', 'Philippines', 608, 63, NULL, NULL),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 612, 0, NULL, NULL),
(171, 'PL', 'POLAND', 'Poland', 616, 48, NULL, NULL),
(172, 'PT', 'PORTUGAL', 'Portugal', 620, 351, NULL, NULL),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 630, 1787, NULL, NULL),
(174, 'QA', 'QATAR', 'Qatar', 634, 974, NULL, NULL),
(175, 'RE', 'REUNION', 'Reunion', 638, 262, NULL, NULL),
(176, 'RO', 'ROMANIA', 'Romania', 642, 40, NULL, NULL),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 643, 70, NULL, NULL),
(178, 'RW', 'RWANDA', 'Rwanda', 646, 250, NULL, NULL),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 654, 290, NULL, NULL),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 659, 1869, NULL, NULL),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 662, 1758, NULL, NULL),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 666, 508, NULL, NULL),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 670, 1784, NULL, NULL),
(184, 'WS', 'SAMOA', 'Samoa', 882, 684, NULL, NULL),
(185, 'SM', 'SAN MARINO', 'San Marino', 674, 378, NULL, NULL),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 678, 239, NULL, NULL),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 682, 966, NULL, NULL),
(188, 'SN', 'SENEGAL', 'Senegal', 686, 221, NULL, NULL),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', 0, 381, NULL, NULL),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 690, 248, NULL, NULL),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 694, 232, NULL, NULL),
(192, 'SG', 'SINGAPORE', 'Singapore', 702, 65, NULL, NULL),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 703, 421, NULL, NULL),
(194, 'SI', 'SLOVENIA', 'Slovenia', 705, 386, NULL, NULL),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 90, 677, NULL, NULL),
(196, 'SO', 'SOMALIA', 'Somalia', 706, 252, NULL, NULL),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 710, 27, NULL, NULL),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', 0, 0, NULL, NULL),
(199, 'ES', 'SPAIN', 'Spain', 724, 34, NULL, NULL),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 144, 94, NULL, NULL),
(201, 'SD', 'SUDAN', 'Sudan', 736, 249, NULL, NULL),
(202, 'SR', 'SURINAME', 'Suriname', 740, 597, NULL, NULL),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 744, 47, NULL, NULL),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 748, 268, NULL, NULL),
(205, 'SE', 'SWEDEN', 'Sweden', 752, 46, NULL, NULL),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 756, 41, NULL, NULL),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 760, 963, NULL, NULL),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 158, 886, NULL, NULL),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 762, 992, NULL, NULL),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 834, 255, NULL, NULL),
(211, 'TH', 'THAILAND', 'Thailand', 764, 66, NULL, NULL),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', 0, 670, NULL, NULL),
(213, 'TG', 'TOGO', 'Togo', 768, 228, NULL, NULL),
(214, 'TK', 'TOKELAU', 'Tokelau', 772, 690, NULL, NULL),
(215, 'TO', 'TONGA', 'Tonga', 776, 676, NULL, NULL),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 780, 1868, NULL, NULL),
(217, 'TN', 'TUNISIA', 'Tunisia', 788, 216, NULL, NULL),
(218, 'TR', 'TURKEY', 'Turkey', 792, 90, NULL, NULL),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 795, 7370, NULL, NULL),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 796, 1649, NULL, NULL),
(221, 'TV', 'TUVALU', 'Tuvalu', 798, 688, NULL, NULL),
(222, 'UG', 'UGANDA', 'Uganda', 800, 256, NULL, NULL),
(223, 'UA', 'UKRAINE', 'Ukraine', 804, 380, NULL, NULL),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 784, 971, NULL, NULL),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 826, 44, NULL, NULL),
(226, 'US', 'UNITED STATES', 'United States', 840, 1, NULL, NULL),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', 0, 1, NULL, NULL),
(228, 'UY', 'URUGUAY', 'Uruguay', 858, 598, NULL, NULL),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 860, 998, NULL, NULL),
(230, 'VU', 'VANUATU', 'Vanuatu', 548, 678, NULL, NULL),
(231, 'VE', 'VENEZUELA', 'Venezuela', 862, 58, NULL, NULL),
(232, 'VN', 'VIET NAM', 'Viet Nam', 704, 84, NULL, NULL),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 92, 1284, NULL, NULL),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 850, 1340, NULL, NULL),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 876, 681, NULL, NULL),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 732, 212, NULL, NULL),
(237, 'YE', 'YEMEN', 'Yemen', 887, 967, NULL, NULL),
(238, 'ZM', 'ZAMBIA', 'Zambia', 894, 260, NULL, NULL),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 716, 263, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hash` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vmodel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vtype` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plateno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `hash`, `fname`, `lname`, `email`, `phone`, `city`, `country`, `vmodel`, `vtype`, `plateno`, `active`, `created_at`, `updated_at`) VALUES
(8, 'TH3zEQii9X04WFxW', 'Israr', 'Totil', 'israr@yahoo.com', '905301446930', 'Khartom', 'SD', 'BMW', '0', '656564', 0, '2019-12-22 06:31:34', '2019-12-26 07:11:26'),
(9, 'lT8LArj8i358z9qo', 'Murat', 'Alvan', 'info@marasiel.com', '5318927413', 'Khartom', 'SD', 'BMW', '1', '656564', 1, '2020-01-02 08:35:59', '2020-02-08 14:56:24'),
(10, 'KZN6DbCfGnVmLCn6', 'Murad', 'Alwan', 'free1soft@gmail.com', '5318927413', 'Khartom', 'SD', 'BMW', '1', '535445', 1, '2020-01-16 09:16:16', '2020-02-09 10:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_11_27_141818_add_apitoken_to_users', 2),
(4, '2019_11_30_112021_create_permission_tables', 3),
(7, '2019_12_04_104044_create_settings_table', 4),
(8, '2019_12_04_153357_create_config_table', 5),
(9, '2019_12_04_164728_create_role_configuration_table', 5),
(10, '2019_12_09_161836_create_notifications_table', 6),
(11, '2019_12_10_170236_create_jobs_table', 7),
(12, '2019_12_16_164910_create_countries_table', 8),
(13, '2019_12_19_144852_create_drivers_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\User', 1),
(2, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('33b4323d-4bc5-4d8d-8722-227b104f9fcb', 'App\\Notifications\\NewUserCreatedDB', 'App\\User', 1, '{\"data\":\"Besha has been created a new user: Amie Ebert Jr.\",\"user\":{\"id\":17,\"name\":\"Besha\",\"email\":\"besha@gmail.com\",\"email_verified_at\":null,\"api_token\":null,\"created_at\":\"2019-12-13 09:57:58\",\"updated_at\":\"2019-12-13 09:57:58\",\"avatar\":\"http:\\/\\/localhost\\/marasielo\\/public\\/storage\\/users\\/0.jpg\",\"getroles\":[],\"settings\":[],\"roles\":[]}}', '2019-12-13 07:04:47', '2019-12-13 07:04:10', '2019-12-13 07:04:47'),
('a4a357df-097c-4e68-a9e4-6975e377dfff', 'App\\Notifications\\NewUserCreatedDB', 'App\\User', 2, '{\"data\":\"Besha has been created a new user: Amie Ebert Jr.\",\"user\":{\"id\":17,\"name\":\"Besha\",\"email\":\"besha@gmail.com\",\"email_verified_at\":null,\"api_token\":null,\"created_at\":\"2019-12-13 09:57:58\",\"updated_at\":\"2019-12-13 09:57:58\",\"avatar\":\"http:\\/\\/localhost\\/marasielo\\/public\\/storage\\/users\\/0.jpg\",\"getroles\":[],\"settings\":[],\"roles\":[]}}', NULL, '2019-12-13 07:04:10', '2019-12-13 07:04:10'),
('cfe7307c-8e39-4a81-b90b-9baa97293b56', 'App\\Notifications\\NewUserCreatedDB', 'App\\User', 2, '{\"data\":\"Murad Alwan has been created a new user: Besha\",\"user\":{\"id\":1,\"name\":\"Murad Alwan\",\"email\":\"free1soft@gmail.com\",\"email_verified_at\":null,\"api_token\":\"5lwj0sXMR757f5K28bGSiDcBYbY5RZMpuUK62AtkN5TBmcnu1fof6e6JUVaW\",\"created_at\":\"2019-11-26 11:57:41\",\"updated_at\":\"2019-12-16 07:43:57\",\"avatar\":\"http:\\/\\/localhost\\/marasielo\\/public\\/storage\\/users\\/1.jpg\",\"getroles\":[{\"id\":2,\"name\":\"developer\",\"guard_name\":\"web\",\"created_at\":\"2019-11-30 16:53:41\",\"updated_at\":\"2019-11-30 16:53:41\",\"getpermissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}],\"pivot\":{\"model_id\":1,\"role_id\":2,\"model_type\":\"App\\\\User\"},\"permissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}]}],\"roles\":[{\"id\":2,\"name\":\"developer\",\"guard_name\":\"web\",\"created_at\":\"2019-11-30 16:53:41\",\"updated_at\":\"2019-11-30 16:53:41\",\"getpermissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}],\"pivot\":{\"model_id\":1,\"role_id\":2,\"model_type\":\"App\\\\User\"},\"permissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}]}]}}', NULL, '2019-12-16 04:46:16', '2019-12-16 04:46:16'),
('f65cf89b-1154-420d-bc72-334abce0b98a', 'App\\Notifications\\NewUserCreatedDB', 'App\\User', 2, '{\"data\":\"Murad Alwan has been created a new user: Samer\",\"user\":{\"id\":1,\"name\":\"Murad Alwan\",\"email\":\"free1soft@gmail.com\",\"email_verified_at\":null,\"api_token\":\"JH8hZ215ib4whwX8doijYywoyMjpsqTAC6l39njegSJ7YX42ldL9ieAZr1mV\",\"domain\":null,\"created_at\":\"2019-11-26 11:57:41\",\"updated_at\":\"2019-12-21 16:05:47\",\"avatar\":\"http:\\/\\/localhost\\/marasielo\\/public\\/storage\\/users\\/1.jpg\",\"getroles\":[{\"id\":2,\"name\":\"developer\",\"guard_name\":\"web\",\"created_at\":\"2019-11-30 16:53:41\",\"updated_at\":\"2019-11-30 16:53:41\",\"getpermissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}],\"pivot\":{\"model_id\":1,\"role_id\":2,\"model_type\":\"App\\\\User\"},\"permissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}]}],\"roles\":[{\"id\":2,\"name\":\"developer\",\"guard_name\":\"web\",\"created_at\":\"2019-11-30 16:53:41\",\"updated_at\":\"2019-11-30 16:53:41\",\"getpermissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}],\"pivot\":{\"model_id\":1,\"role_id\":2,\"model_type\":\"App\\\\User\"},\"permissions\":[{\"id\":4,\"name\":\"access-roles\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:28:55\",\"updated_at\":\"2019-12-09 13:28:55\",\"pivot\":{\"role_id\":2,\"permission_id\":4}},{\"id\":5,\"name\":\"access-users\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:06\",\"updated_at\":\"2019-12-09 13:29:06\",\"pivot\":{\"role_id\":2,\"permission_id\":5}},{\"id\":6,\"name\":\"access-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:25\",\"updated_at\":\"2019-12-09 13:29:25\",\"pivot\":{\"role_id\":2,\"permission_id\":6}},{\"id\":7,\"name\":\"access-configs\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 13:29:43\",\"updated_at\":\"2019-12-09 13:29:43\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"give-permissions\",\"guard_name\":\"web\",\"created_at\":\"2019-12-09 15:03:45\",\"updated_at\":\"2019-12-09 15:03:45\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"access-desktop\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:43\",\"updated_at\":\"2019-12-10 07:08:43\",\"pivot\":{\"role_id\":2,\"permission_id\":9}},{\"id\":10,\"name\":\"access-drivers\",\"guard_name\":\"web\",\"created_at\":\"2019-12-10 07:08:52\",\"updated_at\":\"2019-12-10 07:08:52\",\"pivot\":{\"role_id\":2,\"permission_id\":10}}]}]}}', NULL, '2019-12-21 13:32:54', '2019-12-21 13:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'access-roles', 'web', '2019-12-09 10:28:55', '2019-12-09 10:28:55'),
(5, 'access-users', 'web', '2019-12-09 10:29:06', '2019-12-09 10:29:06'),
(6, 'access-permissions', 'web', '2019-12-09 10:29:25', '2019-12-09 10:29:25'),
(7, 'access-configs', 'web', '2019-12-09 10:29:43', '2019-12-09 10:29:43'),
(8, 'give-permissions', 'web', '2019-12-09 12:03:45', '2019-12-09 12:03:45'),
(9, 'access-desktop', 'web', '2019-12-10 04:08:43', '2019-12-10 04:08:43'),
(10, 'access-drivers', 'web', '2019-12-10 04:08:52', '2019-12-10 04:08:52'),
(11, 'make_drivers_approved', 'web', '2019-12-23 06:27:05', '2019-12-23 06:27:05'),
(12, 'show-orders-statics', 'web', '2019-12-23 06:27:20', '2020-02-11 16:08:02'),
(13, 'show-drivers-statics', 'web', '2020-02-11 16:09:12', '2020-02-11 16:09:12'),
(14, 'manage_pending-drivers', 'web', '2020-02-11 16:09:35', '2020-02-11 16:09:35'),
(15, 'manage_active-drivers', 'web', '2020-02-11 16:09:44', '2020-02-11 16:09:44'),
(16, 'show-top-drivers', 'web', '2020-02-11 16:12:43', '2020-02-11 16:12:43'),
(17, 'add_credit2user', 'web', '2020-02-12 07:21:37', '2020-02-12 07:21:37'),
(18, 'manage_customers', 'web', '2020-02-12 07:35:25', '2020-02-12 07:35:25'),
(19, 'manage_active_customers', 'web', '2020-02-12 07:35:36', '2020-02-12 07:35:36'),
(20, 'manage_orders', 'web', '2020-02-12 07:35:47', '2020-02-12 07:35:47'),
(21, 'orders_done', 'web', '2020-02-12 07:35:56', '2020-02-12 07:35:56'),
(22, 'orders_progress', 'web', '2020-02-18 07:22:30', '2020-02-18 07:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2019-11-30 08:30:28', '2019-11-30 13:56:04'),
(2, 'developer', 'web', '2019-11-30 13:53:41', '2019-11-30 13:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_configuration`
--

CREATE TABLE `role_configuration` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `configuration_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_configuration`
--

INSERT INTO `role_configuration` (`id`, `role_id`, `configuration_id`, `created_at`, `updated_at`) VALUES
(41, 2, 10, NULL, NULL),
(44, 1, 7, NULL, NULL),
(46, 2, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `user_id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(9, 1, 'dev-setting-1', '77', '2019-12-09 06:29:33', '2019-12-09 06:29:33'),
(10, 1, 'receive-noti-4new-users', '1', '2019-12-09 13:14:21', '2019-12-09 13:14:21'),
(11, 1, 'notifications-show-limit', '4', '2019-12-12 13:20:51', '2019-12-12 13:20:51'),
(13, 2, 'receive-noti-4new-users', '1', NULL, NULL),
(14, 1, 'new-user-welcome-email', '1', '2019-12-20 10:36:32', '2019-12-20 10:36:39'),
(17, 1, 'foo', '99', '2020-02-19 05:10:51', '2020-02-19 05:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `domain`, `created_at`, `updated_at`) VALUES
(1, 'Murad Alwan', 'free1soft@gmail.com', NULL, '$2y$10$7XCBy.NbQfLDXAWnnkiUze7MunO79FCjmVVK5fx0LCZggALBY/IoC', 'OyOAI9CbdTZnyG0cDegBdRt3WSKIQOH2zOyTAE8vsIlDSeWWF2sH8JVJRaBi', 'OC000WzO0gazmSFmRHsqEXJc9VHQ8ojynDYDTb24biKjm1re0YZowEa9FROP', NULL, '2019-11-26 08:57:41', '2020-02-19 05:10:49'),
(2, 'Hussam Totile', 'hussam@gmail.com', NULL, '$2y$10$BOSA8NOUXDdVg/ST0v/LDeMnP.PaRBYiHE/Zedus4Qwz.M1Tr7PsK', NULL, NULL, NULL, '2019-12-01 05:22:11', '2019-12-01 05:22:11'),
(3, 'israr totil1', 'isrartoteel@yahoo.com', NULL, '$2y$10$IZ384g3uYpBoj4k8U10P0OkKaNOZBIlHVNIoNqJbxhHP8J6FwzXbS', NULL, NULL, NULL, '2019-12-02 05:43:53', '2019-12-05 14:56:32'),
(4, 'Ashtyn Herman', 'mortimer.luettgen@example.com', '2019-12-06 12:06:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'uFSfHEz3ia', NULL, '2019-12-06 12:06:51', '2019-12-06 12:06:51'),
(5, 'Amie Ebert Jr.', 'jett13@example.org', '2019-12-06 12:06:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'HOmCfrFkeD', NULL, '2019-12-06 12:06:51', '2019-12-06 12:06:51'),
(6, 'Prof. Jett Borer V', 'kameron.luettgen@example.com', '2019-12-06 12:06:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'w9xlijyPo5', NULL, '2019-12-06 12:06:51', '2019-12-06 12:06:51'),
(17, 'Besha', 'besha@gmail.com', NULL, '$2y$10$cK.TJnTfwKcGYl9irYhIR.noG9lh6JqHN/MSMHMlfRnVqeBtl8ZTa', NULL, NULL, NULL, '2019-12-13 06:57:58', '2019-12-13 06:57:58'),
(18, 'Samer', 'samer@hotmail.com', NULL, '$2y$10$/Ghch8SUezwUzbCFk8fqDOXgtgD1KPUC51LUqkFgutqBLHwtwrIAq', NULL, NULL, 'SD', '2019-12-16 04:46:14', '2019-12-21 13:32:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_configuration`
--
ALTER TABLE `role_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_configuration`
--
ALTER TABLE `role_configuration`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
