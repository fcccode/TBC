-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.10-MariaDB - Arch Linux
-- Server OS:                    Linux
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for characters
CREATE DATABASE IF NOT EXISTS `characters` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `characters`;

-- Dumping structure for table characters.account_instances_entered
CREATE TABLE IF NOT EXISTS `account_instances_entered` (
  `AccountId` int(11) unsigned NOT NULL COMMENT 'Player account',
  `ExpireTime` bigint(40) NOT NULL COMMENT 'Time when instance was entered',
  `InstanceId` int(11) unsigned NOT NULL COMMENT 'ID of instance entered',
  PRIMARY KEY (`AccountId`,`InstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Instance reset limit system';

-- Dumping data for table characters.account_instances_entered: ~0 rows (approximately)
DELETE FROM `account_instances_entered`;
/*!40000 ALTER TABLE `account_instances_entered` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_instances_entered` ENABLE KEYS */;

-- Dumping structure for table characters.arena_team
CREATE TABLE IF NOT EXISTS `arena_team` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT 0,
  `name` char(255) NOT NULL,
  `captainguid` int(10) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `BackgroundColor` int(10) unsigned NOT NULL DEFAULT 0,
  `EmblemStyle` int(10) unsigned NOT NULL DEFAULT 0,
  `EmblemColor` int(10) unsigned NOT NULL DEFAULT 0,
  `BorderStyle` int(10) unsigned NOT NULL DEFAULT 0,
  `BorderColor` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.arena_team: ~0 rows (approximately)
DELETE FROM `arena_team`;
/*!40000 ALTER TABLE `arena_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team` ENABLE KEYS */;

-- Dumping structure for table characters.arena_team_member
CREATE TABLE IF NOT EXISTS `arena_team_member` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT 0,
  `guid` int(10) unsigned NOT NULL DEFAULT 0,
  `played_week` int(10) unsigned NOT NULL DEFAULT 0,
  `wons_week` int(10) unsigned NOT NULL DEFAULT 0,
  `played_season` int(10) unsigned NOT NULL DEFAULT 0,
  `wons_season` int(10) unsigned NOT NULL DEFAULT 0,
  `personal_rating` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`arenateamid`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.arena_team_member: ~0 rows (approximately)
DELETE FROM `arena_team_member`;
/*!40000 ALTER TABLE `arena_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_member` ENABLE KEYS */;

-- Dumping structure for table characters.arena_team_stats
CREATE TABLE IF NOT EXISTS `arena_team_stats` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT 0,
  `rating` int(10) unsigned NOT NULL DEFAULT 0,
  `games_week` int(10) unsigned NOT NULL DEFAULT 0,
  `wins_week` int(10) unsigned NOT NULL DEFAULT 0,
  `games_season` int(10) unsigned NOT NULL DEFAULT 0,
  `wins_season` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.arena_team_stats: ~0 rows (approximately)
DELETE FROM `arena_team_stats`;
/*!40000 ALTER TABLE `arena_team_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `arena_team_stats` ENABLE KEYS */;

-- Dumping structure for table characters.auction
CREATE TABLE IF NOT EXISTS `auction` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `houseid` int(11) unsigned NOT NULL DEFAULT 0,
  `itemguid` int(11) unsigned NOT NULL DEFAULT 0,
  `item_template` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Item Identifier',
  `item_count` int(11) unsigned NOT NULL DEFAULT 0,
  `item_randompropertyid` int(11) NOT NULL DEFAULT 0,
  `itemowner` int(11) unsigned NOT NULL DEFAULT 0,
  `buyoutprice` int(11) NOT NULL DEFAULT 0,
  `time` bigint(40) unsigned NOT NULL DEFAULT 0,
  `buyguid` int(11) unsigned NOT NULL DEFAULT 0,
  `lastbid` int(11) NOT NULL DEFAULT 0,
  `startbid` int(11) NOT NULL DEFAULT 0,
  `deposit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.auction: ~0 rows (approximately)
DELETE FROM `auction`;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;

-- Dumping structure for table characters.bugreport
CREATE TABLE IF NOT EXISTS `bugreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Debug System';

-- Dumping data for table characters.bugreport: 0 rows
DELETE FROM `bugreport`;
/*!40000 ALTER TABLE `bugreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugreport` ENABLE KEYS */;

-- Dumping structure for table characters.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `account` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Account Identifier',
  `name` varchar(12) NOT NULL DEFAULT '',
  `race` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `class` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `gender` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `xp` int(10) unsigned NOT NULL DEFAULT 0,
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `playerBytes` int(10) unsigned NOT NULL DEFAULT 0,
  `playerBytes2` int(10) unsigned NOT NULL DEFAULT 0,
  `playerFlags` int(10) unsigned NOT NULL DEFAULT 0,
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  `map` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  `taximask` longtext DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cinematic` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `totaltime` int(11) unsigned NOT NULL DEFAULT 0,
  `leveltime` int(11) unsigned NOT NULL DEFAULT 0,
  `logout_time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rest_bonus` float NOT NULL DEFAULT 0,
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT 0,
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `trans_x` float NOT NULL DEFAULT 0,
  `trans_y` float NOT NULL DEFAULT 0,
  `trans_z` float NOT NULL DEFAULT 0,
  `trans_o` float NOT NULL DEFAULT 0,
  `transguid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `extra_flags` int(11) unsigned NOT NULL DEFAULT 0,
  `stable_slots` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `at_login` int(11) unsigned NOT NULL DEFAULT 0,
  `zone` int(11) unsigned NOT NULL DEFAULT 0,
  `death_expire_time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxi_path` text DEFAULT NULL,
  `arenaPoints` int(10) unsigned NOT NULL DEFAULT 0,
  `totalHonorPoints` int(10) unsigned NOT NULL DEFAULT 0,
  `todayHonorPoints` int(10) unsigned NOT NULL DEFAULT 0,
  `yesterdayHonorPoints` int(10) unsigned NOT NULL DEFAULT 0,
  `totalKills` int(10) unsigned NOT NULL DEFAULT 0,
  `todayKills` smallint(5) unsigned NOT NULL DEFAULT 0,
  `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT 0,
  `chosenTitle` int(10) unsigned NOT NULL DEFAULT 0,
  `watchedFaction` int(10) unsigned NOT NULL DEFAULT 0,
  `drunk` smallint(5) unsigned NOT NULL DEFAULT 0,
  `health` int(10) unsigned NOT NULL DEFAULT 0,
  `power1` int(10) unsigned NOT NULL DEFAULT 0,
  `power2` int(10) unsigned NOT NULL DEFAULT 0,
  `power3` int(10) unsigned NOT NULL DEFAULT 0,
  `power4` int(10) unsigned NOT NULL DEFAULT 0,
  `power5` int(10) unsigned NOT NULL DEFAULT 0,
  `exploredZones` longtext DEFAULT NULL,
  `equipmentCache` longtext DEFAULT NULL,
  `ammoId` int(10) unsigned NOT NULL DEFAULT 0,
  `knownTitles` longtext DEFAULT NULL,
  `actionBars` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `deleteInfos_Account` int(11) unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.characters: ~0 rows (approximately)
DELETE FROM `characters`;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table characters.character_action
CREATE TABLE IF NOT EXISTS `character_action` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `button` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `action` int(11) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_action: ~0 rows (approximately)
DELETE FROM `character_action`;
/*!40000 ALTER TABLE `character_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_action` ENABLE KEYS */;

-- Dumping structure for table characters.character_aura
CREATE TABLE IF NOT EXISTS `character_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT 0,
  `spell` int(11) unsigned NOT NULL DEFAULT 0,
  `stackcount` int(11) unsigned NOT NULL DEFAULT 1,
  `remaincharges` int(11) unsigned NOT NULL DEFAULT 0,
  `basepoints0` int(11) NOT NULL DEFAULT 0,
  `basepoints1` int(11) NOT NULL DEFAULT 0,
  `basepoints2` int(11) NOT NULL DEFAULT 0,
  `periodictime0` int(11) unsigned NOT NULL DEFAULT 0,
  `periodictime1` int(11) unsigned NOT NULL DEFAULT 0,
  `periodictime2` int(11) unsigned NOT NULL DEFAULT 0,
  `maxduration` int(11) NOT NULL DEFAULT 0,
  `remaintime` int(11) NOT NULL DEFAULT 0,
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_aura: ~0 rows (approximately)
DELETE FROM `character_aura`;
/*!40000 ALTER TABLE `character_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_aura` ENABLE KEYS */;

-- Dumping structure for table characters.character_battleground_data
CREATE TABLE IF NOT EXISTS `character_battleground_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `instance_id` int(11) unsigned NOT NULL DEFAULT 0,
  `team` int(11) unsigned NOT NULL DEFAULT 0,
  `join_x` float NOT NULL DEFAULT 0,
  `join_y` float NOT NULL DEFAULT 0,
  `join_z` float NOT NULL DEFAULT 0,
  `join_o` float NOT NULL DEFAULT 0,
  `join_map` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_battleground_data: ~0 rows (approximately)
DELETE FROM `character_battleground_data`;
/*!40000 ALTER TABLE `character_battleground_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_battleground_data` ENABLE KEYS */;

-- Dumping structure for table characters.character_db_version
CREATE TABLE IF NOT EXISTS `character_db_version` (
  `required_s2395_01_characters_WorldState` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Last applied sql update to DB';

-- Dumping data for table characters.character_db_version: 1 rows
DELETE FROM `character_db_version`;
/*!40000 ALTER TABLE `character_db_version` DISABLE KEYS */;
INSERT INTO `character_db_version` (`required_s2395_01_characters_WorldState`) VALUES
	(NULL);
/*!40000 ALTER TABLE `character_db_version` ENABLE KEYS */;

-- Dumping structure for table characters.character_declinedname
CREATE TABLE IF NOT EXISTS `character_declinedname` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table characters.character_declinedname: ~0 rows (approximately)
DELETE FROM `character_declinedname`;
/*!40000 ALTER TABLE `character_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_declinedname` ENABLE KEYS */;

-- Dumping structure for table characters.character_gifts
CREATE TABLE IF NOT EXISTS `character_gifts` (
  `guid` int(20) unsigned NOT NULL DEFAULT 0,
  `item_guid` int(11) unsigned NOT NULL DEFAULT 0,
  `entry` int(20) unsigned NOT NULL DEFAULT 0,
  `flags` int(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.character_gifts: ~0 rows (approximately)
DELETE FROM `character_gifts`;
/*!40000 ALTER TABLE `character_gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_gifts` ENABLE KEYS */;

-- Dumping structure for table characters.character_homebind
CREATE TABLE IF NOT EXISTS `character_homebind` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `map` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `zone` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Zone Identifier',
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_homebind: ~0 rows (approximately)
DELETE FROM `character_homebind`;
/*!40000 ALTER TABLE `character_homebind` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_homebind` ENABLE KEYS */;

-- Dumping structure for table characters.character_instance
CREATE TABLE IF NOT EXISTS `character_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0,
  `instance` int(11) unsigned NOT NULL DEFAULT 0,
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.character_instance: ~0 rows (approximately)
DELETE FROM `character_instance`;
/*!40000 ALTER TABLE `character_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_instance` ENABLE KEYS */;

-- Dumping structure for table characters.character_inventory
CREATE TABLE IF NOT EXISTS `character_inventory` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `bag` int(11) unsigned NOT NULL DEFAULT 0,
  `slot` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `item` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Item Global Unique Identifier',
  `item_template` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Item Identifier',
  PRIMARY KEY (`item`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_inventory: ~0 rows (approximately)
DELETE FROM `character_inventory`;
/*!40000 ALTER TABLE `character_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_inventory` ENABLE KEYS */;

-- Dumping structure for table characters.character_pet
CREATE TABLE IF NOT EXISTS `character_pet` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `entry` int(11) unsigned NOT NULL DEFAULT 0,
  `owner` int(11) unsigned NOT NULL DEFAULT 0,
  `modelid` int(11) unsigned DEFAULT 0,
  `CreatedBySpell` int(11) unsigned NOT NULL DEFAULT 0,
  `PetType` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `level` int(11) unsigned NOT NULL DEFAULT 1,
  `exp` int(11) unsigned NOT NULL DEFAULT 0,
  `Reactstate` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `loyaltypoints` int(11) NOT NULL DEFAULT 0,
  `loyalty` int(11) unsigned NOT NULL DEFAULT 0,
  `xpForNextLoyalty` int(11) unsigned NOT NULL DEFAULT 0,
  `trainpoint` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) DEFAULT 'Pet',
  `renamed` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `slot` int(11) unsigned NOT NULL DEFAULT 0,
  `curhealth` int(11) unsigned NOT NULL DEFAULT 1,
  `curmana` int(11) unsigned NOT NULL DEFAULT 0,
  `curhappiness` int(11) unsigned NOT NULL DEFAULT 0,
  `savetime` bigint(20) unsigned NOT NULL DEFAULT 0,
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT 0,
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `abdata` longtext DEFAULT NULL,
  `teachspelldata` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

-- Dumping data for table characters.character_pet: ~0 rows (approximately)
DELETE FROM `character_pet`;
/*!40000 ALTER TABLE `character_pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet` ENABLE KEYS */;

-- Dumping structure for table characters.character_pet_declinedname
CREATE TABLE IF NOT EXISTS `character_pet_declinedname` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `owner` int(11) unsigned NOT NULL DEFAULT 0,
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table characters.character_pet_declinedname: ~0 rows (approximately)
DELETE FROM `character_pet_declinedname`;
/*!40000 ALTER TABLE `character_pet_declinedname` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_pet_declinedname` ENABLE KEYS */;

-- Dumping structure for table characters.character_queststatus
CREATE TABLE IF NOT EXISTS `character_queststatus` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  `status` int(11) unsigned NOT NULL DEFAULT 0,
  `rewarded` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `explored` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `timer` bigint(20) unsigned NOT NULL DEFAULT 0,
  `mobcount1` int(11) unsigned NOT NULL DEFAULT 0,
  `mobcount2` int(11) unsigned NOT NULL DEFAULT 0,
  `mobcount3` int(11) unsigned NOT NULL DEFAULT 0,
  `mobcount4` int(11) unsigned NOT NULL DEFAULT 0,
  `itemcount1` int(11) unsigned NOT NULL DEFAULT 0,
  `itemcount2` int(11) unsigned NOT NULL DEFAULT 0,
  `itemcount3` int(11) unsigned NOT NULL DEFAULT 0,
  `itemcount4` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_queststatus: ~0 rows (approximately)
DELETE FROM `character_queststatus`;
/*!40000 ALTER TABLE `character_queststatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus` ENABLE KEYS */;

-- Dumping structure for table characters.character_queststatus_daily
CREATE TABLE IF NOT EXISTS `character_queststatus_daily` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_queststatus_daily: ~0 rows (approximately)
DELETE FROM `character_queststatus_daily`;
/*!40000 ALTER TABLE `character_queststatus_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_daily` ENABLE KEYS */;

-- Dumping structure for table characters.character_queststatus_monthly
CREATE TABLE IF NOT EXISTS `character_queststatus_monthly` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_queststatus_monthly: ~0 rows (approximately)
DELETE FROM `character_queststatus_monthly`;
/*!40000 ALTER TABLE `character_queststatus_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_monthly` ENABLE KEYS */;

-- Dumping structure for table characters.character_queststatus_weekly
CREATE TABLE IF NOT EXISTS `character_queststatus_weekly` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Player System';

-- Dumping data for table characters.character_queststatus_weekly: ~0 rows (approximately)
DELETE FROM `character_queststatus_weekly`;
/*!40000 ALTER TABLE `character_queststatus_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_queststatus_weekly` ENABLE KEYS */;

-- Dumping structure for table characters.character_reputation
CREATE TABLE IF NOT EXISTS `character_reputation` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `faction` int(11) unsigned NOT NULL DEFAULT 0,
  `standing` int(11) NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_reputation: ~0 rows (approximately)
DELETE FROM `character_reputation`;
/*!40000 ALTER TABLE `character_reputation` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_reputation` ENABLE KEYS */;

-- Dumping structure for table characters.character_skills
CREATE TABLE IF NOT EXISTS `character_skills` (
  `guid` int(11) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` mediumint(9) unsigned NOT NULL,
  `value` mediumint(9) unsigned NOT NULL,
  `max` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_skills: ~0 rows (approximately)
DELETE FROM `character_skills`;
/*!40000 ALTER TABLE `character_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_skills` ENABLE KEYS */;

-- Dumping structure for table characters.character_social
CREATE TABLE IF NOT EXISTS `character_social` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `friend` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `guid_flags` (`guid`,`flags`),
  KEY `friend_flags` (`friend`,`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_social: ~0 rows (approximately)
DELETE FROM `character_social`;
/*!40000 ALTER TABLE `character_social` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_social` ENABLE KEYS */;

-- Dumping structure for table characters.character_spell
CREATE TABLE IF NOT EXISTS `character_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`spell`),
  KEY `Idx_spell` (`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_spell: ~0 rows (approximately)
DELETE FROM `character_spell`;
/*!40000 ALTER TABLE `character_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_spell` ENABLE KEYS */;

-- Dumping structure for table characters.character_spell_cooldown
CREATE TABLE IF NOT EXISTS `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part',
  `SpellId` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `SpellExpireTime` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Spell cooldown expire time',
  `Category` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Spell category',
  `CategoryExpireTime` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Spell category cooldown expire time',
  `ItemId` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Item Identifier',
  PRIMARY KEY (`guid`,`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table characters.character_spell_cooldown: 0 rows
DELETE FROM `character_spell_cooldown`;
/*!40000 ALTER TABLE `character_spell_cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_spell_cooldown` ENABLE KEYS */;

-- Dumping structure for table characters.character_stats
CREATE TABLE IF NOT EXISTS `character_stats` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT 0,
  `maxpower1` int(10) unsigned NOT NULL DEFAULT 0,
  `maxpower2` int(10) unsigned NOT NULL DEFAULT 0,
  `maxpower3` int(10) unsigned NOT NULL DEFAULT 0,
  `maxpower4` int(10) unsigned NOT NULL DEFAULT 0,
  `maxpower5` int(10) unsigned NOT NULL DEFAULT 0,
  `maxpower6` int(10) unsigned NOT NULL DEFAULT 0,
  `maxpower7` int(10) unsigned NOT NULL DEFAULT 0,
  `strength` int(10) unsigned NOT NULL DEFAULT 0,
  `agility` int(10) unsigned NOT NULL DEFAULT 0,
  `stamina` int(10) unsigned NOT NULL DEFAULT 0,
  `intellect` int(10) unsigned NOT NULL DEFAULT 0,
  `spirit` int(10) unsigned NOT NULL DEFAULT 0,
  `armor` int(10) unsigned NOT NULL DEFAULT 0,
  `resHoly` int(10) unsigned NOT NULL DEFAULT 0,
  `resFire` int(10) unsigned NOT NULL DEFAULT 0,
  `resNature` int(10) unsigned NOT NULL DEFAULT 0,
  `resFrost` int(10) unsigned NOT NULL DEFAULT 0,
  `resShadow` int(10) unsigned NOT NULL DEFAULT 0,
  `resArcane` int(10) unsigned NOT NULL DEFAULT 0,
  `blockPct` float unsigned NOT NULL DEFAULT 0,
  `dodgePct` float unsigned NOT NULL DEFAULT 0,
  `parryPct` float unsigned NOT NULL DEFAULT 0,
  `critPct` float unsigned NOT NULL DEFAULT 0,
  `rangedCritPct` float unsigned NOT NULL DEFAULT 0,
  `spellCritPct` float unsigned NOT NULL DEFAULT 0,
  `attackPower` int(10) unsigned NOT NULL DEFAULT 0,
  `rangedAttackPower` int(10) unsigned NOT NULL DEFAULT 0,
  `spellPower` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.character_stats: ~0 rows (approximately)
DELETE FROM `character_stats`;
/*!40000 ALTER TABLE `character_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_stats` ENABLE KEYS */;

-- Dumping structure for table characters.character_ticket
CREATE TABLE IF NOT EXISTS `character_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(11) unsigned NOT NULL DEFAULT 0,
  `ticket_text` text DEFAULT NULL,
  `response_text` text DEFAULT NULL,
  `ticket_lastchange` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_ticket: ~0 rows (approximately)
DELETE FROM `character_ticket`;
/*!40000 ALTER TABLE `character_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_ticket` ENABLE KEYS */;

-- Dumping structure for table characters.character_tutorial
CREATE TABLE IF NOT EXISTS `character_tutorial` (
  `account` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Account Identifier',
  `tut0` int(11) unsigned NOT NULL DEFAULT 0,
  `tut1` int(11) unsigned NOT NULL DEFAULT 0,
  `tut2` int(11) unsigned NOT NULL DEFAULT 0,
  `tut3` int(11) unsigned NOT NULL DEFAULT 0,
  `tut4` int(11) unsigned NOT NULL DEFAULT 0,
  `tut5` int(11) unsigned NOT NULL DEFAULT 0,
  `tut6` int(11) unsigned NOT NULL DEFAULT 0,
  `tut7` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Dumping data for table characters.character_tutorial: ~0 rows (approximately)
DELETE FROM `character_tutorial`;
/*!40000 ALTER TABLE `character_tutorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_tutorial` ENABLE KEYS */;

-- Dumping structure for table characters.corpse
CREATE TABLE IF NOT EXISTS `corpse` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `player` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `position_x` float NOT NULL DEFAULT 0,
  `position_y` float NOT NULL DEFAULT 0,
  `position_z` float NOT NULL DEFAULT 0,
  `orientation` float NOT NULL DEFAULT 0,
  `map` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Map Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `corpse_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `instance` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpse_type`),
  KEY `instance` (`instance`),
  KEY `Idx_player` (`player`),
  KEY `Idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Death System';

-- Dumping data for table characters.corpse: ~0 rows (approximately)
DELETE FROM `corpse`;
/*!40000 ALTER TABLE `corpse` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpse` ENABLE KEYS */;

-- Dumping structure for table characters.creature_respawn
CREATE TABLE IF NOT EXISTS `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT 0,
  `instance` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

-- Dumping data for table characters.creature_respawn: ~0 rows (approximately)
DELETE FROM `creature_respawn`;
/*!40000 ALTER TABLE `creature_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_respawn` ENABLE KEYS */;

-- Dumping structure for table characters.event_group_chosen
CREATE TABLE IF NOT EXISTS `event_group_chosen` (
  `eventGroup` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`eventGroup`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest Group picked';

-- Dumping data for table characters.event_group_chosen: 0 rows
DELETE FROM `event_group_chosen`;
/*!40000 ALTER TABLE `event_group_chosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_group_chosen` ENABLE KEYS */;

-- Dumping structure for table characters.gameobject_respawn
CREATE TABLE IF NOT EXISTS `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT 0,
  `instance` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

-- Dumping data for table characters.gameobject_respawn: ~0 rows (approximately)
DELETE FROM `gameobject_respawn`;
/*!40000 ALTER TABLE `gameobject_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_respawn` ENABLE KEYS */;

-- Dumping structure for table characters.game_event_status
CREATE TABLE IF NOT EXISTS `game_event_status` (
  `event` smallint(6) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Game event system';

-- Dumping data for table characters.game_event_status: 0 rows
DELETE FROM `game_event_status`;
/*!40000 ALTER TABLE `game_event_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_status` ENABLE KEYS */;

-- Dumping structure for table characters.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `groupId` int(11) unsigned NOT NULL,
  `leaderGuid` int(11) unsigned NOT NULL,
  `mainTank` int(11) unsigned NOT NULL,
  `mainAssistant` int(11) unsigned NOT NULL,
  `lootMethod` tinyint(4) unsigned NOT NULL,
  `looterGuid` int(11) unsigned NOT NULL,
  `lootThreshold` tinyint(4) unsigned NOT NULL,
  `icon1` int(11) unsigned NOT NULL,
  `icon2` int(11) unsigned NOT NULL,
  `icon3` int(11) unsigned NOT NULL,
  `icon4` int(11) unsigned NOT NULL,
  `icon5` int(11) unsigned NOT NULL,
  `icon6` int(11) unsigned NOT NULL,
  `icon7` int(11) unsigned NOT NULL,
  `icon8` int(11) unsigned NOT NULL,
  `isRaid` tinyint(1) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Groups';

-- Dumping data for table characters.groups: ~0 rows (approximately)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table characters.group_instance
CREATE TABLE IF NOT EXISTS `group_instance` (
  `leaderGuid` int(11) unsigned NOT NULL DEFAULT 0,
  `instance` int(11) unsigned NOT NULL DEFAULT 0,
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`leaderGuid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.group_instance: ~0 rows (approximately)
DELETE FROM `group_instance`;
/*!40000 ALTER TABLE `group_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_instance` ENABLE KEYS */;

-- Dumping structure for table characters.group_member
CREATE TABLE IF NOT EXISTS `group_member` (
  `groupId` int(11) unsigned NOT NULL,
  `memberGuid` int(11) unsigned NOT NULL,
  `assistant` tinyint(1) unsigned NOT NULL,
  `subgroup` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`groupId`,`memberGuid`),
  KEY `Idx_memberGuid` (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Groups';

-- Dumping data for table characters.group_member: ~0 rows (approximately)
DELETE FROM `group_member`;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;

-- Dumping structure for table characters.guild
CREATE TABLE IF NOT EXISTS `guild` (
  `guildid` int(6) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `leaderguid` int(6) unsigned NOT NULL DEFAULT 0,
  `EmblemStyle` int(5) NOT NULL DEFAULT 0,
  `EmblemColor` int(5) NOT NULL DEFAULT 0,
  `BorderStyle` int(5) NOT NULL DEFAULT 0,
  `BorderColor` int(5) NOT NULL DEFAULT 0,
  `BackgroundColor` int(5) NOT NULL DEFAULT 0,
  `info` varchar(500) NOT NULL DEFAULT '',
  `motd` varchar(128) NOT NULL DEFAULT '',
  `createdate` bigint(20) unsigned NOT NULL DEFAULT 0,
  `BankMoney` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Dumping data for table characters.guild: ~0 rows (approximately)
DELETE FROM `guild`;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;

-- Dumping structure for table characters.guild_bank_eventlog
CREATE TABLE IF NOT EXISTS `guild_bank_eventlog` (
  `guildid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Event type',
  `PlayerGuid` int(11) unsigned NOT NULL DEFAULT 0,
  `ItemOrMoney` int(11) unsigned NOT NULL DEFAULT 0,
  `ItemStackCount` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `DestTabId` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT 'Destination Tab Id',
  `TimeStamp` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.guild_bank_eventlog: ~0 rows (approximately)
DELETE FROM `guild_bank_eventlog`;
/*!40000 ALTER TABLE `guild_bank_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_eventlog` ENABLE KEYS */;

-- Dumping structure for table characters.guild_bank_item
CREATE TABLE IF NOT EXISTS `guild_bank_item` (
  `guildid` int(11) unsigned NOT NULL DEFAULT 0,
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `SlotId` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `item_guid` int(11) unsigned NOT NULL DEFAULT 0,
  `item_entry` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.guild_bank_item: ~0 rows (approximately)
DELETE FROM `guild_bank_item`;
/*!40000 ALTER TABLE `guild_bank_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_item` ENABLE KEYS */;

-- Dumping structure for table characters.guild_bank_right
CREATE TABLE IF NOT EXISTS `guild_bank_right` (
  `guildid` int(11) unsigned NOT NULL DEFAULT 0,
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `rid` int(11) unsigned NOT NULL DEFAULT 0,
  `gbright` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `SlotPerDay` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`,`TabId`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.guild_bank_right: ~0 rows (approximately)
DELETE FROM `guild_bank_right`;
/*!40000 ALTER TABLE `guild_bank_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_right` ENABLE KEYS */;

-- Dumping structure for table characters.guild_bank_tab
CREATE TABLE IF NOT EXISTS `guild_bank_tab` (
  `guildid` int(11) unsigned NOT NULL DEFAULT 0,
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `TabName` varchar(100) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.guild_bank_tab: ~0 rows (approximately)
DELETE FROM `guild_bank_tab`;
/*!40000 ALTER TABLE `guild_bank_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_bank_tab` ENABLE KEYS */;

-- Dumping structure for table characters.guild_eventlog
CREATE TABLE IF NOT EXISTS `guild_eventlog` (
  `guildid` int(11) unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(1) unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(11) unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(11) unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(2) unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` bigint(20) unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';

-- Dumping data for table characters.guild_eventlog: ~0 rows (approximately)
DELETE FROM `guild_eventlog`;
/*!40000 ALTER TABLE `guild_eventlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_eventlog` ENABLE KEYS */;

-- Dumping structure for table characters.guild_member
CREATE TABLE IF NOT EXISTS `guild_member` (
  `guildid` int(6) unsigned NOT NULL DEFAULT 0,
  `guid` int(11) unsigned NOT NULL DEFAULT 0,
  `rank` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `pnote` varchar(31) NOT NULL DEFAULT '',
  `offnote` varchar(31) NOT NULL DEFAULT '',
  `BankResetTimeMoney` int(11) unsigned NOT NULL DEFAULT 0,
  `BankRemMoney` int(11) unsigned NOT NULL DEFAULT 0,
  `BankResetTimeTab0` int(11) unsigned NOT NULL DEFAULT 0,
  `BankRemSlotsTab0` int(11) unsigned NOT NULL DEFAULT 0,
  `BankResetTimeTab1` int(11) unsigned NOT NULL DEFAULT 0,
  `BankRemSlotsTab1` int(11) unsigned NOT NULL DEFAULT 0,
  `BankResetTimeTab2` int(11) unsigned NOT NULL DEFAULT 0,
  `BankRemSlotsTab2` int(11) unsigned NOT NULL DEFAULT 0,
  `BankResetTimeTab3` int(11) unsigned NOT NULL DEFAULT 0,
  `BankRemSlotsTab3` int(11) unsigned NOT NULL DEFAULT 0,
  `BankResetTimeTab4` int(11) unsigned NOT NULL DEFAULT 0,
  `BankRemSlotsTab4` int(11) unsigned NOT NULL DEFAULT 0,
  `BankResetTimeTab5` int(11) unsigned NOT NULL DEFAULT 0,
  `BankRemSlotsTab5` int(11) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Dumping data for table characters.guild_member: ~0 rows (approximately)
DELETE FROM `guild_member`;
/*!40000 ALTER TABLE `guild_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_member` ENABLE KEYS */;

-- Dumping structure for table characters.guild_rank
CREATE TABLE IF NOT EXISTS `guild_rank` (
  `guildid` int(6) unsigned NOT NULL DEFAULT 0,
  `rid` int(11) unsigned NOT NULL,
  `rname` varchar(255) NOT NULL DEFAULT '',
  `rights` int(3) unsigned NOT NULL DEFAULT 0,
  `BankMoneyPerDay` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Dumping data for table characters.guild_rank: ~0 rows (approximately)
DELETE FROM `guild_rank`;
/*!40000 ALTER TABLE `guild_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_rank` ENABLE KEYS */;

-- Dumping structure for table characters.instance
CREATE TABLE IF NOT EXISTS `instance` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `map` int(11) unsigned NOT NULL DEFAULT 0,
  `resettime` bigint(40) unsigned NOT NULL DEFAULT 0,
  `encountersMask` int(10) unsigned NOT NULL DEFAULT 0,
  `difficulty` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.instance: ~0 rows (approximately)
DELETE FROM `instance`;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;

-- Dumping structure for table characters.instance_reset
CREATE TABLE IF NOT EXISTS `instance_reset` (
  `mapid` int(11) unsigned NOT NULL DEFAULT 0,
  `resettime` bigint(40) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.instance_reset: ~0 rows (approximately)
DELETE FROM `instance_reset`;
/*!40000 ALTER TABLE `instance_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_reset` ENABLE KEYS */;

-- Dumping structure for table characters.item_instance
CREATE TABLE IF NOT EXISTS `item_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0,
  `owner_guid` int(11) unsigned NOT NULL DEFAULT 0,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

-- Dumping data for table characters.item_instance: ~0 rows (approximately)
DELETE FROM `item_instance`;
/*!40000 ALTER TABLE `item_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_instance` ENABLE KEYS */;

-- Dumping structure for table characters.item_loot
CREATE TABLE IF NOT EXISTS `item_loot` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0,
  `owner_guid` int(11) unsigned NOT NULL DEFAULT 0,
  `itemid` int(11) unsigned NOT NULL DEFAULT 0,
  `amount` int(11) unsigned NOT NULL DEFAULT 0,
  `suffix` int(11) unsigned NOT NULL DEFAULT 0,
  `property` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`itemid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

-- Dumping data for table characters.item_loot: ~0 rows (approximately)
DELETE FROM `item_loot`;
/*!40000 ALTER TABLE `item_loot` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_loot` ENABLE KEYS */;

-- Dumping structure for table characters.item_text
CREATE TABLE IF NOT EXISTS `item_text` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

-- Dumping data for table characters.item_text: ~0 rows (approximately)
DELETE FROM `item_text`;
/*!40000 ALTER TABLE `item_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_text` ENABLE KEYS */;

-- Dumping structure for table characters.mail
CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Identifier',
  `messageType` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `stationery` tinyint(3) NOT NULL DEFAULT 41,
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sender` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `receiver` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  `subject` longtext DEFAULT NULL,
  `itemTextId` int(11) unsigned NOT NULL DEFAULT 0,
  `has_items` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `expire_time` bigint(40) unsigned NOT NULL DEFAULT 0,
  `deliver_time` bigint(40) unsigned NOT NULL DEFAULT 0,
  `money` int(11) unsigned NOT NULL DEFAULT 0,
  `cod` int(11) unsigned NOT NULL DEFAULT 0,
  `checked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Mail System';

-- Dumping data for table characters.mail: ~0 rows (approximately)
DELETE FROM `mail`;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;

-- Dumping structure for table characters.mail_items
CREATE TABLE IF NOT EXISTS `mail_items` (
  `mail_id` int(11) NOT NULL DEFAULT 0,
  `item_guid` int(11) NOT NULL DEFAULT 0,
  `item_template` int(11) NOT NULL DEFAULT 0,
  `receiver` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`mail_id`,`item_guid`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table characters.mail_items: ~0 rows (approximately)
DELETE FROM `mail_items`;
/*!40000 ALTER TABLE `mail_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_items` ENABLE KEYS */;

-- Dumping structure for table characters.petition
CREATE TABLE IF NOT EXISTS `petition` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(10) unsigned DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ownerguid`,`type`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Dumping data for table characters.petition: ~0 rows (approximately)
DELETE FROM `petition`;
/*!40000 ALTER TABLE `petition` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition` ENABLE KEYS */;

-- Dumping structure for table characters.petition_sign
CREATE TABLE IF NOT EXISTS `petition_sign` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(11) unsigned NOT NULL DEFAULT 0,
  `playerguid` int(11) unsigned NOT NULL DEFAULT 0,
  `player_account` int(11) unsigned NOT NULL DEFAULT 0,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Dumping data for table characters.petition_sign: ~0 rows (approximately)
DELETE FROM `petition_sign`;
/*!40000 ALTER TABLE `petition_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `petition_sign` ENABLE KEYS */;

-- Dumping structure for table characters.pet_aura
CREATE TABLE IF NOT EXISTS `pet_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT 0,
  `spell` int(11) unsigned NOT NULL DEFAULT 0,
  `stackcount` int(11) unsigned NOT NULL DEFAULT 1,
  `remaincharges` int(11) unsigned NOT NULL DEFAULT 0,
  `basepoints0` int(11) NOT NULL DEFAULT 0,
  `basepoints1` int(11) NOT NULL DEFAULT 0,
  `basepoints2` int(11) NOT NULL DEFAULT 0,
  `periodictime0` int(11) unsigned NOT NULL DEFAULT 0,
  `periodictime1` int(11) unsigned NOT NULL DEFAULT 0,
  `periodictime2` int(11) unsigned NOT NULL DEFAULT 0,
  `maxduration` int(11) NOT NULL DEFAULT 0,
  `remaintime` int(11) NOT NULL DEFAULT 0,
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

-- Dumping data for table characters.pet_aura: ~0 rows (approximately)
DELETE FROM `pet_aura`;
/*!40000 ALTER TABLE `pet_aura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_aura` ENABLE KEYS */;

-- Dumping structure for table characters.pet_spell
CREATE TABLE IF NOT EXISTS `pet_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `active` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

-- Dumping data for table characters.pet_spell: ~0 rows (approximately)
DELETE FROM `pet_spell`;
/*!40000 ALTER TABLE `pet_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell` ENABLE KEYS */;

-- Dumping structure for table characters.pet_spell_cooldown
CREATE TABLE IF NOT EXISTS `pet_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'Spell Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.pet_spell_cooldown: ~0 rows (approximately)
DELETE FROM `pet_spell_cooldown`;
/*!40000 ALTER TABLE `pet_spell_cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_spell_cooldown` ENABLE KEYS */;

-- Dumping structure for table characters.playerbot_saved_data
CREATE TABLE IF NOT EXISTS `playerbot_saved_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT 0,
  `combat_order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `primary_target` int(11) unsigned NOT NULL DEFAULT 0,
  `secondary_target` int(11) unsigned NOT NULL DEFAULT 0,
  `pname` varchar(12) NOT NULL DEFAULT '',
  `sname` varchar(12) NOT NULL DEFAULT '',
  `combat_delay` int(11) unsigned NOT NULL DEFAULT 0,
  `auto_follow` int(11) unsigned NOT NULL DEFAULT 1,
  `autoequip` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Persistent Playerbot settings per alt';

-- Dumping data for table characters.playerbot_saved_data: 0 rows
DELETE FROM `playerbot_saved_data`;
/*!40000 ALTER TABLE `playerbot_saved_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerbot_saved_data` ENABLE KEYS */;

-- Dumping structure for table characters.pvpstats_battlegrounds
CREATE TABLE IF NOT EXISTS `pvpstats_battlegrounds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `winner_team` tinyint(3) NOT NULL,
  `bracket_id` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.pvpstats_battlegrounds: ~0 rows (approximately)
DELETE FROM `pvpstats_battlegrounds`;
/*!40000 ALTER TABLE `pvpstats_battlegrounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpstats_battlegrounds` ENABLE KEYS */;

-- Dumping structure for table characters.pvpstats_players
CREATE TABLE IF NOT EXISTS `pvpstats_players` (
  `battleground_id` bigint(20) unsigned NOT NULL,
  `character_guid` int(10) unsigned NOT NULL,
  `score_killing_blows` mediumint(8) unsigned NOT NULL,
  `score_deaths` mediumint(8) unsigned NOT NULL,
  `score_honorable_kills` mediumint(8) unsigned NOT NULL,
  `score_bonus_honor` mediumint(8) unsigned NOT NULL,
  `score_damage_done` mediumint(8) unsigned NOT NULL,
  `score_healing_done` mediumint(8) unsigned NOT NULL,
  `attr_1` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `attr_2` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `attr_3` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `attr_4` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `attr_5` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`battleground_id`,`character_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.pvpstats_players: ~0 rows (approximately)
DELETE FROM `pvpstats_players`;
/*!40000 ALTER TABLE `pvpstats_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpstats_players` ENABLE KEYS */;

-- Dumping structure for table characters.saved_variables
CREATE TABLE IF NOT EXISTS `saved_variables` (
  `NextArenaPointDistributionTime` bigint(40) unsigned NOT NULL DEFAULT 0,
  `NextDailyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT 0,
  `NextWeeklyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT 0,
  `NextMonthlyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT 0,
  `cleaning_flags` int(11) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Variable Saves';

-- Dumping data for table characters.saved_variables: ~0 rows (approximately)
DELETE FROM `saved_variables`;
/*!40000 ALTER TABLE `saved_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_variables` ENABLE KEYS */;

-- Dumping structure for table characters.world
CREATE TABLE IF NOT EXISTS `world` (
  `map` int(11) unsigned NOT NULL DEFAULT 0,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table characters.world: ~0 rows (approximately)
DELETE FROM `world`;
/*!40000 ALTER TABLE `world` DISABLE KEYS */;
/*!40000 ALTER TABLE `world` ENABLE KEYS */;

-- Dumping structure for table characters.world_state
CREATE TABLE IF NOT EXISTS `world_state` (
  `Id` int(11) unsigned NOT NULL COMMENT 'Internal save ID',
  `Data` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='WorldState save system';

-- Dumping data for table characters.world_state: ~0 rows (approximately)
DELETE FROM `world_state`;
/*!40000 ALTER TABLE `world_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `world_state` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
