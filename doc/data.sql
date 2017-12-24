-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: dblog
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add department',7,'add_department'),(20,'Can change department',7,'change_department'),(21,'Can delete department',7,'delete_department'),(22,'Can add prefs',8,'add_prefs'),(23,'Can change prefs',8,'change_prefs'),(24,'Can delete prefs',8,'delete_prefs'),(25,'Can add mail cfilter rule action',9,'add_mailcfilterruleaction'),(26,'Can change mail cfilter rule action',9,'change_mailcfilterruleaction'),(27,'Can delete mail cfilter rule action',9,'delete_mailcfilterruleaction'),(28,'Can add mail cfilter rule',10,'add_mailcfilterrule'),(29,'Can change mail cfilter rule',10,'change_mailcfilterrule'),(30,'Can delete mail cfilter rule',10,'delete_mailcfilterrule'),(31,'Can add mail cfilter rule option',11,'add_mailcfilterruleoption'),(32,'Can change mail cfilter rule option',11,'change_mailcfilterruleoption'),(33,'Can delete mail cfilter rule option',11,'delete_mailcfilterruleoption'),(34,'Can add blog comment',12,'add_blogcomment'),(35,'Can change blog comment',12,'change_blogcomment'),(36,'Can delete blog comment',12,'delete_blogcomment'),(37,'Can add suggest',13,'add_suggest'),(38,'Can change suggest',13,'change_suggest'),(39,'Can delete suggest',13,'delete_suggest'),(40,'Can add category',14,'add_category'),(41,'Can change category',14,'change_category'),(42,'Can delete category',14,'delete_category'),(43,'Can add article',15,'add_article'),(44,'Can change article',15,'change_article'),(45,'Can delete article',15,'delete_article'),(46,'Can add tag',16,'add_tag'),(47,'Can change tag',16,'change_tag'),(48,'Can delete tag',16,'delete_tag'),(49,'Can add c keditor picture file',17,'add_ckeditorpicturefile'),(50,'Can change c keditor picture file',17,'change_ckeditorpicturefile'),(51,'Can delete c keditor picture file',17,'delete_ckeditorpicturefile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(1) NOT NULL,
  `abstract` longtext,
  `views` int(10) unsigned NOT NULL,
  `likes` int(10) unsigned NOT NULL,
  `topped` tinyint(1) NOT NULL,
  `auth` varchar(50) NOT NULL,
  `source` varchar(50) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_title_3c514952` (`title`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'那一天','<div class=\"article-body\">\r\n<p>那一夜，我听了一宿梵唱，不为参悟，只为寻你一丝气息。<br />\r\n那一月，我摇动所有的经筒，不为超度，只为触摸你的指纹。<br />\r\n那一年，我磕长头拥抱尘埃，不为朝佛，只为贴着你的温暖。<br />\r\n那一世，我翻遍十万大山，不为修来世，只为路中能与你相遇。<br />\r\n那一瞬，我飞升成仙，不为长生，只为佑你平安喜乐。</p>\r\n\r\n<p><br />\r\n那一天，闭目在经殿香雾中，蓦然听见你颂经中的真言。<br />\r\n那一月，我摇动所有的转经筒，不为超度，只为触摸你的指尖。<br />\r\n那一年，磕长头匍匐在山路，不为觐见，只为贴着你的温暖。<br />\r\n那一世，转山转水转佛塔啊，不为修来生，只为途中与你相见。</p>\r\n\r\n<p><br />\r\n那一刻，我升起了风马，不为祈福，只为守候着你的到来。<br />\r\n那一日，我垒起玛尼堆，不为修德，只为投下心湖的石子。<br />\r\n那一月，我摇动所有的经筒，不为超度，只为触摸你的指尖。<br />\r\n那一年，我磕长头在山路，不为觐见，只为贴着你的温暖。<br />\r\n那一世，转山转水转佛塔，不为轮回，只为途中与你相见。</p>\r\n</div>','p','<div class=\"article-body\">\r\n<p>那一夜，我听了一宿梵唱，不为参悟，只为寻你一丝气息。<br />\r\n那一月，我摇动所有的经筒，不为超度，只为触摸你的指纹。<br />\r\n那一年，我磕长头拥抱尘埃，不为朝佛，只为贴着你的温暖。<br />\r\n那一世，我翻遍十万大山，不为修来世，只为路中能与你相遇。<br />\r\n那一瞬，我飞升成仙，不为长生，只为佑你平安喜乐。</p>\r\n</div>',21,3,1,'Y.c','信徒','2017-12-21 13:34:18.360231','2017-12-24 11:55:07.602617',1),(4,'Nginx配置中的 root 与 alias 指令的区别','<p>root和alias都可以定义在location模块中，都是用来指定请求资源的真实路径，比如：</p>\r\n\r\n<div style=\"background:#eeeeee none repeat scroll 0% 0%; border:1px solid #cccccc; padding:5px 10px\">location /i/ {<br />\r\n&nbsp;&nbsp;&nbsp; root /data/w3;<br />\r\n}</div>\r\n\r\n<p>请求 http://foofish.net/i/top.gif 这个地址时，那么在服务器里面对应的真正的资源是 /data/w3/i/top.gif文件，注意<strong>真实的路径是root指定的值加上location指定的值</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"/media/ckupload/2f37e5da-e89d-11e7-863b-000c2997ff86-93596.png\" style=\"height:356px; width:544px\" /></p>\r\n\r\n<p>而 alias 正如其名，alias指定的路径是location的别名，不管location的值怎么写，资源的<strong>真实路径都是 alias 指定的路径</strong>，比如：</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\r\n<pre>\r\nlocation /i/ {\r\n    alias /data/w3/;\r\n}</pre>\r\n</div>\r\n\r\n<p>同样请求 http://foofish.net/i/top.gif 时，在服务器查找的资源路径是：/data/w3/top.gif</p>\r\n\r\n<p><img alt=\"\" src=\"/media/ckupload/63c2cdec-e89d-11e7-863b-000c2997ff86-67006.png\" style=\"height:356px; width:544px\" />&nbsp;</p>\r\n\r\n<p>其他区别：</p>\r\n\r\n<ol>\r\n	<li>alias 只能作用在location中，而root可以存在server、http和location中。</li>\r\n	<li>alias 后面必须要用 &ldquo;/&rdquo; 结束，否则会找不到文件，而 root 则对 &rdquo;/&rdquo; 可有可无。</li>\r\n</ol>\r\n\r\n<p>参考：</p>\r\n\r\n<ul>\r\n	<li>http://nginx.org/en/docs/http/ngx_http_core_module.html#root</li>\r\n	<li>http://nginx.org/en/docs/http/ngx_http_core_module.html#alias</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>','p','<p>root和alias都可以定义在location模块中，都是用来指定请求资源的真实路径，比如：</p>\r\n\r\n<div style=\"background:#eeeeee none repeat scroll 0% 0%; border:1px solid #cccccc; padding:5px 10px\">location /i/ {<br />\r\n&nbsp;&nbsp;&nbsp; root /data/w3;<br />\r\n}</div>\r\n\r\n<p>请求 http://foofish.net/i/top.gif 这个地址时，那么在服务器里面对应的真正的资源是 /data/w3/i/top.gif文件，注意<strong>真实的路径是root指定的值加上location指定的值</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"/media/ckupload/2f37e5da-e89d-11e7-863b-000c2997ff86-93596.png\" style=\"height:356px; width:544px\" /></p>',4,1,0,'Y.c','https://foofish.net/nginx-root-different-with-alia','2017-12-24 11:24:17.466614','2017-12-24 11:55:20.260025',10),(5,'正向代理与反向代理','<p>这是一篇旧文推送，重新整理了一下内容，更正了错别字。之前收到这篇推送的同学不多，因为那时订阅这个公众号的用户很少，最近关注的朋友越来越多了，谢谢你们给了我持续写作的动力。</p>\r\n\r\n<p>​这篇文章最开始形成于知乎写的一个答案，没想到在好几个网站传开了，在 segmentfault 收到的评论是：</p>\r\n\r\n<blockquote>\r\n<p>@温柔的狮子：简单明了，好老师！<br />\r\n@程序诗人：不错，浅显易懂<br />\r\n@xrr2016：生动形象，简单明了，赞赞赞！<br />\r\n@小小仕：老师都是这样讲课就好了<br />\r\n@Merlinhuang：这两个例子很有感觉，666<br />\r\n@TonyTsien：反正把我讲懂了，赞<br />\r\n@非正常人类研究员：这种举个栗子的解释方法是最6的了！<br />\r\n@EyesChan：简洁、清晰、有重点。感谢！<br />\r\n...</p>\r\n</blockquote>\r\n\r\n<p>维基百科对「代理服务器」的解释也是让人一头雾水，在计算机世界，代理可分为「正向代理」和「反向代理」，比如著名的翻墙软件 Shadowsocks 就是一款正向代理软件，全世界前1000的高流量网站都在用的 Web 服务器 Nginx 也作为反向代理服务器，那么两者之间究竟有什么区别？我尝试着用浅显易懂的例子把两个概念解释清楚</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h1><ins>正向代理</ins></h1>\r\n\r\n<p>A同学在大众创业、万众创新的大时代背景下开启他的创业之路，目前他遇到的最大的一个问题就是启动资金，于是他决定去找马云爸爸借钱，可想而知，最后碰一鼻子灰回来了，情急之下，他想到一个办法，找关系开后门，经过一番消息打探，原来A同学的大学老师王老师是马云的同学，于是A同学找到王老师，托王老师帮忙去马云那借500万过来，当然最后事成了。不过马云并不知道这钱是A同学借的，马云是借给王老师的，最后由王老师转交给A同学。这里的王老师在这个过程中扮演了一个非常关键的角色，就是<strong>代理</strong>，也可以说是正向代理，王老师代替A同学办这件事，这个过程中，真正借钱的人是谁，马云是不知道的，这点非常关键。</p>\r\n\r\n<p>我们常说的代理也就是只正向代理，正向代理的过程，它隐藏了真实的请求客户端，服务端不知道真实的客户端是谁，客户端请求的服务都被代理服务器代替来请求，科学上网工具 Shadowsocks 扮演的就是典型的正向代理角色。在天朝用浏览器访问 www.google.com 时会被无情的墙掉，要想翻阅这堵墙，你可以在国外用 Shadowsocks 来搭建一台代理服务器，让代理帮我们去请求 www.google.com，代理再把请求响应结果再返回给我。</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/media/ckupload/5358c50a-e89e-11e7-863b-000c2997ff86-32888.jpg\" style=\"height:315px; margin-left:auto; margin-right:auto; text-align:center; width:544px\" /></p>\r\n\r\n<h1><ins>反向代理</ins></h1>\r\n\r\n<p>大家都有过这样的经历，拨打10086 客服电话，一个地区的 10086 客服有几个或者几十个，你永远都不需要关心在电话那头的是哪一个，叫什么，男的，还是女的，漂亮的还是帅气的，你都不关心，你关心的是你的问题能不能得到专业的解答，你只需要拨通了10086 的总机号码，电话那头总会有人会回答你，只是有时慢有时快而已。那么这里的 10086 总机号码就是我们说的<strong>反向代理</strong>。客户不知道真正提供服务的人是谁。</p>\r\n\r\n<p>反向代理隐藏了真实的服务端，当我们访问 www.baidu.com 的时候，就像拨打 10086 一样，背后可能有成千上万台服务器为我们服务，但具体是哪一台，你不知道，也不需要知道，你只需要知道反向代理服务器是谁就好了，www.baidu.com 就是我们的反向代理服务器，反向代理服务器会帮我们把请求转发到提供真实计算的服务器那里去。Nginx 就是性能非常好的反向代理服务器，它可以用来做负载均衡。</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/media/ckupload/7f8987e0-e89e-11e7-863b-000c2997ff86-64042.jpg\" style=\"height:316px; margin-left:auto; margin-right:auto; text-align:center; width:375px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>两者的区别在于代理的对象不一样，<strong>「正向代理」代理的对象是客户端，「反向代理」代理的对象是服务端</strong></p>\r\n\r\n<p>&nbsp;</p>','p','<p>这是一篇旧文推送，重新整理了一下内容，更正了错别字。之前收到这篇推送的同学不多，因为那时订阅这个公众号的用户很少，最近关注的朋友越来越多了，谢谢你们给了我持续写作的动力。</p>\r\n\r\n<p>​这篇文章最开始形成于知乎写的一个答案，没想到在好几个网站传开了，在 segmentfault 收到的评论是：</p>\r\n\r\n<blockquote>\r\n<p>@温柔的狮子：简单明了，好老师！<br />\r\n@程序诗人：不错，浅显易懂<br />\r\n@xrr2016：生动形象，简单明了，赞赞赞！<br />\r\n@小小仕：老师都是这样讲课就好了<br />\r\n@Merlinhuang：这两个例子很有感觉，666<br />\r\n@TonyTsien：反正把我讲懂了，赞<br />\r\n@非正常人类研究员：这种举个栗子的解释方法是最6的了！<br />\r\n@EyesChan：简洁、清晰、有重点。感谢！<br />\r\n...</p>\r\n</blockquote>',3,2,0,'Y.c','https://foofish.net/proxy-and-reverse-proxy.html','2017-12-24 11:37:42.495286','2017-12-24 11:55:25.798175',10),(6,'MySQL数据库备份和恢复','<p>MySQL数据库备份和恢复用到了两个命令，分别是&ldquo;mysqldump&rdquo;和&ldquo;mysql&rdquo;，我们使用&ldquo;mysqldump&rdquo;命令进行数据库备份，使用&ldquo;mysql&rdquo;命令对数据库进行数据恢复。</p>\r\n\r\n<p><br />\r\n语法一、导出数据库中所有表结构；只导出表结构, 不导出表中的数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump --opt -d 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法二、导出数据库中所有表中的数据；只导出表中的数据，不导出表结构</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -t 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法三、导出数据库中所有的表结构和数据；导出表结构和数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法四、导出指定表的结构和数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -u用户名 -p密码 -B 数据库名称 --table 表名 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法五、导出指定表数据，只导出数据，不导出表结构</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -t 数据库名称 -u用户名 -p密码 --table 表名 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法六、将备份文件导入到数据库</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysql -u用户名 -p密码 数据库名称 &lt; 用于恢复数据库的数据文件路径</code></div>\r\n\r\n<p>&nbsp;</p>','p','<p>MySQL数据库备份和恢复用到了两个命令，分别是&ldquo;mysqldump&rdquo;和&ldquo;mysql&rdquo;，我们使用&ldquo;mysqldump&rdquo;命令进行数据库备份，使用&ldquo;mysql&rdquo;命令对数据库进行数据恢复。</p>\r\n\r\n<p><br />\r\n语法一、导出数据库中所有表结构；只导出表结构, 不导出表中的数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump --opt -d 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法二、导出数据库中所有表中的数据；只导出表中的数据，不导出表结构</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -t 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>',3,0,0,'Y.c',NULL,'2017-12-24 11:51:54.755207','2017-12-24 12:15:10.740482',8);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (2,1,7),(1,1,8),(5,1,24),(10,4,12),(8,4,16),(9,4,18),(11,5,16),(13,5,18),(12,5,25),(14,6,14);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'随笔','2017-12-21 13:31:46.141665','2017-12-21 13:31:46.141716'),(2,'生活','2017-12-21 13:31:50.974849','2017-12-21 13:31:50.974895'),(3,'诗歌','2017-12-21 13:31:56.137587','2017-12-21 13:31:56.137655'),(4,'Python','2017-12-21 13:32:00.839475','2017-12-21 13:32:00.839523'),(5,'部署','2017-12-21 13:32:05.125186','2017-12-21 13:32:05.125225'),(6,'配置','2017-12-21 13:32:09.939532','2017-12-21 13:32:09.939591'),(7,'MongoDB','2017-12-21 13:32:28.509185','2017-12-21 13:32:28.509271'),(8,'MySQL','2017-12-21 13:32:44.873544','2017-12-21 13:32:44.873589'),(9,'PostgreSQL','2017-12-21 13:32:54.183618','2017-12-21 13:32:54.183674'),(10,'Linux','2017-12-21 13:33:13.423084','2017-12-21 13:33:13.423181');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_article_id_3d58bca6_fk_blog_article_id` (`article_id`),
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (1,'ysq','ysq@qq.com','多么温暖的家乡','2017-12-21 14:19:09.963720',1),(2,'alex','alex@gmail.com','化为尘埃，回归自然！','2017-12-21 14:52:20.558981',1);
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_picture`
--

DROP TABLE IF EXISTS `blog_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filetype` varchar(100) NOT NULL,
  `filepath` varchar(200) DEFAULT NULL,
  `filesize` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filepath` (`filepath`),
  KEY `blog_picture_article_id_b12eacae` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_picture`
--

LOCK TABLES `blog_picture` WRITE;
/*!40000 ALTER TABLE `blog_picture` DISABLE KEYS */;
INSERT INTO `blog_picture` VALUES (4,4,'nginx-root.png','image/png','/media/ckupload/2f37e5da-e89d-11e7-863b-000c2997ff86-93596.png',26855,'2017-12-24 11:25:45.780034','2017-12-24 11:27:50.706251'),(5,4,'nginx-alias.png','image/png','/media/ckupload/63c2cdec-e89d-11e7-863b-000c2997ff86-67006.png',26938,'2017-12-24 11:27:13.932474','2017-12-24 11:27:50.702620'),(6,5,'proxy.jpg','image/jpeg','/media/ckupload/5358c50a-e89e-11e7-863b-000c2997ff86-32888.jpg',22025,'2017-12-24 11:33:55.890039','2017-12-24 11:39:54.184197'),(7,5,'reverse-proxy.jpg','image/jpeg','/media/ckupload/7f8987e0-e89e-11e7-863b-000c2997ff86-64042.jpg',17684,'2017-12-24 11:35:10.029966','2017-12-24 11:39:54.179951');
/*!40000 ALTER TABLE `blog_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_suggest`
--

DROP TABLE IF EXISTS `blog_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_suggest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_suggest`
--

LOCK TABLES `blog_suggest` WRITE;
/*!40000 ALTER TABLE `blog_suggest` DISABLE KEYS */;
INSERT INTO `blog_suggest` VALUES (1,'test','test@qq.com','如果您有什么好的想法要告诉我，或者希望与我交换链接，我都表示荣幸以及对提供帮助的您的满怀感激。','2017-12-21 13:12:25.143946');
/*!40000 ALTER TABLE `blog_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'Python','2017-12-21 13:28:55.081707','2017-12-21 13:28:55.081782'),(2,'Tornado','2017-12-21 13:28:59.850533','2017-12-21 13:28:59.850580'),(3,'Django','2017-12-21 13:29:03.336368','2017-12-21 13:29:03.336419'),(4,'Flask','2017-12-21 13:29:07.682305','2017-12-21 13:29:07.682369'),(5,'Gevent','2017-12-21 13:29:13.157837','2017-12-21 13:29:13.157912'),(6,'HTML5','2017-12-21 13:29:24.829360','2017-12-21 13:29:24.829457'),(7,'随笔','2017-12-21 13:29:35.924415','2017-12-21 13:29:35.924459'),(8,'诗歌','2017-12-21 13:29:38.783184','2017-12-21 13:29:38.783278'),(9,'散文','2017-12-21 13:29:42.564365','2017-12-21 13:29:42.564406'),(10,'音乐','2017-12-21 13:29:48.123025','2017-12-21 13:29:48.123093'),(11,'算法','2017-12-21 13:29:55.261404','2017-12-21 13:29:55.261440'),(12,'部署','2017-12-21 13:29:58.863191','2017-12-21 13:29:58.863227'),(13,'MongoDB','2017-12-21 13:30:05.544568','2017-12-21 13:30:05.544615'),(14,'MySQL','2017-12-21 13:30:10.938776','2017-12-21 13:30:10.938865'),(15,'Redis','2017-12-21 13:30:16.592469','2017-12-21 13:30:16.592516'),(16,'Linux','2017-12-21 13:30:21.788928','2017-12-21 13:30:21.788986'),(17,'C/C++','2017-12-21 13:30:33.396879','2017-12-21 13:30:33.396937'),(18,'Nginx','2017-12-21 13:30:40.452845','2017-12-21 13:30:40.452935'),(19,'Apache','2017-12-21 13:30:45.164489','2017-12-21 13:30:45.164578'),(20,'源码','2017-12-21 13:30:50.004688','2017-12-21 13:30:50.004743'),(21,'Javascript','2017-12-21 13:30:54.950427','2017-12-21 13:30:54.950499'),(22,'异步','2017-12-21 13:30:59.790297','2017-12-21 13:30:59.790348'),(23,'任务队列','2017-12-21 13:31:06.797824','2017-12-21 13:31:06.797908'),(24,'仓央嘉措','2017-12-21 13:31:11.870775','2017-12-21 13:31:11.870805'),(25,'配置','2017-12-21 13:32:13.194445','2017-12-21 13:32:13.194485'),(26,'PostgreSQL','2017-12-21 13:32:56.485961','2017-12-21 13:32:56.486004'),(27,'爬虫','2017-12-24 11:53:01.210652','2017-12-24 11:53:01.210721'),(28,'正则表达式','2017-12-24 11:53:15.206851','2017-12-24 11:53:15.206891'),(29,'beautifulsoup','2017-12-24 11:53:27.484102','2017-12-24 11:53:27.484210'),(30,'闭包','2017-12-24 11:53:38.145261','2017-12-24 11:53:38.145298'),(31,'generator','2017-12-24 11:54:12.607613','2017-12-24 11:54:12.607685'),(32,'生成器','2017-12-24 11:54:21.364804','2017-12-24 11:54:21.364852'),(33,'装饰器','2017-12-24 11:54:27.343542','2017-12-24 11:54:27.343619');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_department`
--

DROP TABLE IF EXISTS `core_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `core_department_parent_id_ec0f2caf` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_department`
--

LOCK TABLES `core_department` WRITE;
/*!40000 ALTER TABLE `core_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_prefs`
--

DROP TABLE IF EXISTS `core_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_prefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `value` longtext,
  `remark` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_prefs`
--

LOCK TABLES `core_prefs` WRITE;
/*!40000 ALTER TABLE `core_prefs` DISABLE KEYS */;
INSERT INTO `core_prefs` VALUES (1,'system_lang',NULL,NULL),(2,'mail_server',NULL,NULL),(3,'mail_port',NULL,NULL),(4,'mail_ssl',NULL,NULL),(5,'mail_sender',NULL,NULL),(6,'mail_passwd',NULL,NULL),(7,'mail_recipient',NULL,NULL);
/*!40000 ALTER TABLE `core_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `age` int(11) NOT NULL,
  `linkman` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `note` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$36000$njYNaPVORqTj$E3bA9JxRza5dLv9q4MZ7X91e4yLp+0CVNNuBWtQEeeQ=','2017-12-23 16:36:53.282397',1,'admin','','','test@qq.com',1,1,'2017-12-20 14:08:03.543639',0,NULL,NULL,NULL,'Male',NULL,NULL);
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(15,'blog','article'),(12,'blog','blogcomment'),(14,'blog','category'),(17,'blog','ckeditorpicturefile'),(13,'blog','suggest'),(16,'blog','tag'),(4,'contenttypes','contenttype'),(7,'core','department'),(8,'core','prefs'),(6,'core','user'),(5,'sessions','session'),(10,'setting','mailcfilterrule'),(9,'setting','mailcfilterruleaction'),(11,'setting','mailcfilterruleoption');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-20 14:07:36.510669'),(2,'contenttypes','0002_remove_content_type_name','2017-12-20 14:07:36.551021'),(3,'auth','0001_initial','2017-12-20 14:07:36.729776'),(4,'auth','0002_alter_permission_name_max_length','2017-12-20 14:07:36.770924'),(5,'auth','0003_alter_user_email_max_length','2017-12-20 14:07:36.781260'),(6,'auth','0004_alter_user_username_opts','2017-12-20 14:07:36.791225'),(7,'auth','0005_alter_user_last_login_null','2017-12-20 14:07:36.801386'),(8,'auth','0006_require_contenttypes_0002','2017-12-20 14:07:36.804563'),(9,'auth','0007_alter_validators_add_error_messages','2017-12-20 14:07:36.815547'),(10,'auth','0008_alter_user_username_max_length','2017-12-20 14:07:36.824540'),(11,'core','0001_initial','2017-12-20 14:07:37.070675'),(12,'admin','0001_initial','2017-12-20 14:07:37.165245'),(13,'admin','0002_logentry_remove_auto_add','2017-12-20 14:07:37.182665'),(14,'blog','0001_initial','2017-12-20 14:07:37.482897'),(15,'sessions','0001_initial','2017-12-20 14:07:37.512698'),(16,'setting','0001_initial','2017-12-20 14:07:37.611318'),(17,'blog','0002_auto_20171221_1249','2017-12-21 12:22:49.926974'),(20,'blog','0003_ckeditorpicturefile','2017-12-24 10:20:34.400807');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0mj7rqzemlqlljja7udic5sh951hljox','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:41:13.743020'),('0taungllhnytihfnwxeos189uapmpyve','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:14:14.025637'),('4gyqa3srmtdeerru680x0aic105xzpk6','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:37:50.927728'),('4h6na8nh7bjj31ekqc39h0gi10kil78o','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:37:32.332647'),('4us3eb5b7osgdya1ausk66o6roruajbi','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:47:09.086467'),('567xrumq451y6w03j75hke5a58if4ibd','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:46:29.892686'),('5ety6rrgaeft2gp2hpr5xe1izuzd89xh','NzA2OTZkMTkxYjhhYTk0MmUzOTU4MTg1MTk5YzBjMDNhODk2MmQ2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-01-03 14:49:02.933381'),('78q7ziqmwstexqxi0qxd8jzayq9lz5i6','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:59:30.926422'),('7jvo5o51924c0xx0e18x5pqbgkybelal','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:36:01.709408'),('9a5lv3o6c1enofy2555z4x8bi620e9gl','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:31:58.040128'),('9t09tsykfmks8junswi3ld1knvjxzwif','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:48:40.216001'),('cvtzx6gwjxpgjurdr45k0meaemset9tx','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:38:07.437433'),('ecktkbxtdcqdn4c9vyun8o32xi11ltpz','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:41:08.110475'),('ftujicvvvzntk119ra32houqdyqhsq8e','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:52:30.122315'),('g520z9qtbi42z2umks9w78gmj2tmc18m','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:54:14.058035'),('gz7mcrzp5z16xgwozvhe559413eab9lq','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:56:41.073650'),('hg6vh0q2yg8m9s81z0thg2anhyns8qof','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:36:13.878010'),('izlvq6ya3nrket7ixej50i78ekrdmw9k','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:47:19.454453'),('k0j4vkkqmipy8s1ipdhljxp7v7dsm9p3','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:10:02.948781'),('kbk6mfxicgysb8bdas65bwr0r2z38cr4','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:22:52.053470'),('l1whimxo4nb4ts0fmnaj1h3vz1br19ue','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:27:05.196983'),('l28kb9birai6ahoe218szp0e37qpikit','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-04 13:28:31.871344'),('lyiz0sp5z1hwh07a9gjhlqjp4x909k0t','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:45:07.485026'),('mop2o6egeq2d9tskhldpdw4ter2n1mx0','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:43:24.093143'),('moss6yh85vnnyaatmikq63ur5etxs9c3','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:09:24.193775'),('muvlrbugam09defrwnte20sooedwuvkj','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:57:28.621761'),('n6s485xer8jksgfejslwe3b8uq7faoli','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:10:04.502372'),('odcdup2oec04h0wwbpr1z426pul4qkrp','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:35:52.511934'),('omvr3qxt55sor2165ywuoxhm5e689jpf','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:27:57.226652'),('qeper24w2n4n6v8coswcq5u0kjkcdrtk','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 15:40:57.365355'),('qrrschc47r0n1ta7g1wo1tm200k48qll','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:52:08.886131'),('ra59rkjp97u27hlcu48qv5qql01uuln3','NzA2OTZkMTkxYjhhYTk0MmUzOTU4MTg1MTk5YzBjMDNhODk2MmQ2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-01-06 13:44:44.545908'),('rpq50w1c0aoj638a0fu4xwryb8a7t6go','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 16:36:53.298646'),('rrtlqbymflb7q5fuqwnaquu62rfcxvv6','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:58:18.338029'),('rtubydj77mksoqynfr37kc5hxk7vhuwl','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:32:10.739007'),('rvfzp8d25xjrjpj98hvqfpkbf48vflmv','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:38:50.770021'),('t0pzzi9m4jymtzuba1dlvjom3ptc7qel','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:44:02.833274'),('t1y0v66uzlb91jhn5llwms86jk0vhi38','NzA2OTZkMTkxYjhhYTk0MmUzOTU4MTg1MTk5YzBjMDNhODk2MmQ2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-01-06 01:31:25.924617'),('tb37xi5ru4mzxpee487r9c8vygevjgej','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 16:00:37.661375'),('ton9lcepq34qmakfhv5a3xypkaq38p10','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:36:47.826494'),('x8ovwdsuc16twmfwmz5bc2es28k80nzv','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:24:11.981303'),('yj9vk9b3y20doaqxvjnsawn1n6k1ytb5','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:37:58.247046'),('yqpi5sfdu5li4qou5385w1c5guujfd3y','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:42:38.747013'),('zas82cnggw3jfxe6lg7mbh3r0uprmqmz','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:38:37.081187');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_cfilter`
--

DROP TABLE IF EXISTS `mail_cfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_cfilter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `logic` varchar(50) NOT NULL,
  `sequence` int(11) NOT NULL,
  `disabled` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_cfilter`
--

LOCK TABLES `mail_cfilter` WRITE;
/*!40000 ALTER TABLE `mail_cfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_cfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_cfilter_action`
--

DROP TABLE IF EXISTS `mail_cfilter_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_cfilter_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `value` varchar(500) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_cfilter_action_rule_id_0dfeb377` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_cfilter_action`
--

LOCK TABLES `mail_cfilter_action` WRITE;
/*!40000 ALTER TABLE `mail_cfilter_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_cfilter_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_cfilter_option`
--

DROP TABLE IF EXISTS `mail_cfilter_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_cfilter_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `logic` varchar(50) NOT NULL,
  `option` varchar(50) NOT NULL,
  `suboption` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_cfilter_option_rule_id_4065b04a` (`rule_id`),
  KEY `mail_cfilter_option_parent_id_4bbabc86` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_cfilter_option`
--

LOCK TABLES `mail_cfilter_option` WRITE;
/*!40000 ALTER TABLE `mail_cfilter_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_cfilter_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-24 20:41:56
