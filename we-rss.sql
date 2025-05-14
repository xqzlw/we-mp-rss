/*
Navicat MySQL Data Transfer

Source Server         : Exp
Source Server Version : 80024
Source Host           : 119.3.239.67:3306
Source Database       : we-rss

Target Server Type    : MYSQL
Target Server Version : 80024
File Encoding         : 65001

Date: 2025-05-14 15:58:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
-- DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
-- DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_time` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `is_export` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
-- Table structure for `feeds`
-- ----------------------------
DROP TABLE IF EXISTS `feeds`;
CREATE TABLE `feeds` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_cover` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `sync_time` int NOT NULL DEFAULT '0',
  `update_time` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `faker_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of feeds
-- ----------------------------

