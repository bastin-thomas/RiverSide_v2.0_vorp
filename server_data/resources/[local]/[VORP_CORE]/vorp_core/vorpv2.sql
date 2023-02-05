CREATE TABLE IF NOT EXISTS `whitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` boolean,
  `firstconnection` boolean DEFAULT TRUE,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `identifier`(`identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(50) DEFAULT 'user',
  `warnings` int(11) DEFAULT 0,
  `banned` boolean,
  `banneduntil` int(10) DEFAULT 0,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ANY NEW UPDATES TO THE TABLES ABOVE NEED TO HAVE TABLE ALTERS ALSO ADDED BELOW FOR THOSE WHO ALREADY HAVE SERVERS RUNNING.
-- The following updates tables that were not included in the original table (Support for those who already have the tables above)
ALTER TABLE `users` ALTER COLUMN  `banned` boolean;
ALTER TABLE `users` ADD `banneduntil` int(10) DEFAULT 0;
ALTER TABLE `whitelist` ADD `status` boolean;
ALTER TABLE `whitelist` ADD `firstconnection` boolean;
ALTER TABLE `characters` ADD `steamname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '';
ALTER TABLE `users` ADD `char` varchar(50) NOT NULL DEFAULT 'false';
ALTER TABLE `characters` ADD COLUMN `ammo` longtext DEFAULT '{}';
ALTER TABLE `characters` ADD INDEX `ammo` (`ammo`);
ALTER TABLE `characters` ADD COLUMN `healthouter` int(4) DEFAULT 500 AFTER `xp`;
ALTER TABLE `characters` ADD COLUMN `healthinner` int(4) DEFAULT 100 AFTER `healthouter`;
ALTER TABLE `characters` ADD COLUMN `staminaouter` int(4) DEFAULT 100 AFTER `healthinner`;
ALTER TABLE `characters` ADD COLUMN `staminainner` int(4) DEFAULT 100 AFTER `staminaouter`;
