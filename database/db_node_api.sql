-- -------------------------------------------------------------
-- TablePlus 3.1.2(296)
--
-- https://tableplus.com/
--
-- Database: db_node_api
-- Generation Time: 2020-03-20 17:32:51.6670
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `rc_comments` (
  `cmt_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  `deleted` int DEFAULT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_upd` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  PRIMARY KEY (`cmt_id`),
  UNIQUE KEY `cmt_id` (`cmt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `rc_companys` (
  `address` varchar(255) DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `member_total` varchar(50) NOT NULL DEFAULT '0',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_upd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `job_id` int NOT NULL DEFAULT '1',
  `province_id` int NOT NULL DEFAULT '1',
  `short_name` varchar(255) DEFAULT NULL,
  `active` int DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

CREATE TABLE `rc_jobs` (
  `job_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_upd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int DEFAULT '1',
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

CREATE TABLE `rc_provinces` (
  `province_id` bigint unsigned NOT NULL,
  `province_name` varchar(255) NOT NULL,
  `date_add` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_upd` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`province_id`),
  UNIQUE KEY `province_id` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rc_users` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gender` bigint unsigned NOT NULL DEFAULT '0' COMMENT '0: female 1: male',
  `nick_name` varchar(100) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `birthday` date DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '1',
  `deleted` tinyint(1) DEFAULT '0',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_upd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `customer_email` (`email`) USING BTREE,
  KEY `customer_login` (`email`,`password`(255)) USING BTREE,
  KEY `id_customer_passwd` (`user_id`,`password`(255)) USING BTREE,
  KEY `id_gender` (`gender`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `rc_comments` (`cmt_id`, `company_id`, `comment`, `deleted`, `date_add`, `date_upd`, `user_id`) VALUES
('1', '1', 'xxxx', '0', '2020-03-14 22:46:11', '2020-03-14 22:46:11', '81'),
('2', '1', 'yyy', '0', '2020-03-14 22:46:44', '2020-03-14 22:46:44', '82');

INSERT INTO `rc_companys` (`address`, `company_id`, `full_name`, `member_total`, `date_add`, `date_upd`, `job_id`, `province_id`, `short_name`, `active`, `email`, `phone`, `website`) VALUES
('200 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '1', 'Công ty Re-Com', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'xxx', '1', 'gvn-techno@gmail.com', '0123456789', NULL),
('201 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '2', 'Công ty TNHH Thiên ngọc Minh Uy', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'ccc', '1', '', '', NULL),
('202 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '3', 'Công ty Cổ phần đầu tư và phát triển', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'ddd', '1', '', '', NULL),
('203 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '4', 'Công ty Công nghệ VNext', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'aaa', '1', '', '', NULL),
('204 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '5', 'Công ty Xây dựng', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'ddd', '1', '', '', NULL),
('205 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '6', 'Công ty Bất động sản HQV', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'sss', '1', '', '', NULL),
('206 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '7', 'Binh đoàn 789 HQV', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'zzz', '1', '', '', NULL),
('207 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '8', 'NavaTech tầng 8 Hoàng Quốc Việt', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'nnn', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '9', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '10', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '11', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '12', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '13', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '14', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '15', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '16', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '17', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '18', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '19', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '20', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '21', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '22', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '23', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '24', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '25', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '26', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '27', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '28', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '29', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '30', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '31', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '32', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '33', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '34', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '35', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '36', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '37', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '38', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '39', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '40', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '41', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '42', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '43', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '44', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '45', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '46', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '47', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '48', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '49', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '50', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '51', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '52', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '53', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '54', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '55', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '56', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '57', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '58', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '59', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '60', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '61', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '62', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '63', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '64', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '65', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '66', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '67', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '68', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '69', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '70', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '71', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '72', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '73', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '74', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '75', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '76', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '77', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '78', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('208 Cầu Giấy, Nghĩa Đô, Hoàng Quốc Việt, Hà Nội', '79', 'Công ty VietIS Technology', '1', '2020-03-06 10:36:41', '2020-03-06 10:36:41', '1', '1', 'mmm', '1', '', '', NULL),
('Tầng 18 Tháp C, Toà nhà Central Point, 219 Trung Kính, phường Yên Hòa, quận Cầu Giấy, Hà Nội', '83', 'CÔNG TY CỔ PHẦN VNEXT SOFTWARE', '5', '2020-03-18 21:39:28', '2020-03-18 21:39:27', '1', '1', NULL, '1', 'info@vnext.vn', '02437659555', 'https://vnext.vn'),
('Tầng 13, tòa nhà 789 Bộ Quốc Phòng, số 147 Hoàng Quốc Việt, quận Cầu Giấy, Hà Nội', '84', 'Công ty cổ phần tập đoàn Ominext', '5', '2020-03-18 22:49:49', '2020-03-18 22:49:48', '1', '1', NULL, '1', 'info@ominext.com', '02466644599', 'https://www.ominext.com'),
('Tầng 8, Toà nhà An Phú, Số 24 Hoàng Quốc Việt, Nghĩa Đô, Cầu Giấy, Hà Nội', '85', 'Công ty TNHH Công nghệ và Truyền thông NAVA', '1', '2020-03-19 20:56:53', '2020-03-19 20:56:53', '1', '1', NULL, '1', 'info@navatech.vn', '02462598212', 'https://navatech.vn/'),
('Tầng 4 - Tòa nhà Tây Hà - 19 Tố Hữu - Phường Trung Văn - Quận Nam Từ Liêm - Hà Nội.', '86', 'Công ty cổ phần Funtap', '5', '2020-03-19 22:25:24', '2020-03-19 22:25:23', '1', '1', NULL, '0', 'hotro@funtap.vn', '02473015656', 'https://corp.funtap.vn/');

INSERT INTO `rc_jobs` (`job_id`, `job_name`, `date_add`, `date_upd`, `active`) VALUES
('1', 'Công nghệ thông tin', '2020-03-08 21:06:20', '2020-03-08 21:06:20', '1'),
('2', 'Y tế', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('3', 'Viễn thông', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('4', 'Giáo dục', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('5', 'Sản xuất Giấy', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('6', 'Bán cám', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('7', 'Bán nhân sự', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('8', 'Kinh doanh nội thất', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('9', 'Bàn quần áo', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('10', 'Tư vấn du học ', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('11', 'Tư vấn xuất khẩu lao động', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('12', 'Du lịch', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('13', 'Trung tâm ngoại giao', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('14', 'Thể thao', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('15', 'Thương mại điện tử', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('16', 'Đồ ăn', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('17', 'Thức uống', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('18', 'Abc', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1'),
('19', 'Xyz', '2020-03-08 21:07:03', '2020-03-08 21:07:03', '1');

INSERT INTO `rc_provinces` (`province_id`, `province_name`, `date_add`, `date_upd`, `type`) VALUES
('1', 'Hà Nội', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Thành Phố'),
('2', 'Hà Giang', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('4', 'Cao Bằng', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('6', 'Bắc Kạn', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('8', 'Tuyên Quang', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('10', 'Lào Cai', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('11', 'Điện Biên', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('12', 'Lai Châu', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('14', 'Sơn La', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('15', 'Yên Bái', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('17', 'Hòa Bình', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('19', 'Thái Nguyên', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('20', 'Lạng Sơn', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('22', 'Quảng Ninh', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('24', 'Bắc Giang', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('25', 'Phú Thọ', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('26', 'Vĩnh Phúc', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('27', 'Bắc Ninh', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('30', 'Hải Dương', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('31', 'Hải Phòng', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Thành Phố'),
('33', 'Hưng Yên', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('34', 'Thái Bình', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('35', 'Hà Nam', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('36', 'Nam Định', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('37', 'Ninh Bình', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('38', 'Thanh Hóa', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('40', 'Nghệ An', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('42', 'Hà Tĩnh', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('44', 'Quảng Bình', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('45', 'Quảng Trị', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('46', 'Thừa Thiên Huế', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('48', 'Đà Nẵng', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Thành Phố'),
('49', 'Quảng Nam', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('51', 'Quảng Ngãi', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('52', 'Bình Định', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('54', 'Phú Yên', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('56', 'Khánh Hòa', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('58', 'Ninh Thuận', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('60', 'Bình Thuận', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('62', 'Kon Tum', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('64', 'Gia Lai', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('66', 'Đắk Lắk', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('67', 'Đắk Nông', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('68', 'Lâm Đồng', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('70', 'Bình Phước', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('72', 'Tây Ninh', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('74', 'Bình Dương', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('75', 'Đồng Nai', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('77', 'Bà Rịa - Vũng Tàu', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('79', 'Hồ Chí Minh', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Thành Phố'),
('80', 'Long An', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('82', 'Tiền Giang', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('83', 'Bến Tre', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('84', 'Trà Vinh', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('86', 'Vĩnh Long', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('87', 'Đồng Tháp', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('89', 'An Giang', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('91', 'Kiên Giang', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('92', 'Cần Thơ', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Thành Phố'),
('93', 'Hậu Giang', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('94', 'Sóc Trăng', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('95', 'Bạc Liêu', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh'),
('96', 'Cà Mau', '2020-03-07 21:40:20', '2020-03-07 21:40:20', 'Tỉnh');

INSERT INTO `rc_users` (`user_id`, `gender`, `nick_name`, `first_name`, `last_name`, `email`, `phone`, `password`, `description`, `birthday`, `active`, `deleted`, `date_add`, `date_upd`, `address`) VALUES
('34', '1', 'Duy DVC', '', '', 'updatetest@gmail.com', '0987456123', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', '', '1996-12-09', '0', '0', '2020-03-05 14:17:22', '2020-03-05 14:17:22', NULL),
('35', '1', ' Sơn Tùng MTP', 'Sơn Tùng', 'MTP', 'minh1@gmail.com', '0362615487', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'vv', '1997-12-09', '1', '0', '2019-12-09 03:45:38', '2020-03-02 15:39:32', NULL),
('36', '1', 'Kimochi', 'Aizono', 'Tsutomu', 'wow@gmail.com', '0987654213', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Mô tả', '1960-07-12', '1', '0', '2019-12-09 04:12:30', '2020-02-27 09:42:46', NULL),
('37', '1', 'dragon@gmail.com', NULL, NULL, 'dragon@gmail.com', '0967166818', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '1995-12-09', '1', '0', '2019-12-09 06:37:17', '2019-12-09 06:37:17', NULL),
('38', '1', 'Hua Linh', 'Linh', 'Hua', 'hualinh1012_1@gmail.com', '0354988696', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'hjhj', '1996-12-10', '1', '0', '2019-12-09 06:41:41', '2020-02-21 07:14:09', NULL),
('39', '1', 'Annie', 'effef', 't', 'annie@gmail.com', '0136538696', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Đọc truyện', '1996-09-06', '1', '0', '2019-12-09 06:49:47', '2019-12-10 02:52:41', NULL),
('40', '1', 'Hải Nam', 'goij', 'gai', 'vn.apnic@gmail.com', '0963190925', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Bác sỹnndndndmmdndmdmdmdknubybybybyby y ybybybu yubbynubynunuutjkfrjjrjrjrjfjdjfjfkfjfkdkdkdmcmxmxmxmmxxmmxmxmcmcmcmxkcndmfmfnfjfkfmfnfjfjfjfjfnfjjfkfjfkfjfjfjfkfjdjdjdmdndnfjfjnfmfncjcjckcmcnfjfkfmfjfmfjfnfjmfnfmfnfmfnfmfnf', '1992-09-25', '1', '0', '2019-12-09 07:21:33', '2020-02-28 16:43:54', NULL),
('41', '1', 'Đen Vâu', 'a', 'b', 'minh2@gmail.com', '0906393582', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Ca sỹ', '1996-12-09', '1', '0', '2019-12-09 09:10:44', '2019-12-09 09:49:49', NULL),
('42', '1', 'Tú', 'y', 'y', 'tu@gmail.com', '0395351723', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Bán hàng online', '1995-01-10', '1', '0', '2019-12-10 01:00:02', '2019-12-10 03:16:03', NULL),
('43', '1', 'Bùi Hải Nam', 'Nam', 'Hải', 'hainam@gmail.com', '0963190925', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Tôi chuyên bán CI Game', '1992-09-25', '1', '0', '2019-12-10 02:32:06', '2019-12-10 02:55:33', NULL),
('44', '1', 'Chim Sẻ Đi Nắng', 'ghj', 'hhhhh', 'minh3@gmail.com', '0963852741', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Gamer', '1996-03-10', '1', '0', '2019-12-10 02:45:24', '2019-12-16 14:59:40', NULL),
('45', '1', 'Tu Ido', 'adoan', 'ngoc', 't@gmail.com', '0395351723', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'hihi', '2019-11-08', '1', '0', '2019-12-10 04:07:03', '2019-12-18 08:46:58', NULL),
('46', '1', 'Quang Tú', NULL, NULL, 'quangtu2208@gmail.com', '0979663310', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', '123', '1996-08-22', '1', '0', '2019-12-10 09:03:41', '2019-12-10 09:03:41', NULL),
('47', '1', 'Trấn Thành', ' Thành', 'Trấn', 'minh4@gmail.com', '0963963963', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Diễn viên ', '1982-12-16', '1', '0', '2019-12-16 06:24:19', '2019-12-16 15:03:03', NULL),
('48', '2', 'Hariwon', 'Hariwon', 'Hari', 'minh5@gmail.com', '0963852852', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Ca sỹ', '1994-12-16', '1', '0', '2019-12-16 07:43:27', '2019-12-16 07:48:56', NULL),
('49', '2', 'Misthy', 'Misthy', 'Misthy', 'minh6@gmail.com', '0963963963', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Streamer', '1993-12-16', '1', '1', '2019-12-16 08:54:42', '2019-12-16 09:00:18', NULL),
('51', '2', 'Chu Duyên Bún', 'Bún', 'Chu Duyên', 'minh8@gmail.com', '0985285296', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Ca sỹ', '1993-12-16', '1', '0', '2019-12-16 09:30:26', '2019-12-16 17:07:43', NULL),
('52', '2', 'Jun Vũ', 'Vũ', 'Jun', 'minh9@gmail.com', '0985285285', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Diễn viên', '1995-12-16', '1', '0', '2019-12-16 09:39:55', '2019-12-16 09:43:36', NULL),
('53', '2', 'Linh Zuto', 'Linh', 'Zuto', 'minh10@gmail.com', '0963963963', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Streamer', '2004-12-16', '1', '0', '2019-12-16 09:48:10', '2019-12-17 08:56:00', NULL),
('56', '2', 'An Ngụy', 'An', 'Ngụy', 'minh13@gmail.com', '0963963963', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Diễn viên', '1991-12-17', '1', '0', '2019-12-17 07:59:45', '2019-12-17 08:06:23', NULL),
('57', '2', 'Nhã Phương', 'Phương', 'Nhã', 'minh14@gmail.com', '0963963963', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Diễn viên', '1995-12-17', '1', '0', '2019-12-17 08:14:45', '2019-12-17 08:21:25', NULL),
('58', '2', '', '', '', 'minh15@gmail.com', '0996363636', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', '', '1988-12-17', '1', '0', '2019-12-17 08:47:55', '2020-01-09 06:30:34', NULL),
('62', '1', 'sonata12', NULL, NULL, 'sonata12@gmail.com', '0928393118', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '1983-12-12', '1', '0', '2020-01-16 02:05:20', '2020-01-16 02:05:20', NULL),
('63', '1', 'abcabc', NULL, NULL, 'abcabc@gmail.com', '0123456789', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2004-01-01', '1', '0', '2020-01-16 02:33:32', '2020-01-16 02:33:32', NULL),
('64', '1', '123123', NULL, NULL, 'bbb@gmail.com', '0123456789', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2004-01-01', '0', '0', '2020-01-16 03:09:52', '2020-01-16 03:09:52', NULL),
('65', '1', '123123123', NULL, NULL, 'wow1@gmail.com', '0123456789', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2004-01-01', '1', '0', '2020-01-16 04:03:36', '2020-01-16 04:03:36', NULL),
('66', '2', 'chibi', NULL, NULL, 'chibi@gmail.com', '0123456785', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2020-01-16', '1', '0', '2020-01-16 07:04:37', '2020-01-16 07:04:37', NULL),
('67', '1', 'tuad', NULL, NULL, 'tu1@gmail.com', '0395351723', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '1995-01-15', '1', '0', '2020-01-16 08:33:39', '2020-01-16 08:33:39', NULL),
('69', '1', 'shine4ever', NULL, NULL, 'hungdt27988@gmail.com', '0985985886', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '1988-09-27', '1', '0', '2020-01-16 10:24:23', '2020-01-16 10:24:23', NULL),
('70', '1', 'duyvp', NULL, NULL, 'duy123@gmail.com', '0979589412', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2004-01-01', '1', '0', '2020-02-06 01:37:43', '2020-02-06 01:37:43', NULL),
('71', '1', 'kendo', NULL, NULL, 'kendo@gmail.com', '1234567890', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '1999-01-06', '1', '0', '2020-02-06 07:02:01', '2020-02-06 07:02:01', NULL),
('72', '1', 'minh', NULL, NULL, 'minh21@gmail.com', '0963963963', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2020-02-06', '1', '0', '2020-02-06 07:18:48', '2020-02-06 07:18:48', NULL),
('73', '1', 'jnnnm', NULL, NULL, 'minh100@gmail.com', '0988999999', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2020-02-06', '1', '0', '2020-02-06 09:05:23', '2020-02-06 09:05:23', NULL),
('74', '1', 'enqtran', NULL, NULL, 'enqtran@gmail.com', '0123456789', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2000-01-01', '1', '0', '2020-02-13 07:28:56', '2020-02-13 07:28:56', NULL),
('75', '1', 'b', NULL, NULL, 'mit@gmail.com', '0963258369', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '2009-02-27', '1', '0', '2020-02-27 09:35:37', '2020-02-27 09:35:37', NULL),
('76', '1', 'Biệt danh dài ngoằng', 'Nguyễn', 'Minh', 'enqminh@gmail.com', '0979456789', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'If you are looking for a solution for how to get javascript unique array then your solution is the Javascript array filter() method. Primitive values in JavaScript are immutable values except for objects. Types of primitive values include Null, Undefined, Boolean, Number, Symbol and String. This tutorial also gives you the answer to the How can I get a list of unique values in array.If you are looking for a solution for how to get javascript unique array then your solution is the Java', '1995-08-29', '1', '0', '2020-03-17 21:56:11', '2020-03-17 21:56:11', 'Hà Nội'),
('77', '1', 'anhpt', NULL, NULL, 'anhptse03395@gmail.com', '0982803436', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '1993-01-07', '1', '0', '2020-02-27 16:32:16', '2020-02-27 16:32:16', NULL),
('78', '1', 'toantroll', NULL, NULL, 'vuongvantoan2305@gmail.com', '0393240523', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, '1995-05-23', '1', '0', '2020-02-28 18:13:29', '2020-02-28 18:13:29', NULL),
('80', '1', 'Huấn Hoa Hồng', 'Huấn ', 'Hoa Hồng', 'minhtest@gmail.com', '', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Đang đi cai nghiện ma tuý', '1995-08-08', '1', '0', '2020-03-18 20:51:37', '2020-03-18 20:51:37', 'Vĩnh Phúc'),
('81', '1', 'MinJa', 'Nguyễn Công', 'Minh', 'minhnc@gmail.com', '0962441368', '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', 'Hihi', '1995-08-29', '1', NULL, '2020-03-19 21:13:39', '2020-03-19 21:13:39', 'Bắc Ninh'),
('88', '1', 'Con lợn què', NULL, NULL, 'minhtest1@gmail.com', NULL, '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, NULL, '1', NULL, '2020-03-13 21:09:24', '2020-03-13 21:09:24', NULL),
('91', '0', 'minhncssss', NULL, NULL, 'minhtest2@gmail.com', NULL, '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, NULL, '1', NULL, '2020-03-15 21:28:55', '2020-03-15 21:28:55', NULL),
('92', '0', 'minhtest3', NULL, NULL, 'minhtest3@gmail.com', NULL, '$2b$10$w6foEZuWHsfr6ccewqfSru5CCvufQvixLthfvwVaN4kApwxZaafe.', NULL, NULL, '1', NULL, '2020-03-15 22:12:50', '2020-03-15 22:12:50', NULL);




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;