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
  `source` varchar(200) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_title_3c514952` (`title`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'那一天','<div class=\"article-body\">\r\n<p>那一夜，我听了一宿梵唱，不为参悟，只为寻你一丝气息。<br />\r\n那一月，我摇动所有的经筒，不为超度，只为触摸你的指纹。<br />\r\n那一年，我磕长头拥抱尘埃，不为朝佛，只为贴着你的温暖。<br />\r\n那一世，我翻遍十万大山，不为修来世，只为路中能与你相遇。<br />\r\n那一瞬，我飞升成仙，不为长生，只为佑你平安喜乐。</p>\r\n\r\n<p><br />\r\n那一天，闭目在经殿香雾中，蓦然听见你颂经中的真言。<br />\r\n那一月，我摇动所有的转经筒，不为超度，只为触摸你的指尖。<br />\r\n那一年，磕长头匍匐在山路，不为觐见，只为贴着你的温暖。<br />\r\n那一世，转山转水转佛塔啊，不为修来生，只为途中与你相见。</p>\r\n\r\n<p><br />\r\n那一刻，我升起了风马，不为祈福，只为守候着你的到来。<br />\r\n那一日，我垒起玛尼堆，不为修德，只为投下心湖的石子。<br />\r\n那一月，我摇动所有的经筒，不为超度，只为触摸你的指尖。<br />\r\n那一年，我磕长头在山路，不为觐见，只为贴着你的温暖。<br />\r\n那一世，转山转水转佛塔，不为轮回，只为途中与你相见。</p>\r\n</div>','p','<div class=\"article-body\">\r\n<p>那一夜，我听了一宿梵唱，不为参悟，只为寻你一丝气息。<br />\r\n那一月，我摇动所有的经筒，不为超度，只为触摸你的指纹。<br />\r\n那一年，我磕长头拥抱尘埃，不为朝佛，只为贴着你的温暖。<br />\r\n那一世，我翻遍十万大山，不为修来世，只为路中能与你相遇。<br />\r\n那一瞬，我飞升成仙，不为长生，只为佑你平安喜乐。</p>\r\n</div>',28,3,1,'Y.c','信徒','2017-12-21 13:34:18.360231','2018-01-06 06:48:39.476504',1),(4,'Nginx配置中的 root 与 alias 指令的区别','<p>root和alias都可以定义在location模块中，都是用来指定请求资源的真实路径，比如：</p>\r\n\r\n<div style=\"background:#eeeeee none repeat scroll 0% 0%; border:1px solid #cccccc; padding:5px 10px\">location /i/ {<br />\r\n&nbsp;&nbsp;&nbsp; root /data/w3;<br />\r\n}</div>\r\n\r\n<p>请求 http://foofish.net/i/top.gif 这个地址时，那么在服务器里面对应的真正的资源是 /data/w3/i/top.gif文件，注意<strong>真实的路径是root指定的值加上location指定的值</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"/media/ckupload/2f37e5da-e89d-11e7-863b-000c2997ff86-93596.png\" style=\"height:356px; width:544px\" /></p>\r\n\r\n<p>而 alias 正如其名，alias指定的路径是location的别名，不管location的值怎么写，资源的<strong>真实路径都是 alias 指定的路径</strong>，比如：</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\r\n<pre>\r\nlocation /i/ {\r\n    alias /data/w3/;\r\n}</pre>\r\n</div>\r\n\r\n<p>同样请求 http://foofish.net/i/top.gif 时，在服务器查找的资源路径是：/data/w3/top.gif</p>\r\n\r\n<p><img alt=\"\" src=\"/media/ckupload/63c2cdec-e89d-11e7-863b-000c2997ff86-67006.png\" style=\"height:356px; width:544px\" />&nbsp;</p>\r\n\r\n<p>其他区别：</p>\r\n\r\n<ol>\r\n	<li>alias 只能作用在location中，而root可以存在server、http和location中。</li>\r\n	<li>alias 后面必须要用 &ldquo;/&rdquo; 结束，否则会找不到文件，而 root 则对 &rdquo;/&rdquo; 可有可无。</li>\r\n</ol>\r\n\r\n<p>参考：</p>\r\n\r\n<ul>\r\n	<li>http://nginx.org/en/docs/http/ngx_http_core_module.html#root</li>\r\n	<li>http://nginx.org/en/docs/http/ngx_http_core_module.html#alias</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>','p','<p>root和alias都可以定义在location模块中，都是用来指定请求资源的真实路径，比如：</p>\r\n\r\n<div style=\"background:#eeeeee none repeat scroll 0% 0%; border:1px solid #cccccc; padding:5px 10px\">location /i/ {<br />\r\n&nbsp;&nbsp;&nbsp; root /data/w3;<br />\r\n}</div>\r\n\r\n<p>请求 http://foofish.net/i/top.gif 这个地址时，那么在服务器里面对应的真正的资源是 /data/w3/i/top.gif文件，注意<strong>真实的路径是root指定的值加上location指定的值</strong>。</p>\r\n\r\n<p><img alt=\"\" src=\"/media/ckupload/2f37e5da-e89d-11e7-863b-000c2997ff86-93596.png\" style=\"height:356px; width:544px\" /></p>',8,1,0,'Y.c','https://foofish.net/nginx-root-different-with-alia','2017-12-24 11:24:17.466614','2017-12-28 07:48:25.266978',10),(5,'正向代理与反向代理','<p>这是一篇旧文推送，重新整理了一下内容，更正了错别字。之前收到这篇推送的同学不多，因为那时订阅这个公众号的用户很少，最近关注的朋友越来越多了，谢谢你们给了我持续写作的动力。</p>\r\n\r\n<p>​这篇文章最开始形成于知乎写的一个答案，没想到在好几个网站传开了，在 segmentfault 收到的评论是：</p>\r\n\r\n<blockquote>\r\n<p>@温柔的狮子：简单明了，好老师！<br />\r\n@程序诗人：不错，浅显易懂<br />\r\n@xrr2016：生动形象，简单明了，赞赞赞！<br />\r\n@小小仕：老师都是这样讲课就好了<br />\r\n@Merlinhuang：这两个例子很有感觉，666<br />\r\n@TonyTsien：反正把我讲懂了，赞<br />\r\n@非正常人类研究员：这种举个栗子的解释方法是最6的了！<br />\r\n@EyesChan：简洁、清晰、有重点。感谢！<br />\r\n...</p>\r\n</blockquote>\r\n\r\n<p>维基百科对「代理服务器」的解释也是让人一头雾水，在计算机世界，代理可分为「正向代理」和「反向代理」，比如著名的翻墙软件 Shadowsocks 就是一款正向代理软件，全世界前1000的高流量网站都在用的 Web 服务器 Nginx 也作为反向代理服务器，那么两者之间究竟有什么区别？我尝试着用浅显易懂的例子把两个概念解释清楚</p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h1><ins>正向代理</ins></h1>\r\n\r\n<p>A同学在大众创业、万众创新的大时代背景下开启他的创业之路，目前他遇到的最大的一个问题就是启动资金，于是他决定去找马云爸爸借钱，可想而知，最后碰一鼻子灰回来了，情急之下，他想到一个办法，找关系开后门，经过一番消息打探，原来A同学的大学老师王老师是马云的同学，于是A同学找到王老师，托王老师帮忙去马云那借500万过来，当然最后事成了。不过马云并不知道这钱是A同学借的，马云是借给王老师的，最后由王老师转交给A同学。这里的王老师在这个过程中扮演了一个非常关键的角色，就是<strong>代理</strong>，也可以说是正向代理，王老师代替A同学办这件事，这个过程中，真正借钱的人是谁，马云是不知道的，这点非常关键。</p>\r\n\r\n<p>我们常说的代理也就是只正向代理，正向代理的过程，它隐藏了真实的请求客户端，服务端不知道真实的客户端是谁，客户端请求的服务都被代理服务器代替来请求，科学上网工具 Shadowsocks 扮演的就是典型的正向代理角色。在天朝用浏览器访问 www.google.com 时会被无情的墙掉，要想翻阅这堵墙，你可以在国外用 Shadowsocks 来搭建一台代理服务器，让代理帮我们去请求 www.google.com，代理再把请求响应结果再返回给我。</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/media/ckupload/5358c50a-e89e-11e7-863b-000c2997ff86-32888.jpg\" style=\"height:315px; margin-left:auto; margin-right:auto; text-align:center; width:544px\" /></p>\r\n\r\n<h1><ins>反向代理</ins></h1>\r\n\r\n<p>大家都有过这样的经历，拨打10086 客服电话，一个地区的 10086 客服有几个或者几十个，你永远都不需要关心在电话那头的是哪一个，叫什么，男的，还是女的，漂亮的还是帅气的，你都不关心，你关心的是你的问题能不能得到专业的解答，你只需要拨通了10086 的总机号码，电话那头总会有人会回答你，只是有时慢有时快而已。那么这里的 10086 总机号码就是我们说的<strong>反向代理</strong>。客户不知道真正提供服务的人是谁。</p>\r\n\r\n<p>反向代理隐藏了真实的服务端，当我们访问 www.baidu.com 的时候，就像拨打 10086 一样，背后可能有成千上万台服务器为我们服务，但具体是哪一台，你不知道，也不需要知道，你只需要知道反向代理服务器是谁就好了，www.baidu.com 就是我们的反向代理服务器，反向代理服务器会帮我们把请求转发到提供真实计算的服务器那里去。Nginx 就是性能非常好的反向代理服务器，它可以用来做负载均衡。</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/media/ckupload/7f8987e0-e89e-11e7-863b-000c2997ff86-64042.jpg\" style=\"height:316px; margin-left:auto; margin-right:auto; text-align:center; width:375px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>两者的区别在于代理的对象不一样，<strong>「正向代理」代理的对象是客户端，「反向代理」代理的对象是服务端</strong></p>\r\n\r\n<p>&nbsp;</p>','p','<p>这是一篇旧文推送，重新整理了一下内容，更正了错别字。之前收到这篇推送的同学不多，因为那时订阅这个公众号的用户很少，最近关注的朋友越来越多了，谢谢你们给了我持续写作的动力。</p>\r\n\r\n<p>​这篇文章最开始形成于知乎写的一个答案，没想到在好几个网站传开了，在 segmentfault 收到的评论是：</p>\r\n\r\n<blockquote>\r\n<p>@温柔的狮子：简单明了，好老师！<br />\r\n@程序诗人：不错，浅显易懂<br />\r\n@xrr2016：生动形象，简单明了，赞赞赞！<br />\r\n@小小仕：老师都是这样讲课就好了<br />\r\n@Merlinhuang：这两个例子很有感觉，666<br />\r\n@TonyTsien：反正把我讲懂了，赞<br />\r\n@非正常人类研究员：这种举个栗子的解释方法是最6的了！<br />\r\n@EyesChan：简洁、清晰、有重点。感谢！<br />\r\n...</p>\r\n</blockquote>',8,2,0,'Y.c','https://foofish.net/proxy-and-reverse-proxy.html','2017-12-24 11:37:42.495286','2018-01-06 13:30:55.279673',10),(6,'MySQL数据库备份和恢复','<p>MySQL数据库备份和恢复用到了两个命令，分别是&ldquo;mysqldump&rdquo;和&ldquo;mysql&rdquo;，我们使用&ldquo;mysqldump&rdquo;命令进行数据库备份，使用&ldquo;mysql&rdquo;命令对数据库进行数据恢复。</p>\r\n\r\n<p><br />\r\n语法一、导出数据库中所有表结构；只导出表结构, 不导出表中的数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump --opt -d 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法二、导出数据库中所有表中的数据；只导出表中的数据，不导出表结构</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -t 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法三、导出数据库中所有的表结构和数据；导出表结构和数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法四、导出指定表的结构和数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -u用户名 -p密码 -B 数据库名称 --table 表名 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法五、导出指定表数据，只导出数据，不导出表结构</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -t 数据库名称 -u用户名 -p密码 --table 表名 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法六、将备份文件导入到数据库</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysql -u用户名 -p密码 数据库名称 &lt; 用于恢复数据库的数据文件路径</code></div>\r\n\r\n<p>&nbsp;</p>','p','<p>MySQL数据库备份和恢复用到了两个命令，分别是&ldquo;mysqldump&rdquo;和&ldquo;mysql&rdquo;，我们使用&ldquo;mysqldump&rdquo;命令进行数据库备份，使用&ldquo;mysql&rdquo;命令对数据库进行数据恢复。</p>\r\n\r\n<p><br />\r\n语法一、导出数据库中所有表结构；只导出表结构, 不导出表中的数据</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump --opt -d 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>语法二、导出数据库中所有表中的数据；只导出表中的数据，不导出表结构</p>\r\n\r\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\"><code>mysqldump -t 数据库名称 -u用户名 -p密码 &gt; 保存文件路径</code></div>',12,1,0,'Y.c',NULL,'2017-12-24 11:51:54.755207','2018-01-06 13:30:52.603957',8),(7,'数据分析pic','<p><img alt=\"\" src=\"/media/ckupload/e78fd108-e8aa-11e7-921a-005056a7d988-71745.jpg\" style=\"height:600px; width:100%\" /></p>','p','<p><img alt=\"\" src=\"/media/ckupload/b9ae5230-ec3a-11e7-921a-005056a7d988-31342.jpg\" style=\"height:210px; width:100%\" /></p>',12,0,0,'Y.c',NULL,'2017-12-24 13:07:51.060910','2018-01-06 13:30:59.635091',11),(8,'和你说晚安','<p>夜又深了一点，世界变得安静了很多，现在我能够想到最好的梦境，就是你开始变得温柔了。晚安，世界和你。</p>\r\n\r\n<p><img alt=\"\" src=\"/media/ckupload/308235c0-e8ad-11e7-921a-005056a7d988-74938.jpg\" style=\"height:199px; width:300px\" /></p>','p','<p>夜又深了一点，世界变得安静了很多，现在我能够想到最好的梦境，就是你开始变得温柔了。晚安，世界和你。</p>',11,13,0,'Y.c',NULL,'2017-12-24 13:16:54.112063','2018-01-06 13:30:53.977290',1),(9,'RabbitMQ简易教程','<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>1.&nbsp;<a href=\"https://www.xncoding.com/2017/05/06/mq/rabbitmq-tutorial01.html#more\" target=\"_blank\">RabbitMQ简易教程 - 安装</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>2.&nbsp;<a href=\"https://www.xncoding.com/2017/05/08/mq/rabbitmq-tutorial02.html#more\" target=\"_blank\">RabbitMQ简易教程 - 任务队列</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>3.&nbsp;<a href=\"https://www.xncoding.com/2017/05/10/mq/rabbitmq-tutorial03.html#more\" target=\"_blank\">RabbitMQ简易教程 - 发布订阅</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>4.&nbsp;<a href=\"https://www.xncoding.com/2017/05/13/mq/rabbitmq-tutorial04.html#more\" target=\"_blank\">RabbitMQ简易教程 - 路由</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>5.&nbsp;<a href=\"https://www.xncoding.com/2017/05/15/mq/rabbitmq-tutorial05.html#more\" target=\"_blank\">RabbitMQ简易教程 - 主题</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>6.&nbsp;<a href=\"https://www.xncoding.com/2017/05/16/mq/rabbitmq-tutorial06.html#more\" target=\"_blank\">RabbitMQ简易教程 - RPC</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>7.&nbsp;<a href=\"https://www.xncoding.com/2017/05/17/mq/rabbitmq-tutorial07.html#more\" target=\"_blank\">RabbitMQ简易教程 - WebSocket</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>8.&nbsp;<a href=\"https://www.xncoding.com/2017/05/26/mq/rabbitmq-tutorial08.html#more\" target=\"_blank\">RabbitMQ简易教程 - 并发调度</a></strong></span></span></p>','p','<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>1.&nbsp;<a href=\"https://www.xncoding.com/2017/05/06/mq/rabbitmq-tutorial01.html#more\" target=\"_blank\">RabbitMQ简易教程 - 安装</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>2.&nbsp;<a href=\"https://www.xncoding.com/2017/05/08/mq/rabbitmq-tutorial02.html#more\" target=\"_blank\">RabbitMQ简易教程 - 任务队列</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>3.&nbsp;<a href=\"https://www.xncoding.com/2017/05/10/mq/rabbitmq-tutorial03.html#more\" target=\"_blank\">RabbitMQ简易教程 - 发布订阅</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>4.&nbsp;<a href=\"https://www.xncoding.com/2017/05/13/mq/rabbitmq-tutorial04.html#more\" target=\"_blank\">RabbitMQ简易教程 - 路由</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>5.&nbsp;<a href=\"https://www.xncoding.com/2017/05/15/mq/rabbitmq-tutorial05.html#more\" target=\"_blank\">RabbitMQ简易教程 - 主题</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>6.&nbsp;<a href=\"https://www.xncoding.com/2017/05/16/mq/rabbitmq-tutorial06.html#more\" target=\"_blank\">RabbitMQ简易教程 - RPC</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>7.&nbsp;<a href=\"https://www.xncoding.com/2017/05/17/mq/rabbitmq-tutorial07.html#more\" target=\"_blank\">RabbitMQ简易教程 - WebSocket</a></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:18px\"><span style=\"font-family:KaiTi\"><strong>8.&nbsp;<a href=\"https://www.xncoding.com/2017/05/26/mq/rabbitmq-tutorial08.html#more\" target=\"_blank\">RabbitMQ简易教程 - 并发调度</a></strong></span></span></p>',4,9,1,'Y.c','https://www.xncoding.com/tags/rabbitmq/','2017-12-30 09:56:32.424377','2018-01-06 16:29:35.991395',13),(10,'Docker每天学一点','<h1><span style=\"font-size:14px\"><a href=\"https://yq.aliyun.com/articles/277652?spm=5176.100239.blogcont247586.37.5qimo4\" target=\"_blank\">5 分钟让你秒懂 Docker ！</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">1.&nbsp;<a href=\"https://www.xncoding.com/2017/04/01/docker/docker01.html\" target=\"_blank\">Docker每天学一点01 - 入门</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">2.&nbsp;<a href=\"https://www.xncoding.com/2017/04/02/docker/docker02.html\" target=\"_blank\">Docker每天学一点02 - 架构详解</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">3.&nbsp;<a href=\"https://www.xncoding.com/2017/04/03/docker/docker03.html\">Docker每天学一点03 - 镜像</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">4.&nbsp;<a href=\"https://www.xncoding.com/2017/04/05/docker/docker04.html\">Docker每天学一点04 - Dockerfile</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">5.&nbsp;<a href=\"https://www.xncoding.com/2017/04/07/docker/docker05.html\">Docker每天学一点05 - Registry</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">6.&nbsp;<a href=\"https://www.xncoding.com/2017/04/09/docker/docker06.html\">Docker每天学一点06 - 运行容器</a></span></h1>\r\n\r\n<p><span style=\"font-size:14px\"><a href=\"http://www.open-open.com/lib/view/open1407374211489.html\" target=\"_blank\">使用 Docker 作为 Python 开发环境</a></span></p>\r\n\r\n<p>&nbsp;</p>','p','<h1><span style=\"font-size:14px\"><a href=\"https://yq.aliyun.com/articles/277652?spm=5176.100239.blogcont247586.37.5qimo4\" target=\"_blank\">5 分钟让你秒懂 Docker ！</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">1.&nbsp;<a href=\"https://www.xncoding.com/2017/04/01/docker/docker01.html\" target=\"_blank\">Docker每天学一点01 - 入门</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">2.&nbsp;<a href=\"https://www.xncoding.com/2017/04/02/docker/docker02.html\" target=\"_blank\">Docker每天学一点02 - 架构详解</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">3.&nbsp;<a href=\"https://www.xncoding.com/2017/04/03/docker/docker03.html\">Docker每天学一点03 - 镜像</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">4.&nbsp;<a href=\"https://www.xncoding.com/2017/04/05/docker/docker04.html\">Docker每天学一点04 - Dockerfile</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">5.&nbsp;<a href=\"https://www.xncoding.com/2017/04/07/docker/docker05.html\">Docker每天学一点05 - Registry</a></span></h1>\r\n\r\n<h1><span style=\"font-size:14px\">6.&nbsp;<a href=\"https://www.xncoding.com/2017/04/09/docker/docker06.html\">Docker每天学一点06 - 运行容器</a></span></h1>',7,1,0,'Y.c','https://www.xncoding.com/tags/docker/','2017-12-30 14:46:19.120913','2018-01-06 16:29:18.809804',6),(11,'nginx笔记','<h1><span style=\"font-size:16px\">1.&nbsp;<a href=\"https://www.xncoding.com/2017/01/08/fullstack/nginx01.html\" target=\"_blank\">nginx笔记 - 配置和使用</a></span></h1>\r\n\r\n<h1><span style=\"font-size:16px\">2.&nbsp;<a href=\"https://www.xncoding.com/2017/01/09/fullstack/nginx02.html\" target=\"_blank\">nginx笔记 - 进阶篇</a></span></h1>\r\n\r\n<h1><span style=\"font-size:16px\">3.&nbsp;<a href=\"https://www.xncoding.com/2017/01/12/fullstack/nginx03.html\" target=\"_blank\">nginx笔记 - 配置HTTPS</a></span></h1>\r\n\r\n<p><span style=\"font-size:16px\">4.&nbsp;<a href=\"https://www.xncoding.com/2017/01/20/python/uwsgi.html\">Nginx+uWSGI部署Python Web应用</a></span></p>','p','<h1><span style=\"font-size:16px\">1.&nbsp;<a href=\"https://www.xncoding.com/2017/01/08/fullstack/nginx01.html\" target=\"_blank\">nginx笔记 - 配置和使用</a></span></h1>\r\n\r\n<h1><span style=\"font-size:16px\">2.&nbsp;<a href=\"https://www.xncoding.com/2017/01/09/fullstack/nginx02.html\" target=\"_blank\">nginx笔记 - 进阶篇</a></span></h1>\r\n\r\n<h1><span style=\"font-size:16px\">3.&nbsp;<a href=\"https://www.xncoding.com/2017/01/12/fullstack/nginx03.html\" target=\"_blank\">nginx笔记 - 配置HTTPS</a></span></h1>\r\n\r\n<p><span style=\"font-size:16px\">4.&nbsp;<a href=\"https://www.xncoding.com/2017/01/20/python/uwsgi.html\">Nginx+uWSGI部署Python Web应用</a></span></p>\r\n\r\n<p>&nbsp;</p>',2,0,0,'Y.c','https://www.xncoding.com/tags/nginx/','2017-12-30 15:00:22.486555','2017-12-30 15:07:11.824719',10),(12,'Tornado','<p><span style=\"font-size:12px\"><a href=\"https://tornado-zh.readthedocs.io/zh/latest/guide.html\" target=\"_blank\">Tornado&nbsp;用户指南</a></span></p>\r\n\r\n<p><span style=\"font-size:12px\"><a href=\"http://www.nowamagic.net/academy/detail/13321002\" target=\"_blank\">为什么要阅读Tornado的源码？</a></span></p>\r\n\r\n<p><span style=\"font-size:12px\"><a href=\"http://www.w-vi.com/255113.htm\" target=\"_blank\">Github Python网页框架资源集合，包括Django、Flask、Tornado等（长期更新）</a></span></p>\r\n\r\n<p><span style=\"font-size:12px\"><a href=\"https://github.com/tornadoweb/tornado/wiki/links\" target=\"_blank\">TornadoWeb&mdash;&mdash;Links</a></span></p>\r\n\r\n<p>&nbsp;</p>','p','<p><span style=\"font-size:12px\"><a href=\"https://tornado-zh.readthedocs.io/zh/latest/guide.html\" target=\"_blank\">Tornado&nbsp;用户指南</a></span></p>\r\n\r\n<p><span style=\"font-size:12px\"><a href=\"http://www.nowamagic.net/academy/detail/13321002\" target=\"_blank\">为什么要阅读Tornado的源码？</a></span></p>\r\n\r\n<p><span style=\"font-size:12px\"><a href=\"http://www.w-vi.com/255113.htm\" target=\"_blank\">Github Python网页框架资源集合，包括Django、Flask、Tornado等（长期更新）</a></span></p>\r\n\r\n<p><span style=\"font-size:12px\"><a href=\"https://github.com/tornadoweb/tornado/wiki/links\" target=\"_blank\">TornadoWeb&mdash;&mdash;Links</a></span></p>',4,0,0,'Y.c',NULL,'2018-01-01 04:54:17.128098','2018-01-06 13:30:57.434680',4),(13,'Django','<p><a href=\"http://python.usyiyi.cn/translate/django_182/index.html\" target=\"_blank\">Django 1.8.2 中文文档</a></p>\r\n\r\n<p><a href=\"http://python.usyiyi.cn/translate/Django_111/index.html\" target=\"_blank\">Django 1.11.6 中文文档</a></p>\r\n\r\n<p><a href=\"https://wizardforcel.gitbooks.io/django-design-patterns-and-best-practices/index.html\" target=\"_blank\">Django 设计模式与最佳实践</a></p>\r\n\r\n<p><a href=\"http://djangobook.py3k.cn/2.0/\" target=\"_blank\">Django book 2.0 中文翻译</a></p>\r\n\r\n<p><a href=\"https://wizardforcel.gitbooks.io/django-book-20-zh-cn/content/index.html\" target=\"_blank\">Django Book 2.0 中文版</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/81836/\" target=\"_blank\">在Django中实现一个高性能未读消息计数器(Django Signals)</a></p>\r\n\r\n<p><a href=\"http://django-simple-captcha.readthedocs.io/en/latest/usage.html\" target=\"_blank\">Using django-simple-captcha（Django自带图形验证码）</a></p>\r\n\r\n<p><a href=\"http://www.w-vi.com/255113.htm\" target=\"_blank\">Github Python网页框架资源集合，包括Django、Flask、Tornado等（长期更新）</a></p>','p','<p><a href=\"http://python.usyiyi.cn/translate/django_182/index.html\" target=\"_blank\">Django 1.8.2 中文文档</a></p>\r\n\r\n<p><a href=\"http://python.usyiyi.cn/translate/Django_111/index.html\" target=\"_blank\">Django 1.11.6 中文文档</a></p>\r\n\r\n<p><a href=\"https://wizardforcel.gitbooks.io/django-design-patterns-and-best-practices/index.html\" target=\"_blank\">Django 设计模式与最佳实践</a></p>\r\n\r\n<p><a href=\"http://djangobook.py3k.cn/2.0/\" target=\"_blank\">Django book 2.0 中文翻译</a></p>\r\n\r\n<p><a href=\"https://wizardforcel.gitbooks.io/django-book-20-zh-cn/content/index.html\" target=\"_blank\">Django Book 2.0 中文版</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/81836/\" target=\"_blank\">在Django中实现一个高性能未读消息计数器(Django Signals)</a></p>\r\n\r\n<p><a href=\"http://django-simple-captcha.readthedocs.io/en/latest/usage.html\" target=\"_blank\">Using django-simple-captcha（Django自带图形验证码）</a></p>\r\n\r\n<p><a href=\"http://www.w-vi.com/255113.htm\" target=\"_blank\">Github Python网页框架资源集合，包括Django、Flask、Tornado等（长期更新）</a></p>\r\n\r\n<p>&nbsp;</p>',6,0,0,'Y.c',NULL,'2018-01-01 05:07:16.637484','2018-01-08 14:50:09.121520',4),(14,'Flask 框架','<p><a href=\"http://dormousehole.readthedocs.io/en/latest/\" target=\"_blank\">Flask 用户指南</a></p>\r\n\r\n<p><a href=\"http://jinja.pocoo.org/docs/2.10/\" target=\"_blank\">Jinja2 文档</a></p>\r\n\r\n<p><a href=\"http://werkzeug.pocoo.org/docs/0.14/\" target=\"_blank\">Werkzeug 文档</a></p>\r\n\r\n<p><a href=\"http://flask.pocoo.org/snippets/73/\" target=\"_blank\">Basic Message Queue with Redis</a></p>\r\n\r\n<p><a href=\"http://www.pythondoc.com/flask-cache/index.html\" target=\"_blank\">Flask-Cache</a></p>\r\n\r\n<p><a href=\"http://www.open-open.com/lib/view/open1413109500500.html\" target=\"_blank\">Flask开发的学习用简单Blog系统：flaskblog</a></p>\r\n\r\n<p><a href=\"http://www.open-open.com/lib/view/open1478662810780.html\" target=\"_blank\">Flask 10 天开发一个网站</a></p>\r\n\r\n<p><a href=\"http://www.pythontab.com/html/2015/pythonweb_1104/974.html\" target=\"_blank\">Python超级明星WEB框架Flask</a></p>\r\n\r\n<p><a href=\"https://yq.aliyun.com/articles/247586\" target=\"_blank\">一线Python运维开发带你秒懂Flask框架</a></p>\r\n\r\n<hr />\r\n<p><a href=\"http://python.jobbole.com/88621/?utm_source=group.jobbole.com&amp;utm_medium=relatedArticles\" target=\"_blank\">Flask 框架简介</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/87683/\" target=\"_blank\">一个Flask应用运行过程剖析</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88618/\" target=\"_blank\">Flask 应用中的 URL 处理</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88591/\" target=\"_blank\">Flask 中模块化应用的实现</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88587/\" target=\"_blank\">Flask 中的蓝图管理</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/87680/\" target=\"_blank\">Flask中的请求上下文和应用上下文</a></p>\r\n\r\n<p><a href=\"http://www.open-open.com/lib/view/open1451461211011.html\" target=\"_blank\">flask 上下文的实现</a></p>\r\n\r\n<p><a href=\"http://www.open-open.com/lib/view/open1454460961573.html\" target=\"_blank\">flask权限管理</a></p>\r\n\r\n<p><a href=\"https://segmentfault.com/a/1190000004406179\" target=\"_blank\">基本的flask权限管理</a></p>\r\n\r\n<p><a href=\"http://www.w-vi.com/255113.htm\" target=\"_blank\">Github Python网页框架资源集合，包括Django、Flask、Tornado等（长期更新）</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/87502/\" target=\"_blank\">如何理解Nginx, WSGI, Flask之间的关系</a></p>','p','<p>&nbsp;</p>\r\n\r\n<p><a href=\"http://dormousehole.readthedocs.io/en/latest/\" target=\"_blank\">Flask 用户指南</a></p>\r\n\r\n<p><a href=\"http://jinja.pocoo.org/docs/2.10/\" target=\"_blank\">Jinja2 文档</a></p>\r\n\r\n<p><a href=\"http://werkzeug.pocoo.org/docs/0.14/\" target=\"_blank\">Werkzeug 文档</a></p>\r\n\r\n<p><a href=\"http://www.open-open.com/lib/view/open1413109500500.html\" target=\"_blank\">Flask开发的学习用简单Blog系统：flaskblog</a></p>\r\n\r\n<p><a href=\"http://www.pythontab.com/html/2015/pythonweb_1104/974.html\" target=\"_blank\">Python超级明星WEB框架Flask</a></p>\r\n\r\n<p><a href=\"https://yq.aliyun.com/articles/247586\" target=\"_blank\">一线Python运维开发带你秒懂Flask框架</a></p>\r\n\r\n<p><a href=\"http://www.w-vi.com/255113.htm\" target=\"_blank\">Github Python网页框架资源集合，包括Django、Flask、Tornado等（长期更新）</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/87502/\" target=\"_blank\">如何理解Nginx, WSGI, Flask之间的关系</a></p>',11,0,0,'Y.c',NULL,'2018-01-01 06:20:02.896569','2018-01-06 13:30:54.671767',4),(15,'Python','<p><a href=\"http://www.open-open.com/lib/view/open1406617515640.html\" target=\"_blank\">Python的网页爬虫&amp;文本处理&amp;科学计&amp;机器学习&amp;数据挖掘工具集</a></p>','p','<p><a href=\"http://www.open-open.com/lib/view/open1406617515640.html\" target=\"_blank\">Python的网页爬虫&amp;文本处理&amp;科学计&amp;机器学习&amp;数据挖掘工具集</a></p>',2,0,0,'Y.c',NULL,'2018-01-01 07:05:42.199491','2018-01-06 13:31:05.239433',4),(16,'SQLAlchemy','<p><a href=\"https://www.xncoding.com/2016/03/07/python/sqlalchemy01.html#more\" target=\"_blank\">SQLAlchemy入门</a></p>\r\n\r\n<p><a href=\"https://www.xncoding.com/2016/03/07/python/sqlalchemy02.html#more\" target=\"_blank\">SQLAlchemy进阶</a></p>\r\n\r\n<p><a href=\"http://docs.jinkan.org/docs/flask-sqlalchemy/index.html\" target=\"_blank\">Flask SQLAlchemy</a></p>','p','<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://www.xncoding.com/2016/03/07/python/sqlalchemy01.html#more\" target=\"_blank\">SQLAlchemy入门</a></p>\r\n\r\n<p><a href=\"https://www.xncoding.com/2016/03/07/python/sqlalchemy02.html#more\" target=\"_blank\">SQLAlchemy进阶</a></p>\r\n\r\n<p><a href=\"http://docs.jinkan.org/docs/flask-sqlalchemy/index.html\" target=\"_blank\">Flask SQLAlchemy</a></p>\r\n\r\n<p>&nbsp;</p>',3,0,0,'Y.c',NULL,'2018-01-02 01:13:08.101448','2018-01-06 06:49:12.960502',4),(17,'异步任务神器 Celery','<p><a href=\"https://www.waitig.com/celery-4-1-%e7%94%a8%e6%88%b7%e6%8c%87%e5%8d%97-task.html\" target=\"_blank\">Celery-4.1 用户指南: Task</a></p>\r\n\r\n<p><a href=\"http://docs.jinkan.org/docs/celery/getting-started/first-steps-with-celery.html\" target=\"_blank\">Celery 3.1 中文文档</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/ajianbeyourself/p/3889017.html\" target=\"_blank\">Celery最佳实践（转）</a></p>\r\n\r\n<p><a href=\"https://zhuanlan.zhihu.com/p/22304455\" target=\"_blank\">使用 Celery</a></p>\r\n\r\n<p><a href=\"http://docs.celeryproject.org/en/latest/index.html\" target=\"_blank\">Celery 4.1.0 documentation</a></p>\r\n\r\n<p><a href=\"https://funhacks.net/2016/12/13/celery/\" target=\"_blank\">异步任务神器 Celery</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/yanjingnan/p/6623483.html\" target=\"_blank\">Python 任务队列 Celery</a></p>\r\n\r\n<p><a href=\"https://www.jianshu.com/p/466f0a497b73\" target=\"_blank\">Django-celery</a></p>\r\n\r\n<p><a href=\"http://blog.csdn.net/iloveyin/article/details/44940931\" target=\"_blank\">Django中如何使用django-celery完成异步任务</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/linxiyue/p/7502561.html\" target=\"_blank\">异步任务利器Celery(一)介绍</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/linxiyue/p/7518535.html\" target=\"_blank\">异步任务利器Celery(二)在django项目中使用Celery</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/wangmin0216/p/6567539.html\" target=\"_blank\">django+celery配置(定时任务+循环任务)</a></p>\r\n\r\n<p><a href=\"https://simpleisbetterthancomplex.com/tutorial/2017/08/20/how-to-use-celery-with-django.html\" target=\"_blank\">How to Use Celery and RabbitMQ with Django</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/81953/\" target=\"_blank\">基于Django与Celery实现异步队列任务</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88276/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Django 使用 Celery 实现异步任务</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/znicy/p/5626040.html\" target=\"_blank\">异步任务队列Celery在Django中的使用</a></p>\r\n\r\n<p><a href=\"http://www.weiguda.com/blog/73/\" target=\"_blank\">Django中如何使用django-celery完成异步任务 (1)</a></p>\r\n\r\n<p><a href=\"http://www.weiguda.com/blog/74/\" target=\"_blank\">Django中如何使用django-celery完成异步任务 (2)</a></p>','p','<p><a href=\"https://www.waitig.com/celery-4-1-%e7%94%a8%e6%88%b7%e6%8c%87%e5%8d%97-task.html\" target=\"_blank\">Celery-4.1 用户指南: Task</a></p>\r\n\r\n<p><a href=\"http://docs.jinkan.org/docs/celery/getting-started/first-steps-with-celery.html\" target=\"_blank\">Celery 3.1 中文文档</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/ajianbeyourself/p/3889017.html\" target=\"_blank\">Celery最佳实践（转）</a></p>\r\n\r\n<p><a href=\"https://zhuanlan.zhihu.com/p/22304455\" target=\"_blank\">使用 Celery</a></p>\r\n\r\n<p><a href=\"http://docs.celeryproject.org/en/latest/index.html\" target=\"_blank\">Celery 4.1.0 documentation</a></p>\r\n\r\n<p><a href=\"https://funhacks.net/2016/12/13/celery/\" target=\"_blank\">异步任务神器 Celery</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/yanjingnan/p/6623483.html\" target=\"_blank\">Python 任务队列 Celery</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/linxiyue/p/7502561.html\" target=\"_blank\">异步任务利器Celery(一)介绍</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/linxiyue/p/7518535.html\" target=\"_blank\">异步任务利器Celery(二)在django项目中使用Celery</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/wangmin0216/p/6567539.html\" target=\"_blank\">django+celery配置(定时任务+循环任务)</a></p>\r\n\r\n<p><a href=\"https://simpleisbetterthancomplex.com/tutorial/2017/08/20/how-to-use-celery-with-django.html\" target=\"_blank\">How to Use Celery and RabbitMQ with Django</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/81953/\" target=\"_blank\">基于Django与Celery实现异步队列任务</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88276/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Django 使用 Celery 实现异步任务</a></p>',10,11,0,'Y.c',NULL,'2018-01-06 12:40:58.170935','2018-01-07 13:51:36.853961',4),(18,'Redis学习手册（目录）','<p><span style=\"font-size:15px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 为什么自己当初要选择Redis作为数据存储解决方案中的一员呢？现在能想到的原因主要有三。其一，Redis不仅性能高效，而且完全免费。其二，是基于C/C++开发的服务器，这里应该有一定的感情因素吧。最后就是上手容易，操作简单。记得在刚刚接触Redis的时候，由于当时项目的工期<span style=\"font-size:15px\">相当</span>紧张，留给我们做出选择的空间也是<span style=\"font-size:15px\">非常</span>有限，一旦技术决策失误，造成的后果也比较严重。所以在做出决定之前，我不仅快速的浏览了Redis官网文档，而且还熬夜搜集了很多网上的相关技术文章。在经过一通折腾之后，毅然决然的选择了它，现在回头想想自己确实是幸运的。</span><br />\r\n<span style=\"font-size:15px\">&nbsp;&nbsp; &nbsp;&nbsp; 这个系列博客中的内容和数据主要来自于Redis官方文档，本人仅仅是根据自己的经验对常用的内容做了进一步的解释和归纳。有兴趣的网友也可以直接阅读Redis的官方文档。由于本人的翻译和理解能力有限，如有不到之处，欢迎指正。</span><br />\r\n<span style=\"font-size:15px\">&nbsp;&nbsp; &nbsp;&nbsp; 最后需要说的是，如果这个系列的博客能够让您在阅读后有所收获，那么就请继续关注本人后面有关新主题的系列博客。</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(开篇)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/13/2348935.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/13/2348935.html</span></a><br />\r\n<span style=\"font-size:15px\">一、简介</span><br />\r\n<span style=\"font-size:15px\">二、Redis的优势</span><br />\r\n<span style=\"font-size:15px\">三、目前版本中Redis存在的主要问题</span><br />\r\n<span style=\"font-size:15px\">四、和关系型数据库的比较</span><br />\r\n<span style=\"font-size:15px\">五、如何持久化内存数据</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(String数据类型)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/13/2349815.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/13/2349815.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n<span style=\"font-size:15px\">三、命令示例</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(List数据类型)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/14/2351859.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/14/2351859.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n<span style=\"font-size:15px\">三、命令示例</span><br />\r\n<span style=\"font-size:15px\">四、链表结构的小技巧</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(Set数据类型)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/15/2352512.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/15/2352512.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n<span style=\"font-size:15px\">三、命令示例</span><br />\r\n<span style=\"font-size:15px\">四、应用范围</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(Hashes数据类型)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/15/2352932.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/15/2352932.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n<span style=\"font-size:15px\">三、命令示例</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(Sorted-Sets数据类型)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/16/2354994.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/16/2354994.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n<span style=\"font-size:15px\">三、命令示例</span><br />\r\n<span style=\"font-size:15px\">四、应用范围</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(Key操作命令)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/18/2356951.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/18/2356951.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n<span style=\"font-size:15px\">三、命令示例</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(事务)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/18/2357783.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/18/2357783.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n<span style=\"font-size:15px\">三、命令示例</span><br />\r\n<span style=\"font-size:15px\">四、WATCH命令和基于CAS的乐观锁</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(主从复制)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/23/2364717.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/23/2364717.html</span></a><br />\r\n<span style=\"font-size:15px\">一、Redis的Replication</span><br />\r\n<span style=\"font-size:15px\">二、Replication的工作原理</span><br />\r\n<span style=\"font-size:15px\">三、如何配置Replication</span><br />\r\n<span style=\"font-size:15px\">四、应用示例</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(持久化)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/23/2365017.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/23/2365017.html</span></a><br />\r\n<span style=\"font-size:15px\">一、Redis提供了哪些持久化机制</span><br />\r\n<span style=\"font-size:15px\">二、RDB机制的优势和劣势</span><br />\r\n<span style=\"font-size:15px\">三、AOF机制的优势和劣势</span><br />\r\n<span style=\"font-size:15px\">四、其它</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(虚拟内存)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/24/2366803.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/24/2366803.html</span></a><br />\r\n<span style=\"font-size:15px\">一、简介</span><br />\r\n<span style=\"font-size:15px\">二、应用场景</span><br />\r\n<span style=\"font-size:15px\">三、配置</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(管线)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/25/2367816.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/25/2367816.html</span></a><br />\r\n<span style=\"font-size:15px\">一、请求应答协议和RTT</span><br />\r\n<span style=\"font-size:15px\">二、管线(pipelining)</span><br />\r\n<span style=\"font-size:15px\">三、Benchmark</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(服务器管理)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/27/2369480.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/27/2369480.html</span></a><br />\r\n<span style=\"font-size:15px\">一、概述</span><br />\r\n<span style=\"font-size:15px\">二、相关命令列表</span><br />\r\n&nbsp;&nbsp; &nbsp;<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(内存优化)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/27/2370521.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/27/2370521.html</span></a><br />\r\n<span style=\"font-size:15px\">一、特殊编码</span><br />\r\n<span style=\"font-size:15px\">二、BIT和Byte级别的操作</span><br />\r\n<span style=\"font-size:15px\">三、尽可能使用Hash</span><br />\r\n<br />\r\n<span style=\"color:#ff6600\"><strong><span style=\"font-size:16px\">Redis学习手册(实例代码)</span></strong></span><br />\r\n<span style=\"font-size:15px\"><a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/03/15/2398249.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2012/03/15/2398249.html</a></span></p>\r\n\r\n<p><span style=\"font-size:15px\"><span style=\"color:#993366\">如果您觉得这个系列的博客可以让您有所收获，请保持持续的关注。<br />\r\n如果您发现博客中有明显的纰漏，欢迎指正。<br />\r\n如果您有意进行技术上的交流，可以通过邮件共同探讨(<strong>stephenland74@hotmail.com</strong>)。<br />\r\n如果您有更好的建议或更好的实现方式，敬请赐教。<br />\r\n如果您已经是我的关注者，希望随后发布的PostgreSQL系列不会让您失望。</span></span></p>','p','<p><span style=\"font-size:15px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 为什么自己当初要选择Redis作为数据存储解决方案中的一员呢？现在能想到的原因主要有三。其一，Redis不仅性能高效，而且完全免费。其二，是基于C/C++开发的服务器，这里应该有一定的感情因素吧。最后就是上手容易，操作简单。记得在刚刚接触Redis的时候，由于当时项目的工期<span style=\"font-size:15px\">相当</span>紧张，留给我们做出选择的空间也是<span style=\"font-size:15px\">非常</span>有限，一旦技术决策失误，造成的后果也比较严重。所以在做出决定之前，我不仅快速的浏览了Redis官网文档，而且还熬夜搜集了很多网上的相关技术文章。在经过一通折腾之后，毅然决然的选择了它，现在回头想想自己确实是幸运的。</span><br />\r\n<span style=\"font-size:15px\">&nbsp;&nbsp; &nbsp;&nbsp; 这个系列博客中的内容和数据主要来自于Redis官方文档，本人仅仅是根据自己的经验对常用的内容做了进一步的解释和归纳。有兴趣的网友也可以直接阅读Redis的官方文档。由于本人的翻译和理解能力有限，如有不到之处，欢迎指正。</span><br />\r\n<span style=\"font-size:15px\">&nbsp;&nbsp; &nbsp;&nbsp; 最后需要说的是，如果这个系列的博客能够让您在阅读后有所收获，那么就请继续关注本人后面有关新主题的系列博客。</span><br />\r\n<br />\r\n<span style=\"font-size:16px\"><strong><span style=\"color:#ff6600\">Redis学习手册(开篇)</span></strong></span><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/02/13/2348935.html\" target=\"_blank\"><span style=\"font-size:15px\">http://www.cnblogs.com/stephen-liu74/archive/2012/02/13/2348935.html</span></a><br />\r\n<span style=\"font-size:15px\">一、简介</span><br />\r\n<span style=\"font-size:15px\">二、Redis的优势</span><br />\r\n<span style=\"font-size:15px\">三、目前版本中Redis存在的主要问题</span><br />\r\n<span style=\"font-size:15px\">四、和关系型数据库的比较</span><br />\r\n<span style=\"font-size:15px\">五、如何持久化内存数据</span></p>',4,0,1,'Stephen Liu','http://www.cnblogs.com/stephen-liu74/archive/2012/04/16/2370212.html','2018-01-07 01:50:37.657469','2018-01-09 01:18:04.249207',10),(19,'Supervisor','<p><a href=\"http://www.restran.net/2015/10/04/supervisord-tutorial/\" target=\"_blank\">Python 进程管理工具 Supervisor 使用教程</a></p>\r\n\r\n<p><a href=\"http://supervisord.org/\" target=\"_blank\">Supervisor</a></p>\r\n\r\n<p><a href=\"https://blog.phpgao.com/supervisor_shadowsocks.html\" target=\"_blank\">使用supervisor托管shadowsocks</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/xuezhigu/p/7660203.html\" target=\"_blank\">supervisor配置文件详解</a></p>\r\n\r\n<p><a href=\"http://blog.51cto.com/lixcto/1539136\" target=\"_blank\">supervisor配置文件详解</a></p>\r\n\r\n<p><a href=\"http://liyangliang.me/posts/2015/06/using-supervisor/\" target=\"_blank\">使用 supervisor 管理进程</a></p>','p','<p><a href=\"http://www.restran.net/2015/10/04/supervisord-tutorial/\" target=\"_blank\">Python 进程管理工具 Supervisor 使用教程</a></p>\r\n\r\n<p><a href=\"http://supervisord.org/\" target=\"_blank\">Supervisor</a></p>\r\n\r\n<p><a href=\"https://blog.phpgao.com/supervisor_shadowsocks.html\" target=\"_blank\">使用supervisor托管shadowsocks</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/xuezhigu/p/7660203.html\" target=\"_blank\">supervisor配置文件详解</a></p>\r\n\r\n<p><a href=\"http://blog.51cto.com/lixcto/1539136\" target=\"_blank\">supervisor配置文件详解</a></p>\r\n\r\n<p><a href=\"http://liyangliang.me/posts/2015/06/using-supervisor/\" target=\"_blank\">使用 supervisor 管理进程</a></p>',3,0,1,'Y.c',NULL,'2018-01-07 08:58:31.169942','2018-01-07 14:45:41.078397',4),(20,'机器学习','<p><a href=\"http://python.jobbole.com/81721/\" target=\"_blank\">基于 Python 和 Scikit-Learn 的机器学习介绍</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/81896/\" target=\"_blank\">从Theano到Lasagne：基于Python的深度学习的框架和库</a></p>','p','<p><a href=\"http://python.jobbole.com/81721/\" target=\"_blank\">基于 Python 和 Scikit-Learn 的机器学习介绍</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/81896/\" target=\"_blank\">从Theano到Lasagne：基于Python的深度学习的框架和库</a></p>',0,0,0,'Y.c',NULL,'2018-01-08 01:39:25.369560','2018-01-08 01:39:25.369615',4),(21,'Python———类','<p><a href=\"http://python.jobbole.com/21351/\" target=\"_blank\">深刻理解Python中的元类(metaclass)</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88214/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Python 面向对象（初级篇）</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88230/\" target=\"_blank\">Python 面向对象（进阶篇）</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/87983/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">浅析 Python 的类、继承和多态</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/86787/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Python: 你不知道的 super</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/86539/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Python类继承的高级特性</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88367/\" target=\"_blank\">Python 魔术方法 - Magic Method</a></p>','p','<p><a href=\"http://python.jobbole.com/21351/\" target=\"_blank\">深刻理解Python中的元类(metaclass)</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88214/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Python 面向对象（初级篇）</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88230/\" target=\"_blank\">Python 面向对象（进阶篇）</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/87983/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">浅析 Python 的类、继承和多态</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/86787/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Python: 你不知道的 super</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/86539/?utm_source=blog.jobbole.com&amp;utm_medium=relatedPosts\" target=\"_blank\">Python类继承的高级特性</a></p>\r\n\r\n<p><a href=\"http://python.jobbole.com/88367/\" target=\"_blank\">Python 魔术方法 - Magic Method</a></p>',1,0,0,'Y.c',NULL,'2018-01-08 03:02:37.582236','2018-01-08 03:02:37.582295',4),(22,'Python Redis','<p><a href=\"http://www.cnblogs.com/melonjiang/p/5342505.html\" target=\"_blank\">Python&mdash;操作redis</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/melonjiang/p/5342383.html\" target=\"_blank\">Python&mdash;redis 连接、发布、订阅</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/sxlnnnn/p/6393139.html\" target=\"_blank\">Python redis</a></p>\r\n\r\n<p><a href=\"http://blog.jobbole.com/88170/\" target=\"_blank\">10 个 Redis 建议/技巧</a></p>\r\n\r\n<p><a href=\"http://debugo.com/python-redis/\" target=\"_blank\">使用Python操作Redis</a></p>\r\n\r\n<p><a href=\"http://redisdoc.com/index.html\" target=\"_blank\">Redis 命令参考</a></p>\r\n\r\n<p><a href=\"http://www.redis.net.cn/order/3578.html\" target=\"_blank\">Redis 命令</a></p>\r\n\r\n<p><a href=\"http://www.shouce.ren/api/view/a/6234\" target=\"_blank\">Redis基础教程</a></p>','p','<p><a href=\"http://www.cnblogs.com/melonjiang/p/5342505.html\" target=\"_blank\">Python&mdash;操作redis</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/melonjiang/p/5342383.html\" target=\"_blank\">Python&mdash;redis 连接、发布、订阅</a></p>\r\n\r\n<p><a href=\"http://www.cnblogs.com/sxlnnnn/p/6393139.html\" target=\"_blank\">Python redis</a></p>\r\n\r\n<p><a href=\"http://blog.jobbole.com/88170/\" target=\"_blank\">10 个 Redis 建议/技巧</a></p>\r\n\r\n<p><a href=\"http://debugo.com/python-redis/\" target=\"_blank\">使用Python操作Redis</a></p>\r\n\r\n<p><a href=\"http://redisdoc.com/index.html\" target=\"_blank\">Redis 命令参考</a></p>\r\n\r\n<p><a href=\"http://www.redis.net.cn/order/3578.html\" target=\"_blank\">Redis 命令</a></p>\r\n\r\n<p><a href=\"http://www.shouce.ren/api/view/a/6234\" target=\"_blank\">Redis基础教程</a></p>',1,1,0,'Y.c',NULL,'2018-01-09 01:32:03.845397','2018-01-09 01:35:27.763896',15),(23,'PostgreSQL学习手册','<p>&nbsp;&nbsp; 事实上之前有很长一段时间都在纠结是否有必要好好学习它，但是始终都没有一个很好的理由说服自己。甚至是直到这个项目最终决定选用PostgreSQL时，我都没有真正意识到学习它的价值，当时只是想反正和其它数据库差不多，能用就行了。然而有一天晚上，自己也不知道为什么，躺在床上开始回想整个项目的实施过程，想着想着就想到了数据库选型这一问题上了。事情是这样的，最初客户将他们的产品目标定位为主打中型规模，同时也要在一定程度上支持小型规模。鉴于此，我们为他们提供的方案是中型规模的数据库选用Oracle，小型规模的选定MySQL，在经过多轮商谈之后这个方案通过了。然而随着项目的深入，客户突然有一天提出，由于成本和市场推广等问题，该产品的数据库部分需要进行一定的调整，调整的结果是中型规模可以同时支持Oracle和MySQL，而小型规模则要同时支持MySQL和PostgreSQL，原因非常简单，PostgreSQL是纯免费的数据库产品。听到这个消息之后，我当时就非常恼火，因为当初为了保证运行时效率(国标)，我们的数据库访问层是完全基于数据库供应商提供的原始C接口开发的，甚至都没有考虑ODBC提供的原始C接口，以防在转换中失去效率，或是ODBC本身为了强调通用性而不得不牺牲某些数据库的优化特征，如批量插入、批量读取等。最后的结果显而易见，客户就是上帝，上帝的意见就是真理，这样我们就不得不基于现有的访问层接口又重新开发了一套支持PostgreSQL原生C接口的驱动。然而随着对PostgreSQL的不断学习，对它的了解也在逐步加深，后来发现它的功能还是非常强大的，特别是对GIS空间数据的支持就更加的吸引我了。于是就在脑子里为MySQL和PostgreSQL做了一个简单的对比和分析，最后得出一个结论，相比MySQL，PostgreSQL并没有什么刚性的缺点，但是它的纯免费特征确实是MySQL无法比拟的。它完全可以成为软件产品解决方案中非常重要的一环，特别是针对很多中低端用户，不仅在使用中不会感到任何差异，而且还能节省一部分额外的费用，这对于产品的市场推广是非常有帮助的。想到这里便决定起而行之，花上一段时间好好的学习和研究它，于是就有了这个系列的博客。<br />\r\n&nbsp;&nbsp;&nbsp; 好了，闲淡扯的差不多了，让我们还是言归正传吧！</p>\r\n\r\n<p><br />\r\n<strong>PostgreSQL学习手册(数据表)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/16/2290803.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/16/2290803.html</a><br />\r\n一、表的定义<br />\r\n二、系统字段<br />\r\n三、表的修改<br />\r\n四、权限<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(模式Schema)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291526.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291526.html</a><br />\r\n<br />\r\n<strong>PostgreSQL学习手册(表的继承和分区)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291814.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291814.html</a><br />\r\n一、表的继承<br />\r\n二、分区表<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(常用数据类型)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/19/2293602.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/19/2293602.html</a><br />\r\n一、数值类型<br />\r\n二、字符类型<br />\r\n三、日期/时间类型<br />\r\n四、布尔类型<br />\r\n五、位串类型<br />\r\n六、数组<br />\r\n七、复合类型<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(函数和操作符&lt;一&gt;)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/19/2294071.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/19/2294071.html</a><br />\r\n一、逻辑操作符<br />\r\n二、比较操作符<br />\r\n三、数学函数和操作符<br />\r\n四、字符串函数和操作符<br />\r\n五、位串函数和操作符<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(函数和操作符&lt;二&gt;)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/20/2294643.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/20/2294643.html</a><br />\r\n六、模式匹配<br />\r\n七、数据类型格式化函数<br />\r\n八、时间/日期函数和操作符<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(函数和操作符&lt;三&gt;)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/20/2295273.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/20/2295273.html</a><br />\r\n九、序列操作函数<br />\r\n十、条件表达式<br />\r\n十一、数组函数和操作符<br />\r\n十二、系统信息函数<br />\r\n十三、系统管理函数<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(索引)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/22/2298182.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/22/2298182.html</a><br />\r\n一、索引的类型<br />\r\n二、复合索引<br />\r\n三、组合多个索引<br />\r\n四、唯一索引<br />\r\n五、表达式索引<br />\r\n六、部分索引<br />\r\n七、检查索引的使用<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(事物隔离)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/25/2300863.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/25/2300863.html</a><br />\r\n<br />\r\n<strong>PostgreSQL学习手册(性能提升技巧)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/25/2301064.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/25/2301064.html</a><br />\r\n一、使用EXPLAIN<br />\r\n二、批量数据插入<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(服务器配置)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/26/2302241.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/26/2302241.html</a><br />\r\n一、服务器进程的启动和关闭<br />\r\n二、服务器配置<br />\r\n三、内存相关的参数配置<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(角色和权限)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/26/2302639.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/26/2302639.html</a><br />\r\n一、数据库角色<br />\r\n二、角色属性<br />\r\n三、权限<br />\r\n四、角色成员<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(数据库管理)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/27/2303510.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/27/2303510.html</a><br />\r\n一、概述<br />\r\n二、创建数据库<br />\r\n三、修改数据库配置<br />\r\n四、删除数据库<br />\r\n五、表空间<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(数据库维护)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/27/2304155.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/27/2304155.html</a><br />\r\n一、恢复磁盘空间<br />\r\n二、更新规划器统计<br />\r\n三、VACUUM和ANALYZE的示例<br />\r\n四、定期重建索引<br />\r\n五、观察磁盘使用情况<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(系统表)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/28/2305415.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/28/2305415.html</a><br />\r\n一、pg_class<br />\r\n二、pg_attribute<br />\r\n三、pg_attrdef<br />\r\n四、pg_authid<br />\r\n五、pg_auth_members<br />\r\n六、pg_constraint<br />\r\n七、pg_tablespace<br />\r\n八、pg_namespace<br />\r\n九、pg_database<br />\r\n十、pg_index<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(系统视图)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/29/2306115.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/29/2306115.html</a><br />\r\n一、pg_tables<br />\r\n二、pg_indexes<br />\r\n三、pg_views<br />\r\n四、pg_user<br />\r\n五、pg_roles<br />\r\n六、pg_rules<br />\r\n七、pg_settings<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(客户端命令&lt;一&gt;)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/29/2306493.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/29/2306493.html</a><br />\r\n零、口令文件<br />\r\n一、createdb<br />\r\n二、dropdb<br />\r\n三、reindexdb<br />\r\n四、vacuumdb<br />\r\n五、createuser<br />\r\n六、dropuser<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(客户端命令&lt;二&gt;)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/30/2307813.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/30/2307813.html</a><br />\r\n七、pg_dump<br />\r\n八、pg_restore<br />\r\n九、psql<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(SQL语言函数)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/01/04/2312194.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2012/01/04/2312194.html</a><br />\r\n一、基本概念<br />\r\n二、基本类型<br />\r\n三、复合类型<br />\r\n四、带输出参数的函数<br />\r\n五、返回结果作为表数据源<br />\r\n六、返回集合的SQL函数<br />\r\n七、多态的SQL函数<br />\r\n八、函数重载<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(PL/pgSQL过程语言)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2012/01/05/2312759.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2012/01/05/2312759.html</a><br />\r\n一、概述<br />\r\n二、PL/pgSQL的结构<br />\r\n三、声明<br />\r\n四、基本语句<br />\r\n五、控制结构<br />\r\n六、游标<br />\r\n七、错误和消息</p>\r\n\r\n<p>如果您觉得这个系列的博客可以让您有所收获，请保持持续的关注。<br />\r\n如果您发现博客中有明显的纰漏，欢迎指正。<br />\r\n如果您有意进行技术上的交流，可以通过邮件共同探讨(<strong>stephenland74@hotmail.com</strong>)。<br />\r\n如果您有更好的建议或更好的实现方式，敬请赐教。<br />\r\n如果您已经是我的关注者，希望随后发布的Lua系列不会让您失望。</p>','p','<p><strong>PostgreSQL学习手册(数据表)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/16/2290803.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/16/2290803.html</a><br />\r\n一、表的定义<br />\r\n二、系统字段<br />\r\n三、表的修改<br />\r\n四、权限<br />\r\n<br />\r\n<strong>PostgreSQL学习手册(模式Schema)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291526.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291526.html</a><br />\r\n<br />\r\n<strong>PostgreSQL学习手册(表的继承和分区)</strong><br />\r\n<a href=\"http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291814.html\" target=\"_blank\">http://www.cnblogs.com/stephen-liu74/archive/2011/12/18/2291814.html</a><br />\r\n一、表的继承<br />\r\n二、分区表</p>',1,0,0,'Stephen Liu','http://www.cnblogs.com/stephen-liu74/archive/2012/06/08/2315679.html','2018-01-09 01:41:18.652252','2018-01-09 01:46:38.267592',9),(24,'HTML 框架','<p><a href=\"http://ace.jeka.by/index.html\" target=\"_blank\">Ace Admin</a></p>\r\n\r\n<p><a href=\"http://preview.isdee.com/admin/smartadmin/index.html\" target=\"_blank\">SmartAdmin</a></p>\r\n\r\n<p><a href=\"https://blackrockdigital.github.io/startbootstrap-sb-admin-2/pages/index.html\" target=\"_blank\">SB Admin v2.0</a></p>\r\n\r\n<p><a href=\"https://github.com/ironsummitmedia/startbootstrap-sb-admin-2\" target=\"_blank\">startbootstrap-sb-admin-2</a></p>\r\n\r\n<p><a href=\"http://getbootstrap.com/2.3.2/javascript.html\" target=\"_blank\">JavaScript in Bootstrap</a></p>\r\n\r\n<p><a href=\"http://v3.bootcss.com/css/\" target=\"_blank\">Bootstrap V3 全局 CSS 样式</a></p>\r\n\r\n<p><a href=\"https://www.tutorialrepublic.com/twitter-bootstrap-tutorial/\" target=\"_blank\">Bootstrap 3 Tutorial</a></p>\r\n\r\n<p><a href=\"https://www.tutorialrepublic.com/jquery-tutorial/\" target=\"_blank\">jQuery Tutorial</a></p>','p','<p><a href=\"http://ace.jeka.by/index.html\" target=\"_blank\">Ace Admin</a></p>\r\n\r\n<p><a href=\"http://preview.isdee.com/admin/smartadmin/index.html\" target=\"_blank\">SmartAdmin</a></p>\r\n\r\n<p><a href=\"https://blackrockdigital.github.io/startbootstrap-sb-admin-2/pages/index.html\" target=\"_blank\">SB Admin v2.0</a></p>\r\n\r\n<p><a href=\"https://github.com/ironsummitmedia/startbootstrap-sb-admin-2\" target=\"_blank\">startbootstrap-sb-admin-2</a></p>\r\n\r\n<p><a href=\"http://getbootstrap.com/2.3.2/javascript.html\" target=\"_blank\">JavaScript in Bootstrap</a></p>\r\n\r\n<p><a href=\"http://v3.bootcss.com/css/\" target=\"_blank\">Bootstrap V3 全局 CSS 样式</a></p>\r\n\r\n<p><a href=\"https://www.tutorialrepublic.com/twitter-bootstrap-tutorial/\" target=\"_blank\">Bootstrap 3 Tutorial</a></p>\r\n\r\n<p><a href=\"https://www.tutorialrepublic.com/jquery-tutorial/\" target=\"_blank\">jQuery Tutorial</a></p>',1,0,0,'Y.c',NULL,'2018-01-09 03:15:09.377655','2018-01-09 03:19:58.129478',16);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (2,1,7),(5,1,24),(10,4,12),(8,4,16),(9,4,18),(11,5,16),(13,5,18),(12,5,25),(14,6,14),(15,7,1),(16,7,34),(17,8,7),(18,9,1),(19,9,36),(20,9,37),(21,9,38),(24,10,12),(23,10,41),(26,11,12),(25,11,18),(27,12,1),(28,12,2),(29,12,20),(30,13,1),(31,13,3),(32,14,1),(33,14,4),(34,15,1),(35,16,1),(37,16,4),(36,16,42),(38,17,1),(45,17,15),(42,17,22),(43,17,23),(39,17,36),(40,17,37),(41,17,38),(44,17,43),(47,18,15),(46,18,16),(49,19,1),(48,19,16),(50,19,47),(51,19,48),(52,20,1),(54,20,49),(53,20,50),(55,21,1),(56,22,1),(57,22,15),(59,23,26),(63,24,6),(62,24,21),(61,24,51),(64,24,52);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_category_name_92eb1483_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'随笔','2017-12-21 13:31:46.141665','2017-12-21 13:31:46.141716'),(2,'生活','2017-12-21 13:31:50.974849','2017-12-21 13:31:50.974895'),(3,'诗歌','2017-12-21 13:31:56.137587','2017-12-21 13:31:56.137655'),(4,'Python','2017-12-21 13:32:00.839475','2017-12-21 13:32:00.839523'),(5,'部署','2017-12-21 13:32:05.125186','2017-12-21 13:32:05.125225'),(6,'配置','2017-12-21 13:32:09.939532','2017-12-21 13:32:09.939591'),(7,'MongoDB','2017-12-21 13:32:28.509185','2017-12-21 13:32:28.509271'),(8,'MySQL','2017-12-21 13:32:44.873544','2017-12-21 13:32:44.873589'),(9,'PostgreSQL','2017-12-21 13:32:54.183618','2017-12-21 13:32:54.183674'),(10,'Linux','2017-12-21 13:33:13.423084','2017-12-21 13:33:13.423181'),(11,'数据分析','2017-12-24 13:09:06.835041','2017-12-24 13:09:06.835093'),(13,'消息队列','2017-12-30 09:56:42.652576','2017-12-30 09:56:42.652605'),(14,'Golang','2018-01-06 13:31:45.416623','2018-01-06 13:31:45.416731'),(15,'Redis','2018-01-09 01:32:16.566805','2018-01-09 01:32:16.566841'),(16,'Javascript','2018-01-09 03:15:43.740594','2018-01-09 03:15:43.740622');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_picture`
--

LOCK TABLES `blog_picture` WRITE;
/*!40000 ALTER TABLE `blog_picture` DISABLE KEYS */;
INSERT INTO `blog_picture` VALUES (4,4,'nginx-root.png','image/png','/media/ckupload/2f37e5da-e89d-11e7-863b-000c2997ff86-93596.png',26855,'2017-12-24 11:25:45.780034','2017-12-24 11:27:50.706251'),(5,4,'nginx-alias.png','image/png','/media/ckupload/63c2cdec-e89d-11e7-863b-000c2997ff86-67006.png',26938,'2017-12-24 11:27:13.932474','2017-12-24 11:27:50.702620'),(6,5,'proxy.jpg','image/jpeg','/media/ckupload/5358c50a-e89e-11e7-863b-000c2997ff86-32888.jpg',22025,'2017-12-24 11:33:55.890039','2017-12-24 11:39:54.184197'),(7,5,'reverse-proxy.jpg','image/jpeg','/media/ckupload/7f8987e0-e89e-11e7-863b-000c2997ff86-64042.jpg',17684,'2017-12-24 11:35:10.029966','2017-12-24 11:39:54.179951'),(9,7,'数据分析.jpg','image/jpeg','/media/ckupload/e78fd108-e8aa-11e7-921a-005056a7d988-71745.jpg',90992,'2017-12-24 13:03:58.514037','2017-12-29 01:52:10.467918'),(10,8,'th.jpg','image/jpeg','/media/ckupload/308235c0-e8ad-11e7-921a-005056a7d988-74938.jpg',11149,'2017-12-24 13:20:19.892079','2017-12-24 13:20:36.515199'),(11,7,'dataanalyze.jpg','image/jpeg','/media/ckupload/b9ae5230-ec3a-11e7-921a-005056a7d988-31342.jpg',70866,'2017-12-29 01:51:02.556295','2017-12-29 01:52:10.470231');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_suggest`
--

LOCK TABLES `blog_suggest` WRITE;
/*!40000 ALTER TABLE `blog_suggest` DISABLE KEYS */;
INSERT INTO `blog_suggest` VALUES (5,'test','test@163.com','测试 celery是否正常工作。','2018-01-06 15:46:39.053909'),(7,'alex','alex@126.com','很高兴看到你的博客，受益匪浅，非常感谢。','2018-01-06 16:00:44.358621'),(9,'test@163.com','test@163.com','Python，Django，Gevent，Tornado，Flask，Mysql，Redis，MongoDB，PostgreSQL，RabbitMQ，jQuery，CSS，HTML.etc。','2018-01-07 01:46:26.789221'),(10,'test@163.com','test@163.com','test@163.com','2018-01-07 09:50:28.418824'),(11,'test@163.com','test@163.com','test@163.com','2018-01-07 09:56:15.710475'),(12,'test@163.com','test@163.com','test@163.com','2018-01-07 09:56:28.140239');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_tag_name_c5718cc8_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'Python','2017-12-21 13:28:55.081707','2017-12-21 13:28:55.081782'),(2,'Tornado','2017-12-21 13:28:59.850533','2017-12-21 13:28:59.850580'),(3,'Django','2017-12-21 13:29:03.336368','2017-12-21 13:29:03.336419'),(4,'Flask','2017-12-21 13:29:07.682305','2017-12-21 13:29:07.682369'),(5,'Gevent','2017-12-21 13:29:13.157837','2017-12-21 13:29:13.157912'),(6,'HTML5','2017-12-21 13:29:24.829360','2017-12-21 13:29:24.829457'),(7,'随笔','2017-12-21 13:29:35.924415','2017-12-21 13:29:35.924459'),(9,'散文','2017-12-21 13:29:42.564365','2017-12-21 13:29:42.564406'),(10,'音乐','2017-12-21 13:29:48.123025','2017-12-21 13:29:48.123093'),(11,'算法','2017-12-21 13:29:55.261404','2017-12-21 13:29:55.261440'),(12,'部署','2017-12-21 13:29:58.863191','2017-12-21 13:29:58.863227'),(13,'MongoDB','2017-12-21 13:30:05.544568','2017-12-21 13:30:05.544615'),(14,'MySQL','2017-12-21 13:30:10.938776','2017-12-21 13:30:10.938865'),(15,'Redis','2017-12-21 13:30:16.592469','2017-12-21 13:30:16.592516'),(16,'Linux','2017-12-21 13:30:21.788928','2017-12-21 13:30:21.788986'),(17,'C/C++','2017-12-21 13:30:33.396879','2017-12-21 13:30:33.396937'),(18,'Nginx','2017-12-21 13:30:40.452845','2017-12-21 13:30:40.452935'),(19,'Apache','2017-12-21 13:30:45.164489','2017-12-21 13:30:45.164578'),(20,'源码','2017-12-21 13:30:50.004688','2017-12-21 13:30:50.004743'),(21,'Javascript','2017-12-21 13:30:54.950427','2017-12-21 13:30:54.950499'),(22,'异步','2017-12-21 13:30:59.790297','2017-12-21 13:30:59.790348'),(23,'任务队列','2017-12-21 13:31:06.797824','2017-12-21 13:31:06.797908'),(24,'仓央嘉措','2017-12-21 13:31:11.870775','2017-12-21 13:31:11.870805'),(25,'配置','2017-12-21 13:32:13.194445','2017-12-21 13:32:13.194485'),(26,'PostgreSQL','2017-12-21 13:32:56.485961','2017-12-21 13:32:56.486004'),(27,'爬虫','2017-12-24 11:53:01.210652','2017-12-24 11:53:01.210721'),(28,'正则表达式','2017-12-24 11:53:15.206851','2017-12-24 11:53:15.206891'),(29,'beautifulsoup','2017-12-24 11:53:27.484102','2017-12-24 11:53:27.484210'),(30,'闭包','2017-12-24 11:53:38.145261','2017-12-24 11:53:38.145298'),(31,'generator','2017-12-24 11:54:12.607613','2017-12-24 11:54:12.607685'),(32,'生成器','2017-12-24 11:54:21.364804','2017-12-24 11:54:21.364852'),(33,'装饰器','2017-12-24 11:54:27.343542','2017-12-24 11:54:27.343619'),(34,'数据分析','2017-12-24 13:09:19.079350','2017-12-24 13:09:19.079389'),(35,'Gunicorn','2017-12-28 03:23:25.413312','2017-12-28 03:23:25.413341'),(36,'消息队列','2017-12-30 09:54:56.924149','2017-12-30 09:54:56.924201'),(37,'消息中间件','2017-12-30 09:55:02.314429','2017-12-30 09:55:02.314473'),(38,'RabbitMQ','2017-12-30 09:55:10.816549','2017-12-30 09:55:10.816609'),(39,'Git','2017-12-30 09:55:45.065657','2017-12-30 09:55:45.065714'),(40,'scrapy','2017-12-30 09:56:01.849985','2017-12-30 09:56:01.850145'),(41,'Docker','2017-12-30 14:47:37.809430','2017-12-30 14:47:37.809473'),(42,'SQLAlchemy','2018-01-02 01:13:18.379517','2018-01-02 01:13:18.379565'),(43,'Celery','2018-01-06 12:41:07.039957','2018-01-06 12:41:07.040016'),(44,'Golang','2018-01-06 13:31:49.512791','2018-01-06 13:31:49.512842'),(45,'Go','2018-01-06 13:31:54.262393','2018-01-06 13:31:54.262463'),(46,'诗歌','2018-01-06 16:41:22.288353','2018-01-06 16:41:22.288415'),(47,'Supervisord','2018-01-07 08:39:31.149628','2018-01-07 08:39:31.149736'),(48,'Supervisor','2018-01-07 08:40:32.211757','2018-01-07 08:40:32.211830'),(49,'深度学习','2018-01-08 01:36:09.295234','2018-01-08 01:36:09.295266'),(50,'机器学习','2018-01-08 01:36:14.445530','2018-01-08 01:36:14.445560'),(51,'Html','2018-01-09 03:15:28.270656','2018-01-09 03:15:28.270683'),(52,'jQuery','2018-01-09 03:19:00.371635','2018-01-09 03:19:00.371661');
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
INSERT INTO `core_prefs` VALUES (1,'system_lang','1','系统语言设置, 1：中文，2：英文'),(2,'mail_server','mail2.comingchina.com','邮件服务器设置'),(3,'mail_port','25','邮件服务器端口设置'),(4,'mail_ssl','0','邮件服务SSL设置，0：不是SSL发送，1：SSL发送'),(5,'mail_sender','sent@comingchina.com','邮件服务器发件人设置'),(6,'mail_passwd','5rdxCFG.,m87SS','邮件服务器发件人密码设置'),(7,'mail_recipient','2948906420@qq.com','系统收件邮箱设置');
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
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$36000$njYNaPVORqTj$E3bA9JxRza5dLv9q4MZ7X91e4yLp+0CVNNuBWtQEeeQ=','2018-01-07 01:44:29.864608',1,'admin','','','test@qq.com',1,1,'2017-12-20 14:08:03.543639',0,NULL,NULL,NULL,'Male',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-20 14:07:36.510669'),(2,'contenttypes','0002_remove_content_type_name','2017-12-20 14:07:36.551021'),(3,'auth','0001_initial','2017-12-20 14:07:36.729776'),(4,'auth','0002_alter_permission_name_max_length','2017-12-20 14:07:36.770924'),(5,'auth','0003_alter_user_email_max_length','2017-12-20 14:07:36.781260'),(6,'auth','0004_alter_user_username_opts','2017-12-20 14:07:36.791225'),(7,'auth','0005_alter_user_last_login_null','2017-12-20 14:07:36.801386'),(8,'auth','0006_require_contenttypes_0002','2017-12-20 14:07:36.804563'),(9,'auth','0007_alter_validators_add_error_messages','2017-12-20 14:07:36.815547'),(10,'auth','0008_alter_user_username_max_length','2017-12-20 14:07:36.824540'),(11,'core','0001_initial','2017-12-20 14:07:37.070675'),(12,'admin','0001_initial','2017-12-20 14:07:37.165245'),(13,'admin','0002_logentry_remove_auto_add','2017-12-20 14:07:37.182665'),(14,'blog','0001_initial','2017-12-20 14:07:37.482897'),(15,'sessions','0001_initial','2017-12-20 14:07:37.512698'),(16,'setting','0001_initial','2017-12-20 14:07:37.611318'),(17,'blog','0002_auto_20171221_1249','2017-12-21 12:22:49.926974'),(20,'blog','0003_ckeditorpicturefile','2017-12-24 10:20:34.400807'),(21,'blog','0004_auto_20180107_0044','2018-01-06 16:45:11.844622'),(22,'blog','0005_auto_20180107_0958','2018-01-07 01:58:47.089148');
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
INSERT INTO `django_session` VALUES ('0ell6bpdqe7mz21lq8d34op4mljrs99g','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-13 09:45:43.405625'),('0mj7rqzemlqlljja7udic5sh951hljox','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:41:13.743020'),('0taungllhnytihfnwxeos189uapmpyve','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:14:14.025637'),('1zz7jwap55gan3w2uhiog28p974l7a74','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-07 12:56:35.532620'),('32dh9rw6cej3v64wxjvgtfn3n2oe8ej7','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-16 10:15:29.858846'),('4gyqa3srmtdeerru680x0aic105xzpk6','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:37:50.927728'),('4h6na8nh7bjj31ekqc39h0gi10kil78o','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:37:32.332647'),('4us3eb5b7osgdya1ausk66o6roruajbi','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:47:09.086467'),('567xrumq451y6w03j75hke5a58if4ibd','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:46:29.892686'),('5ety6rrgaeft2gp2hpr5xe1izuzd89xh','NzA2OTZkMTkxYjhhYTk0MmUzOTU4MTg1MTk5YzBjMDNhODk2MmQ2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-01-03 14:49:02.933381'),('5vrn86rnbj149c2kfs9qwfl5g8wdtxde','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-13 09:02:48.834350'),('78q7ziqmwstexqxi0qxd8jzayq9lz5i6','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:59:30.926422'),('7jvo5o51924c0xx0e18x5pqbgkybelal','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:36:01.709408'),('8nhx4vue36h18f2vroz4f8cdbmek1ztt','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-12 04:12:21.361921'),('9a5lv3o6c1enofy2555z4x8bi620e9gl','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:31:58.040128'),('9oygylijvg29cmdtrocqxs4vnfajqgml','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-11 06:45:13.413727'),('9t09tsykfmks8junswi3ld1knvjxzwif','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:48:40.216001'),('cvtzx6gwjxpgjurdr45k0meaemset9tx','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:38:07.437433'),('ecktkbxtdcqdn4c9vyun8o32xi11ltpz','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:41:08.110475'),('fmysd0oc0luq75qpstyejb6dfb9t6kxg','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-13 09:08:40.264278'),('ftujicvvvzntk119ra32houqdyqhsq8e','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:52:30.122315'),('g520z9qtbi42z2umks9w78gmj2tmc18m','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:54:14.058035'),('gz7mcrzp5z16xgwozvhe559413eab9lq','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:56:41.073650'),('h2velrgy4k90fo3ouby0jz131jjlnwop','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-11 03:00:53.175599'),('hg6vh0q2yg8m9s81z0thg2anhyns8qof','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:36:13.878010'),('izlvq6ya3nrket7ixej50i78ekrdmw9k','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:47:19.454453'),('jdhz0qgokb0bm07lf9d6of3n28ylw2lx','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-11 06:31:07.057175'),('k0j4vkkqmipy8s1ipdhljxp7v7dsm9p3','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:10:02.948781'),('kbk6mfxicgysb8bdas65bwr0r2z38cr4','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:22:52.053470'),('kuuo7287qr0qw8bkne6fhfg6eax6pr5z','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-13 08:27:37.540998'),('l1whimxo4nb4ts0fmnaj1h3vz1br19ue','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:27:05.196983'),('l28kb9birai6ahoe218szp0e37qpikit','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-04 13:28:31.871344'),('lyiz0sp5z1hwh07a9gjhlqjp4x909k0t','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:45:07.485026'),('mop2o6egeq2d9tskhldpdw4ter2n1mx0','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:43:24.093143'),('moss6yh85vnnyaatmikq63ur5etxs9c3','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:09:24.193775'),('muvlrbugam09defrwnte20sooedwuvkj','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:57:28.621761'),('n6s485xer8jksgfejslwe3b8uq7faoli','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:10:04.502372'),('odcdup2oec04h0wwbpr1z426pul4qkrp','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:35:52.511934'),('omvr3qxt55sor2165ywuoxhm5e689jpf','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:27:57.226652'),('pnjzo6dhpjcj8u10fxs0ijq49brdzpfz','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-21 01:44:30.008436'),('qeper24w2n4n6v8coswcq5u0kjkcdrtk','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 15:40:57.365355'),('qrrschc47r0n1ta7g1wo1tm200k48qll','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:52:08.886131'),('ra59rkjp97u27hlcu48qv5qql01uuln3','NzA2OTZkMTkxYjhhYTk0MmUzOTU4MTg1MTk5YzBjMDNhODk2MmQ2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-01-06 13:44:44.545908'),('rpq50w1c0aoj638a0fu4xwryb8a7t6go','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 16:36:53.298646'),('rrtlqbymflb7q5fuqwnaquu62rfcxvv6','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:58:18.338029'),('rtubydj77mksoqynfr37kc5hxk7vhuwl','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:32:10.739007'),('rvfzp8d25xjrjpj98hvqfpkbf48vflmv','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:38:50.770021'),('t0pzzi9m4jymtzuba1dlvjom3ptc7qel','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:44:02.833274'),('t1y0v66uzlb91jhn5llwms86jk0vhi38','NzA2OTZkMTkxYjhhYTk0MmUzOTU4MTg1MTk5YzBjMDNhODk2MmQ2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-01-06 01:31:25.924617'),('ton9lcepq34qmakfhv5a3xypkaq38p10','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 14:36:47.826494'),('w5dloudjjn29c366xb1y3jqivg3lb10i','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-13 09:40:39.397733'),('x8ovwdsuc16twmfwmz5bc2es28k80nzv','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 04:24:11.981303'),('yj9vk9b3y20doaqxvjnsawn1n6k1ytb5','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:37:58.247046'),('yqpi5sfdu5li4qou5385w1c5guujfd3y','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 01:42:38.747013'),('zas82cnggw3jfxe6lg7mbh3r0uprmqmz','M2UyYTdlMTNlMmY3N2ViNzU4ZjNhM2ZmMzYxOTQxYzI3YTkwYzVmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2N2I5NzdmZjRjZDFkOTk1NTExZDMwMDZhZjAzNzljMDZiMTZiMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 02:38:37.081187');
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

-- Dump completed on 2018-01-09 20:34:35
