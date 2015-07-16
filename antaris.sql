-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 02-Maio-2015 às 01:27
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `antaris`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `email` varchar(500) NOT NULL,
  `lang` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_achats_log`
--

CREATE TABLE IF NOT EXISTS `uni1_achats_log` (
`achatID` int(11) NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `userID` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8,
  `total_cred` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_aks`
--

CREATE TABLE IF NOT EXISTS `uni1_aks` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `target` int(11) unsigned NOT NULL,
  `ankunft` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_alliance`
--

CREATE TABLE IF NOT EXISTS `uni1_alliance` (
`id` int(11) unsigned NOT NULL,
  `ally_name` varchar(50) DEFAULT '',
  `ally_tag` varchar(20) DEFAULT '',
  `ally_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `ally_register_time` int(11) NOT NULL DEFAULT '0',
  `ally_description` text,
  `ally_web` varchar(255) DEFAULT '',
  `ally_text` text,
  `ally_image` varchar(255) DEFAULT '',
  `ally_request` varchar(1000) DEFAULT NULL,
  `ally_request_notallow` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ally_request_min_points` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ally_owner_range` varchar(32) DEFAULT '',
  `ally_members` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_stats` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ally_diplo` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ally_universe` tinyint(3) unsigned NOT NULL,
  `ally_max_members` int(5) unsigned NOT NULL DEFAULT '20',
  `ally_events` varchar(55) NOT NULL DEFAULT '',
  `defcon` tinyint(3) unsigned NOT NULL DEFAULT '5'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_alliance_ranks`
--

CREATE TABLE IF NOT EXISTS `uni1_alliance_ranks` (
`rankID` int(11) NOT NULL,
  `rankName` varchar(32) NOT NULL,
  `allianceID` int(10) unsigned NOT NULL,
  `MEMBERLIST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MANAGEAPPLY` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ROUNDMAIL` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ADMIN` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DIPLOMATIC` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RANKS` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MANAGEUSERS` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_alliance_ranks`
--

INSERT INTO `uni1_alliance_ranks` (`rankID`, `rankName`, `allianceID`, `MEMBERLIST`, `MANAGEAPPLY`, `ROUNDMAIL`, `ADMIN`, `DIPLOMATIC`, `RANKS`, `MANAGEUSERS`) VALUES
(1, 'Offizier', 17, 1, 0, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_alliance_request`
--

CREATE TABLE IF NOT EXISTS `uni1_alliance_request` (
`applyID` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `allianceID` int(10) unsigned NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_banned`
--

CREATE TABLE IF NOT EXISTS `uni1_banned` (
`id` int(11) unsigned NOT NULL,
  `who` varchar(64) NOT NULL DEFAULT '',
  `theme` varchar(500) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `longer` int(11) NOT NULL DEFAULT '0',
  `author` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `universe` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_buddy`
--

CREATE TABLE IF NOT EXISTS `uni1_buddy` (
`id` int(11) unsigned NOT NULL,
  `sender` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_buddy_request`
--

CREATE TABLE IF NOT EXISTS `uni1_buddy_request` (
  `id` int(11) unsigned NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_bunker_log`
--

CREATE TABLE IF NOT EXISTS `uni1_bunker_log` (
`logID` int(11) NOT NULL,
  `userID` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_config`
--

CREATE TABLE IF NOT EXISTS `uni1_config` (
`uni` int(11) NOT NULL,
  `VERSION` varchar(8) NOT NULL,
  `sql_revision` int(11) NOT NULL DEFAULT '0',
  `users_amount` int(11) unsigned NOT NULL DEFAULT '1',
  `game_speed` bigint(20) unsigned NOT NULL DEFAULT '2500',
  `fleet_speed` bigint(20) unsigned NOT NULL DEFAULT '2500',
  `resource_multiplier` smallint(5) unsigned NOT NULL DEFAULT '1',
  `halt_speed` smallint(5) unsigned NOT NULL DEFAULT '1',
  `Fleet_Cdr` tinyint(3) unsigned NOT NULL DEFAULT '30',
  `Defs_Cdr` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `initial_fields` smallint(5) unsigned NOT NULL DEFAULT '163',
  `uni_name` varchar(30) NOT NULL,
  `game_name` varchar(30) NOT NULL,
  `game_disable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `close_reason` text NOT NULL,
  `metal_basic_income` int(11) NOT NULL DEFAULT '20',
  `crystal_basic_income` int(11) NOT NULL DEFAULT '10',
  `deuterium_basic_income` int(11) NOT NULL DEFAULT '0',
  `elyrium_basic_income` int(11) unsigned NOT NULL DEFAULT '0',
  `formation_basic_income` int(11) unsigned NOT NULL DEFAULT '0',
  `energy_basic_income` int(11) NOT NULL DEFAULT '0',
  `LastSettedGalaxyPos` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `LastSettedSystemPos` smallint(5) unsigned NOT NULL DEFAULT '1',
  `LastSettedPlanetPos` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `noobprotection` int(11) NOT NULL DEFAULT '0',
  `noobprotectiontime` int(11) NOT NULL DEFAULT '5000',
  `noobprotectionmulti` int(11) NOT NULL DEFAULT '5',
  `forum_url` varchar(128) NOT NULL DEFAULT 'http://2moons.cc',
  `adm_attack` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `debug` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` varchar(2) NOT NULL DEFAULT '',
  `stat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_level` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `stat_last_update` int(11) NOT NULL DEFAULT '0',
  `stat_settings` int(11) unsigned NOT NULL DEFAULT '1000',
  `stat_update_time` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `stat_last_db_update` int(11) NOT NULL DEFAULT '0',
  `stats_fly_lock` int(11) NOT NULL DEFAULT '0',
  `cron_lock` int(11) NOT NULL DEFAULT '0',
  `ts_modon` tinyint(1) NOT NULL DEFAULT '0',
  `ts_server` varchar(64) NOT NULL DEFAULT '',
  `ts_tcpport` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ts_udpport` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ts_timeout` tinyint(1) NOT NULL DEFAULT '1',
  `ts_version` tinyint(1) NOT NULL DEFAULT '2',
  `ts_cron_last` int(11) NOT NULL DEFAULT '0',
  `ts_cron_interval` smallint(5) NOT NULL DEFAULT '5',
  `ts_login` varchar(32) NOT NULL DEFAULT '',
  `ts_password` varchar(32) NOT NULL DEFAULT '',
  `reg_closed` tinyint(1) NOT NULL DEFAULT '0',
  `OverviewNewsFrame` tinyint(1) NOT NULL DEFAULT '1',
  `OverviewNewsText` text NOT NULL,
  `capaktiv` tinyint(1) NOT NULL DEFAULT '0',
  `cappublic` varchar(42) NOT NULL DEFAULT '',
  `capprivate` varchar(42) NOT NULL DEFAULT '',
  `min_build_time` tinyint(2) NOT NULL DEFAULT '1',
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_use` tinyint(1) NOT NULL DEFAULT '0',
  `smtp_host` varchar(64) NOT NULL DEFAULT '',
  `smtp_port` smallint(5) NOT NULL DEFAULT '0',
  `smtp_user` varchar(64) NOT NULL DEFAULT '',
  `smtp_pass` varchar(32) NOT NULL DEFAULT '',
  `smtp_ssl` enum('','ssl','tls') NOT NULL DEFAULT '',
  `smtp_sendmail` varchar(64) NOT NULL DEFAULT '',
  `smail_path` varchar(30) NOT NULL DEFAULT '/usr/sbin/sendmail',
  `user_valid` tinyint(1) NOT NULL DEFAULT '0',
  `fb_on` tinyint(1) NOT NULL DEFAULT '0',
  `fb_apikey` varchar(42) NOT NULL DEFAULT '',
  `fb_skey` varchar(42) NOT NULL DEFAULT '',
  `ga_active` varchar(42) NOT NULL DEFAULT '0',
  `ga_key` varchar(42) NOT NULL DEFAULT '',
  `moduls` varchar(100) NOT NULL DEFAULT '',
  `trade_allowed_ships` varchar(255) NOT NULL DEFAULT '202,401',
  `trade_charge` varchar(5) NOT NULL DEFAULT '30',
  `chat_closed` tinyint(1) NOT NULL DEFAULT '0',
  `chat_allowchan` tinyint(1) NOT NULL DEFAULT '1',
  `chat_allowmes` tinyint(1) NOT NULL DEFAULT '1',
  `chat_allowdelmes` tinyint(1) NOT NULL DEFAULT '1',
  `chat_logmessage` tinyint(1) NOT NULL DEFAULT '1',
  `chat_nickchange` tinyint(1) NOT NULL DEFAULT '1',
  `chat_botname` varchar(15) NOT NULL DEFAULT '2Moons',
  `chat_channelname` varchar(15) NOT NULL DEFAULT '2Moons',
  `chat_socket_active` tinyint(1) NOT NULL DEFAULT '0',
  `chat_socket_host` varchar(64) NOT NULL DEFAULT '',
  `chat_socket_ip` varchar(40) NOT NULL DEFAULT '',
  `chat_socket_port` smallint(5) NOT NULL DEFAULT '0',
  `chat_socket_chatid` tinyint(1) NOT NULL DEFAULT '1',
  `max_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '9',
  `max_system` smallint(5) unsigned NOT NULL DEFAULT '400',
  `max_planets` tinyint(3) unsigned NOT NULL DEFAULT '15',
  `planet_factor` float(2,1) NOT NULL DEFAULT '1.0',
  `max_elements_build` tinyint(3) unsigned NOT NULL DEFAULT '5',
  `max_elements_tech` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `max_elements_ships` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `min_player_planets` tinyint(3) unsigned NOT NULL DEFAULT '9',
  `planets_tech` tinyint(4) NOT NULL DEFAULT '11',
  `planets_officier` tinyint(4) NOT NULL DEFAULT '5',
  `planets_per_tech` float(2,1) NOT NULL DEFAULT '0.5',
  `max_fleet_per_build` bigint(20) unsigned NOT NULL DEFAULT '1000000',
  `deuterium_cost_galaxy` int(11) unsigned NOT NULL DEFAULT '10',
  `max_dm_missions` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `max_overflow` float(2,1) NOT NULL DEFAULT '1.0',
  `moon_factor` float(2,1) NOT NULL DEFAULT '1.0',
  `moon_chance` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `darkmatter_cost_trader` int(11) unsigned NOT NULL DEFAULT '750',
  `factor_university` tinyint(3) unsigned NOT NULL DEFAULT '8',
  `max_fleets_per_acs` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `debris_moon` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `vmode_min_time` int(11) NOT NULL DEFAULT '259200',
  `gate_wait_time` int(11) NOT NULL DEFAULT '3600',
  `metal_start` int(11) unsigned NOT NULL DEFAULT '500',
  `crystal_start` int(11) unsigned NOT NULL DEFAULT '500',
  `deuterium_start` int(11) unsigned NOT NULL DEFAULT '0',
  `elyrium_start` int(11) unsigned NOT NULL DEFAULT '0',
  `darkmatter_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ttf_file` varchar(128) NOT NULL DEFAULT 'styles/resource/fonts/DroidSansMono.ttf',
  `ref_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ref_bonus` int(11) unsigned NOT NULL DEFAULT '1000',
  `ref_minpoints` bigint(20) unsigned NOT NULL DEFAULT '2000',
  `ref_max_referals` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `del_oldstuff` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `del_user_manually` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `del_user_automatic` tinyint(3) unsigned NOT NULL DEFAULT '30',
  `del_user_sendmail` tinyint(3) unsigned NOT NULL DEFAULT '21',
  `sendmail_inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `silo_factor` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `timezone` varchar(32) NOT NULL DEFAULT 'Europe/London',
  `dst` enum('0','1','2') NOT NULL DEFAULT '2',
  `energySpeed` smallint(6) NOT NULL DEFAULT '1',
  `disclamerAddress` text NOT NULL,
  `disclamerPhone` text NOT NULL,
  `disclamerMail` text NOT NULL,
  `disclamerNotice` text NOT NULL,
  `alliance_create_min_points` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lottery_time` int(11) unsigned NOT NULL DEFAULT '0',
  `lottery_min` int(11) unsigned NOT NULL DEFAULT '15',
  `taxe_metal` float NOT NULL DEFAULT '0',
  `taxe_crystal` float NOT NULL DEFAULT '0',
  `taxe_deuterium` float NOT NULL DEFAULT '0',
  `taxe_elyrium` float NOT NULL DEFAULT '0',
  `bank_metal` double(50,0) unsigned NOT NULL DEFAULT '400000000000',
  `bank_crystal` double(50,0) unsigned NOT NULL DEFAULT '300000000000',
  `bank_deuterium` double(50,0) unsigned NOT NULL DEFAULT '200000000000',
  `bank_elyrium` double(50,0) unsigned NOT NULL DEFAULT '100000000000',
  `new_taxe_metal` float NOT NULL DEFAULT '0',
  `new_taxe_crystal` float NOT NULL DEFAULT '0',
  `new_taxe_deuterium` float NOT NULL DEFAULT '0',
  `new_taxe_elyrium` float NOT NULL DEFAULT '0',
  `newbank` int(11) unsigned NOT NULL DEFAULT '0',
  `asteroid_event` int(11) unsigned NOT NULL DEFAULT '0',
  `asteroid_metal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `asteroid_crystal` bigint(20) unsigned NOT NULL DEFAULT '0',
  `asteroid_deuterium` bigint(20) unsigned NOT NULL DEFAULT '0',
  `globalevent` int(11) unsigned NOT NULL DEFAULT '0',
  `globaleventsocial` int(11) unsigned NOT NULL DEFAULT '0',
  `birthday_event` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_config`
--

INSERT INTO `uni1_config` (`uni`, `VERSION`, `sql_revision`, `users_amount`, `game_speed`, `fleet_speed`, `resource_multiplier`, `halt_speed`, `Fleet_Cdr`, `Defs_Cdr`, `initial_fields`, `uni_name`, `game_name`, `game_disable`, `close_reason`, `metal_basic_income`, `crystal_basic_income`, `deuterium_basic_income`, `elyrium_basic_income`, `formation_basic_income`, `energy_basic_income`, `LastSettedGalaxyPos`, `LastSettedSystemPos`, `LastSettedPlanetPos`, `noobprotection`, `noobprotectiontime`, `noobprotectionmulti`, `forum_url`, `adm_attack`, `debug`, `lang`, `stat`, `stat_level`, `stat_last_update`, `stat_settings`, `stat_update_time`, `stat_last_db_update`, `stats_fly_lock`, `cron_lock`, `ts_modon`, `ts_server`, `ts_tcpport`, `ts_udpport`, `ts_timeout`, `ts_version`, `ts_cron_last`, `ts_cron_interval`, `ts_login`, `ts_password`, `reg_closed`, `OverviewNewsFrame`, `OverviewNewsText`, `capaktiv`, `cappublic`, `capprivate`, `min_build_time`, `mail_active`, `mail_use`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_ssl`, `smtp_sendmail`, `smail_path`, `user_valid`, `fb_on`, `fb_apikey`, `fb_skey`, `ga_active`, `ga_key`, `moduls`, `trade_allowed_ships`, `trade_charge`, `chat_closed`, `chat_allowchan`, `chat_allowmes`, `chat_allowdelmes`, `chat_logmessage`, `chat_nickchange`, `chat_botname`, `chat_channelname`, `chat_socket_active`, `chat_socket_host`, `chat_socket_ip`, `chat_socket_port`, `chat_socket_chatid`, `max_galaxy`, `max_system`, `max_planets`, `planet_factor`, `max_elements_build`, `max_elements_tech`, `max_elements_ships`, `min_player_planets`, `planets_tech`, `planets_officier`, `planets_per_tech`, `max_fleet_per_build`, `deuterium_cost_galaxy`, `max_dm_missions`, `max_overflow`, `moon_factor`, `moon_chance`, `darkmatter_cost_trader`, `factor_university`, `max_fleets_per_acs`, `debris_moon`, `vmode_min_time`, `gate_wait_time`, `metal_start`, `crystal_start`, `deuterium_start`, `elyrium_start`, `darkmatter_start`, `ttf_file`, `ref_active`, `ref_bonus`, `ref_minpoints`, `ref_max_referals`, `del_oldstuff`, `del_user_manually`, `del_user_automatic`, `del_user_sendmail`, `sendmail_inactive`, `silo_factor`, `timezone`, `dst`, `energySpeed`, `disclamerAddress`, `disclamerPhone`, `disclamerMail`, `disclamerNotice`, `alliance_create_min_points`, `lottery_time`, `lottery_min`, `taxe_metal`, `taxe_crystal`, `taxe_deuterium`, `taxe_elyrium`, `bank_metal`, `bank_crystal`, `bank_deuterium`, `bank_elyrium`, `new_taxe_metal`, `new_taxe_crystal`, `new_taxe_deuterium`, `new_taxe_elyrium`, `newbank`, `asteroid_event`, `asteroid_metal`, `asteroid_crystal`, `asteroid_deuterium`, `globalevent`, `globaleventsocial`, `birthday_event`) VALUES
(1, '1.7.2676', 0, 1, 500000, 20000, 1, 10, 55, 25, 163, 'Horizon', 'Antaris Legacy', 1, 'The game is closed until 17.04.2015 at 18.00&lt;br&gt;\n\nLe jeu est fermer jusqau 17.04.2015 a 18.00\n&lt;br&gt;\n\nDas Spiel ist bis 17.04.2015 um 18.00 Uhr geschlossen', 100, 80, 60, 40, 0, 0, 1, 99, 3, 1, 250000, 5, 'http://forum.antaris-legacy.org', 1, 0, 'fr', 2, 2, 1430521854, 1000, 0, 0, 0, 0, 0, '', 0, 0, 1, 2, 0, 5, '', '', 0, 1, 'Welcome to 2Moons v1.7', 0, '', '', 1, 1, 2, 'antaris-legacy.org', 465, 'staff@antaris-legacy.org', 'EJceRpJcPv3181', '', 'staff@antaris-legacy.org', '/usr/sbin/sendmail', 0, 0, '', '', '0', '', '1;1;1;1;1;1;0;1;1;1;1;1;1;0;1;0;1;1;0;0;1;1;1;1;1;1;1;0;1;1;0;0;1;1;1;1;1;1;0;1;0;0;1', '202,401', '30', 0, 1, 1, 0, 1, 1, 'Battle-Fighter', 'Battle-Fighter', 0, '', '', 0, 1, 1, 500, 10, 1.0, 1, 1, 10, 10, 0, 0, 0.0, 1000000, 10, 1, 1.0, 1.0, 20, 0, 8, 16, 0, 259200, 3600, 40000, 30000, 20000, 10000, 5, 'styles/resource/fonts/antaris.ttf', 1, 1, 10000, 5, 3, 10, 40, 21, 1, 1, 'Europe/Brussels', '0', 5, '', '', '', '', 0, 1429563958, 15, -11.34, 10.75, 6.81, -11.76, 3993016208, 2994184110, 2003694151, 1004146448, 0.73, 1.1, -0.74, -1.09, 2857863733, 1430519391, 150000, 100000, 50000, 1429192655, 1429732643, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_cronjobs`
--

CREATE TABLE IF NOT EXISTS `uni1_cronjobs` (
`cronjobID` int(11) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `min` varchar(32) NOT NULL,
  `hours` varchar(32) NOT NULL,
  `dom` varchar(32) NOT NULL,
  `month` varchar(32) NOT NULL,
  `dow` varchar(32) NOT NULL,
  `class` varchar(32) NOT NULL,
  `nextTime` int(11) NOT NULL DEFAULT '0',
  `lock` varchar(32) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_cronjobs`
--

INSERT INTO `uni1_cronjobs` (`cronjobID`, `name`, `isActive`, `min`, `hours`, `dom`, `month`, `dow`, `class`, `nextTime`, `lock`) VALUES
(1, 'referral', 1, '0,30', '*', '*', '*', '*', 'ReferralCronjob', 1430523000, NULL),
(2, 'statistic', 1, '1,31,51', '*', '*', '*', '*', 'StatisticCronjob', 1430523060, NULL),
(3, 'daily', 1, '25', '2', '*', '*', '*', 'DailyCronjob', 1430526300, NULL),
(4, 'cleaner', 1, '45', '2', '*', '*', '6', 'CleanerCronjob', 1430527500, NULL),
(5, 'inactive', 1, '30', '1', '*', '*', '0,3,6', 'InactiveMailCronjob', 1430523000, NULL),
(7, 'databasedump', 1, '30', '1', '*', '*', '1', 'DumpCronjob', 1430695800, '09d3680031cb0b4183dea8088c5d65ea'),
(8, 'tracking', 1, '6', '21', '*', '*', '0', 'TrackingCronjob', 1430679960, NULL),
(9, 'Stats History', 1, '0,30,50', '*', '*', '*', '*', 'StatHistoryCronjob', 1430523000, NULL),
(10, 'Bunker Reset', 1, '57', '23', '*', '*', '*', 'BunkerCronjob', 1430603820, NULL),
(11, 'Clean PUSH', 1, '5,35,55', '*', '*', '*', '*', 'DoJobCronjob', 1430523300, NULL),
(12, 'Asteroid Cronjon', 1, '25', '9,15,21', '*', '*', '*', 'AsteroidCronJob', 1430551500, NULL),
(13, 'Game Events', 1, '40', '3,7,11,15,19,23', '*', '*', '*', 'EventCronJob', 1430530800, '5ae905331baa77d78367dcef6cdbee45'),
(14, 'Social Event', 1, '15', '18', '5,10,15,20,25,30', '*', '*', 'EventSocialCronJob', 1430842500, NULL),
(15, 'Birtday', 1, '27', '3', '*', '*', '*', 'BirthdayCronJob', 1430530020, 'e068ef641d29478e514bfd21195b79c4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_diplo`
--

CREATE TABLE IF NOT EXISTS `uni1_diplo` (
`id` int(11) unsigned NOT NULL,
  `owner_1` int(11) unsigned NOT NULL,
  `owner_2` int(11) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `accept` tinyint(1) unsigned NOT NULL,
  `accept_text` varchar(255) NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_diplo`
--

INSERT INTO `uni1_diplo` (`id`, `owner_1`, `owner_2`, `level`, `accept`, `accept_text`, `time`, `universe`) VALUES
(1, 17, 17, 1, 0, '', 1429429239, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_explorations`
--

CREATE TABLE IF NOT EXISTS `uni1_explorations` (
`explorationID` int(11) NOT NULL,
  `userID` int(11) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `type_of_search` tinyint(3) NOT NULL DEFAULT '0',
  `start_planet_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `start_system` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `start_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `end_planet_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `emd_time` int(11) unsigned NOT NULL DEFAULT '0',
  `population_array` text CHARACTER SET utf8,
  `ships_array` text CHARACTER SET utf8,
  `text` text CHARACTER SET utf16,
  `categorie` int(11) unsigned NOT NULL DEFAULT '0',
  `subcategorie` int(11) unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT 'defaut.jpg'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_fleets`
--

CREATE TABLE IF NOT EXISTS `uni1_fleets` (
`fleet_id` bigint(11) unsigned NOT NULL,
  `fleet_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_mission` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `fleet_amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_array` text,
  `fleet_universe` tinyint(3) unsigned NOT NULL,
  `fleet_start_time` int(11) NOT NULL DEFAULT '0',
  `fleet_start_id` int(11) unsigned NOT NULL,
  `fleet_start_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_start_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `fleet_end_time` int(11) NOT NULL DEFAULT '0',
  `fleet_end_stay` int(11) NOT NULL DEFAULT '0',
  `fleet_end_id` int(11) unsigned NOT NULL,
  `fleet_end_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_end_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `fleet_target_obj` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_deuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_elyrium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_301` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_302` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_303` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_304` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_305` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_306` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_307` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_309` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_darkmatter` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_target_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_group` int(10) unsigned NOT NULL DEFAULT '0',
  `fleet_mess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `start_time` int(11) DEFAULT NULL,
  `fleet_busy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hasCanceled` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1858 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_fleets_manage`
--

CREATE TABLE IF NOT EXISTS `uni1_fleets_manage` (
`manageID` int(11) NOT NULL,
  `userID` int(11) unsigned NOT NULL DEFAULT '0',
  `manage_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ship202` int(11) unsigned NOT NULL DEFAULT '0',
  `ship203` int(11) unsigned NOT NULL DEFAULT '0',
  `ship204` int(11) unsigned NOT NULL DEFAULT '0',
  `ship205` int(11) unsigned NOT NULL DEFAULT '0',
  `ship206` int(11) unsigned NOT NULL DEFAULT '0',
  `ship207` int(11) unsigned NOT NULL DEFAULT '0',
  `ship211` int(11) unsigned NOT NULL DEFAULT '0',
  `ship214` int(11) unsigned NOT NULL DEFAULT '0',
  `ship215` int(11) unsigned NOT NULL DEFAULT '0',
  `ship216` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `uni1_fleets_manage`
--

INSERT INTO `uni1_fleets_manage` (`manageID`, `userID`, `manage_name`, `ship202`, `ship203`, `ship204`, `ship205`, `ship206`, `ship207`, `ship211`, `ship214`, `ship215`, `ship216`) VALUES
(20, 3, 'GT', 0, 7, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 10022, 'Raiding', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 47, '2', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 5, 'flotte1', 14, 2, 8, 0, 0, 0, 0, 0, 0, 0),
(14, 5, 'flotte2', 28, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 10030, 'false', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 47, '1', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 10016, 'A', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_fleet_event`
--

CREATE TABLE IF NOT EXISTS `uni1_fleet_event` (
  `fleetID` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `lock` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_ipblock`
--

CREATE TABLE IF NOT EXISTS `uni1_ipblock` (
`ipblockID` int(11) NOT NULL,
  `userID` int(11) unsigned NOT NULL DEFAULT '0',
  `secondID` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_iplog`
--

CREATE TABLE IF NOT EXISTS `uni1_iplog` (
`logID` int(11) NOT NULL,
  `timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `ipaddress` text CHARACTER SET utf8,
  `browser` text CHARACTER SET utf8,
  `os` text CHARACTER SET utf8,
  `userID` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=212 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `uni1_iplog`
--

INSERT INTO `uni1_iplog` (`logID`, `timestamp`, `ipaddress`, `browser`, `os`, `userID`) VALUES
(1, 1429276135, '41.189.161.43', 'Opera', 'Autre', 10009),
(2, 1429277329, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(3, 1429282992, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(4, 1429283471, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(5, 1429284965, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(6, 1429285796, '190.2.96.64', 'Google Chrome', 'Windows', 50),
(7, 1429286197, '92.225.106.213', 'Mozilla Firefox', 'Windows', 4),
(8, 1429286360, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(9, 1429286379, '91.59.149.246', 'Google Chrome', 'Windows', 10011),
(10, 1429286700, '188.25.1.5', 'Mozilla Firefox', 'Windows', 10014),
(11, 1429286871, '178.25.44.105', 'Mozilla Firefox', 'Windows', 25),
(12, 1429286924, '46.127.252.38', 'Google Chrome', 'Windows', 32),
(13, 1429287596, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(14, 1429288217, '89.245.11.100', 'Google Chrome', 'Windows', 10007),
(15, 1429288694, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(16, 1429289147, '2.99.240.236', 'Mozilla Firefox', 'Windows', 10016),
(17, 1429289526, '193.13.195.76', 'Google Chrome', 'Linux', 37),
(18, 1429289855, '79.115.3.88', 'Google Chrome', 'Windows', 10001),
(19, 1429290645, '95.15.146.27', 'Apple Safari', 'Autre', 10010),
(20, 1429290819, '41.189.161.43', 'Opera', 'Autre', 10009),
(21, 1429291822, '41.189.161.43', 'Opera', 'Autre', 10009),
(22, 1429291864, '81.131.134.47', 'Google Chrome', 'Windows', 19),
(23, 1429293509, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(24, 1429295801, '109.70.40.238', 'Google Chrome', 'Windows', 7),
(25, 1429295926, '92.110.43.73', 'Mozilla Firefox', 'Windows', 18),
(26, 1429296521, '41.189.161.43', 'Opera', 'Autre', 10009),
(27, 1429296794, '46.115.16.139', 'Mozilla Firefox', 'Windows', 6),
(28, 1429298344, '80.138.227.129', 'Mozilla Firefox', 'Windows', 47),
(29, 1429299542, '83.176.62.124', 'Google Chrome', 'Linux', 37),
(30, 1429301657, '93.105.179.108', 'Mozilla Firefox', 'Autre', 10008),
(31, 1429302275, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(32, 1429302533, '81.166.128.42', 'Mozilla Firefox', 'Windows', 15),
(33, 1429303981, '2.235.63.139', 'Google Chrome', 'Windows', 42),
(34, 1429305240, '89.115.114.165', 'Google Chrome', 'Windows', 54),
(35, 1429305785, '2.40.18.92', 'Google Chrome', 'Windows', 30),
(36, 1429306421, '37.244.250.84', 'Mozilla Firefox', 'Windows', 10025),
(37, 1429307454, '74.104.133.123', 'Google Chrome', 'Windows', 27),
(38, 1429309756, '98.219.130.174', 'Mozilla Firefox', 'Windows', 8),
(39, 1429310214, '85.138.38.244', 'Google Chrome', 'Windows', 10030),
(40, 1429313200, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(41, 1429313755, '190.2.96.64', 'Google Chrome', 'Windows', 50),
(42, 1429314587, '151.42.104.132', 'Mozilla Firefox', 'Windows', 10028),
(43, 1429317717, '201.13.90.149', 'Google Chrome', 'Linux', 10017),
(44, 1429318528, '177.79.26.39', 'Google Chrome', 'Linux', 10017),
(45, 1429326584, '93.105.179.108', 'Mozilla Firefox', 'Autre', 10008),
(46, 1429330076, '178.25.44.105', 'Mozilla Firefox', 'Windows', 25),
(47, 1429330805, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(48, 1429331983, '37.0.134.60', 'Google Chrome', 'Linux', 37),
(49, 1429333222, '37.0.134.60', 'Google Chrome', 'Linux', 37),
(50, 1429333360, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(51, 1429334857, '92.225.106.213', 'Mozilla Firefox', 'Windows', 4),
(52, 1429337922, '83.177.21.146', 'Google Chrome', 'Linux', 37),
(53, 1429339105, '179.7.114.237', 'Google Chrome', 'Windows', 10029),
(54, 1429340323, '193.12.133.192', 'Google Chrome', 'Linux', 37),
(55, 1429340588, '88.241.86.120', 'Google Chrome', 'Windows', 10000),
(56, 1429341557, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(57, 1429342581, '91.46.243.36', 'Mozilla Firefox', 'Windows', 47),
(58, 1429342815, '90.134.206.117', 'Google Chrome', 'Linux', 37),
(59, 1429343562, '41.189.161.43', 'Opera', 'Autre', 10009),
(60, 1429344347, '37.244.250.84', 'Mozilla Firefox', 'Windows', 10025),
(61, 1429345154, '93.135.21.245', 'Google Chrome', 'Windows', 10020),
(62, 1429345593, '92.224.228.214', 'Google Chrome', 'Windows', 16),
(63, 1429345987, '188.25.1.5', 'Mozilla Firefox', 'Windows', 10014),
(64, 1429346366, '188.25.1.5', 'Mozilla Firefox', 'Windows', 10014),
(65, 1429347221, '2.99.240.236', 'Mozilla Firefox', 'Windows', 10016),
(66, 1429347306, '2.235.63.139', 'Google Chrome', 'Windows', 42),
(67, 1429347496, '92.110.43.73', 'Mozilla Firefox', 'Windows', 18),
(68, 1429347844, '37.24.156.16', 'Mozilla Firefox', 'Windows', 35),
(69, 1429348914, '85.138.38.244', 'Google Chrome', 'Windows', 10030),
(70, 1429352620, '37.244.250.84', 'Mozilla Firefox', 'Windows', 10025),
(71, 1429352995, '98.219.130.174', 'Mozilla Firefox', 'Windows', 8),
(72, 1429354332, '89.115.114.165', 'Google Chrome', 'Windows', 54),
(73, 1429355776, '92.225.91.201', 'Mozilla Firefox', 'Windows', 4),
(74, 1429356327, '89.173.24.62', 'Mozilla Firefox', 'Windows', 20),
(75, 1429356461, '92.110.43.73', 'Mozilla Firefox', 'Windows', 18),
(76, 1429356690, '151.42.104.132', 'Mozilla Firefox', 'Windows', 10028),
(77, 1429359643, '213.93.190.61', 'Mozilla Firefox', 'Windows', 14),
(78, 1429359856, '92.225.91.201', 'Mozilla Firefox', 'Windows', 4),
(79, 1429360582, '74.104.133.123', 'Google Chrome', 'Windows', 27),
(80, 1429360615, '190.2.96.64', 'Google Chrome', 'Windows', 50),
(81, 1429361245, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(82, 1429362915, '93.135.21.245', 'Mozilla Firefox', 'Windows', 10020),
(83, 1429363273, '93.138.100.5', 'Google Chrome', 'Windows', 10022),
(84, 1429364191, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(85, 1429366417, '92.225.91.201', 'Mozilla Firefox', 'Windows', 4),
(86, 1429367367, '109.128.183.181', 'Mozilla Firefox', 'Windows', 1),
(87, 1429367945, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(88, 1429369902, '92.86.79.196', 'Google Chrome', 'Windows', 10005),
(89, 1429371950, '93.138.100.5', 'Google Chrome', 'Windows', 10022),
(90, 1429373226, '74.104.133.123', 'Google Chrome', 'Windows', 27),
(91, 1429375338, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(92, 1429375484, '46.115.16.139', 'Mozilla Firefox', 'Windows', 6),
(93, 1429376542, '90.134.206.117', 'Google Chrome', 'Linux', 37),
(94, 1429376811, '188.25.1.95', 'Mozilla Firefox', 'Windows', 10014),
(95, 1429377689, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(96, 1429379835, '179.7.114.237', 'Google Chrome', 'Windows', 10029),
(97, 1429381750, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(98, 1429382682, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(99, 1429382793, '91.109.247.173', 'Mozilla Firefox', 'Windows', 1),
(100, 1429382879, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(101, 1429384764, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(102, 1429385879, '41.189.161.44', 'Opera', 'Autre', 10009),
(103, 1429386261, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(104, 1429386937, '41.189.161.44', 'Opera', 'Autre', 10009),
(105, 1429388738, '37.0.156.209', 'Google Chrome', 'Linux', 37),
(106, 1429390916, '190.239.66.88', 'Apple Safari', 'Autre', 10029),
(107, 1429391470, '91.46.243.36', 'Mozilla Firefox', 'Windows', 47),
(108, 1429391715, '37.0.200.218', 'Google Chrome', 'Linux', 37),
(109, 1429391853, '37.0.200.218', 'Google Chrome', 'Linux', 37),
(110, 1429392159, '85.138.38.244', 'Google Chrome', 'Windows', 10030),
(111, 1429394366, '77.237.111.142', 'Mozilla Firefox', 'Windows', 10025),
(112, 1429394754, '93.136.21.41', 'Google Chrome', 'Windows', 10022),
(113, 1429396778, '2.99.240.236', 'Mozilla Firefox', 'Windows', 10016),
(114, 1429399402, '187.101.76.67', 'Google Chrome', 'Linux', 10017),
(115, 1429400041, '151.42.104.132', 'Mozilla Firefox', 'Windows', 10028),
(116, 1429402969, '186.110.237.143', 'Google Chrome', 'Windows', 10037),
(117, 1429403397, '2.235.63.139', 'Google Chrome', 'Windows', 42),
(118, 1429407275, '190.2.96.64', 'Google Chrome', 'Windows', 50),
(119, 1429409691, '92.225.91.201', 'Mozilla Firefox', 'Windows', 4),
(120, 1429412864, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(121, 1429413970, '74.104.133.123', 'Google Chrome', 'Windows', 27),
(122, 1429414322, '179.7.105.173', 'Google Chrome', 'Windows', 10029),
(123, 1429418546, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(124, 1429418798, '213.101.168.131', 'Google Chrome', 'Linux', 37),
(125, 1429420889, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(126, 1429421029, '193.217.238.216', 'Google Chrome', 'Linux', 37),
(127, 1429421819, '41.189.161.44', 'Opera', 'Autre', 10009),
(128, 1429422408, '89.115.114.165', 'Google Chrome', 'Windows', 54),
(129, 1429424519, '79.252.226.250', 'Mozilla Firefox', 'Windows', 47),
(130, 1429424942, '179.7.105.173', 'Google Chrome', 'Windows', 10029),
(131, 1429426717, '41.189.161.44', 'Opera', 'Autre', 10009),
(132, 1429426935, '93.136.21.41', 'Google Chrome', 'Windows', 10022),
(133, 1429428990, '213.93.190.61', 'Mozilla Firefox', 'Windows', 14),
(134, 1429429220, '41.189.161.44', 'Opera', 'Autre', 10009),
(135, 1429429732, '93.136.21.41', 'Google Chrome', 'Windows', 10022),
(136, 1429430262, '92.110.43.73', 'Mozilla Firefox', 'Windows', 18),
(137, 1429431653, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(138, 1429433178, '77.219.126.240', 'Google Chrome', 'Linux', 37),
(139, 1429433830, '93.133.1.37', 'Mozilla Firefox', 'Windows', 10020),
(140, 1429435282, '41.189.161.44', 'Opera', 'Autre', 10009),
(141, 1429436659, '37.0.202.192', 'Google Chrome', 'Linux', 37),
(142, 1429436817, '85.138.38.244', 'Google Chrome', 'Windows', 10030),
(143, 1429436872, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(144, 1429436932, '95.90.184.35', 'Google Chrome', 'Windows', 26),
(145, 1429437145, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(146, 1429437223, '89.173.24.62', 'Mozilla Firefox', 'Windows', 20),
(147, 1429437518, '2.40.18.92', 'Google Chrome', 'Windows', 30),
(148, 1429438357, '95.90.184.35', 'Google Chrome', 'Windows', 26),
(149, 1429438487, '93.141.86.46', 'Mozilla Firefox', 'Windows', 10025),
(150, 1429440742, '91.46.251.190', 'Mozilla Firefox', 'Windows', 47),
(151, 1429441029, '2.99.240.236', 'Mozilla Firefox', 'Windows', 10016),
(152, 1429443253, '151.42.104.132', 'Mozilla Firefox', 'Windows', 10028),
(153, 1429443416, '178.209.40.111', 'Google Chrome', 'Windows', 10039),
(154, 1429443885, '41.189.161.44', 'Opera', 'Autre', 10009),
(155, 1429446366, '176.0.72.94', 'Mozilla Firefox', 'Windows', 6),
(156, 1429448708, '93.217.171.211', 'Mozilla Firefox', 'Windows', 10026),
(157, 1429450017, '2.235.63.139', 'Google Chrome', 'Windows', 42),
(158, 1429451387, '81.164.22.254', 'Mozilla Firefox', 'Windows', 1),
(159, 1429451902, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(160, 1429451946, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(161, 1429452892, '92.225.188.161', 'Mozilla Firefox', 'Windows', 4),
(162, 1429455347, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(163, 1429455716, '93.141.86.46', 'Mozilla Firefox', 'Windows', 10025),
(164, 1429456276, '80.138.235.120', 'Mozilla Firefox', 'Windows', 47),
(165, 1429457520, '190.2.96.64', 'Google Chrome', 'Windows', 50),
(166, 1429457540, '74.104.133.123', 'Google Chrome', 'Windows', 27),
(167, 1429459651, '5.187.214.98', 'Google Chrome', 'Windows', 40),
(168, 1429459685, '178.25.44.105', 'Mozilla Firefox', 'Windows', 25),
(169, 1429463068, '92.110.43.73', 'Mozilla Firefox', 'Windows', 18),
(170, 1429463984, '41.189.161.51', 'Opera', 'Autre', 10009),
(171, 1429464253, '37.0.202.192', 'Google Chrome', 'Linux', 37),
(172, 1429464357, '92.224.229.206', 'Google Chrome', 'Windows', 16),
(173, 1429464382, '88.241.86.120', 'Google Chrome', 'Windows', 10000),
(174, 1429465053, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(175, 1429465189, '37.0.202.192', 'Google Chrome', 'Windows', 37),
(176, 1429465195, '178.26.230.26', 'Google Chrome', 'Windows', 5),
(177, 1429465916, '89.115.114.165', 'Google Chrome', 'Windows', 54),
(178, 1429466025, '37.0.200.78', 'Google Chrome', 'Windows', 37),
(179, 1429466189, '83.176.63.212', 'Google Chrome', 'Windows', 37),
(180, 1429466257, '31.45.254.114', 'Mozilla Firefox', 'Windows', 10025),
(181, 1429466796, '41.189.161.51', 'Opera', 'Autre', 10009),
(182, 1429467621, '83.176.63.212', 'Google Chrome', 'Linux', 37),
(183, 1429470053, '41.189.161.51', 'Opera', 'Autre', 10009),
(184, 1429470248, '93.136.21.41', 'Google Chrome', 'Windows', 10022),
(185, 1429472705, '179.7.105.173', 'Google Chrome', 'Windows', 10029),
(186, 1429474217, '41.189.161.51', 'Opera', 'Autre', 10009),
(187, 1429474452, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(188, 1429476057, '90.49.48.186', 'Mozilla Firefox', 'Windows', 3),
(189, 1429478123, '213.93.190.61', 'Mozilla Firefox', 'Windows', 14),
(190, 1429478831, '178.26.230.26', 'Google Chrome', 'Linux', 5),
(191, 1429478888, '41.189.161.51', 'Opera', 'Autre', 10009),
(192, 1429479048, '93.133.1.37', 'Mozilla Firefox', 'Windows', 10020),
(193, 1429487777, 'unknown, 178.209.52.103', 'Google Chrome', 'Windows', 10039),
(194, 1429487840, 'unknown, 178.209.52.103', 'Google Chrome', 'Windows', 1),
(195, 1429518416, '85.243.21.229', 'Google Chrome', 'Windows', 10046),
(196, 1429518441, '222.64.213.70', 'Google Chrome', 'Windows', 10046),
(197, 1429528737, '222.64.213.70', 'Mozilla Firefox', 'Windows', 10046),
(198, 1429732341, '85.243.21.229', 'Google Chrome', 'Windows', 10046),
(199, 1429762003, '77.20.230.250', 'Google Chrome', 'Linux', 10046),
(200, 1429990705, '37.123.112.181', 'Google Chrome', 'Windows', 10046),
(201, 1429995794, '88.253.223.95', 'Google Chrome', 'Windows', 10018),
(202, 1429996529, '37.123.112.181', 'Google Chrome', 'Windows', 10046),
(203, 1430002940, '37.123.112.181', 'Google Chrome', 'Windows', 10046),
(204, 1430004067, '37.123.112.181', 'Google Chrome', 'Windows', 10046),
(205, 1430035376, '::1', 'Google Chrome', 'Windows', 10046),
(206, 1430035443, '::1', 'Google Chrome', 'Windows', 10046),
(207, 1430519087, '::1', 'Google Chrome', 'Windows', 10046),
(208, 1430519227, '::1', 'Google Chrome', 'Windows', 10046),
(209, 1430519255, '::1', 'Google Chrome', 'Windows', 1),
(210, 1430521853, '::1', 'Google Chrome', 'Windows', 1),
(211, 1430522274, '::1', 'Google Chrome', 'Windows', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_log`
--

CREATE TABLE IF NOT EXISTS `uni1_log` (
`id` int(11) unsigned NOT NULL,
  `mode` tinyint(3) unsigned NOT NULL,
  `admin` int(11) unsigned NOT NULL,
  `target` int(11) NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `data` text NOT NULL,
  `universe` tinyint(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_log_fleets`
--

CREATE TABLE IF NOT EXISTS `uni1_log_fleets` (
  `fleet_id` bigint(11) unsigned NOT NULL,
  `fleet_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_mission` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `fleet_amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fleet_array` text,
  `fleet_universe` tinyint(3) unsigned NOT NULL,
  `fleet_start_time` int(11) NOT NULL DEFAULT '0',
  `fleet_start_id` int(11) unsigned NOT NULL,
  `fleet_start_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_start_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_start_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `fleet_end_time` int(11) NOT NULL DEFAULT '0',
  `fleet_end_stay` int(11) NOT NULL DEFAULT '0',
  `fleet_end_id` int(11) unsigned NOT NULL,
  `fleet_end_galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `fleet_end_planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_end_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `fleet_target_obj` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_deuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_elyrium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_301` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_302` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_303` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_304` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_305` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_306` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_307` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_population_309` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_resource_darkmatter` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_target_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_group` varchar(15) NOT NULL DEFAULT '0',
  `fleet_mess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `start_time` int(11) DEFAULT NULL,
  `fleet_busy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fleet_state` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_lostpassword`
--

CREATE TABLE IF NOT EXISTS `uni1_lostpassword` (
  `userID` int(10) unsigned NOT NULL,
  `key` varchar(32) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `hasChanged` tinyint(1) NOT NULL DEFAULT '0',
  `fromIP` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_loteria`
--

CREATE TABLE IF NOT EXISTS `uni1_loteria` (
  `ID` int(11) NOT NULL,
  `user` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `tickets` int(5) NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_loteria_log`
--

CREATE TABLE IF NOT EXISTS `uni1_loteria_log` (
  `username` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `prize` int(11) NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_messages`
--

CREATE TABLE IF NOT EXISTS `uni1_messages` (
`message_id` bigint(20) unsigned NOT NULL,
  `message_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `message_sender` int(11) unsigned NOT NULL DEFAULT '0',
  `message_time` int(11) NOT NULL DEFAULT '0',
  `message_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `message_from` varchar(128) DEFAULT NULL,
  `message_subject` varchar(255) DEFAULT NULL,
  `message_text` text,
  `message_unread` tinyint(4) NOT NULL DEFAULT '1',
  `message_universe` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_message_banned`
--

CREATE TABLE IF NOT EXISTS `uni1_message_banned` (
`id` int(11) unsigned NOT NULL,
  `who` varchar(64) NOT NULL DEFAULT '',
  `theme` varchar(500) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `longer` int(11) NOT NULL DEFAULT '0',
  `author` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `universe` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_minichat`
--

CREATE TABLE IF NOT EXISTS `uni1_minichat` (
`id` int(32) NOT NULL,
  `pseudo` varchar(32) NOT NULL,
  `alliance` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `timestamp` int(255) NOT NULL,
  `color` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_multi`
--

CREATE TABLE IF NOT EXISTS `uni1_multi` (
`multiID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_news`
--

CREATE TABLE IF NOT EXISTS `uni1_news` (
`id` int(11) unsigned NOT NULL,
  `user` varchar(64) NOT NULL,
  `date` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_news`
--

INSERT INTO `uni1_news` (`id`, `user`, `date`, `title`, `text`) VALUES
(1, 'Antaris', 1426810468, 'HORIZON: A new era begins!', 'Dear Emperors or visitors from space,\n<br><br>\nThe team of Antaris Legacy is proud to announce that we has worked in recent weeks to the establishment of what you have long awaited: a new universe.\n<br><br>\nWe were somewhat divided following the community response to the forum, divergent opinions. But Caliban now a year and a half, and it was time to offer the opportunity for new players, such as elders, to start from scratch, and have a chance to be part of the lead.\n<br><br>\nThis has now been done, thanks to Horizon. Get ready for a new race in the standings. Please do not miss the top starting this Friday, April 17 at 18H.\n<br><br>\nHave you always dreamed of being the most powerful emperor of the universe? Fly into a new adventure and an unexplored universe!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_newsfeed`
--

CREATE TABLE IF NOT EXISTS `uni1_newsfeed` (
`feedID` int(11) NOT NULL,
  `username` int(11) NOT NULL DEFAULT '0',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8 NOT NULL,
  `accepted` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_until` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `uni1_newsfeed`
--

INSERT INTO `uni1_newsfeed` (`feedID`, `username`, `date`, `message`, `accepted`, `valid_until`) VALUES
(1, 27, 1429321907, 'Veni Vidi Vici  (V V V) ALLY OPEN ONLY ACTIVE PLAYERS', 1, 1429408633);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_notes`
--

CREATE TABLE IF NOT EXISTS `uni1_notes` (
`id` int(11) NOT NULL,
  `owner` int(11) unsigned DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `priority` tinyint(1) unsigned DEFAULT '1',
  `title` varchar(32) DEFAULT NULL,
  `text` text,
  `universe` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_paypal`
--

CREATE TABLE IF NOT EXISTS `uni1_paypal` (
`id` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_paypal_log`
--

CREATE TABLE IF NOT EXISTS `uni1_paypal_log` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `darkmatter` double(50,0) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_paysafecard_log`
--

CREATE TABLE IF NOT EXISTS `uni1_paysafecard_log` (
`payID` int(11) NOT NULL,
  `userID` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `pinCode` text,
  `pinPrice` int(11) unsigned NOT NULL DEFAULT '0',
  `pinCredits` int(11) unsigned NOT NULL DEFAULT '0',
  `pinType` varchar(255) DEFAULT NULL,
  `pinAprouved` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `key` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_planets`
--

CREATE TABLE IF NOT EXISTS `uni1_planets` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(20) DEFAULT 'Hauptplanet',
  `id_owner` int(11) unsigned DEFAULT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  `galaxy` tinyint(3) NOT NULL DEFAULT '0',
  `system` smallint(5) NOT NULL DEFAULT '0',
  `planet` tinyint(3) NOT NULL DEFAULT '0',
  `last_update` int(11) DEFAULT NULL,
  `planet_type` enum('1','3') NOT NULL DEFAULT '1',
  `destruyed` int(11) NOT NULL DEFAULT '0',
  `b_building` int(11) NOT NULL DEFAULT '0',
  `b_building_id` text,
  `b_hangar` int(11) NOT NULL DEFAULT '0',
  `b_hangar_id` text,
  `b_hangar_plus` int(11) NOT NULL DEFAULT '0',
  `b_defense` int(11) NOT NULL DEFAULT '0',
  `b_defense_id` text,
  `b_defense_plus` int(11) NOT NULL DEFAULT '0',
  `image` varchar(32) NOT NULL DEFAULT 'normaltempplanet01',
  `diameter` int(11) unsigned NOT NULL DEFAULT '12800',
  `field_current` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field_max` smallint(5) unsigned NOT NULL DEFAULT '163',
  `temp_min` int(3) NOT NULL DEFAULT '-17',
  `temp_max` int(3) NOT NULL DEFAULT '23',
  `eco_hash` varchar(32) NOT NULL DEFAULT '',
  `formation` int(11) unsigned NOT NULL DEFAULT '0',
  `formation_used` bigint(11) unsigned NOT NULL DEFAULT '0',
  `metal` double(50,6) unsigned NOT NULL DEFAULT '0.000000',
  `metal_perhour` double(50,6) NOT NULL DEFAULT '0.000000',
  `metal_max` double(50,0) unsigned DEFAULT '100000',
  `crystal` double(50,6) unsigned NOT NULL DEFAULT '0.000000',
  `crystal_perhour` double(50,6) NOT NULL DEFAULT '0.000000',
  `crystal_max` double(50,0) unsigned DEFAULT '100000',
  `deuterium` double(50,6) unsigned NOT NULL DEFAULT '0.000000',
  `deuterium_perhour` double(50,6) NOT NULL DEFAULT '0.000000',
  `deuterium_max` double(50,0) unsigned DEFAULT '100000',
  `elyrium` double(50,6) unsigned NOT NULL DEFAULT '0.000000',
  `elyrium_perhour` double(50,6) unsigned NOT NULL DEFAULT '0.000000',
  `elyrium_max` double(50,0) unsigned NOT NULL DEFAULT '100000',
  `energy_used` double(50,0) NOT NULL DEFAULT '0',
  `energy` double(50,0) unsigned NOT NULL DEFAULT '0',
  `metal_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metal_mine_extract` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_mine_extract` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_sintetizer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_sintetizer_extract` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `elyrium_mine` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `elyrium_mine_extract` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `solar_plant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `solar_plant_extract` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fusion_plant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `robot_factory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nano_factory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hangar` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metal_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `elyrium_store` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `laboratory` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `terraformer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `university` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_deposit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `silo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mondbasis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `phalanx` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sprungtor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `antaris_headpost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `headquarters_antaris` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `barracks` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `defense_base` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `small_ship_cargo` bigint(20) unsigned NOT NULL DEFAULT '0',
  `big_ship_cargo` bigint(20) unsigned NOT NULL DEFAULT '0',
  `light_hunter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `heavy_hunter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `crusher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `battle_ship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `colonizer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `recycler` bigint(20) unsigned NOT NULL DEFAULT '0',
  `spy_sonde` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bomber_ship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `solar_satelit` bigint(20) unsigned NOT NULL DEFAULT '0',
  `destructor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dearth_star` bigint(20) unsigned NOT NULL DEFAULT '0',
  `battleship` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lune_noir` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ev_transporter` bigint(20) unsigned NOT NULL DEFAULT '0',
  `star_crasher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `giga_recykler` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dm_ship` bigint(20) NOT NULL DEFAULT '0',
  `elyrium_reactor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `energy_modulator` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mid_recycler` double(50,0) unsigned NOT NULL DEFAULT '0',
  `spy_sonde_portal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `orbital_station` bigint(20) unsigned NOT NULL DEFAULT '0',
  `misil_launcher` bigint(20) unsigned NOT NULL DEFAULT '0',
  `small_laser` bigint(20) unsigned NOT NULL DEFAULT '0',
  `big_laser` bigint(20) unsigned NOT NULL DEFAULT '0',
  `gauss_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ionic_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `buster_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `small_protection_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `planet_protector` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `big_protection_shield` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `graviton_canyon` bigint(20) unsigned NOT NULL DEFAULT '0',
  `interceptor_misil` bigint(20) unsigned NOT NULL DEFAULT '0',
  `interplanetary_misil` bigint(20) unsigned NOT NULL DEFAULT '0',
  `metal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `metal_mine_extract_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `crystal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `crystal_mine_extract_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `deuterium_sintetizer_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `deuterium_sintetizer_extract_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `solar_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `solar_plant_extract_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `elyrium_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `elyrium_mine_extract_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `fusion_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `solar_satelit_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `barracks_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '10',
  `last_jump_time` int(11) NOT NULL DEFAULT '0',
  `der_metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `der_crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `der_deuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `id_luna` int(11) NOT NULL DEFAULT '0',
  `teleport_portal` int(11) unsigned NOT NULL DEFAULT '1',
  `teleport_portal_timer` int(11) unsigned NOT NULL DEFAULT '0',
  `force_field_timer` int(11) unsigned NOT NULL DEFAULT '0',
  `force_field_timer_bis` int(11) unsigned NOT NULL DEFAULT '0',
  `siege_on` int(11) unsigned NOT NULL DEFAULT '0',
  `ordernumber` int(11) unsigned NOT NULL DEFAULT '0',
  `metal_bunker` bigint(20) unsigned NOT NULL DEFAULT '0',
  `crystal_bunker` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deuterium_bunker` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elyrium_bunker` bigint(20) unsigned NOT NULL DEFAULT '0',
  `metal_bunker_in` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_bunker_in` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_bunker_in` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `elyrium_bunker_in` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `civil` bigint(20) unsigned NOT NULL DEFAULT '0',
  `technician` bigint(20) unsigned NOT NULL DEFAULT '0',
  `scientist` bigint(20) unsigned NOT NULL DEFAULT '0',
  `archaeologist` bigint(20) unsigned NOT NULL DEFAULT '0',
  `diplomat` bigint(20) unsigned NOT NULL DEFAULT '0',
  `soldier` bigint(20) unsigned NOT NULL DEFAULT '0',
  `adv_soldier` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pilot` bigint(20) unsigned NOT NULL DEFAULT '0',
  `antaris` bigint(20) unsigned NOT NULL DEFAULT '0',
  `technician_used` bigint(20) unsigned NOT NULL DEFAULT '0',
  `scientis_used` bigint(20) unsigned NOT NULL DEFAULT '0',
  `civil_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `technician_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `scientist_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `archaeologist_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `diplomat_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `soldier_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `adv_soldier_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pilot_prod` bigint(20) unsigned NOT NULL DEFAULT '0',
  `colo_metal` int(11) NOT NULL DEFAULT '0',
  `colo_crystal` int(11) NOT NULL DEFAULT '0',
  `colo_deut` int(11) NOT NULL DEFAULT '0',
  `colo_elyrium` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1888 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_planets`
--

INSERT INTO `uni1_planets` (`id`, `name`, `id_owner`, `universe`, `galaxy`, `system`, `planet`, `last_update`, `planet_type`, `destruyed`, `b_building`, `b_building_id`, `b_hangar`, `b_hangar_id`, `b_hangar_plus`, `b_defense`, `b_defense_id`, `b_defense_plus`, `image`, `diameter`, `field_current`, `field_max`, `temp_min`, `temp_max`, `eco_hash`, `formation`, `formation_used`, `metal`, `metal_perhour`, `metal_max`, `crystal`, `crystal_perhour`, `crystal_max`, `deuterium`, `deuterium_perhour`, `deuterium_max`, `elyrium`, `elyrium_perhour`, `elyrium_max`, `energy_used`, `energy`, `metal_mine`, `metal_mine_extract`, `crystal_mine`, `crystal_mine_extract`, `deuterium_sintetizer`, `deuterium_sintetizer_extract`, `elyrium_mine`, `elyrium_mine_extract`, `solar_plant`, `solar_plant_extract`, `fusion_plant`, `robot_factory`, `nano_factory`, `hangar`, `metal_store`, `crystal_store`, `deuterium_store`, `elyrium_store`, `laboratory`, `terraformer`, `university`, `ally_deposit`, `silo`, `mondbasis`, `phalanx`, `sprungtor`, `antaris_headpost`, `headquarters_antaris`, `barracks`, `defense_base`, `small_ship_cargo`, `big_ship_cargo`, `light_hunter`, `heavy_hunter`, `crusher`, `battle_ship`, `colonizer`, `recycler`, `spy_sonde`, `bomber_ship`, `solar_satelit`, `destructor`, `dearth_star`, `battleship`, `lune_noir`, `ev_transporter`, `star_crasher`, `giga_recykler`, `dm_ship`, `elyrium_reactor`, `energy_modulator`, `mid_recycler`, `spy_sonde_portal`, `orbital_station`, `misil_launcher`, `small_laser`, `big_laser`, `gauss_canyon`, `ionic_canyon`, `buster_canyon`, `small_protection_shield`, `planet_protector`, `big_protection_shield`, `graviton_canyon`, `interceptor_misil`, `interplanetary_misil`, `metal_mine_porcent`, `metal_mine_extract_porcent`, `crystal_mine_porcent`, `crystal_mine_extract_porcent`, `deuterium_sintetizer_porcent`, `deuterium_sintetizer_extract_porcent`, `solar_plant_porcent`, `solar_plant_extract_porcent`, `elyrium_mine_porcent`, `elyrium_mine_extract_porcent`, `fusion_plant_porcent`, `solar_satelit_porcent`, `barracks_porcent`, `last_jump_time`, `der_metal`, `der_crystal`, `der_deuterium`, `id_luna`, `teleport_portal`, `teleport_portal_timer`, `force_field_timer`, `force_field_timer_bis`, `siege_on`, `ordernumber`, `metal_bunker`, `crystal_bunker`, `deuterium_bunker`, `elyrium_bunker`, `metal_bunker_in`, `crystal_bunker_in`, `deuterium_bunker_in`, `elyrium_bunker_in`, `civil`, `technician`, `scientist`, `archaeologist`, `diplomat`, `soldier`, `adv_soldier`, `pilot`, `antaris`, `technician_used`, `scientis_used`, `civil_prod`, `technician_prod`, `scientist_prod`, `archaeologist_prod`, `diplomat_prod`, `soldier_prod`, `adv_soldier_prod`, `pilot_prod`, `colo_metal`, `colo_crystal`, `colo_deut`, `colo_elyrium`) VALUES
(1, 'Antaris-Legacy', 1, 1, 1, 200, 1, 1430522816, '1', 0, 0, '', 0, '', 0, 0, '', 0, '8', 10198, 9, 163, 208, 248, '08f803b25ed3365a3208cc73da0aa8b4', 750, 0, 62108.556452, 0.000000, 100000, 48242.468548, 0.000000, 80000, 37802.632473, 0.000000, 60000, 21390.923115, 0.000000, 40000, 0, 586, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '10', '10', '10', '10', '10', '10', '10', '10', '10', '10', '10', '10', '10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4000, 0, 2000, 1920, 0, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_raports`
--

CREATE TABLE IF NOT EXISTS `uni1_raports` (
  `rid` varchar(32) NOT NULL,
  `raport` text NOT NULL,
  `time` int(11) NOT NULL,
  `attacker` varchar(255) NOT NULL DEFAULT '',
  `defender` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_records`
--

CREATE TABLE IF NOT EXISTS `uni1_records` (
  `userID` int(10) unsigned NOT NULL,
  `elementID` smallint(5) unsigned NOT NULL,
  `level` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_reward`
--

CREATE TABLE IF NOT EXISTS `uni1_reward` (
`rewardId` int(11) unsigned NOT NULL,
  `rewardCode` varchar(255) NOT NULL,
  `rewardMetal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `rewardCrystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `rewardDeuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `rewardDarkmatter` double(50,0) unsigned NOT NULL DEFAULT '0',
  `rewardAntimatter` double(50,0) unsigned NOT NULL DEFAULT '0',
  `rewardCount` int(11) NOT NULL DEFAULT '0',
  `rewardUserLimit` int(11) NOT NULL DEFAULT '0',
  `universe` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_reward_log`
--

CREATE TABLE IF NOT EXISTS `uni1_reward_log` (
  `rewardIdLog` int(11) unsigned NOT NULL DEFAULT '0',
  `rewardUserId` int(11) unsigned NOT NULL DEFAULT '0',
  `rewardTime` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_session`
--

CREATE TABLE IF NOT EXISTS `uni1_session` (
  `sessionID` varchar(32) NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `userIP` varchar(40) NOT NULL,
  `lastonline` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_session`
--

INSERT INTO `uni1_session` (`sessionID`, `userID`, `userIP`, `lastonline`) VALUES
('8hnk7g1rrvf08r9ujrnb0dl880', 1, '::1', 1430522816);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_shortcuts`
--

CREATE TABLE IF NOT EXISTS `uni1_shortcuts` (
`shortcutID` int(10) unsigned NOT NULL,
  `ownerID` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `galaxy` tinyint(3) unsigned NOT NULL,
  `system` smallint(5) unsigned NOT NULL,
  `planet` tinyint(3) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_stathistory`
--

CREATE TABLE IF NOT EXISTS `uni1_stathistory` (
  `id_owner` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `universe` tinyint(4) NOT NULL,
  `history_build_points` double(50,0) NOT NULL,
  `history_tech_points` double(50,0) NOT NULL,
  `history_fleet_points` double(50,0) NOT NULL,
  `history_defs_points` double(50,0) NOT NULL,
  `history_popu_points` double(50,0) NOT NULL,
  `history_total_points` double(50,0) NOT NULL,
  `history_total_rank` double(50,0) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `uni1_stathistory`
--

INSERT INTO `uni1_stathistory` (`id_owner`, `time`, `universe`, `history_build_points`, `history_tech_points`, `history_fleet_points`, `history_defs_points`, `history_popu_points`, `history_total_points`, `history_total_rank`) VALUES
(1, 1430521854, 1, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_statpoints`
--

CREATE TABLE IF NOT EXISTS `uni1_statpoints` (
  `id_owner` int(11) unsigned NOT NULL DEFAULT '0',
  `id_ally` int(11) unsigned NOT NULL DEFAULT '0',
  `stat_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tech_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `tech_old_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `tech_points` double(50,0) unsigned NOT NULL DEFAULT '0',
  `tech_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `build_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `build_old_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `build_points` double(50,0) unsigned NOT NULL DEFAULT '0',
  `build_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `defs_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `defs_old_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `defs_points` double(50,0) unsigned NOT NULL DEFAULT '0',
  `defs_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `popu_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `popu_old_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `popu_points` int(11) unsigned NOT NULL DEFAULT '0',
  `popu_count` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_old_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_points` double(50,0) unsigned NOT NULL DEFAULT '0',
  `fleet_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `total_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `total_old_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `total_points` double(50,0) unsigned NOT NULL DEFAULT '0',
  `total_count` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_statpoints`
--

INSERT INTO `uni1_statpoints` (`id_owner`, `id_ally`, `stat_type`, `universe`, `tech_rank`, `tech_old_rank`, `tech_points`, `tech_count`, `build_rank`, `build_old_rank`, `build_points`, `build_count`, `defs_rank`, `defs_old_rank`, `defs_points`, `defs_count`, `popu_rank`, `popu_old_rank`, `popu_points`, `popu_count`, `fleet_rank`, `fleet_old_rank`, `fleet_points`, `fleet_count`, `total_rank`, `total_old_rank`, `total_points`, `total_count`) VALUES
(1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_ticket`
--

CREATE TABLE IF NOT EXISTS `uni1_ticket` (
`ticketID` int(10) unsigned NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  `ownerID` int(10) unsigned NOT NULL,
  `categoryID` tinyint(1) unsigned NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_ticket_answer`
--

CREATE TABLE IF NOT EXISTS `uni1_ticket_answer` (
`answerID` int(10) unsigned NOT NULL,
  `ownerID` int(10) unsigned NOT NULL,
  `ownerName` varchar(32) NOT NULL,
  `ticketID` int(10) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_ticket_category`
--

CREATE TABLE IF NOT EXISTS `uni1_ticket_category` (
`categoryID` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_ticket_category`
--

INSERT INTO `uni1_ticket_category` (`categoryID`, `name`) VALUES
(1, 'Support');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_topkb`
--

CREATE TABLE IF NOT EXISTS `uni1_topkb` (
  `rid` varchar(32) NOT NULL,
  `units` double(50,0) unsigned NOT NULL,
  `result` varchar(1) NOT NULL,
  `time` int(11) NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_transport_player`
--

CREATE TABLE IF NOT EXISTS `uni1_transport_player` (
`transportID` int(11) NOT NULL,
  `senderID` int(11) unsigned NOT NULL DEFAULT '0',
  `receiverID` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `strongest` int(11) unsigned NOT NULL DEFAULT '0',
  `push` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resource_metal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `resource_crystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `resource_deuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `resource_elyrium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `population301` double(50,0) unsigned NOT NULL DEFAULT '0',
  `population302` double(50,0) unsigned NOT NULL DEFAULT '0',
  `population303` double(50,0) unsigned NOT NULL DEFAULT '0',
  `population304` double(50,0) unsigned NOT NULL DEFAULT '0',
  `population305` double(50,0) unsigned NOT NULL DEFAULT '0',
  `population306` double(50,0) unsigned NOT NULL DEFAULT '0',
  `population307` double(50,0) unsigned NOT NULL DEFAULT '0',
  `legal` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delete` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_users`
--

CREATE TABLE IF NOT EXISTS `uni1_users` (
`id` int(11) unsigned NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `email_2` varchar(64) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar_defaut.jpg',
  `lang` varchar(2) NOT NULL DEFAULT 'de',
  `authattack` tinyint(1) NOT NULL DEFAULT '0',
  `authlevel` tinyint(1) NOT NULL DEFAULT '0',
  `rights` text,
  `id_planet` int(11) unsigned NOT NULL DEFAULT '0',
  `universe` tinyint(3) unsigned NOT NULL,
  `galaxy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `system` smallint(5) unsigned NOT NULL DEFAULT '0',
  `planet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `darkmatter` double(50,0) NOT NULL DEFAULT '0',
  `user_lastip` varchar(40) NOT NULL DEFAULT '',
  `ip_at_reg` varchar(40) NOT NULL DEFAULT '',
  `register_time` int(11) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `dpath` varchar(20) NOT NULL DEFAULT 'gow',
  `timezone` varchar(32) NOT NULL DEFAULT 'Europe/London',
  `planet_sort` tinyint(1) NOT NULL DEFAULT '0',
  `planet_sort_order` tinyint(1) NOT NULL DEFAULT '0',
  `spio_anz` int(10) unsigned NOT NULL DEFAULT '1',
  `settings_fleetactions` tinyint(2) unsigned NOT NULL DEFAULT '3',
  `settings_esp` tinyint(1) NOT NULL DEFAULT '1',
  `settings_wri` tinyint(1) NOT NULL DEFAULT '1',
  `settings_bud` tinyint(1) NOT NULL DEFAULT '1',
  `settings_mis` tinyint(1) NOT NULL DEFAULT '1',
  `settings_blockPM` tinyint(1) NOT NULL DEFAULT '0',
  `urlaubs_modus` tinyint(1) NOT NULL DEFAULT '0',
  `urlaubs_until` int(11) NOT NULL DEFAULT '0',
  `db_deaktjava` int(11) NOT NULL DEFAULT '0',
  `b_tech_planet` int(11) unsigned NOT NULL DEFAULT '0',
  `b_tech` int(11) unsigned NOT NULL DEFAULT '0',
  `b_tech_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `b_tech_queue` text,
  `spy_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `computer_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `military_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `defence_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shield_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `energy_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hyperspace_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `combustion_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `impulse_motor_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hyperspace_motor_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `laser_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ionic_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `buster_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `intergalactic_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expedition_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metal_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crystal_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deuterium_proc_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `graviton_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `extraction_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subspace_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `particle_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `antaris_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `infrastructure_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `virus_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `forcefield_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `occultation_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sensors_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `control_room_tech` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ally_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ally_register_time` int(11) NOT NULL DEFAULT '0',
  `ally_rank_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `next_ally_register` int(11) unsigned NOT NULL DEFAULT '0',
  `rpg_geologue` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `rpg_amiral` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_ingenieur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_technocrate` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_espion` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_constructeur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_scientifique` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_commandant` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_stockeur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_defenseur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_destructeur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_general` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_bunker` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_raideur` tinyint(2) NOT NULL DEFAULT '0',
  `rpg_empereur` tinyint(22) NOT NULL DEFAULT '0',
  `bana` tinyint(1) NOT NULL DEFAULT '0',
  `banaday` int(11) NOT NULL DEFAULT '0',
  `hof` tinyint(4) NOT NULL DEFAULT '0',
  `spyMessagesMode` tinyint(1) NOT NULL DEFAULT '0',
  `wons` int(11) unsigned NOT NULL DEFAULT '0',
  `loos` int(11) unsigned NOT NULL DEFAULT '0',
  `draws` int(11) unsigned NOT NULL DEFAULT '0',
  `kbmetal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `kbcrystal` double(50,0) unsigned NOT NULL DEFAULT '0',
  `kbdeuterium` double(50,0) unsigned NOT NULL DEFAULT '0',
  `lostunits` double(50,0) unsigned NOT NULL DEFAULT '0',
  `desunits` double(50,0) unsigned NOT NULL DEFAULT '0',
  `uctime` int(11) NOT NULL DEFAULT '0',
  `setmail` int(11) NOT NULL DEFAULT '0',
  `dm_attack` int(11) NOT NULL DEFAULT '0',
  `dm_defensive` int(11) NOT NULL DEFAULT '0',
  `dm_buildtime` int(11) NOT NULL DEFAULT '0',
  `dm_researchtime` int(11) NOT NULL DEFAULT '0',
  `dm_resource` int(11) NOT NULL DEFAULT '0',
  `dm_energie` int(11) NOT NULL DEFAULT '0',
  `dm_fleettime` int(11) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `ref_bonus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inactive_mail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `intro` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_deleted` int(11) unsigned NOT NULL DEFAULT '0',
  `multi_spotted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mode_chaine` int(11) unsigned NOT NULL DEFAULT '0',
  `mode_rapide` int(11) unsigned NOT NULL DEFAULT '0',
  `date_of_birth` int(11) DEFAULT NULL,
  `year` int(11) NOT NULL DEFAULT '2015',
  `sexe` varchar(5) DEFAULT NULL,
  `planet_cloak` int(11) unsigned NOT NULL DEFAULT '0',
  `planet_cloak_countdown` int(11) unsigned NOT NULL DEFAULT '0',
  `immunity_until` int(11) unsigned NOT NULL DEFAULT '0',
  `next_immunity` int(11) unsigned NOT NULL DEFAULT '0',
  `hln_post` int(11) unsigned NOT NULL DEFAULT '0',
  `achievement_todo` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ragnar_item` int(11) unsigned NOT NULL DEFAULT '0',
  `khufu_item` int(11) unsigned NOT NULL DEFAULT '0',
  `amplificateur_item` int(11) unsigned NOT NULL DEFAULT '0',
  `malvar_item` int(11) unsigned NOT NULL DEFAULT '0',
  `fleet_manage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `max_explore` int(11) unsigned NOT NULL DEFAULT '0',
  `chat_visit` int(11) unsigned NOT NULL DEFAULT '0',
  `message_ban` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `message_ban_time` int(11) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(11) unsigned NOT NULL DEFAULT '0',
  `v1` int(11) unsigned NOT NULL DEFAULT '0',
  `custom_color` varchar(55) DEFAULT NULL,
  `galaxy_space` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=10047 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_users`
--

INSERT INTO `uni1_users` (`id`, `username`, `password`, `email`, `email_2`, `avatar`, `lang`, `authattack`, `authlevel`, `rights`, `id_planet`, `universe`, `galaxy`, `system`, `planet`, `darkmatter`, `user_lastip`, `ip_at_reg`, `register_time`, `onlinetime`, `dpath`, `timezone`, `planet_sort`, `planet_sort_order`, `spio_anz`, `settings_fleetactions`, `settings_esp`, `settings_wri`, `settings_bud`, `settings_mis`, `settings_blockPM`, `urlaubs_modus`, `urlaubs_until`, `db_deaktjava`, `b_tech_planet`, `b_tech`, `b_tech_id`, `b_tech_queue`, `spy_tech`, `computer_tech`, `military_tech`, `defence_tech`, `shield_tech`, `energy_tech`, `hyperspace_tech`, `combustion_tech`, `impulse_motor_tech`, `hyperspace_motor_tech`, `laser_tech`, `ionic_tech`, `buster_tech`, `intergalactic_tech`, `expedition_tech`, `metal_proc_tech`, `crystal_proc_tech`, `deuterium_proc_tech`, `graviton_tech`, `extraction_tech`, `subspace_tech`, `particle_tech`, `antaris_tech`, `infrastructure_tech`, `virus_tech`, `forcefield_tech`, `occultation_tech`, `sensors_tech`, `control_room_tech`, `ally_id`, `ally_register_time`, `ally_rank_id`, `next_ally_register`, `rpg_geologue`, `rpg_amiral`, `rpg_ingenieur`, `rpg_technocrate`, `rpg_espion`, `rpg_constructeur`, `rpg_scientifique`, `rpg_commandant`, `rpg_stockeur`, `rpg_defenseur`, `rpg_destructeur`, `rpg_general`, `rpg_bunker`, `rpg_raideur`, `rpg_empereur`, `bana`, `banaday`, `hof`, `spyMessagesMode`, `wons`, `loos`, `draws`, `kbmetal`, `kbcrystal`, `kbdeuterium`, `lostunits`, `desunits`, `uctime`, `setmail`, `dm_attack`, `dm_defensive`, `dm_buildtime`, `dm_researchtime`, `dm_resource`, `dm_energie`, `dm_fleettime`, `ref_id`, `ref_bonus`, `inactive_mail`, `intro`, `user_deleted`, `multi_spotted`, `mode_chaine`, `mode_rapide`, `date_of_birth`, `year`, `sexe`, `planet_cloak`, `planet_cloak_countdown`, `immunity_until`, `next_immunity`, `hln_post`, `achievement_todo`, `ragnar_item`, `khufu_item`, `amplificateur_item`, `malvar_item`, `fleet_manage`, `max_explore`, `chat_visit`, `message_ban`, `message_ban_time`, `vote_count`, `v1`, `custom_color`, `galaxy_space`) VALUES
(1, 'Admin', '$2a$09$MhPS.okDO52xiw/7rX0s9upqkXH8w7P9nxqDiUTx2.0C9inMnLWIS', '', '', 'avatar_defaut.jpg', 'en', 3, 3, NULL, 1, 1, 1, 92, 2, 5, '::1', '178.209.52.103', 1429443275, 1430522816, 'gow', 'Europe/Brussels', 0, 0, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 2015, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1429443295, 0, 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_users_to_acs`
--

CREATE TABLE IF NOT EXISTS `uni1_users_to_acs` (
  `userID` int(10) unsigned NOT NULL,
  `acsID` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_users_to_extauth`
--

CREATE TABLE IF NOT EXISTS `uni1_users_to_extauth` (
  `id` int(11) NOT NULL,
  `account` varchar(64) NOT NULL,
  `mode` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_users_to_topkb`
--

CREATE TABLE IF NOT EXISTS `uni1_users_to_topkb` (
  `rid` varchar(32) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `role` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_users_valid`
--

CREATE TABLE IF NOT EXISTS `uni1_users_valid` (
`validationID` int(11) unsigned NOT NULL,
  `userName` varchar(64) NOT NULL,
  `validationKey` varchar(32) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(64) NOT NULL,
  `planetName` varchar(500) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `language` varchar(3) NOT NULL,
  `universe` tinyint(3) unsigned NOT NULL,
  `referralID` int(11) DEFAULT NULL,
  `externalAuthUID` varchar(128) DEFAULT NULL,
  `externalAuthMethod` varchar(32) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_vars`
--

CREATE TABLE IF NOT EXISTS `uni1_vars` (
  `elementID` smallint(5) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `class` int(11) NOT NULL,
  `onPlanetType` set('1','3') NOT NULL,
  `onePerPlanet` tinyint(4) NOT NULL,
  `factor` float(4,2) NOT NULL,
  `maxLevel` int(11) DEFAULT NULL,
  `cost901` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cost902` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cost903` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cost904` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cost905` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cost911` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cost921` bigint(20) unsigned NOT NULL DEFAULT '0',
  `consumption1` int(11) unsigned DEFAULT NULL,
  `consumption2` int(11) unsigned DEFAULT NULL,
  `speedTech` int(11) unsigned DEFAULT NULL,
  `speed1` int(11) unsigned DEFAULT NULL,
  `speed2` int(11) unsigned DEFAULT NULL,
  `speed2Tech` int(10) unsigned DEFAULT NULL,
  `speed2onLevel` int(10) unsigned DEFAULT NULL,
  `speed3Tech` int(10) unsigned DEFAULT NULL,
  `speed3onLevel` int(10) unsigned DEFAULT NULL,
  `capacity` int(11) unsigned DEFAULT NULL,
  `attack` int(10) unsigned DEFAULT NULL,
  `defend` int(10) unsigned DEFAULT NULL,
  `timeBonus` int(11) unsigned DEFAULT NULL,
  `bonusAttack` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusDefensive` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusShield` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusBuildTime` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusResearchTime` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusShipTime` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusDefensiveTime` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusResource` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusEnergy` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusResourceStorage` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusShipStorage` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusFlyTime` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusFleetSlots` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusPlanets` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusSpyPower` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusExpedition` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusGateCoolTime` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusMoreFound` float(4,2) NOT NULL DEFAULT '0.00',
  `bonusAttackUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusDefensiveUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusShieldUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusBuildTimeUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusResearchTimeUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusShipTimeUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusDefensiveTimeUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusResourceUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusEnergyUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusResourceStorageUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusShipStorageUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusFlyTimeUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusFleetSlotsUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusPlanetsUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusSpyPowerUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusExpeditionUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusGateCoolTimeUnit` smallint(1) NOT NULL DEFAULT '0',
  `bonusMoreFoundUnit` smallint(1) NOT NULL DEFAULT '0',
  `speedFleetFactor` float(4,2) DEFAULT NULL,
  `production901` varchar(255) DEFAULT NULL,
  `production902` varchar(255) DEFAULT NULL,
  `production903` varchar(255) DEFAULT NULL,
  `production904` varchar(255) DEFAULT NULL,
  `production905` varchar(255) DEFAULT NULL,
  `production911` varchar(255) DEFAULT NULL,
  `production921` varchar(255) DEFAULT NULL,
  `storage901` varchar(255) DEFAULT NULL,
  `storage902` varchar(255) DEFAULT NULL,
  `storage903` varchar(255) DEFAULT NULL,
  `storage904` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_vars`
--

INSERT INTO `uni1_vars` (`elementID`, `name`, `class`, `onPlanetType`, `onePerPlanet`, `factor`, `maxLevel`, `cost901`, `cost902`, `cost903`, `cost904`, `cost905`, `cost911`, `cost921`, `consumption1`, `consumption2`, `speedTech`, `speed1`, `speed2`, `speed2Tech`, `speed2onLevel`, `speed3Tech`, `speed3onLevel`, `capacity`, `attack`, `defend`, `timeBonus`, `bonusAttack`, `bonusDefensive`, `bonusShield`, `bonusBuildTime`, `bonusResearchTime`, `bonusShipTime`, `bonusDefensiveTime`, `bonusResource`, `bonusEnergy`, `bonusResourceStorage`, `bonusShipStorage`, `bonusFlyTime`, `bonusFleetSlots`, `bonusPlanets`, `bonusSpyPower`, `bonusExpedition`, `bonusGateCoolTime`, `bonusMoreFound`, `bonusAttackUnit`, `bonusDefensiveUnit`, `bonusShieldUnit`, `bonusBuildTimeUnit`, `bonusResearchTimeUnit`, `bonusShipTimeUnit`, `bonusDefensiveTimeUnit`, `bonusResourceUnit`, `bonusEnergyUnit`, `bonusResourceStorageUnit`, `bonusShipStorageUnit`, `bonusFlyTimeUnit`, `bonusFleetSlotsUnit`, `bonusPlanetsUnit`, `bonusSpyPowerUnit`, `bonusExpeditionUnit`, `bonusGateCoolTimeUnit`, `bonusMoreFoundUnit`, `speedFleetFactor`, `production901`, `production902`, `production903`, `production904`, `production905`, `production911`, `production921`, `storage901`, `storage902`, `storage903`, `storage904`) VALUES
(1, 'metal_mine', 0, '1', 0, 1.50, 255, 150, 60, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '(40 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, '-(10 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(2, 'crystal_mine', 0, '1', 0, 1.50, 255, 200, 150, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '(30 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, '-(10 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor);', NULL, NULL, NULL, NULL, NULL),
(3, 'deuterium_sintetizer', 0, '1', 0, 1.50, 255, 300, 160, 5, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '(20 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, '- (30 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(4, 'solar_plant', 0, '1', 0, 1.50, 255, 150, 75, 30, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '(20 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(6, 'university', 0, '1', 0, 2.00, 255, 100000000, 50000000, 25000000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.08, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'fusion_plant', 0, '1', 0, 2.00, 255, 900, 360, 180, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '- (10 * $BuildLevel * pow(1.1,$BuildLevel) * (0.1 * $BuildLevelFactor))', NULL, NULL, '(30 * $BuildLevel * pow((1.05 + $BuildEnergy * 0.01), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(14, 'robot_factory', 0, '1,3', 0, 2.00, 255, 1000, 600, 200, 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'nano_factory', 0, '1', 0, 2.00, 255, 1000000, 500000, 100000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'hangar', 0, '1,3', 0, 2.00, 255, 500, 400, 250, 50, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'metal_store', 0, '1,3', 0, 2.00, 255, 12500, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pow(2, $BuildLevel) * 100000', NULL, NULL, NULL),
(23, 'crystal_store', 0, '1,3', 0, 2.00, 255, 12500, 6250, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pow(2, $BuildLevel) * 80000', NULL, NULL),
(24, 'deuterium_store', 0, '1,3', 0, 2.00, 255, 12500, 6250, 3125, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pow(2, $BuildLevel) * 60000', NULL),
(31, 'laboratory', 0, '1', 0, 2.00, 255, 2000, 4000, 500, 100, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'terraformer', 0, '1', 0, 2.00, 255, 1000000, 800000, 400000, 200000, 0, 800, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'ally_deposit', 0, '1', 0, 2.00, 255, 20000, 40000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'mondbasis', 0, '3', 0, 2.00, 255, 20000, 40000, 20000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'phalanx', 0, '3', 0, 2.00, 255, 20000, 40000, 20000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'sprungtor', 0, '3', 0, 2.00, 255, 2000000, 4000000, 2000000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'silo', 0, '1', 0, 2.00, 255, 20000, 20000, 1000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'spy_tech', 100, '1,3', 0, 2.00, 255, 1200, 2400, 400, 200, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'computer_tech', 100, '1,3', 0, 2.00, 255, 0, 400, 600, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'military_tech', 100, '1,3', 0, 2.00, 255, 1000, 250, 125, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'defence_tech', 100, '1,3', 0, 2.00, 255, 1500, 100, 250, 500, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'shield_tech', 100, '1,3', 0, 2.00, 255, 400, 1200, 600, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'energy_tech', 100, '1,3', 0, 2.00, 255, 500, 600, 50, 10, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'hyperspace_tech', 100, '1,3', 0, 2.00, 255, 0, 4000, 2000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'combustion_tech', 100, '1,3', 0, 2.00, 255, 500, 400, 800, 200, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -0.01, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'impulse_motor_tech', 100, '1,3', 0, 2.00, 255, 1000, 1500, 2000, 750, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -0.02, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'hyperspace_motor_tech', 100, '1,3', 0, 2.00, 255, 3000, 4000, 5000, 1250, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -0.03, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'laser_tech', 100, '1,3', 0, 2.00, 255, 200, 100, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'ionic_tech', 100, '1,3', 0, 2.00, 255, 1000, 300, 100, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'buster_tech', 100, '1,3', 0, 2.00, 255, 2000, 4000, 1000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'intergalactic_tech', 100, '1,3', 0, 2.00, 255, 240000, 400000, 160000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'expedition_tech', 100, '1,3', 0, 1.75, 255, 4000, 8000, 4000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'metal_proc_tech', 100, '1,3', 0, 2.00, 255, 750, 500, 250, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'crystal_proc_tech', 100, '1,3', 0, 2.00, 255, 1000, 750, 500, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'deuterium_proc_tech', 100, '1,3', 0, 2.00, 255, 1250, 1000, 750, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'graviton_tech', 100, '1,3', 0, 3.00, 255, 0, 0, 0, 0, 0, 300000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'small_ship_cargo', 200, '1,3', 0, 1.00, NULL, 5000, 4000, 3000, 0, 0, 0, 0, 10, 20, 4, 5000, 10000, NULL, NULL, NULL, NULL, 15000, 5, 10, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'big_ship_cargo', 200, '1,3', 0, 1.00, NULL, 10000, 6000, 6000, 2000, 0, 0, 0, 50, 50, 1, 7500, 7500, NULL, NULL, NULL, NULL, 50000, 5, 25, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 'light_hunter', 200, '1,3', 0, 1.00, NULL, 4000, 1200, 300, 0, 0, 0, 0, 20, 20, 1, 12500, 12500, NULL, NULL, NULL, NULL, 50, 50, 10, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'heavy_hunter', 200, '1,3', 0, 1.00, NULL, 7000, 2100, 700, 0, 0, 0, 0, 75, 75, 2, 10000, 15000, NULL, NULL, NULL, NULL, 100, 150, 25, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 'crusher', 200, '1,3', 0, 1.00, NULL, 15000, 9000, 4000, 1200, 0, 0, 0, 300, 300, 2, 15000, 15000, NULL, NULL, NULL, NULL, 800, 400, 50, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'battle_ship', 200, '1,3', 0, 1.00, NULL, 40000, 18000, 7000, 3000, 0, 0, 0, 250, 250, 3, 10000, 10000, NULL, NULL, NULL, NULL, 1500, 1000, 200, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'colonizer', 200, '1,3', 0, 1.00, NULL, 10000, 20000, 10000, 0, 0, 0, 0, 1000, 1000, 2, 2500, 2500, NULL, NULL, NULL, NULL, 7500, 50, 100, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'recycler', 200, '1,3', 0, 1.00, NULL, 12000, 5000, 2000, 200, 0, 0, 0, 300, 300, 1, 2000, 2000, NULL, NULL, NULL, NULL, 40000, 1, 10, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'spy_sonde', 200, '1,3', 0, 1.00, NULL, 2000, 1200, 400, 0, 0, 0, 0, 1, 1, 1, 100000000, 100000000, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'bomber_ship', 200, '1,3', 0, 1.00, NULL, 60000, 30000, 20000, 10000, 0, 0, 0, 1000, 1000, 5, 4000, 5000, NULL, NULL, NULL, NULL, 500, 1000, 500, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'solar_satelit', 200, '1,3', 0, 1.00, NULL, 0, 2000, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '((($BuildTemp + 160) / 6) * (0.1 * $BuildLevelFactor) * $BuildLevel)', NULL, NULL, NULL, NULL, NULL),
(213, 'destructor', 200, '1,3', 0, 1.00, NULL, 60000, 50000, 15000, 0, 0, 0, 0, 1000, 1000, 3, 5000, 5000, NULL, NULL, NULL, NULL, 2000, 2000, 500, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'dearth_star', 200, '1,3', 0, 1.00, NULL, 5000000, 4000000, 1000000, 500000, 0, 0, 0, 1, 1, 3, 200, 200, NULL, NULL, NULL, NULL, 1000000, 200000, 50000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'battleship', 200, '1,3', 0, 1.00, NULL, 40000, 65000, 10000, 20000, 0, 0, 0, 250, 250, 3, 10000, 10000, NULL, NULL, NULL, NULL, 750, 700, 400, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'lune_noir', 200, '1,3', 0, 1.00, NULL, 8000000, 2000000, 1500000, 900000, 0, 0, 0, 250, 250, 3, 900, 900, NULL, NULL, NULL, NULL, 15000000, 150000, 70000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'ev_transporter', 200, '1,3', 0, 1.00, NULL, 35000, 20000, 1500, 0, 0, 0, 0, 90, 90, 3, 6000, 6000, NULL, NULL, NULL, NULL, 400000000, 50, 120, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'star_crasher', 200, '1,3', 0, 1.00, NULL, 275000000, 130000000, 60000000, 0, 0, 0, 0, 10000, 10000, 3, 10, 10, NULL, NULL, NULL, NULL, 50000000, 35000000, 2000000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'giga_recykler', 200, '1,3', 0, 1.00, NULL, 20000, 10000, 20000, 30000, 0, 0, 0, 300, 300, 3, 7500, 7500, NULL, NULL, NULL, NULL, 250000, 1, 1000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'dm_ship', 200, '1,3', 0, 1.00, NULL, 6000000, 7000000, 3000000, 0, 0, 0, 0, 100000, 100000, 3, 100, 100, NULL, NULL, NULL, NULL, 6000000, 5, 50000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(401, 'misil_launcher', 400, '1,3', 0, 1.00, NULL, 2000, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, 20, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(402, 'small_laser', 400, '1,3', 0, 1.00, NULL, 1500, 500, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100, 25, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(403, 'big_laser', 400, '1,3', 0, 1.00, NULL, 6000, 2000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 250, 100, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(404, 'gauss_canyon', 400, '1,3', 0, 1.00, NULL, 20000, 15000, 2000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1100, 200, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 'ionic_canyon', 400, '1,3', 0, 1.00, NULL, 2000, 6000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 150, 500, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(406, 'buster_canyon', 400, '1,3', 0, 1.00, NULL, 50000, 50000, 30000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3000, 300, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(407, 'small_protection_shield', 400, '1,3', 1, 1.00, NULL, 10000, 10000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(408, 'big_protection_shield', 400, '1,3', 1, 1.00, NULL, 50000, 50000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(409, 'planet_protector', 400, '1,3', 1, 1.00, NULL, 10000000, 5000000, 2500000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1000000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'graviton_canyon', 400, '1,3', 0, 1.00, NULL, 15000000, 15000000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 500000, 80000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 'orbital_station', 400, '1,3', 1, 1.00, NULL, 5000000000, 2000000000, 500000000, 0, 0, 1000000, 10000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 400000000, 2000000000, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'interceptor_misil', 500, '1,3', 0, 1.00, NULL, 8000, 0, 2000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'interplanetary_misil', 500, '1,3', 0, 1.00, NULL, 12500, 2500, 10000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12000, 1, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(601, 'rpg_geologue', 600, '1,3', 0, 1.00, 20, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(602, 'rpg_amiral', 600, '1,3', 0, 1.00, 20, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.05, 0.05, 0.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(603, 'rpg_ingenieur', 600, '1,3', 0, 1.00, 10, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.05, 0.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(604, 'rpg_technocrate', 600, '1,3', 0, 1.00, 10, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, -0.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(605, 'rpg_constructeur', 600, '1,3', 0, 1.00, 3, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, -0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(606, 'rpg_scientifique', 600, '1,3', 0, 1.00, 3, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, -0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(607, 'rpg_stockeur', 600, '1,3', 0, 1.00, 2, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(608, 'rpg_defenseur', 600, '1,3', 0, 1.00, 2, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -0.25, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(609, 'rpg_bunker', 600, '1,3', 0, 1.00, 1, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(610, 'rpg_espion', 600, '1,3', 0, 1.00, 2, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.35, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(611, 'rpg_commandant', 600, '1,3', 0, 1.00, 3, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(612, 'rpg_destructeur', 600, '1,3', 0, 1.00, 1, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(613, 'rpg_general', 600, '1,3', 0, 1.00, 3, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(614, 'rpg_raideur', 600, '1,3', 0, 1.00, 1, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(615, 'rpg_empereur', 600, '1,3', 0, 1.00, 1, 0, 0, 0, 0, 0, 0, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(701, 'dm_attack', 700, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 1500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, 0.10, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(702, 'dm_defensive', 700, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 1500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, 0.00, 0.00, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(703, 'dm_buildtime', 700, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, 0.00, 0.00, 0.00, -0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(704, 'dm_resource', 700, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 2500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'dm_energie', 700, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'dm_researchtime', 700, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 1250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, 0.00, 0.00, 0.00, 0.00, -0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(707, 'dm_fleettime', 700, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 3000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86400, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'elyrium_store', 0, '1,3', 0, 2.00, 255, 12500, 6250, 3125, 1560, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pow(2, $BuildLevel) * 40000'),
(10, 'solar_plant_extract', 0, '1', 0, 1.50, 255, 16000, 10000, 7500, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '(20 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(48, 'elyrium_mine', 0, '1', 0, 1.50, 255, 400, 300, 50, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '(10 * $BuildLevel * pow((1.1), $BuildLevel) * (-0.002 * $BuildTemp + 1.28) * (0.1 * $BuildLevelFactor))', NULL, '-(10 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(7, 'metal_mine_extract', 0, '1', 0, 1.50, 255, 40000, 18000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '(1000* $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, '-(10 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(8, 'crystal_mine_extract', 0, '1', 0, 1.50, 255, 28000, 15000, 2000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '(900* $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, '-(10 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor);', NULL, NULL, NULL, NULL, NULL),
(9, 'deuterium_sintetizer_extract', 0, '1', 0, 1.50, 255, 40000, 25000, 4000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '(800* $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, '- (30 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(11, 'elyrium_mine_extract', 0, '1', 0, 1.50, 255, 80000, 45000, 15000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '(700* $BuildLevel * pow((1.1), $BuildLevel) * (-0.002 * $BuildTemp + 1.28) * (0.1 * $BuildLevelFactor))', NULL, '-(10 * $BuildLevel * pow((1.1), $BuildLevel)) * (0.1 * $BuildLevelFactor)', NULL, NULL, NULL, NULL, NULL),
(45, 'barracks', 0, '1', 0, 2.00, 255, 1000, 1000, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 'pow((1.2), $BuildLevel) *  750', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'defense_base', 0, '1', 0, 2.00, 255, 2000, 1800, 1000, 500, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'headquarters_antaris', 0, '1', 0, 2.00, 255, 500000, 600000, 200000, 100000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'antaris_headpost', 0, '1', 0, 2.00, 255, 275000, 200000, 150000, 125000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'extraction_tech', 100, '1,3', 0, 2.00, 255, 500, 250, 20, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'control_room_tech', 100, '1,3', 0, 2.00, 255, 1200, 200, 800, 20, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'subspace_tech', 100, '1,3', 0, 2.00, 255, 1250, 2500, 750, 500, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -0.03, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'particle_tech', 100, '1,3', 0, 2.00, 255, 200, 1200, 1000, 1200, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'antaris_tech', 100, '1,3', 0, 2.00, 255, 200, 250, 250, 200, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'infrastructure_tech', 100, '1,3', 0, 2.00, 255, 500, 400, 50, 200, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'virus_tech', 100, '1,3', 0, 2.00, 255, 50000, 80000, 40000, 10000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'forcefield_tech', 100, '1,3', 0, 2.00, 255, 75000, 140000, 65000, 18000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'occultation_tech', 100, '1,3', 0, 2.00, 255, 10000, 20000, 12000, 4000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'sensors_tech', 100, '1,3', 0, 2.00, 255, 8000, 16000, 10000, 3000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'elyrium_reactor', 200, '1,3', 0, 1.00, NULL, 100000, 140000, 120000, 220000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'energy_modulator', 200, '1,3', 0, 1.00, NULL, 8000000, 12750000, 6500000, 1400000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(301, 'civil', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'technician', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 3, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(303, 'scientist', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 4, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(304, 'archaeologist', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 50, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(305, 'diplomat', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 20, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(306, 'soldier', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 100, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uni1_vars` (`elementID`, `name`, `class`, `onPlanetType`, `onePerPlanet`, `factor`, `maxLevel`, `cost901`, `cost902`, `cost903`, `cost904`, `cost905`, `cost911`, `cost921`, `consumption1`, `consumption2`, `speedTech`, `speed1`, `speed2`, `speed2Tech`, `speed2onLevel`, `speed3Tech`, `speed3onLevel`, `capacity`, `attack`, `defend`, `timeBonus`, `bonusAttack`, `bonusDefensive`, `bonusShield`, `bonusBuildTime`, `bonusResearchTime`, `bonusShipTime`, `bonusDefensiveTime`, `bonusResource`, `bonusEnergy`, `bonusResourceStorage`, `bonusShipStorage`, `bonusFlyTime`, `bonusFleetSlots`, `bonusPlanets`, `bonusSpyPower`, `bonusExpedition`, `bonusGateCoolTime`, `bonusMoreFound`, `bonusAttackUnit`, `bonusDefensiveUnit`, `bonusShieldUnit`, `bonusBuildTimeUnit`, `bonusResearchTimeUnit`, `bonusShipTimeUnit`, `bonusDefensiveTimeUnit`, `bonusResourceUnit`, `bonusEnergyUnit`, `bonusResourceStorageUnit`, `bonusShipStorageUnit`, `bonusFlyTimeUnit`, `bonusFleetSlotsUnit`, `bonusPlanetsUnit`, `bonusSpyPowerUnit`, `bonusExpeditionUnit`, `bonusGateCoolTimeUnit`, `bonusMoreFoundUnit`, `speedFleetFactor`, `production901`, `production902`, `production903`, `production904`, `production905`, `production911`, `production921`, `storage901`, `storage902`, `storage903`, `storage904`) VALUES
(307, 'adv_soldier', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 44, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2500, 500, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(309, 'antaris', 300, '1,3', 0, 1.00, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(801, 'ragnar_item', 800, '1,3', 0, 2.00, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(802, 'khufu_item', 800, '1,3', 0, 2.00, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(803, 'amplificateur_item', 800, '1,3', 0, 2.00, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(804, 'malvar_item', 800, '1,3', 0, 2.00, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'mid_recycler', 200, '1,3', 0, 1.00, NULL, 16000, 8000, 3200, 4000, 0, 0, 0, 300, 300, 1, 4000, 4000, NULL, NULL, NULL, NULL, 100000, 1, 450, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'spy_sonde_portal', 200, '1,3', 0, 1.00, NULL, 3000, 1000, 400, 1200, 0, 0, 0, 1, 1, 1, 100000000, 100000000, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_vars_rapidfire`
--

CREATE TABLE IF NOT EXISTS `uni1_vars_rapidfire` (
  `elementID` int(11) NOT NULL,
  `rapidfireID` int(11) NOT NULL,
  `shoots` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_vars_rapidfire`
--

INSERT INTO `uni1_vars_rapidfire` (`elementID`, `rapidfireID`, `shoots`) VALUES
(202, 210, 5),
(202, 212, 5),
(203, 210, 5),
(203, 212, 5),
(204, 210, 5),
(204, 212, 5),
(205, 202, 3),
(205, 210, 5),
(205, 212, 5),
(206, 204, 6),
(206, 401, 10),
(206, 210, 5),
(206, 212, 5),
(207, 210, 5),
(207, 212, 5),
(208, 210, 5),
(208, 212, 5),
(209, 210, 5),
(209, 212, 5),
(211, 210, 5),
(211, 212, 5),
(211, 401, 20),
(211, 402, 20),
(211, 403, 10),
(211, 405, 10),
(213, 210, 5),
(213, 212, 5),
(213, 215, 2),
(213, 402, 10),
(214, 210, 1250),
(214, 212, 1250),
(214, 202, 250),
(214, 203, 250),
(214, 208, 250),
(214, 209, 250),
(214, 204, 200),
(214, 205, 100),
(214, 206, 33),
(214, 207, 30),
(214, 211, 25),
(214, 215, 15),
(214, 213, 5),
(214, 401, 200),
(214, 402, 200),
(214, 403, 100),
(214, 404, 50),
(214, 405, 100),
(215, 202, 3),
(215, 203, 3),
(215, 205, 4),
(215, 206, 4),
(215, 207, 10),
(215, 210, 5),
(215, 212, 5),
(216, 210, 1250),
(216, 212, 1250),
(216, 202, 250),
(216, 203, 250),
(216, 204, 200),
(216, 205, 100),
(216, 206, 33),
(216, 207, 30),
(216, 208, 250),
(216, 209, 250),
(216, 211, 25),
(216, 213, 5),
(216, 214, 1),
(216, 215, 15),
(216, 401, 400),
(216, 402, 200),
(216, 403, 100),
(216, 404, 50),
(216, 405, 100),
(217, 210, 5),
(217, 212, 5),
(218, 210, 1250),
(218, 212, 1250),
(218, 202, 250),
(218, 203, 250),
(218, 204, 200),
(218, 205, 100),
(218, 206, 33),
(218, 207, 30),
(218, 208, 250),
(218, 209, 250),
(218, 211, 25),
(218, 213, 5),
(218, 215, 15),
(218, 401, 400),
(218, 402, 200),
(218, 403, 100),
(218, 404, 50),
(218, 405, 100),
(219, 210, 5),
(219, 212, 5),
(220, 210, 5),
(220, 212, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `uni1_vars_requriements`
--

CREATE TABLE IF NOT EXISTS `uni1_vars_requriements` (
  `elementID` int(11) NOT NULL,
  `requireID` int(11) NOT NULL,
  `requireLevel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `uni1_vars_requriements`
--

INSERT INTO `uni1_vars_requriements` (`elementID`, `requireID`, `requireLevel`) VALUES
(10, 4, 15),
(10, 113, 10),
(7, 1, 20),
(7, 140, 10),
(8, 2, 20),
(8, 140, 12),
(9, 3, 20),
(9, 140, 14),
(11, 48, 20),
(11, 140, 16),
(24, 110, 2),
(24, 3, 2),
(23, 110, 2),
(23, 2, 2),
(22, 110, 2),
(22, 1, 2),
(25, 48, 2),
(25, 110, 2),
(45, 14, 3),
(45, 141, 3),
(21, 14, 5),
(21, 141, 5),
(46, 14, 5),
(46, 141, 3),
(5, 31, 8),
(5, 113, 12),
(5, 144, 10),
(5, 141, 10),
(33, 31, 3),
(47, 31, 10),
(47, 5, 6),
(47, 144, 12),
(47, 141, 12),
(113, 31, 2),
(140, 31, 5),
(140, 113, 5),
(140, 110, 2),
(141, 31, 3),
(142, 21, 5),
(142, 31, 8),
(142, 113, 8),
(142, 143, 5),
(143, 31, 3),
(143, 113, 5),
(144, 31, 12),
(144, 113, 10),
(144, 142, 7),
(144, 143, 6),
(109, 31, 5),
(109, 143, 2),
(110, 31, 3),
(111, 21, 3),
(111, 31, 6),
(111, 113, 6),
(111, 143, 4),
(115, 21, 1),
(115, 31, 3),
(115, 113, 3),
(117, 21, 5),
(117, 31, 7),
(117, 113, 6),
(117, 143, 4),
(118, 21, 8),
(118, 31, 10),
(118, 113, 12),
(118, 142, 10),
(145, 21, 1),
(145, 31, 3),
(106, 31, 6),
(146, 31, 14),
(146, 113, 12),
(146, 144, 8),
(147, 31, 14),
(147, 110, 12),
(147, 144, 8),
(148, 31, 10),
(148, 113, 12),
(148, 144, 6),
(148, 145, 8),
(149, 31, 10),
(149, 113, 12),
(149, 144, 6),
(149, 143, 8),
(301, 45, 1),
(302, 45, 2),
(303, 45, 5),
(306, 45, 6),
(307, 45, 12),
(307, 109, 5),
(307, 111, 5),
(308, 45, 10),
(308, 21, 2),
(304, 45, 12),
(304, 144, 14),
(305, 45, 6),
(202, 21, 2),
(202, 115, 2),
(203, 21, 4),
(203, 115, 6),
(204, 21, 1),
(204, 115, 1),
(205, 21, 3),
(205, 111, 2),
(205, 117, 2),
(206, 21, 5),
(206, 117, 4),
(207, 21, 7),
(207, 118, 4),
(208, 21, 4),
(208, 117, 3),
(219, 118, 12),
(219, 110, 16),
(219, 14, 16),
(210, 21, 3),
(210, 115, 3),
(210, 106, 2),
(211, 117, 6),
(211, 21, 8),
(212, 21, 1),
(213, 21, 9),
(213, 118, 6),
(214, 21, 12),
(214, 118, 7),
(221, 143, 8),
(222, 143, 10),
(215, 118, 5),
(215, 21, 8),
(216, 106, 12),
(216, 21, 15),
(216, 109, 14),
(216, 110, 14),
(216, 111, 15),
(222, 144, 10),
(221, 140, 8),
(217, 111, 10),
(217, 21, 14),
(222, 113, 12),
(217, 110, 14),
(217, 117, 15),
(218, 21, 18),
(218, 109, 20),
(218, 110, 20),
(218, 111, 20),
(222, 14, 10),
(218, 118, 20),
(221, 113, 8),
(219, 45, 12),
(209, 142, 6),
(209, 110, 6),
(209, 14, 8),
(209, 45, 5),
(220, 21, 9),
(222, 31, 12),
(220, 118, 6),
(401, 46, 1),
(402, 113, 1),
(402, 46, 2),
(403, 113, 3),
(403, 46, 4),
(404, 46, 6),
(404, 113, 6),
(404, 109, 3),
(404, 110, 1),
(405, 46, 4),
(405, 146, 4),
(406, 46, 8),
(407, 110, 2),
(407, 46, 1),
(408, 110, 6),
(408, 46, 6),
(409, 609, 1),
(221, 31, 8),
(410, 46, 18),
(410, 109, 20),
(221, 14, 6),
(411, 110, 22),
(411, 108, 15),
(411, 111, 25),
(411, 113, 20),
(411, 608, 2),
(411, 46, 20),
(223, 45, 10),
(223, 14, 12),
(223, 110, 12),
(223, 117, 8),
(219, 144, 12),
(224, 45, 6),
(224, 21, 8),
(224, 110, 5),
(224, 106, 8),
(224, 118, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
 ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `uni1_achats_log`
--
ALTER TABLE `uni1_achats_log`
 ADD PRIMARY KEY (`achatID`);

--
-- Indexes for table `uni1_aks`
--
ALTER TABLE `uni1_aks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uni1_alliance`
--
ALTER TABLE `uni1_alliance`
 ADD PRIMARY KEY (`id`), ADD KEY `ally_tag` (`ally_tag`), ADD KEY `ally_name` (`ally_name`), ADD KEY `ally_universe` (`ally_universe`);

--
-- Indexes for table `uni1_alliance_ranks`
--
ALTER TABLE `uni1_alliance_ranks`
 ADD PRIMARY KEY (`rankID`), ADD KEY `allianceID` (`allianceID`,`rankID`);

--
-- Indexes for table `uni1_alliance_request`
--
ALTER TABLE `uni1_alliance_request`
 ADD PRIMARY KEY (`applyID`), ADD KEY `allianceID` (`allianceID`,`userID`);

--
-- Indexes for table `uni1_banned`
--
ALTER TABLE `uni1_banned`
 ADD KEY `ID` (`id`), ADD KEY `universe` (`universe`);

--
-- Indexes for table `uni1_buddy`
--
ALTER TABLE `uni1_buddy`
 ADD PRIMARY KEY (`id`), ADD KEY `universe` (`universe`), ADD KEY `sender` (`sender`,`owner`);

--
-- Indexes for table `uni1_buddy_request`
--
ALTER TABLE `uni1_buddy_request`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uni1_bunker_log`
--
ALTER TABLE `uni1_bunker_log`
 ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `uni1_config`
--
ALTER TABLE `uni1_config`
 ADD PRIMARY KEY (`uni`);

--
-- Indexes for table `uni1_cronjobs`
--
ALTER TABLE `uni1_cronjobs`
 ADD UNIQUE KEY `cronjobID` (`cronjobID`), ADD KEY `isActive` (`isActive`,`nextTime`,`lock`,`cronjobID`);

--
-- Indexes for table `uni1_diplo`
--
ALTER TABLE `uni1_diplo`
 ADD PRIMARY KEY (`id`), ADD KEY `universe` (`universe`), ADD KEY `owner_1` (`owner_1`,`owner_2`,`accept`);

--
-- Indexes for table `uni1_explorations`
--
ALTER TABLE `uni1_explorations`
 ADD PRIMARY KEY (`explorationID`);

--
-- Indexes for table `uni1_fleets`
--
ALTER TABLE `uni1_fleets`
 ADD PRIMARY KEY (`fleet_id`), ADD KEY `fleet_target_owner` (`fleet_target_owner`,`fleet_mission`), ADD KEY `fleet_owner` (`fleet_owner`,`fleet_mission`), ADD KEY `fleet_group` (`fleet_group`);

--
-- Indexes for table `uni1_fleets_manage`
--
ALTER TABLE `uni1_fleets_manage`
 ADD PRIMARY KEY (`manageID`);

--
-- Indexes for table `uni1_fleet_event`
--
ALTER TABLE `uni1_fleet_event`
 ADD PRIMARY KEY (`fleetID`), ADD KEY `lock` (`lock`,`time`);

--
-- Indexes for table `uni1_ipblock`
--
ALTER TABLE `uni1_ipblock`
 ADD PRIMARY KEY (`ipblockID`);

--
-- Indexes for table `uni1_iplog`
--
ALTER TABLE `uni1_iplog`
 ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `uni1_log`
--
ALTER TABLE `uni1_log`
 ADD PRIMARY KEY (`id`), ADD KEY `mode` (`mode`);

--
-- Indexes for table `uni1_log_fleets`
--
ALTER TABLE `uni1_log_fleets`
 ADD PRIMARY KEY (`fleet_id`), ADD KEY `BashRule` (`fleet_owner`,`fleet_end_id`,`fleet_start_time`,`fleet_mission`,`fleet_state`);

--
-- Indexes for table `uni1_lostpassword`
--
ALTER TABLE `uni1_lostpassword`
 ADD PRIMARY KEY (`key`), ADD UNIQUE KEY `userID` (`userID`,`key`,`time`,`hasChanged`), ADD KEY `time` (`time`);

--
-- Indexes for table `uni1_messages`
--
ALTER TABLE `uni1_messages`
 ADD PRIMARY KEY (`message_id`), ADD KEY `message_sender` (`message_sender`), ADD KEY `message_owner` (`message_owner`,`message_type`,`message_unread`);

--
-- Indexes for table `uni1_message_banned`
--
ALTER TABLE `uni1_message_banned`
 ADD KEY `ID` (`id`), ADD KEY `universe` (`universe`);

--
-- Indexes for table `uni1_minichat`
--
ALTER TABLE `uni1_minichat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uni1_multi`
--
ALTER TABLE `uni1_multi`
 ADD PRIMARY KEY (`multiID`), ADD KEY `userID` (`userID`);

--
-- Indexes for table `uni1_news`
--
ALTER TABLE `uni1_news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uni1_newsfeed`
--
ALTER TABLE `uni1_newsfeed`
 ADD PRIMARY KEY (`feedID`);

--
-- Indexes for table `uni1_notes`
--
ALTER TABLE `uni1_notes`
 ADD PRIMARY KEY (`id`), ADD KEY `universe` (`universe`), ADD KEY `owner` (`owner`,`time`,`priority`);

--
-- Indexes for table `uni1_paypal`
--
ALTER TABLE `uni1_paypal`
 ADD KEY `id` (`id`);

--
-- Indexes for table `uni1_paypal_log`
--
ALTER TABLE `uni1_paypal_log`
 ADD KEY `id` (`id`);

--
-- Indexes for table `uni1_paysafecard_log`
--
ALTER TABLE `uni1_paysafecard_log`
 ADD PRIMARY KEY (`payID`);

--
-- Indexes for table `uni1_planets`
--
ALTER TABLE `uni1_planets`
 ADD PRIMARY KEY (`id`), ADD KEY `id_luna` (`id_luna`), ADD KEY `id_owner` (`id_owner`), ADD KEY `destruyed` (`destruyed`), ADD KEY `universe` (`universe`,`galaxy`,`system`,`planet`,`planet_type`);

--
-- Indexes for table `uni1_raports`
--
ALTER TABLE `uni1_raports`
 ADD PRIMARY KEY (`rid`), ADD KEY `time` (`time`);

--
-- Indexes for table `uni1_reward`
--
ALTER TABLE `uni1_reward`
 ADD PRIMARY KEY (`rewardId`);

--
-- Indexes for table `uni1_session`
--
ALTER TABLE `uni1_session`
 ADD PRIMARY KEY (`userID`), ADD KEY `sessionID` (`sessionID`);

--
-- Indexes for table `uni1_shortcuts`
--
ALTER TABLE `uni1_shortcuts`
 ADD PRIMARY KEY (`shortcutID`), ADD KEY `ownerID` (`ownerID`);

--
-- Indexes for table `uni1_statpoints`
--
ALTER TABLE `uni1_statpoints`
 ADD KEY `id_owner` (`id_owner`), ADD KEY `universe` (`universe`), ADD KEY `stat_type` (`stat_type`);

--
-- Indexes for table `uni1_ticket`
--
ALTER TABLE `uni1_ticket`
 ADD PRIMARY KEY (`ticketID`), ADD KEY `ownerID` (`ownerID`), ADD KEY `universe` (`universe`,`status`);

--
-- Indexes for table `uni1_ticket_answer`
--
ALTER TABLE `uni1_ticket_answer`
 ADD PRIMARY KEY (`answerID`);

--
-- Indexes for table `uni1_ticket_category`
--
ALTER TABLE `uni1_ticket_category`
 ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `uni1_topkb`
--
ALTER TABLE `uni1_topkb`
 ADD KEY `time` (`universe`,`rid`,`time`);

--
-- Indexes for table `uni1_transport_player`
--
ALTER TABLE `uni1_transport_player`
 ADD PRIMARY KEY (`transportID`);

--
-- Indexes for table `uni1_users`
--
ALTER TABLE `uni1_users`
 ADD PRIMARY KEY (`id`), ADD KEY `authlevel` (`authlevel`), ADD KEY `ref_bonus` (`ref_bonus`), ADD KEY `universe` (`universe`,`username`,`password`,`onlinetime`,`authlevel`), ADD KEY `ally_id` (`ally_id`);

--
-- Indexes for table `uni1_users_to_acs`
--
ALTER TABLE `uni1_users_to_acs`
 ADD KEY `userID` (`userID`), ADD KEY `acsID` (`acsID`);

--
-- Indexes for table `uni1_users_to_extauth`
--
ALTER TABLE `uni1_users_to_extauth`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`), ADD KEY `account` (`account`,`mode`);

--
-- Indexes for table `uni1_users_to_topkb`
--
ALTER TABLE `uni1_users_to_topkb`
 ADD KEY `rid` (`rid`,`role`);

--
-- Indexes for table `uni1_users_valid`
--
ALTER TABLE `uni1_users_valid`
 ADD PRIMARY KEY (`validationID`,`validationKey`);

--
-- Indexes for table `uni1_vars`
--
ALTER TABLE `uni1_vars`
 ADD PRIMARY KEY (`elementID`), ADD KEY `class` (`class`);

--
-- Indexes for table `uni1_vars_rapidfire`
--
ALTER TABLE `uni1_vars_rapidfire`
 ADD KEY `elementID` (`elementID`), ADD KEY `rapidfireID` (`rapidfireID`);

--
-- Indexes for table `uni1_vars_requriements`
--
ALTER TABLE `uni1_vars_requriements`
 ADD KEY `elementID` (`elementID`), ADD KEY `requireID` (`requireID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uni1_achats_log`
--
ALTER TABLE `uni1_achats_log`
MODIFY `achatID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_aks`
--
ALTER TABLE `uni1_aks`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uni1_alliance`
--
ALTER TABLE `uni1_alliance`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_alliance_ranks`
--
ALTER TABLE `uni1_alliance_ranks`
MODIFY `rankID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uni1_alliance_request`
--
ALTER TABLE `uni1_alliance_request`
MODIFY `applyID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `uni1_banned`
--
ALTER TABLE `uni1_banned`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `uni1_buddy`
--
ALTER TABLE `uni1_buddy`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `uni1_bunker_log`
--
ALTER TABLE `uni1_bunker_log`
MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_config`
--
ALTER TABLE `uni1_config`
MODIFY `uni` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uni1_cronjobs`
--
ALTER TABLE `uni1_cronjobs`
MODIFY `cronjobID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `uni1_diplo`
--
ALTER TABLE `uni1_diplo`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uni1_explorations`
--
ALTER TABLE `uni1_explorations`
MODIFY `explorationID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_fleets`
--
ALTER TABLE `uni1_fleets`
MODIFY `fleet_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1858;
--
-- AUTO_INCREMENT for table `uni1_fleets_manage`
--
ALTER TABLE `uni1_fleets_manage`
MODIFY `manageID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `uni1_ipblock`
--
ALTER TABLE `uni1_ipblock`
MODIFY `ipblockID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_iplog`
--
ALTER TABLE `uni1_iplog`
MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `uni1_log`
--
ALTER TABLE `uni1_log`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_messages`
--
ALTER TABLE `uni1_messages`
MODIFY `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_message_banned`
--
ALTER TABLE `uni1_message_banned`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_minichat`
--
ALTER TABLE `uni1_minichat`
MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_multi`
--
ALTER TABLE `uni1_multi`
MODIFY `multiID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_news`
--
ALTER TABLE `uni1_news`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uni1_newsfeed`
--
ALTER TABLE `uni1_newsfeed`
MODIFY `feedID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uni1_notes`
--
ALTER TABLE `uni1_notes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_paypal`
--
ALTER TABLE `uni1_paypal`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_paypal_log`
--
ALTER TABLE `uni1_paypal_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_paysafecard_log`
--
ALTER TABLE `uni1_paysafecard_log`
MODIFY `payID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_planets`
--
ALTER TABLE `uni1_planets`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1888;
--
-- AUTO_INCREMENT for table `uni1_reward`
--
ALTER TABLE `uni1_reward`
MODIFY `rewardId` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_shortcuts`
--
ALTER TABLE `uni1_shortcuts`
MODIFY `shortcutID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_ticket`
--
ALTER TABLE `uni1_ticket`
MODIFY `ticketID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_ticket_answer`
--
ALTER TABLE `uni1_ticket_answer`
MODIFY `answerID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_ticket_category`
--
ALTER TABLE `uni1_ticket_category`
MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uni1_transport_player`
--
ALTER TABLE `uni1_transport_player`
MODIFY `transportID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uni1_users`
--
ALTER TABLE `uni1_users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10047;
--
-- AUTO_INCREMENT for table `uni1_users_valid`
--
ALTER TABLE `uni1_users_valid`
MODIFY `validationID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=151;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
