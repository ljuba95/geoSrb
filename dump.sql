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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_rows` */

insert  into `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) values (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(3,1,'category_id','text','Category',0,0,1,1,1,0,NULL,3),(4,1,'title','text','Title',1,1,1,1,1,1,NULL,4),(5,1,'excerpt','text_area','excerpt',0,0,1,1,1,1,NULL,5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),(9,1,'meta_description','text_area','meta_description',0,0,1,1,1,1,NULL,9),(10,1,'meta_keywords','text_area','meta_keywords',0,0,1,1,1,1,NULL,10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,NULL,12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,'',1),(27,3,'name','text','name',1,1,1,1,1,1,'',2),(28,3,'email','text','email',1,1,1,1,1,1,'',3),(29,3,'password','password','password',0,0,0,1,1,0,'',4),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}',10),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,'',5),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,'',6),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(34,3,'avatar','image','avatar',0,1,1,1,1,1,'',8),(35,5,'id','number','id',1,0,0,0,0,0,'',1),(36,5,'name','text','name',1,1,1,1,1,1,'',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(39,4,'id','number','id',1,0,0,0,0,0,'',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(41,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(42,4,'name','text','name',1,1,1,1,1,1,'',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(46,6,'id','number','id',1,0,0,0,0,0,'',1),(47,6,'name','text','Name',1,1,1,1,1,1,'',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,NULL,14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,NULL,15),(53,3,'role_id','text','role_id',1,1,1,1,1,1,'',9),(54,7,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(55,7,'name','text','Name',0,1,1,1,1,1,NULL,2),(56,7,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(57,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(58,7,'link_group_hasmany_link_relationship','relationship','links',0,1,1,1,1,1,'{\"model\":\"App\\\\Link\",\"table\":\"links\",\"type\":\"hasMany\",\"column\":\"link_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',5),(59,8,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(60,8,'url','text','Url',0,1,1,1,1,1,NULL,2),(61,8,'active','checkbox','Active',0,1,1,1,1,1,NULL,3),(62,8,'link_group_id','checkbox','Link Group Id',0,0,1,1,0,1,NULL,4),(63,8,'name','text','Name',0,1,1,1,1,1,NULL,5),(64,8,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,6),(65,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(66,8,'link_belongsto_link_group_relationship','relationship','link_groups',0,1,1,1,1,1,'{\"model\":\"App\\\\LinkGroup\",\"table\":\"link_groups\",\"type\":\"belongsTo\",\"column\":\"link_group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',8),(67,9,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(68,9,'name','text','Name',0,1,1,1,1,1,NULL,2),(69,9,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(70,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(72,1,'language_id','checkbox','Language Id',0,0,1,1,0,1,NULL,16),(73,10,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(74,10,'title','text','Title',0,1,1,1,1,1,NULL,2),(75,10,'excerpt','text_area','Excerpt',0,1,1,1,1,1,NULL,3),(76,10,'body','rich_text_box','Body',0,1,1,1,1,1,NULL,4),(77,10,'active','checkbox','Active',0,1,1,1,1,1,NULL,5),(78,10,'language_id','checkbox','Language Id',0,0,1,1,0,1,NULL,6),(79,10,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,7),(80,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,8),(81,10,'news_belongsto_language_relationship','relationship','languages',0,1,1,1,1,1,'{\"model\":\"App\\\\Language\",\"table\":\"languages\",\"type\":\"belongsTo\",\"column\":\"language_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',9),(82,7,'active','checkbox','Active',0,1,1,1,1,1,NULL,5),(84,7,'language_id','checkbox','Language Id',0,0,1,1,0,1,NULL,6),(85,7,'link_group_belongsto_language_relationship','relationship','languages',0,1,1,1,1,1,'{\"model\":\"App\\\\Language\",\"table\":\"languages\",\"type\":\"belongsTo\",\"column\":\"language_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',7);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `data_types` */

insert  into `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`created_at`,`updated_at`) values (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,0,'2017-12-01 18:13:39','2017-12-02 17:50:53'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,'2017-12-01 18:13:39','2017-12-01 18:13:39'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,'2017-12-01 18:13:39','2017-12-01 18:13:39'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,'2017-12-01 18:13:39','2017-12-01 18:13:39'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,'2017-12-01 18:13:39','2017-12-01 18:13:39'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,'2017-12-01 18:13:39','2017-12-01 18:13:39'),(7,'link_groups','link-groups','Link Group','Link Groups',NULL,'App\\LinkGroup',NULL,NULL,NULL,1,0,'2017-12-01 18:14:13','2017-12-01 18:14:13'),(8,'links','links','Link','Links',NULL,'App\\Link',NULL,NULL,NULL,1,0,'2017-12-01 18:16:07','2017-12-01 18:16:07'),(9,'languages','languages','Language','Languages',NULL,'App\\Language',NULL,NULL,NULL,1,0,'2017-12-02 17:48:05','2017-12-02 17:48:05'),(10,'news','news','News','News',NULL,'App\\News',NULL,NULL,NULL,1,0,'2017-12-02 17:58:20','2017-12-02 17:58:20');

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

insert  into `languages`(`id`,`name`,`created_at`,`updated_at`) values (1,'sr','2017-12-02 16:20:13','2017-12-02 16:20:13'),(2,'sr-Latn','2017-12-02 16:21:08','2017-12-02 16:21:08'),(3,'en','2017-12-02 16:21:14','2017-12-02 16:21:14');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `link_groups` */

insert  into `link_groups`(`id`,`name`,`created_at`,`updated_at`,`active`,`language_id`) values (1,'Uputstva','2017-12-01 18:17:00','2017-12-02 18:17:48',1,2),(2,'Podrška projektu','2017-12-01 18:17:00','2017-12-02 18:21:19',1,2),(3,'Упутства','2017-12-02 18:20:00','2017-12-02 18:22:59',1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `links` */

insert  into `links`(`id`,`url`,`active`,`link_group_id`,`name`,`created_at`,`updated_at`) values (1,'http://www.geosrbija.rs/Files/Uputstvo%20za%20koriscenje%20Digitalne%20platforme%20za%20NIGP.pdf',1,1,'Ilustrovano uputstvo za korišćenje Digitalne platforme za Nacionalnu infrastrukturu geoprostornih podataka (PDF)','2017-12-01 18:18:17','2017-12-01 18:18:17'),(2,'https://www.youtube.com/watch?v=Rjrs1Bf7pbI',0,1,'Video uputstvo za korišćenje Digitalne platforme za Nacionalnu infrastrukturu geoprostornih podataka','2017-12-01 18:18:35','2017-12-01 18:18:35'),(3,'https://www.kartverket.no/',1,2,'Kartverket – Norveška agencija za kartografiju i katastar','2017-12-01 18:19:00','2017-12-01 18:19:00'),(4,'https://www.youtube.com/watch?v=Rjrs1Bf7pbI',1,3,'Видео упутство за коришћење Дигиталне платформе за Националну инфраструктуру геопросторних података','2017-12-02 18:22:46','2017-12-02 18:22:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_items` */

insert  into `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) values (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.media.index',NULL),(3,1,'Posts','','_self','voyager-news',NULL,NULL,6,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.posts.index',NULL),(4,1,'Users','','_self','voyager-person',NULL,NULL,3,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.users.index',NULL),(5,1,'Categories','','_self','voyager-categories',NULL,NULL,8,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.categories.index',NULL),(6,1,'Pages','','_self','voyager-file-text',NULL,NULL,7,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.pages.index',NULL),(7,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.roles.index',NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2017-12-01 18:13:39','2017-12-01 18:13:39',NULL,NULL),(9,1,'Menu Builder','','_self','voyager-list',NULL,8,10,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.menus.index',NULL),(10,1,'Database','','_self','voyager-data',NULL,8,11,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.database.index',NULL),(11,1,'Compass','/admin/compass','_self','voyager-compass',NULL,8,12,'2017-12-01 18:13:39','2017-12-01 18:13:39',NULL,NULL),(12,1,'Hooks','/admin/hooks','_self','voyager-hook',NULL,8,13,'2017-12-01 18:13:39','2017-12-01 18:13:39',NULL,NULL),(13,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2017-12-01 18:13:39','2017-12-01 18:13:39','voyager.settings.index',NULL),(14,1,'Link Groups','/admin/link-groups','_self',NULL,NULL,NULL,15,'2017-12-01 18:14:13','2017-12-01 18:14:13',NULL,NULL),(15,1,'Links','/admin/links','_self',NULL,NULL,NULL,16,'2017-12-01 18:16:07','2017-12-01 18:16:07',NULL,NULL),(16,1,'Languages','/admin/languages','_self',NULL,NULL,NULL,17,'2017-12-02 17:48:05','2017-12-02 17:48:05',NULL,NULL),(17,1,'News','/admin/news','_self',NULL,NULL,NULL,18,'2017-12-02 17:58:20','2017-12-02 17:58:20',NULL,NULL);

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`created_at`,`updated_at`) values (1,'admin','2017-12-01 18:13:39','2017-12-01 18:13:39');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (58,'2014_10_12_000000_create_users_table',1),(59,'2014_10_12_100000_create_password_resets_table',1),(60,'2016_01_01_000000_add_voyager_user_fields',1),(61,'2016_01_01_000000_create_data_types_table',1),(62,'2016_01_01_000000_create_pages_table',1),(63,'2016_01_01_000000_create_posts_table',1),(64,'2016_02_15_204651_create_categories_table',1),(65,'2016_05_19_173453_create_menu_table',1),(66,'2016_10_21_190000_create_roles_table',1),(67,'2016_10_21_190000_create_settings_table',1),(68,'2016_11_30_135954_create_permission_table',1),(69,'2016_11_30_141208_create_permission_role_table',1),(70,'2016_12_26_201236_data_types__add__server_side',1),(71,'2017_01_13_000000_add_route_to_menu_items_table',1),(72,'2017_01_14_005015_create_translations_table',1),(73,'2017_01_15_000000_add_permission_group_id_to_permissions_table',1),(74,'2017_01_15_000000_create_permission_groups_table',1),(75,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(76,'2017_03_06_000000_add_controller_to_data_types_table',1),(77,'2017_04_11_000000_alter_post_nullable_fields_table',1),(78,'2017_04_21_000000_add_order_to_data_rows_table',1),(79,'2017_07_05_210000_add_policyname_to_data_types_table',1),(80,'2017_08_05_000000_add_group_to_settings_table',1),(81,'2017_12_01_181018_create_link_groups_table',1),(82,'2017_12_01_181018_create_links_table',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`excerpt`,`body`,`active`,`language_id`,`created_at`,`updated_at`) values (1,'title','asdfasdfasdfag','<p>asdfgasdfafsdfasdf</p>',1,2,'2017-12-02 17:59:00','2017-12-02 18:14:09'),(2,'ћирилица','афњефасдфањеф','<p>асдгаергањерфгањефањфањеф</p>',1,1,'2017-12-02 18:00:03','2017-12-02 18:00:03');

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

insert  into `permission_role`(`permission_id`,`role_id`) values (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`,`permission_group_id`) values (1,'browse_admin',NULL,'2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(2,'browse_database',NULL,'2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(3,'browse_media',NULL,'2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(4,'browse_compass',NULL,'2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(5,'browse_menus','menus','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(6,'read_menus','menus','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(7,'edit_menus','menus','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(8,'add_menus','menus','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(9,'delete_menus','menus','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(10,'browse_pages','pages','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(11,'read_pages','pages','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(12,'edit_pages','pages','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(13,'add_pages','pages','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(14,'delete_pages','pages','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(15,'browse_roles','roles','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(16,'read_roles','roles','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(17,'edit_roles','roles','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(18,'add_roles','roles','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(19,'delete_roles','roles','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(20,'browse_users','users','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(21,'read_users','users','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(22,'edit_users','users','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(23,'add_users','users','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(24,'delete_users','users','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(25,'browse_posts','posts','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(26,'read_posts','posts','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(27,'edit_posts','posts','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(28,'add_posts','posts','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(29,'delete_posts','posts','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(30,'browse_categories','categories','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(31,'read_categories','categories','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(32,'edit_categories','categories','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(33,'add_categories','categories','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(34,'delete_categories','categories','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(35,'browse_settings','settings','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(36,'read_settings','settings','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(37,'edit_settings','settings','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(38,'add_settings','settings','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(39,'delete_settings','settings','2017-12-01 18:13:39','2017-12-01 18:13:39',NULL),(40,'browse_link_groups','link_groups','2017-12-01 18:14:13','2017-12-01 18:14:13',NULL),(41,'read_link_groups','link_groups','2017-12-01 18:14:13','2017-12-01 18:14:13',NULL),(42,'edit_link_groups','link_groups','2017-12-01 18:14:13','2017-12-01 18:14:13',NULL),(43,'add_link_groups','link_groups','2017-12-01 18:14:13','2017-12-01 18:14:13',NULL),(44,'delete_link_groups','link_groups','2017-12-01 18:14:13','2017-12-01 18:14:13',NULL),(45,'browse_links','links','2017-12-01 18:16:07','2017-12-01 18:16:07',NULL),(46,'read_links','links','2017-12-01 18:16:07','2017-12-01 18:16:07',NULL),(47,'edit_links','links','2017-12-01 18:16:07','2017-12-01 18:16:07',NULL),(48,'add_links','links','2017-12-01 18:16:07','2017-12-01 18:16:07',NULL),(49,'delete_links','links','2017-12-01 18:16:07','2017-12-01 18:16:07',NULL),(50,'browse_languages','languages','2017-12-02 17:48:05','2017-12-02 17:48:05',NULL),(51,'read_languages','languages','2017-12-02 17:48:05','2017-12-02 17:48:05',NULL),(52,'edit_languages','languages','2017-12-02 17:48:05','2017-12-02 17:48:05',NULL),(53,'add_languages','languages','2017-12-02 17:48:05','2017-12-02 17:48:05',NULL),(54,'delete_languages','languages','2017-12-02 17:48:05','2017-12-02 17:48:05',NULL),(55,'browse_news','news','2017-12-02 17:58:20','2017-12-02 17:58:20',NULL),(56,'read_news','news','2017-12-02 17:58:20','2017-12-02 17:58:20',NULL),(57,'edit_news','news','2017-12-02 17:58:20','2017-12-02 17:58:20',NULL),(58,'add_news','news','2017-12-02 17:58:20','2017-12-02 17:58:20',NULL),(59,'delete_news','news','2017-12-02 17:58:20','2017-12-02 17:58:20',NULL);

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

insert  into `posts`(`id`,`author_id`,`category_id`,`title`,`seo_title`,`excerpt`,`body`,`image`,`slug`,`meta_description`,`meta_keywords`,`status`,`featured`,`created_at`,`updated_at`) values (1,1,NULL,'Nova Digitalna platforma za Nacionalnu infrastrukturu geoprostornih podataka',NULL,'RGZ je razvio novi portal u saradnji sa norveškim partnerom – Statens Kartverk (norveška agencija za katastar i kartografiju), u okviru Nacionalne infrastrukture geoprostornih podataka.','<p>lalalall</p>',NULL,'nova-digitalna-platforma-za-nacionalnu-infrastrukturu-geoprostornih-podataka',NULL,NULL,1,0,'2017-12-01 18:21:38','2017-12-01 18:21:38'),(2,1,NULL,'mater',NULL,'ok boys','<p>&nbsp;lol</p>',NULL,'mater',NULL,NULL,1,0,'2017-12-01 18:22:08','2017-12-01 18:22:08');

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

insert  into `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) values (1,'admin','Administrator','2017-12-01 18:12:52','2017-12-01 18:12:52'),(2,'user','Normal User','2017-12-01 18:13:39','2017-12-01 18:13:39');

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

insert  into `users`(`id`,`role_id`,`name`,`email`,`avatar`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,1,'aljuba','ljuba95@hotmail.com','users/default.png','$2y$10$9MfXtzzkIjs5DE2yY8oyKOdxTLz0rXARtdgAkhsD6dq/7jzT83IvW',NULL,'2017-12-01 18:12:52','2017-12-01 18:12:52');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
