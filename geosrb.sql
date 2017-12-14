/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.19-0ubuntu0.16.04.1 : Database - geosrb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`geosrb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `geosrb`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

/*Table structure for table `data_rows` */

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_rows` */

insert  into `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) values (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(3,1,'category_id','text','Category',0,0,1,1,1,0,NULL,3),(4,1,'title','text','Title',1,1,1,1,1,1,NULL,4),(5,1,'excerpt','text_area','excerpt',0,0,1,1,1,1,NULL,5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),(9,1,'meta_description','text_area','meta_description',0,0,1,1,1,1,NULL,9),(10,1,'meta_keywords','text_area','meta_keywords',0,0,1,1,1,1,NULL,10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,NULL,12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,'',1),(27,3,'name','text','name',1,1,1,1,1,1,'',2),(28,3,'email','text','email',1,1,1,1,1,1,'',3),(29,3,'password','password','password',0,0,0,1,1,0,'',4),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}',10),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,'',5),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,'',6),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(34,3,'avatar','image','avatar',0,1,1,1,1,1,'',8),(35,5,'id','number','id',1,0,0,0,0,0,'',1),(36,5,'name','text','name',1,1,1,1,1,1,'',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(39,4,'id','number','id',1,0,0,0,0,0,'',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(41,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(42,4,'name','text','name',1,1,1,1,1,1,'',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(46,6,'id','number','id',1,0,0,0,0,0,'',1),(47,6,'name','text','Name',1,1,1,1,1,1,'',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,NULL,14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,NULL,15),(53,3,'role_id','text','role_id',1,1,1,1,1,1,'',9),(54,7,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(55,7,'name','text','Name',0,1,1,1,1,1,NULL,2),(56,7,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(57,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(58,7,'link_group_hasmany_link_relationship','relationship','links',0,1,1,1,1,1,'{\"model\":\"App\\\\Link\",\"table\":\"links\",\"type\":\"hasMany\",\"column\":\"link_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',5),(59,8,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(60,8,'url','text','Url',0,1,1,1,1,1,NULL,2),(61,8,'active','checkbox','Active',0,1,1,1,1,1,NULL,3),(62,8,'link_group_id','checkbox','Link Group Id',0,0,1,1,0,1,NULL,4),(63,8,'name','text','Name',0,1,1,1,1,1,NULL,5),(64,8,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,6),(65,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(66,8,'link_belongsto_link_group_relationship','relationship','link_groups',0,1,1,1,1,1,'{\"model\":\"App\\\\LinkGroup\",\"table\":\"link_groups\",\"type\":\"belongsTo\",\"column\":\"link_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',8),(67,9,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(68,9,'name','text','Name',0,1,1,1,1,1,NULL,2),(69,9,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(70,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(72,1,'language_id','checkbox','Language Id',0,0,1,1,0,1,NULL,16),(73,10,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(74,10,'title','text','Title',0,1,1,1,1,1,NULL,2),(75,10,'excerpt','text_area','Excerpt',0,1,1,1,1,1,NULL,3),(76,10,'body','rich_text_box','Body',0,1,1,1,1,1,NULL,4),(77,10,'active','checkbox','Active',0,1,1,1,1,1,NULL,5),(78,10,'language_id','checkbox','Language Id',0,0,1,1,0,1,NULL,6),(79,10,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,7),(80,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,8),(81,10,'news_belongsto_language_relationship','relationship','languages',0,1,1,1,1,1,'{\"model\":\"App\\\\Language\",\"table\":\"languages\",\"type\":\"belongsTo\",\"column\":\"language_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',9),(82,7,'active','checkbox','Active',0,1,1,1,1,1,NULL,5),(84,7,'language_id','checkbox','Language Id',0,0,1,1,0,1,NULL,6),(85,7,'link_group_belongsto_language_relationship','relationship','languages',0,1,1,1,1,1,'{\"model\":\"App\\\\Language\",\"table\":\"languages\",\"type\":\"belongsTo\",\"column\":\"language_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',7),(86,11,'id','checkbox','Id',1,1,1,0,0,0,NULL,1),(87,11,'name','text','Name',1,1,1,1,1,1,NULL,2),(88,11,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,3),(89,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(90,12,'id','checkbox','Id',1,1,1,0,0,0,NULL,1),(91,12,'label','text','Label',1,1,1,1,1,1,NULL,3),(92,12,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,4),(93,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,5),(94,12,'category_id','checkbox','Category Id',1,1,1,1,1,1,NULL,2),(95,12,'file_belongsto_file_category_relationship','relationship','file_categories',0,1,1,1,1,1,'{\"model\":\"App\\\\FileCategory\",\"table\":\"file_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',6),(96,11,'file_category_hasmany_file_relationship','relationship','files',0,1,1,1,1,1,'{\"model\":\"App\\\\File\",\"table\":\"files\",\"type\":\"hasMany\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',5);

/*Table structure for table `data_types` */

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_types` */

insert  into `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`created_at`,`updated_at`) values (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,0,'2017-12-01 17:13:39','2017-12-02 16:50:53'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,'2017-12-01 17:13:39','2017-12-01 17:13:39'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,'2017-12-01 17:13:39','2017-12-01 17:13:39'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,'2017-12-01 17:13:39','2017-12-01 17:13:39'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,'2017-12-01 17:13:39','2017-12-01 17:13:39'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,'2017-12-01 17:13:39','2017-12-01 17:13:39'),(7,'link_groups','link-groups','Link Group','Link Groups',NULL,'App\\LinkGroup',NULL,NULL,NULL,1,0,'2017-12-01 17:14:13','2017-12-01 17:14:13'),(8,'links','links','Link','Links',NULL,'App\\Link',NULL,NULL,NULL,1,0,'2017-12-01 17:16:07','2017-12-01 17:16:07'),(9,'languages','languages','Language','Languages',NULL,'App\\Language',NULL,NULL,NULL,1,0,'2017-12-02 16:48:05','2017-12-02 16:48:05'),(10,'news','news','News','News',NULL,'App\\News',NULL,NULL,NULL,1,0,'2017-12-02 16:58:20','2017-12-02 16:58:20'),(11,'file_categories','file-categories','File Category','File Categories','voyager-folder','App\\FileCategory',NULL,NULL,NULL,1,0,'2017-12-03 19:42:41','2017-12-03 19:57:59'),(12,'files','files','File','Files','voyager-file-text','App\\File',NULL,NULL,NULL,1,0,'2017-12-03 19:48:20','2017-12-03 19:59:05');

/*Table structure for table `file_categories` */

DROP TABLE IF EXISTS `file_categories`;

CREATE TABLE `file_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `file_categories` */

insert  into `file_categories`(`id`,`name`,`created_at`,`updated_at`) values (1,'kategorija 1','2017-12-03 19:58:24','2017-12-03 19:58:24'),(2,'kategorija 2','2017-12-03 19:58:38','2017-12-03 19:58:38');

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_category_id_foreign` (`category_id`),
  CONSTRAINT `files_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `file_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `files` */

insert  into `files`(`id`,`label`,`created_at`,`updated_at`,`category_id`) values (2,'Novi fajl','2017-12-03 20:01:29','2017-12-03 20:01:29',1),(3,'fajl.txt','2017-12-04 00:02:00','2017-12-04 00:02:00',1);

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `languages` */

insert  into `languages`(`id`,`name`,`created_at`,`updated_at`) values (1,'sr','2017-12-02 15:20:13','2017-12-02 15:20:13'),(2,'sr-Latn','2017-12-02 15:21:08','2017-12-02 15:21:08'),(3,'en','2017-12-02 15:21:14','2017-12-02 15:21:14');

/*Table structure for table `link_groups` */

DROP TABLE IF EXISTS `link_groups`;

CREATE TABLE `link_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `language_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `link_groups` */

insert  into `link_groups`(`id`,`name`,`created_at`,`updated_at`,`active`,`language_id`) values (1,'Uputstva','2017-12-01 17:17:00','2017-12-02 17:17:48',1,2),(2,'Podrška projektu','2017-12-01 17:17:00','2017-12-02 17:21:19',1,2),(3,'Упутства','2017-12-02 17:20:00','2017-12-02 17:22:59',1,1),(4,'Instructions','2017-12-11 19:23:15','2017-12-11 19:23:15',1,3),(5,'Project support','2017-12-11 19:29:22','2017-12-11 19:29:22',1,3),(6,'Подршка пројекту','2017-12-11 19:29:50','2017-12-11 19:29:50',1,1),(7,'European SDI','2017-12-11 19:32:33','2017-12-11 19:32:33',1,3),(8,'Evropski SDI','2017-12-11 19:33:16','2017-12-11 19:33:16',1,2),(9,'Европски СДИ','2017-12-11 19:33:39','2017-12-11 19:33:39',1,1);

/*Table structure for table `links` */

DROP TABLE IF EXISTS `links`;

CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `link_group_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `links` */

insert  into `links`(`id`,`url`,`active`,`link_group_id`,`name`,`created_at`,`updated_at`) values (1,'http://www.geosrbija.rs/Files/Uputstvo%20za%20koriscenje%20Digitalne%20platforme%20za%20NIGP.pdf',1,1,'Ilustrovano uputstvo za korišćenje Digitalne platforme za Nacionalnu infrastrukturu geoprostornih podataka (PDF)','2017-12-01 17:18:17','2017-12-01 17:18:17'),(3,'https://www.kartverket.no/',1,2,'Kartverket – Norveška agencija za kartografiju i katastar','2017-12-01 17:19:00','2017-12-01 17:19:00'),(4,'https://www.youtube.com/watch?v=Rjrs1Bf7pbI',1,3,'Видео упутство за коришћење Дигиталне платформе за Националну инфраструктуру геопросторних података','2017-12-02 17:22:46','2017-12-02 17:22:46'),(5,'https://www.youtube.com/watch?v=Rjrs1Bf7pbI',1,4,'Video instructions for using Digital Platform of National Spatial Data Infrastructure','2017-12-11 19:34:46','2017-12-11 19:34:46'),(6,'https://www.youtube.com/watch?v=Rjrs1Bf7pbI',1,1,'Video uputstvo za korišćenje Digitalne platforme za Nacionalnu infrastrukturu geoprostornih podataka','2017-12-11 19:37:28','2017-12-11 19:37:28'),(7,'http://www.geosrbija.rs/Files/Uputstvo%20za%20koriscenje%20Digitalne%20platforme%20za%20NIGP.pdf',1,3,'Илустровано упутство за коришћење Дигиталне платформе за Националну инфраструктуру геопросторних података (PDF)','2017-12-11 19:38:27','2017-12-11 19:38:27'),(8,'http://www.geosrbija.rs/Files/Uputstvo%20za%20koriscenje%20Digitalne%20platforme%20za%20NIGP.pdf',1,4,'User manual for Digital Platform for National Spatial Data Infrastructure (PDF in Serbian)','2017-12-11 19:38:50','2017-12-11 19:38:50'),(9,'https://www.kartverket.no/',1,5,'Kartverket - Norwegian Mapping and Cadastre Authority','2017-12-11 19:39:47','2017-12-11 19:39:47'),(10,'https://www.kartverket.no/',1,6,'Картверкет – Норвешка агенција за картографију и катастар','2017-12-11 19:41:47','2017-12-11 19:41:47'),(11,'https://www.youtube.com/watch?v=r4EPjVNAd8Q',1,3,'Видео упутство за коришћење картографског прегледа','2017-12-11 19:42:39','2017-12-11 19:42:39'),(12,'https://www.youtube.com/watch?v=r4EPjVNAd8Q',1,1,'Video uputstvo za korišćenje kartografskog pregleda','2017-12-11 19:43:04','2017-12-11 19:43:04'),(13,'https://www.youtube.com/watch?v=r4EPjVNAd8Q',1,4,'Video instructions for using the map browser','2017-12-11 19:43:25','2017-12-11 19:43:25'),(14,'http://inspire.jrc.ec.europa.eu/',1,7,'INSPIRE','2017-12-11 19:45:36','2017-12-11 19:45:36'),(15,'http://inspire.jrc.ec.europa.eu/',1,8,'INSPIRE','2017-12-11 19:45:52','2017-12-11 19:45:52'),(16,'http://inspire.jrc.ec.europa.eu/',1,9,'ИНСПАЈР','2017-12-11 19:46:19','2017-12-11 19:46:19'),(17,'http://ies.jrc.ec.europa.eu/SDI',1,9,'JRC (Истраживачки центар Европске комисије) – SDI јединица','2017-12-11 19:47:30','2017-12-11 19:47:30'),(18,'http://ies.jrc.ec.europa.eu/SDI',1,8,'JRC (Istraživački centar Evropske komisije) – SDI jedinica','2017-12-11 19:48:00','2017-12-11 19:48:00'),(19,'http://ies.jrc.ec.europa.eu/SDI',1,7,'JRC (Join Research Centre) – SDI Unit','2017-12-11 19:48:53','2017-12-11 19:48:53'),(20,'http://www.eurogeographics.org/',1,7,'EuroGeographics','2017-12-11 19:49:17','2017-12-11 19:49:17'),(21,'http://www.eurogeographics.org/',1,8,'EuroGeographics','2017-12-11 19:49:40','2017-12-11 19:49:40'),(22,'http://www.eurogeographics.org/',1,9,'EuroGeographics','2017-12-11 19:50:00','2017-12-11 19:50:12');

/*Table structure for table `menu_items` */

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_items` */

insert  into `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) values (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.media.index',NULL),(3,1,'Posts','','_self','voyager-news',NULL,NULL,6,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.posts.index',NULL),(4,1,'Users','','_self','voyager-person',NULL,NULL,3,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.users.index',NULL),(5,1,'Categories','','_self','voyager-categories',NULL,NULL,8,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.categories.index',NULL),(6,1,'Pages','','_self','voyager-file-text',NULL,NULL,7,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.pages.index',NULL),(7,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.roles.index',NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2017-12-01 17:13:39','2017-12-01 17:13:39',NULL,NULL),(9,1,'Menu Builder','','_self','voyager-list',NULL,8,10,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.menus.index',NULL),(10,1,'Database','','_self','voyager-data',NULL,8,11,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.database.index',NULL),(11,1,'Compass','/admin/compass','_self','voyager-compass',NULL,8,12,'2017-12-01 17:13:39','2017-12-01 17:13:39',NULL,NULL),(12,1,'Hooks','/admin/hooks','_self','voyager-hook',NULL,8,13,'2017-12-01 17:13:39','2017-12-01 17:13:39',NULL,NULL),(13,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2017-12-01 17:13:39','2017-12-01 17:13:39','voyager.settings.index',NULL),(14,1,'Link Groups','/admin/link-groups','_self',NULL,NULL,NULL,15,'2017-12-01 17:14:13','2017-12-01 17:14:13',NULL,NULL),(15,1,'Links','/admin/links','_self',NULL,NULL,NULL,16,'2017-12-01 17:16:07','2017-12-01 17:16:07',NULL,NULL),(16,1,'Languages','/admin/languages','_self',NULL,NULL,NULL,17,'2017-12-02 16:48:05','2017-12-02 16:48:05',NULL,NULL),(17,1,'News','/admin/news','_self',NULL,NULL,NULL,18,'2017-12-02 16:58:20','2017-12-02 16:58:20',NULL,NULL),(18,1,'File Categories','/admin/file-categories','_self','voyager-list',NULL,NULL,19,'2017-12-03 19:42:41','2017-12-03 19:42:41',NULL,NULL),(19,1,'Files','/admin/files','_self','voyager-file-text',NULL,NULL,20,'2017-12-03 19:48:20','2017-12-03 19:48:20',NULL,NULL),(20,2,'Home','/','_self',NULL,'#000000',NULL,1,'2017-12-14 19:52:13','2017-12-14 20:39:59',NULL,'');

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`created_at`,`updated_at`) values (1,'admin','2017-12-01 17:13:39','2017-12-01 17:13:39'),(2,'en','2017-12-14 19:48:08','2017-12-14 20:14:59'),(3,'sr','2017-12-14 20:18:34','2017-12-14 20:18:34'),(4,'sr-Latn','2017-12-14 20:18:41','2017-12-14 20:18:41');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (58,'2014_10_12_000000_create_users_table',1),(59,'2014_10_12_100000_create_password_resets_table',1),(60,'2016_01_01_000000_add_voyager_user_fields',1),(61,'2016_01_01_000000_create_data_types_table',1),(62,'2016_01_01_000000_create_pages_table',1),(63,'2016_01_01_000000_create_posts_table',1),(64,'2016_02_15_204651_create_categories_table',1),(65,'2016_05_19_173453_create_menu_table',1),(66,'2016_10_21_190000_create_roles_table',1),(67,'2016_10_21_190000_create_settings_table',1),(68,'2016_11_30_135954_create_permission_table',1),(69,'2016_11_30_141208_create_permission_role_table',1),(70,'2016_12_26_201236_data_types__add__server_side',1),(71,'2017_01_13_000000_add_route_to_menu_items_table',1),(72,'2017_01_14_005015_create_translations_table',1),(73,'2017_01_15_000000_add_permission_group_id_to_permissions_table',1),(74,'2017_01_15_000000_create_permission_groups_table',1),(75,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(76,'2017_03_06_000000_add_controller_to_data_types_table',1),(77,'2017_04_11_000000_alter_post_nullable_fields_table',1),(78,'2017_04_21_000000_add_order_to_data_rows_table',1),(79,'2017_07_05_210000_add_policyname_to_data_types_table',1),(80,'2017_08_05_000000_add_group_to_settings_table',1),(81,'2017_12_01_181018_create_link_groups_table',1),(82,'2017_12_01_181018_create_links_table',1),(83,'2017_12_03_173523_create_files_table',2),(84,'2017_12_03_173828_create_file_categories_table',2),(85,'2017_12_03_175228_add_foreign_key_on_files',3);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` mediumtext COLLATE utf8_unicode_ci,
  `active` tinyint(4) DEFAULT NULL,
  `language_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`excerpt`,`body`,`active`,`language_id`,`created_at`,`updated_at`) values (1,'Nova Digitalna platforma za Nacionalnu infrastrukturu geoprostornih podataka','Na adresi www.geosrbija.rs počela je sa radom test faza nove Digitalne platforme za Nacionalnu infrastrukturu geoprostornih podataka.','<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20171003_nk1.jpg\" alt=\"\" width=\"540\" height=\"573\" /></p>\r\n<p>&nbsp;</p>\r\n<p class=\"body_text\">RGZ je razvio novi portal u saradnji sa norve&scaron;kim partnerom &ndash; Statens Kartverk (norve&scaron;ka agencija za katastar i kartografiju), u okviru Nacionalne infrastrukture geoprostornih podataka.</p>\r\n<p class=\"body_text\">Reč je o novoj platformi koja objedinjuje sve prostorne podatke na državnom nivou, &scaron;to je od velikog značaja za državne organe, privredu i građane.</p>\r\n<p class=\"body_text\">Na portalu Geosrbija se mogu naći svi prostorni podaci RGZ-a, Republičkog zavoda za statistiku, Hidrometeorolo&scaron;kog zavoda, podaci o zemlji&scaron;tu, objektima, adresama, za&scaron;tićenim područjima, nacionalnim parkovima, nadmorskim visinama i slično.</p>\r\n<p class=\"body_text\">Građanima je pomoću portala omogućeno da nađu i pogledaju svoje parcele i vide kakvo je trenutno stanje na njihovim nepokretnostima, koristeći satelitske i ortofoto snimke. Takođe može da se vidi da li je na nekom zemlji&scaron;tu posečena &scaron;uma, kakav je status nekog objekta u katastru. Portal pored ostalog omogućava i veću transparentnost rada državnih organa.</p>\r\n<p class=\"body_text\">Počelo je temeljno testiranje svih mogućnosti portala Geosrbija, koji će zvanično početi da radi za nekoliko nedelja.</p>\r\n<p class=\"body_text\">Na jednom mestu će biti svi zvanični geoprostorni podaci državnih organa, na osnovu kojih oni mogu da donose odluke, unapređuju poslovne procese i prikupljaju nove podatke, a građani će moći da pristupe tim podacima na jednostavan način.</p>\r\n<p class=\"body_text\">Aplikacija je takva da se može lako koristiti, kao na primer guglove aplikacije, s tim &scaron;to su na portalu Geosrbija zvanični geoprostorni podaci, iza kojih stoji država Srbija, &scaron;to korisnicima pruža veću sigurnost prilikom dono&scaron;enja važnih odluka.</p>\r\n<p class=\"body_text\">Statens Kartverk je finansirao platformu u vidu donacije, a RGZ je obavio tehnički deo posla i usavr&scaron;io je, dok je adekvatan hardver nabavljen u okviru projekta Svetske banke.</p>\r\n<p class=\"body_text\">Osnovna namena ove platforme je da unapredi procese rada drugih državnih institucija i da im pomogne da prikupe nove ili ažuriraju već postojeće podatke, koji su važni za državu i na&scaron;e građane.</p>\r\n<p class=\"body_text\">Građanima je omogućeno da preko mobilnih telefona ili tableta prijave neku pojavu u prirodi, na primer divlju deponiju, poplavu i slično, koja je od interesa za građane.</p>\r\n<p class=\"body_text\">Na <a href=\"https://www.youtube.com/watch?v=Rjrs1Bf7pbI\">OVOM LINKU</a> ili klikom na sliku ispod možete pogledati video uputstvo za kori&scaron;ćenje Digitalne platforme za Nacionalnu infrastrukturu geoprostornih podataka.</p>\r\n<p class=\"sub_head\">Video upustvo</p>\r\n<p class=\"sub_head\" style=\"text-align: center;\"><iframe title=\"\" src=\"https://www.youtube.com/embed/Rjrs1Bf7pbI?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>\r\n<p class=\"body_text\">Takođe pripremljeno je i pisano upustvo sa ilustracijama za kori&scaron;ćenje digitalne platforme za nacionalnu infrastrukturu geoprostornih podataka koje se može preuzeti <a href=\"http://www.geosrbija.rs/Files/Uputstvo%20za%20koriscenje%20Digitalne%20platforme%20za%20NIGP.pdf\">OVDE</a>.</p>\r\n<p class=\"body_text\">Pozivamo Vas da nam tokom test faze po&scaron;aljete svoje sugestije na adresu <a href=\"mailto:nsdi@rgz.gov.rs\">nsdi@rgz.gov.rs</a>.</p>',1,2,'2017-12-02 16:59:00','2017-12-11 20:13:57'),(2,'Нова Дигитална платформа за Националну инфраструктуру геопросторних података','На адреси www.geosrbija.rs почела је са радом тест фаза нове Дигиталне платформе за Националну инфраструктуру геопросторних података.','<p class=\"body_text\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20171003_nk.jpg\" alt=\"\" width=\"540\" height=\"573\" /></p>\r\n<p class=\"body_text\">РГЗ је развио нови портал у сарадњи са норвешким партнером &ndash; Статенс Картверк (норвешка агенција за катастар и картографију), у оквиру Националне инфраструктуре геопросторних података.</p>\r\n<p class=\"body_text\">Реч је о новој платформи која обједињује све просторне податке на државном нивоу, што је од великог значаја за државне органе, привреду и грађане.</p>\r\n<p class=\"body_text\">На порталу Геосрбија се могу наћи сви просторни подаци РГЗ-а, Републичког завода за статистику, Хидрометеоролошког завода, подаци о земљишту, објектима, адресама, заштићеним подручјима, националним парковима, надморским висинама и слично.</p>\r\n<p class=\"body_text\">Грађанима је помоћу портала омогућено да нађу и погледају своје парцеле и виде какво је тренутно стање на њиховим непокретностима, користећи сателитске и ортофото снимке. Такође може да се види да ли је на неком земљишту посечена шума, какав је статус неког објекта у катастру. Портал поред осталог омогућава и већу транспарентност рада државних органа.</p>\r\n<p class=\"body_text\">Почело је темељно тестирање свих могућности портала Геосрбија, који ће званично почети да ради за неколико недеља.</p>\r\n<p class=\"body_text\">На једном месту ће бити сви званични геопросторни подаци државних органа, на основу којих они могу да доносе одлуке, унапређују пословне процесе и прикупљају нове податке, а грађани ће моћи да приступе тим подацима на једноставан начин.</p>\r\n<p class=\"body_text\">Апликација је таква да се може лако користити, као на пример гуглове апликације, с тим што су на порталу Геосрбија званични геопросторни подаци, иза којих стоји држава Србија, што корисницима пружа већу сигурност приликом доношења важних одлука.</p>\r\n<p class=\"body_text\">Статенс Картверк је финансирао платформу у виду донације, а РГЗ је обавио технички део посла и усавршио је, док је адекватан хардвер набављен у оквиру пројекта Светске банке.</p>\r\n<p class=\"body_text\">Основна намена ове платформе је да унапреди процесе рада других државних институција и да им помогне да прикупе нове или ажурирају већ постојеће податке, који су важни за државу и наше грађане.</p>\r\n<p class=\"body_text\">Грађанима је омогућено да преко мобилних телефона или таблета пријаве неку појаву у природи, на пример дивљу депонију, поплаву и слично, која је од интереса за грађане.</p>\r\n<p class=\"body_text\">На <a href=\"https://www.youtube.com/watch?v=Rjrs1Bf7pbI\">ОВОМ ЛИНКУ</a> или кликом на слику испод можете погледати видео упутство за коришћење Дигиталне платформе за Националну инфраструктуру геопросторних података.</p>\r\n<p class=\"body_text\" style=\"text-align: center;\"><iframe title=\"\" src=\"https://www.youtube.com/embed/Rjrs1Bf7pbI?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>\r\n<p class=\"body_text\">&nbsp;</p>\r\n<p class=\"body_text\">Такође припремљено је и писано упуство са илустрацијама за коришћење дигиталне платформе за националну инфраструктуру геопросторних података које се може преузети <a href=\"http://www.geosrbija.rs/Files/Uputstvo%20za%20koriscenje%20Digitalne%20platforme%20za%20NIGP.pdf\">ОВДЕ</a>.</p>\r\n<p class=\"body_text\">Позивамо Вас да нам током тест фазе пошаљете своје сугестије на адресу <a href=\"mailto:nsdi@rgz.gov.rs\">nsdi@rgz.gov.rs</a>.</p>',1,1,'2017-12-02 17:00:00','2017-12-11 20:13:39'),(3,'New Digital Platform for National Geospatial Data Infrastructure','The test phase of the new Digital Platform for the National Geospatial Data Infrastructure was launched at www.geosrbija.rs.','<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20171003_nk2.jpg\" alt=\"\" width=\"540\" height=\"573\" /></p>\r\n<p class=\"body_text\">RGZ has developed a new portal in cooperation with the Norwegian partner - Statens Kartverk (Norwegian Agency for Cadastre and Cartography), within the National Geospatial Data Infrastructure.</p>\r\n<p class=\"body_text\">This is a new platform that brings together all spatial data at the state level, which is of great importance to state authorities, businesses and citizens.</p>\r\n<p class=\"body_text\">On the portal Geosrbija all spatial data аre available from the RGА, the Statistical Office, Hydrometeorological Institute, the data on land, objects, addresses, protected areas, national parks, altitudes and the like can be found.</p>\r\n<p class=\"body_text\">Citizens can use the portalto find and view their parcels and see what is the current state of their real estate, using satellite and orthophoto images. It can also be seen whether there is a forest cut on a piece of land, and what is the status of an object in the cadastre. The portal, among other things, enables greater transparency of the work of state bodies</p>\r\n<p class=\"body_text\">The advantage of geoportal GeoSrbija is that all official geospatial data from state authorities will be placed in one portal based on which they can make decisions, improve business processes and collect new data, and citizens will be able to access these data in a simple way.</p>\r\n<p class=\"body_text\">The application is such that it can be easily used, such as google\'s applications, while portal Geosrbija contains official geospatial data, providing users with greater security in making important decisions.</p>\r\n<p class=\"body_text\">Statens Kartverk has funded the donation for building the platform, and RGZ has done the technical part of the job and tailor it to Serbian needs, while adequate hardware was acquired within the World Bank project.</p>\r\n<p class=\"body_text\">The main purpose of this platform is to improve the processes of work of other state institutions and to help them collect new or update existing data, which are important for the state and our citizens.</p>\r\n<p class=\"body_text\">Citizens are allowed to report a natural phenomenon through mobile phones or tablets, such as wild dumps, floods and the like, which is of great interest to citizens.</p>\r\n<p class=\"body_text\">On this <a href=\"https://www.youtube.com/watch?v=Rjrs1Bf7pbI\">LINK</a> or by clicking on the picture below you can see the video manual for using the Digital Platform for the National Geospatial Data Infrastructure.</p>\r\n<p class=\"sub_head\">Video instruction</p>\r\n<p class=\"sub_head\"><iframe title=\"\" src=\"https://www.youtube.com/embed/Rjrs1Bf7pbI?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>\r\n<div class=\"page-template-border\">\r\n<p class=\"body_text\">A written guide was also prepared with illustrations for the use of the portal GeoSrbija for the national spatial data infrastructure that can be downloaded. <a href=\"http://www.geosrbija.rs/Files/Uputstvo%20za%20koriscenje%20Digitalne%20platforme%20za%20NIGP.pdf\">HERE</a>.</p>\r\n<p class=\"body_text\">We invite you to send us your suggestions at the <a href=\"mailto:nsdi@rgz.gov.rs\">nsdi@rgz.gov.rs</a> during the test phase.</p>\r\n</div>\r\n<p>&nbsp;</p>',1,3,'2017-12-11 20:08:00','2017-12-11 20:13:02'),(4,'Obuka o Open Foris platformama za praćenje promena na zemljištu na osnovu satelitskih snimaka','Od 3.7. do 7.7.2017. u prostorijama Republičkog geodetskog zavoda održana je obuka o mogućnostima korišćenja Open Foris aplikacija u saradnji sa UN FAO (Organizacija Ujedinjenih nacija za hranu i poljoprivredu).','<p class=\"body_text\"><em><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20170711_nk.jpg\" alt=\"\" width=\"540\" height=\"300\" /></em></p>\r\n<p class=\"body_text\"><em>Open Foris</em> je skup besplatnih softverskih platformi razvijenih od strane Odeljenje za &scaron;umarstvo FAO-a za potrebe praćenja promena na zemlji&scaron;tu pomoću vizuelne interpretacije dostupnih satelitskih snimaka. Komponente <em>Open Foris</em>-a su:</p>\r\n<ul>\r\n<li class=\"body_text\">Collect;</li>\r\n<li class=\"body_text\">Collect Mobile;</li>\r\n<li class=\"body_text\">Collect Earth;</li>\r\n<li class=\"body_text\">Calc;</li>\r\n<li class=\"body_text\">Geospatial Toolkit.</li>\r\n</ul>\r\n<p class=\"body_text\">Tokom radionice akcenat je bio na prezentaciji rada sa raspoloživim alatima i praktičnoj primeni <em>Google</em> tehnologije za upravljanje podacima na primerima za teritoriju Republike Srbije. Obuku je održao predstavnik UN FAO iz Odeljenja za &Scaron;umarstvo, gospodin <em>Giulio Marchi</em>.</p>\r\n<p class=\"body_text\">Učesnici obuke su upoznati sa radom i mogućnostima kori&scaron;ćenja alata <em>Collect Earth</em> softverske platforme. Sistem se zasniva na Google re&scaron;enjima za pristup geoprostornim podacima kao &scaron;to su <em>Google Earth</em> i <em>Earth Engine</em>. Uz veliki broj arhivskih satelitskih snimaka veoma visoke rezolucije, dostupni su i ažurni snimci <em>Sentinel 2</em>, <em>Landsat</em> i drugih satelitskih platformi. Prikupljanje podata se vr&scaron;i po principu &bdquo;uvećane stvarnosti&ldquo; kori&scaron;ćenjem svih raspoloživih podataka i vizuelne interpretacije operatera na osnovu koje se mogu kreirati statistički trendovi na velikim povr&scaron;inama u zavisnosti od broja uzoraka. Tokom obuke prikupljeno je 600 uzoraka sa informacijama o zemlji&scaron;tu na teritoriji Republike Srbije na osnovu raspoloživih istorijskih snimaka. Rezultati analize prikupljenih uzoraka upoređeni su sa podacima Karte osnovnog zemlji&scaron;nog pokrivača za epohu 2011, pri čemu su dobijene vrlo bliske vrednosti.</p>\r\n<p class=\"body_text\">U okviru <em>Open Foris Collect</em>-a prikazan je postupak kreiranja forme za prikupljanje podataka u okviru <em>Collect Earth</em>-a. Takođe, prezentovana je <em>SAIKU</em> aplikacija za analizu i prezentaciju prikupljenih podataka. Pored toga, učesnici radionice su se upoznali i sa radom Collect Mobile sistema za telefone na android platformi i mogućnostima prikupljanja podataka u realnom vremenu na terenu po unapred zadatim parametrima.</p>\r\n<p class=\"body_text\">Pored zaposlenih iz Republičkog geodetskog zavoda, obuci su prisustvovali i zaposleni iz drugih institucija: Uprava za agrarna plaćanja, Uprava za poljoprivredno zemlji&scaron;te i Agencija za za&scaron;titu životne sredine. Kratka prezentacija je održana i rukovodstvu Republičkog geodetskog zavoda gde su predstavljene komponente <em>Collect Earth</em> sistema za prikupljanje i analizu geoprostornih podataka.</p>\r\n<p class=\"body_text\">Republički geodetski zavod će na osnovu prezentovanog sadržaja razmotriti mogućnost primene <em>Open Foris</em> sistema i razvoj aplikacija neophodnih za obavljanje aktivnosti u svojoj nadležnosti ali i za unapređenje rada drugih državnih institucija kojima su prostorne informacije od značaja.</p>\r\n<p class=\"sub_head\"><a href=\"https://www.youtube.com/watch?v=Ezn1ne2Fj6Y\"><em>A Planetary Perspective: With Landsat and Google Earth Engine</em></a></p>\r\n<p class=\"sub_head\"><iframe title=\"\" src=\"https://www.youtube.com/embed/Ezn1ne2Fj6Y?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>',1,2,'2017-12-11 20:12:00','2017-12-11 20:12:53'),(5,'Обука о Open Foris платформама за праћење промена на земљишту на основу сателитских снимака','Од 3.7. до 7.7.2017. у просторијама Републичког геодетског завода одржанa је обука о могућностима коришћења Оpen Foris апликација у сарадњи са UN FAO (Организација Уједињених нација за храну и пољопривреду).','<p class=\"body_text\"><em><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20170711_nk1.jpg\" alt=\"\" width=\"540\" height=\"300\" /></em></p>\r\n<p class=\"body_text\"><em>Open Foris</em> је скуп бесплатних софтверских платформи развијених од стране Одељење за шумарство FAO-а за потребе праћења промена на земљишту помоћу визуелне интерпретације доступних сателитских снимака. Компоненте <em>Open Foris</em>-а су:</p>\r\n<ul>\r\n<li class=\"body_text\">Collect;</li>\r\n<li class=\"body_text\">Collect Mobile;</li>\r\n<li class=\"body_text\">Collect Earth;</li>\r\n<li class=\"body_text\">Calc;</li>\r\n<li class=\"body_text\">Geospatial Toolkit.</li>\r\n</ul>\r\n<p class=\"body_text\">Током радионице акценат је био на презентацији рада са расположивим алатима и практичној примени <em>Google</em> технологије за управљање подацима на примерима за територију Републике Србије. Обуку је одржао представник UN FAO из Одељења за Шумарство, господин <em>Giulio Marchi</em>.</p>\r\n<p class=\"body_text\">Учесници обуке су упознати са радом и могућностима коришћења алата <em>Collect Earth</em> софтверске платформе. Систем се заснива на Google решењима за приступ геопросторним подацима као што су <em>Google Earth</em> и <em>Earth Engine</em>. Уз велики број архивских сателитских снимака веома високе резолуције, доступни су и ажурни снимци <em>Sentinel 2</em>, <em>Landsat</em> и других сателитских платформи. Прикупљање подата се врши по принципу &bdquo;увећане стварности&ldquo; коришћењем свих расположивих података и визуелне интерпретације оператера на основу које се могу креирати статистички трендови на великим површинама у зависности од броја узорака. Током обуке прикупљенo је 600 узорака са информацијама о земљишту на територији Републике Србије на основу расположивих историјских снимака. Резултати анализе прикупљених узорака упоређени су са подацима Карте основног земљишног покривача за епоху 2011, при чему су добијене врло блиске вредности.</p>\r\n<p class=\"body_text\">У оквиру <em>Open Foris Collect</em>-а приказан је поступак креирања форме за прикупљање података у оквиру <em>Collect Earth</em>-а. Такође, презентована је <em>SAIKU</em> апликација за анализу и презентацију прикупљених података. Поред тога, учесници радионице су се упознали и са радом Collect Mobile система за телефоне на андроид платформи и могућностима прикупљања података у реалном времену на терену по унапред задатим параметрима.</p>\r\n<p class=\"body_text\">Поред запослених из Републичког геодетског завода, обуци су присуствовали и запослени из других институција: Управа за аграрна плаћања, Управа за пољопривредно земљиште и Агенција за заштиту животне средине. Кратка презентација је одржана и руководству Републичког геодетског завода где су представљене компоненте <em>Collect Earth</em> система за прикупљање и анализу геопросторних података.</p>\r\n<p class=\"body_text\">Републички геодетски завод ће на основу презентованог садржаја размотрити могућност примене <em>Open Foris</em> система и развој апликација неопходних за обављање активности у својој надлежности али и за унапређење рада других државних институција којима су просторне информације од значаја.</p>\r\n<p class=\"sub_head\"><a href=\"https://www.youtube.com/watch?v=Ezn1ne2Fj6Y\"><em>A Planetary Perspective: With Landsat and Google Earth Engine</em></a></p>\r\n<p class=\"sub_head\"><em><iframe title=\"\" src=\"https://www.youtube.com/embed/Ezn1ne2Fj6Y?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></em></p>',1,1,'2017-12-11 20:16:00','2017-12-11 20:17:00'),(6,'Workshop for Open Foris platform for tracking ground changes using satellite images','A workshop on possibilites of using the Open Foris application was held between 3.7. and 7.7.2017. at the Republic geodetic authority in cooperation with UN FAO (Food and Agriculture Organization of the United Nations).','<p class=\"body_text\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20170711_nk2.jpg\" alt=\"\" width=\"540\" height=\"300\" /></p>\r\n<p class=\"body_text\">Open Foris is a collection of free software platforms developed by the Department of Forestry of FAO to satisfy needs for tracking changes on teh ground using visual interpretation of the available satellite imagery. The components of Open Foris are:</p>\r\n<ul>\r\n<li class=\"body_text\">Collect;</li>\r\n<li class=\"body_text\">Collect Mobile;</li>\r\n<li class=\"body_text\">Collect Earth;</li>\r\n<li class=\"body_text\">Calc;</li>\r\n<li class=\"body_text\">Geospatial Toolkit.</li>\r\n</ul>\r\n<p class=\"body_text\">During the workshop teh focus was on the presentation of work with available tools and practical application of Google technologies for data management, using examples for the territory of the Republic of Serbia. The workship was held by the representative of UN FAO from the Department of Forestry, Giulio Marchi.</p>\r\n<p class=\"body_text\">Workshop participants were introduced to the work and possibilites of using the Collect Earth software platform. The system si based on Google\'s solutions for geospatial data access such as Google Earth and Earth Engine. Along with a large number of archival satellite images in high resolution, there are available images from Sentinel 2, Landsat and other satellite platforms. Data gathering is performed according to the \"enlarged reality\" principle using all of the available data and visual interpretation of the operator based on which it is possible to create statistical trends on large surfaces depending on the size of the sample. During the workshop, 600 samples were collected with information about land on the territory of Republic of Serbia based on available historical images. The results of the analysis were compared with date from the Map of the basic land cover from 2011, and the results were a close match.</p>\r\n<p class=\"body_text\">Within the Open Foris Collect framework, the process of creating a form for data gathering was presented using the Collect Earth framework. Along with that, SAIKU application for analysis and presentation of gathered data was presented. Workshop participants were introduced to the Collect Mobile system for mobile devices based on the Android platform and the possibilities of real-time data gathering on the field according to preset parameters.</p>\r\n<p class=\"body_text\">Along with employees from Republic geodetic authority, workshop was attended by employees from other institutions: Поред запослених из Републичког геодетског завода, обуци су присуствовали и запослени из других институција: Directorate for Agrarian Payments, Administration for Agricultural Land и Environmental Protection Agency. A short presentation was given to the management of the Republic geodetic authority as well, where components of Collect Earth for gathering and analysis of geospatial data was shown.</p>\r\n<p class=\"body_text\">Republic geodetic authority will, based on the presented material, consider the opportunity to apply Open Foris system and develop applications necessary for performing activities in its jurisdiction as well as improving the work of other government institutions which find geospatial data indispensable for their work.</p>\r\n<p class=\"sub_head\"><a href=\"https://www.youtube.com/watch?v=Ezn1ne2Fj6Y\">A Planetary Perspective: With Landsat and Google Earth Engine</a></p>\r\n<p class=\"sub_head\" style=\"text-align: center;\"><iframe title=\"\" src=\"https://www.youtube.com/embed/Ezn1ne2Fj6Y?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>',1,3,'2017-12-11 20:19:33','2017-12-11 20:19:33'),(7,'Tenth Regional Conference on Cadastre and Spatial Data Infrastructure','The Real Estate Cadastre Agency is the organizer of the Tenth Regional Conference on Cadastre and Spatial Data Infrastructure on the topic \"The role of national agencies for mapping and cadastre, private geodetic sector and universities on the process of managing geospatial data\", which was held on June 8 and 9, 2017. the Museum of the Macedonian struggle in Skopje.','<p class=\"body_text\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20170609_nk.jpg\" alt=\"\" width=\"540\" height=\"250\" /></p>\r\n<p class=\"body_text\">The aim of this conference is exchange of experiences between the countries in the region in the sphere of cadastre and spatial data infrastructure in order to establish a functional cadastre which should guarantee ownership of property, development of real estate market, increase of number of transactions, improvement of urban planning, development of infrastructure and environment with the aim sustainable development for the benefit of society.</p>\r\n<p class=\"body_text\">The regional conference includes the cadastres of Slovenia, Croatia, the Federation of Bosnia and Herzegovina, Republika Srpska, Montenegro, Serbia, Kosovo *, Albania, Bulgaria and Macedonia. The conference also includes the chambers of private geodetic companies in the countries of the Balkan Peninsula, which is the first time to participate in this conference and is expected to increase their number from next year and their participation becomes traditional.</p>\r\n<p class=\"body_text\">Representatives of the Swedish, Dutch and Norwegian cadastres also participated at the regional conference, bearing in mind that for 10 years they have continuously contributed greatly to the development of the cadastre in the Balkans. There are also representatives of EuroGeographics, UN-GGIM Europe, Council of European Geodetic Surveyors as well as representatives of faculties of Bulgaria, Croatia and Macedonia.</p>\r\n<p class=\"body_text\">For ten years now, there has been successful regional cooperation among agencies for mapping and cadastre, which has provided the opportunity for knowledge and good practice exchange, interconnection for the positive development of the cadastre and the possibility of creating new initiatives for regional cooperation such as the establishment of cross-border cooperation in the field of data exchange and services of national GNSS System, joint appearance of the countries of the region in front of international institutions as an equitable participation in regional projects in the field of cadastre and spatial data infrastructure before donation organizations.</p>\r\n<p class=\"body_text\">As a result of the joint cooperation, the INSPIRATION - Spatial Data Infrastructure of the Western Balkans countries was funded by the European Union. The aim of the project is to promote and strengthen the capacities of the Western Balkan countries in the process of implementing the INSPIRE Directive. After that, the IMPULS project was financed by the Swedish International Development Agency and aims to support the capacity building of national cadastral and geodetic agencies in establishing the national spatial data infrastructure, establishing technical interoperability between institutions in the region, and developing services with aim to exchange and share geospatial data among the countries of the region.</p>\r\n<p class=\"body_text\">At the beginning of this year, a regional project SPATIAL was launched - Strengthening professional access to land information in the Western Balkans region financed by the Dutch Ministry of Foreign Affairs through the pre-accession program MATRA. Through this project, assistance is planned for the countries of the Western Balkans in the process of harmonization and improvement of access to available geospatial information. Initiative through the Directive for reuse of Public Sector Information, the INSPIRE Directive, the development of global environmental monitoring services, global geospatial information management (UN-GGIM) for Europe, the Digital Agenda for Europe and the Agenda 2030 Global Land Management and Sustainable Development , Cadastre 2034 and the FIG perspective are paving the way for national cadastral and land administration agencies.</p>',1,3,'2017-12-11 20:21:29','2017-12-11 20:21:29'),(8,'Deseta regionalna konferencija za katastar i infrastrukturu geoprostornih podataka','Agencija za katastar nepokretnosti je organizator Desete regionalne konferencije za katastar i infrastrukturu prostornih podataka na temu: „Uloga nacionalnih agencija za kartografiju i katastar, privatnog geodetskog sektora i univerziteta na proces upravljanja geoprostornim podacima“ koja se održava od 8. i 9. juna 2017. u Muzeju makedonske borbe u Skoplju.','<p class=\"body_text\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20170609_nk1.jpg\" alt=\"\" width=\"540\" height=\"250\" /></p>\r\n<p class=\"body_text\">Cilj ove konferencije je razmena iskustava između zemalja regiona u oblasti katastra i infrastrukture prostornih podataka kako bi do&scaron;lo do uspostavljanja funkcionalnog katastra koji treba da garantuje pravo svojine, razvoj trži&scaron;ta nepokretnosti, povećanje broja transakcija, da pobolj&scaron;a urbanističko planiranje, razvoj infrastrukture i životne sredine sa ciljem održivog razvoja na dobrobit dru&scaron;tva.</p>\r\n<p class=\"body_text\">Na regionalnoj konferenciji učestvuju katastri Slovenije, Hrvatske, Federacije Bosne i Hercegovine, Republike Srpske, Crne Gore, Srbije, Kosova*, Albanije, Bugarske i Makedonije. U konferenciji učestvuju i komore privatnih geodetskih firmi zemalja Balkanskog poluostvra koje prvi put učestvuju na ovoj konferenciji i očekuje se da se od sledeće godine njihov broj poveća i njihovo uče&scaron;će postane tradicionalno.</p>\r\n<p class=\"body_text\">Na regionalnoj konferenciji prisutni su i predstavnici &scaron;vedskog, holandskog i norve&scaron;kog katastra imajući u vidu da već 10 godina kontinuirano pružaju veliki doprinos razvoju katastra na Balkanu. Tu su takođe predstavnici EuroGeographics, UN-GGIM Europe, Council of European Geodetic Surveyors kao i predstavnici fakulteta Bugarske, Hrvatske i Makedonije.</p>\r\n<p class=\"body_text\">Već deset godina traje uspe&scaron;na regionalna saradnja među katastrima koja je obezbedila mogućnost za razmenu znanja i dobrih praksi, međusobno povezivanje u cilju pozitivnog razvoja katastra i mogućnosti za stvaranje novih inicijativa za regionalnu saradnju kao &scaron;to je uspostavljanje prekogranične saradnje u oblasti razmene podataka i servisa nacionalnih GNSS sistema, zajednički nastup zemalja regiona pred međunarodnim institucijama kao izajednički nastup u regionalnim projektima u oblasti katastra i infrastrukture prostornih podataka pred donatorskim organizacijama.</p>\r\n<p class=\"body_text\">Kao rezultat zajedničke saradnje bio je i projekat INSPIRATION - Infrastruktura prostornih podataka zemalja Zapadnog Balkana koji je finansirala Evropska Unija. Cilj projekta je promocija i jačanje kapaciteta zemalja Zapadnog Balkana u procesu implementacije INSPIRE direktive. Nakon toga usledio je projekat IMPULS koji je finansirala &Scaron;vedska agencija za međunarodni razvoj i ima za cilj da podrži izgradnju kapaciteta nacionalnih agencija za katastar i geodeziju u uspostavljanju nacionalne infrastrukture geoprostornih podataka, uspostavljanje tehničke interoperabilnosti između institucija u regionu, kao i razvoj usluga i servisa sa ciljem razmene i deljenja geoprostornih podataka među zemljama regiona.</p>\r\n<p class=\"body_text\">Na početku ove godine pokrenut je regionalni projekat SPATIAL - Jačanje profesionalnog pristupa informacijama o zemlji&scaron;tu u regionu Zapadnog Balkana koji finansira holandsko Ministarstvo inostranih poslova kroz predpristupni program MATRA. Kroz ovaj projekat planirana je pomoć zemljama Zapadnog Balkana u procesu harmonizacije i unapređenja pristupa raspoloživim geoprostornim informacijama. Inicijativa kroz direktivu za ponovnu upotrebu informacija iz javnog sektora, INSPIRE direktivu, razvoj usluga za globalni monitoring u domenu za&scaron;tite životne sredine, upravljanje globalnim geoprostornim informacijama (UN-GGIM) za Evropu, Digitalna agenda za Evropu i Agenda 2030 Globalno upravljanje zelji&scaron;tem i održivi razvoj, Katastar 2034 i perspektive FIG trasiraju put nacionalnih agencija za katastar i zemlji&scaron;nu administraciju.</p>\r\n<p class=\"link\">Vest Agencije za katastar nepokretnosti Makedonije možete pogledati <a href=\"http://www.katastar.gov.mk/mk/News.aspx?Id=1617\">ovde</a>.</p>',1,2,'2017-12-11 20:22:26','2017-12-11 20:22:26'),(9,'Десета регионална конференција за катастар и инфраструктуру геопросторних података','Агенција за катастар непокретности је организатор Десете регионалне конференције за катастар и инфраструктуру просторних података на тему: „Улога националних агенција за картографију и катастар, приватног геодетског сектора и универзитета на процес управљања геопросторним подацима“ која се одржава од 8. и 9. јуна 2017. у Музеју македонске борбе у Скопљу.','<p class=\"body_text\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://geosrb.dev/storage/news/December2017/20170609_nk2.jpg\" alt=\"\" width=\"540\" height=\"250\" /></p>\r\n<p class=\"body_text\">Циљ ове конференције је размена искустава између земаља региона у области катастра и инфраструктуре просторних података како би дошло до успостављања функционалног катастра који треба да гарантује право својине, развој тржишта непокретности, повећање броја трансакција, да побољша урбанистичко планирање, развој инфраструктуре и животне средине са циљем одрживог развоја на добробит друштва.</p>\r\n<p class=\"body_text\">На регионалној конференцији учествују катастри Словеније, Хрватске, Федерације Босне и Херцеговине, Републике Српске, Црне Горе, Србије, Косова*, Албаније, Бугарске и Македоније. У конференцији учествују и коморе приватних геодетских фирми земаља Балканског полуоствра које први пут учествују на овој конференцији и очекује се да се од следеће године њихов број повећа и њихово учешће постане традиционално.</p>\r\n<p class=\"body_text\">На регионалној конференцији присутни су и представници шведског, холандског и норвешког катастра имајући у виду да већ 10 година континуирано пружају велики допринос развоју катастра на Балкану. Ту су такође представници EuroGeographics, UN-GGIM Europe, Council of European Geodetic Surveyors као и представници факултета Бугарске, Хрватске и Македоније.</p>\r\n<p class=\"body_text\">Већ десет година траје успешна регионална сарадња међу катастрима која је обезбедила могућност за размену знања и добрих пракси, међусобно повезивање у циљу позитивног развоја катастра и могућности за стварање нових иницијатива за регионалну сарадњу као што је успостављање прекограничне сарадње у области размене података и сервиса националних GNSS система, заједнички наступ земаља региона пред међународним институцијама као изаједнички наступ у регионалним пројектима у области катастра и инфраструктуре просторних података пред донаторским организацијама.</p>\r\n<p class=\"body_text\">Као резултат заједничке сарадње био је и пројекат INSPIRATION - Инфраструктура просторних података земаља Западног Балкана који је финансирала Европска Унија. Циљ пројекта је промоција и јачање капацитета земаља Западног Балкана у процесу имплементације INSPIRE директиве. Након тога уследио је пројекат IMPULS који је финансирала Шведска агенција за међународни развој и има за циљ да подржи изградњу капацитета националних агенција за катастар и геодезију у успостављању националне инфраструктуре геопросторних података, успостављање техничке интероперабилности између институција у региону, као и развој услуга и сервиса са циљем размене и дељења геопросторних података међу земљама региона.</p>\r\n<p class=\"body_text\">На почетку ове године покренут је регионални пројекат SPATIAL - Јачање професионалног приступа информацијама о земљишту у региону Западног Балкана који финансира холандско Министарство иностраних послова кроз предприступни програм MATRA. Кроз овај пројекат планирана је помоћ земљама Западног Балкана у процесу хармонизације и унапређења приступа расположивим геопросторним информацијама. Иницијатива кроз директиву за поновну употребу информација из јавног сектора, INSPIRE директиву, развој услуга за глобални мониторинг у домену заштите животне средине, управљање глобалним геопросторним информацијама (UN-GGIM) за Европу, Дигитална агенда за Европу и Агенда 2030 Глобално управљање зељиштем и одрживи развој, Катастар 2034 и перспективе FIG трасирају пут националних агенција за катастар и земљишну администрацију.</p>\r\n<p class=\"link\">Вест Агенције за катастар непокретности Македоније можете погледати <a href=\"http://www.katastar.gov.mk/mk/News.aspx?Id=1617\">овде</a>.</p>',1,1,'2017-12-11 20:23:18','2017-12-11 20:23:18');

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pages` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permission_groups` */

DROP TABLE IF EXISTS `permission_groups`;

CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_groups` */

/*Table structure for table `permission_role` */

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permission_role` */

insert  into `permission_role`(`permission_id`,`role_id`) values (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`,`permission_group_id`) values (1,'browse_admin',NULL,'2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(2,'browse_database',NULL,'2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(3,'browse_media',NULL,'2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(4,'browse_compass',NULL,'2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(5,'browse_menus','menus','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(6,'read_menus','menus','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(7,'edit_menus','menus','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(8,'add_menus','menus','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(9,'delete_menus','menus','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(10,'browse_pages','pages','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(11,'read_pages','pages','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(12,'edit_pages','pages','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(13,'add_pages','pages','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(14,'delete_pages','pages','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(15,'browse_roles','roles','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(16,'read_roles','roles','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(17,'edit_roles','roles','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(18,'add_roles','roles','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(19,'delete_roles','roles','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(20,'browse_users','users','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(21,'read_users','users','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(22,'edit_users','users','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(23,'add_users','users','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(24,'delete_users','users','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(25,'browse_posts','posts','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(26,'read_posts','posts','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(27,'edit_posts','posts','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(28,'add_posts','posts','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(29,'delete_posts','posts','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(30,'browse_categories','categories','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(31,'read_categories','categories','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(32,'edit_categories','categories','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(33,'add_categories','categories','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(34,'delete_categories','categories','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(35,'browse_settings','settings','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(36,'read_settings','settings','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(37,'edit_settings','settings','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(38,'add_settings','settings','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(39,'delete_settings','settings','2017-12-01 17:13:39','2017-12-01 17:13:39',NULL),(40,'browse_link_groups','link_groups','2017-12-01 17:14:13','2017-12-01 17:14:13',NULL),(41,'read_link_groups','link_groups','2017-12-01 17:14:13','2017-12-01 17:14:13',NULL),(42,'edit_link_groups','link_groups','2017-12-01 17:14:13','2017-12-01 17:14:13',NULL),(43,'add_link_groups','link_groups','2017-12-01 17:14:13','2017-12-01 17:14:13',NULL),(44,'delete_link_groups','link_groups','2017-12-01 17:14:13','2017-12-01 17:14:13',NULL),(45,'browse_links','links','2017-12-01 17:16:07','2017-12-01 17:16:07',NULL),(46,'read_links','links','2017-12-01 17:16:07','2017-12-01 17:16:07',NULL),(47,'edit_links','links','2017-12-01 17:16:07','2017-12-01 17:16:07',NULL),(48,'add_links','links','2017-12-01 17:16:07','2017-12-01 17:16:07',NULL),(49,'delete_links','links','2017-12-01 17:16:07','2017-12-01 17:16:07',NULL),(50,'browse_languages','languages','2017-12-02 16:48:05','2017-12-02 16:48:05',NULL),(51,'read_languages','languages','2017-12-02 16:48:05','2017-12-02 16:48:05',NULL),(52,'edit_languages','languages','2017-12-02 16:48:05','2017-12-02 16:48:05',NULL),(53,'add_languages','languages','2017-12-02 16:48:05','2017-12-02 16:48:05',NULL),(54,'delete_languages','languages','2017-12-02 16:48:05','2017-12-02 16:48:05',NULL),(55,'browse_news','news','2017-12-02 16:58:20','2017-12-02 16:58:20',NULL),(56,'read_news','news','2017-12-02 16:58:20','2017-12-02 16:58:20',NULL),(57,'edit_news','news','2017-12-02 16:58:20','2017-12-02 16:58:20',NULL),(58,'add_news','news','2017-12-02 16:58:20','2017-12-02 16:58:20',NULL),(59,'delete_news','news','2017-12-02 16:58:20','2017-12-02 16:58:20',NULL),(60,'browse_file_categories','file_categories','2017-12-03 19:42:41','2017-12-03 19:42:41',NULL),(61,'read_file_categories','file_categories','2017-12-03 19:42:41','2017-12-03 19:42:41',NULL),(62,'edit_file_categories','file_categories','2017-12-03 19:42:41','2017-12-03 19:42:41',NULL),(63,'add_file_categories','file_categories','2017-12-03 19:42:41','2017-12-03 19:42:41',NULL),(64,'delete_file_categories','file_categories','2017-12-03 19:42:41','2017-12-03 19:42:41',NULL),(65,'browse_files','files','2017-12-03 19:48:20','2017-12-03 19:48:20',NULL),(66,'read_files','files','2017-12-03 19:48:20','2017-12-03 19:48:20',NULL),(67,'edit_files','files','2017-12-03 19:48:20','2017-12-03 19:48:20',NULL),(68,'add_files','files','2017-12-03 19:48:20','2017-12-03 19:48:20',NULL),(69,'delete_files','files','2017-12-03 19:48:20','2017-12-03 19:48:20',NULL);

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

insert  into `posts`(`id`,`author_id`,`category_id`,`title`,`seo_title`,`excerpt`,`body`,`image`,`slug`,`meta_description`,`meta_keywords`,`status`,`featured`,`created_at`,`updated_at`) values (1,1,NULL,'Nova Digitalna platforma za Nacionalnu infrastrukturu geoprostornih podataka',NULL,'RGZ je razvio novi portal u saradnji sa norveškim partnerom – Statens Kartverk (norveška agencija za katastar i kartografiju), u okviru Nacionalne infrastrukture geoprostornih podataka.','<p>lalalall</p>',NULL,'nova-digitalna-platforma-za-nacionalnu-infrastrukturu-geoprostornih-podataka',NULL,NULL,1,0,'2017-12-01 17:21:38','2017-12-01 17:21:38'),(2,1,NULL,'mater',NULL,'ok boys','<p>&nbsp;lol</p>',NULL,'mater',NULL,NULL,1,0,'2017-12-01 17:22:08','2017-12-01 17:22:08');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) values (1,'admin','Administrator','2017-12-01 17:12:52','2017-12-01 17:12:52'),(2,'user','Normal User','2017-12-01 17:13:39','2017-12-01 17:13:39');

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

/*Table structure for table `translations` */

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `translations` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`role_id`,`name`,`email`,`avatar`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,1,'aljuba','ljuba95@hotmail.com','users/default.png','$2y$10$9MfXtzzkIjs5DE2yY8oyKOdxTLz0rXARtdgAkhsD6dq/7jzT83IvW','YtUNwO5yw2Oi3npDuYa7OpmjBta724CyVYSLCUhdoNGLxsr1y1LnG6XfzoDa','2017-12-01 17:12:52','2017-12-01 17:12:52');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
