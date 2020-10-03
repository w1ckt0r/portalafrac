-- Generation time: Tue, 08 Sep 2020 14:59:01 -0300
-- Host: localhost
-- DB name: ustestes
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `arquivos`;
CREATE TABLE `arquivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) DEFAULT NULL,
  `nome` varchar(2555) DEFAULT NULL,
  `evento` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `criado_em` datetime DEFAULT NULL,
  `ultimo_download` datetime DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expira_em` datetime DEFAULT NULL,
  `downloads` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;

INSERT INTO `arquivos` VALUES ('80','Malling','Apresentação Empresarial.pdf','','3','2020-09-07 19:47:43','2020-09-08 12:37:40','2020-09-07 19:47:43','5315d2d62f3df31713fd3229be75be84573ba0a6','2020-09-08 20:09:16','4'),
('81','Malling','logo-top.png','sdffwe','3','2020-09-08 14:57:25',NULL,'2020-09-08 14:57:25','0eeddf0044b6b63a86c16d34c77677c1575395ae',NULL,'0'); 


DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) NOT NULL,
  `viewed` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO `audit` VALUES ('1','0','4','2020-09-03 14:48:27','::1','0'),
('2','0','4','2020-09-03 14:59:27','::1','0'),
('3','0','24','2020-09-03 15:00:33','::1','0'),
('4','0','94','2020-09-03 15:27:22','::1','0'),
('5','3','4','2020-09-04 14:24:23','::1','0'),
('6','0','90','2020-09-04 14:25:12','::1','0'),
('7','0','95','2020-09-04 14:46:59','::1','0'),
('8','0','95','2020-09-04 14:48:22','::1','0'),
('9','0','95','2020-09-04 14:49:22','::1','0'),
('10','0','95','2020-09-04 14:49:24','::1','0'),
('11','0','95','2020-09-04 14:51:12','::1','0'),
('12','0','95','2020-09-04 14:51:40','::1','0'),
('13','0','90','2020-09-04 14:55:15','::1','0'),
('14','0','95','2020-09-04 14:56:14','::1','0'),
('15','0','90','2020-09-04 14:56:51','::1','0'),
('16','0','95','2020-09-04 14:57:04','::1','0'),
('17','0','90','2020-09-04 14:57:50','::1','0'),
('18','0','95','2020-09-04 14:58:08','::1','0'),
('19','0','95','2020-09-04 14:58:35','::1','0'),
('20','0','95','2020-09-04 14:59:16','::1','0'),
('21','0','90','2020-09-04 14:59:19','::1','0'),
('22','0','95','2020-09-04 14:59:30','::1','0'),
('23','0','95','2020-09-04 15:02:23','::1','0'),
('24','0','90','2020-09-04 15:18:43','::1','0'),
('25','0','90','2020-09-04 15:21:36','::1','0'),
('26','0','90','2020-09-06 14:32:39','::1','0'),
('27','3','4','2020-09-06 23:59:59','::1','0'); 


DROP TABLE IF EXISTS `crons`;
CREATE TABLE `crons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` int(1) NOT NULL DEFAULT 1,
  `sort` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `crons` VALUES ('1','0','100','Auto-Backup','backup.php','1','2017-09-16 07:49:22','2017-11-11 17:15:36'); 


DROP TABLE IF EXISTS `crons_logs`;
CREATE TABLE `crons_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cron_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_name` varchar(100) NOT NULL,
  `smtp_server` varchar(100) NOT NULL,
  `smtp_port` int(10) NOT NULL,
  `email_login` varchar(150) NOT NULL,
  `email_pass` varchar(100) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `verify_url` varchar(255) NOT NULL,
  `email_act` int(1) NOT NULL,
  `debug_level` int(1) NOT NULL DEFAULT 0,
  `isSMTP` int(1) NOT NULL DEFAULT 0,
  `isHTML` varchar(5) NOT NULL DEFAULT 'true',
  `useSMTPauth` varchar(6) NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `email` VALUES ('1','TLV','outlook.office365.com','587','noreply@tlv.ag','8AHkM8JhRGQ6','noreply@tlv.ag','noreply@tlv.ag','tls','http://localhost/43','0','0','1','true','true'); 


DROP TABLE IF EXISTS `groups_menus`;
CREATE TABLE `groups_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL,
  `menu_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

INSERT INTO `groups_menus` VALUES ('30','2','9'),
('29','0','8'),
('28','0','7'),
('27','0','21'),
('5','0','3'),
('6','0','1'),
('7','0','2'),
('8','0','51'),
('9','0','52'),
('10','0','37'),
('11','0','38'),
('12','2','39'),
('13','2','40'),
('14','2','41'),
('15','2','42'),
('16','2','43'),
('17','2','44'),
('18','2','45'),
('19','0','46'),
('20','0','47'),
('21','0','49'),
('26','0','20'),
('25','0','18'),
('31','2','10'),
('32','2','11'),
('33','2','12'),
('34','2','13'),
('35','2','14'),
('36','2','15'),
('37','0','16'),
('38','1','15'); 


DROP TABLE IF EXISTS `keys`;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stripe_ts` varchar(255) NOT NULL,
  `stripe_tp` varchar(255) NOT NULL,
  `stripe_ls` varchar(255) NOT NULL,
  `stripe_lp` varchar(255) NOT NULL,
  `recap_pub` varchar(100) NOT NULL,
  `recap_pri` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `logdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logtype` varchar(25) NOT NULL,
  `lognote` text NOT NULL,
  `ip` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

INSERT INTO `logs` VALUES ('1','1','2020-09-01 13:43:20','System Updates','Update 2020-07-16a successfully deployed.','::1'),
('2','1','2020-09-01 13:43:20','System Updates','Update 2020-07-30a successfully deployed.','::1'),
('3','1','2020-09-01 13:43:36','User','User logged in.','::1'),
('4','1','2020-09-01 13:44:35','USPlugins','fileman installed','::1'),
('5','1','2020-09-01 13:44:45','USPlugins','fileman activated','::1'),
('6','1','2020-09-03 14:36:26','User','User logged in.','::1'),
('7','1','2020-09-03 15:15:23','User','User logged in.','::1'),
('8','1','2020-09-03 15:16:23','Pages Manager','Retitled \'files.php\' to \'Meus aqruivos\'.','::1'),
('9','1','2020-09-03 15:16:45','Pages Manager','Added 2 permission(s) to upload.php.','::1'),
('10','1','2020-09-03 15:16:45','Pages Manager','Retitled \'upload.php\' to \'Upload de arquivos\'.','::1'),
('11','1','2020-09-03 15:16:53','Pages Manager','Added 2 permission(s) to files.php.','::1'),
('12','1','2020-09-03 15:17:19','Permissions Manager','Added Permission Level named Consultor TLV.','::1'),
('13','1','2020-09-03 15:17:41','Permissions Manager','Changed Permission Name from User to Cliente.','::1'),
('14','1','2020-09-03 15:20:23','User','User logged in.','::1'),
('15','1','2020-09-03 15:22:06','User','User logged in.','::1'),
('16','1','2020-09-03 15:23:41','User','User logged in.','::1'),
('17','1','2020-09-03 15:23:55','User','User logged in.','::1'),
('18','1','2020-09-03 15:24:18','User','User logged in.','::1'),
('19','1','2020-09-03 15:25:07','User Manager','Added user cliente.','::1'),
('20','3','2020-09-03 15:25:32','User','User logged in.','::1'),
('21','3','2020-09-03 15:27:25','User','User logged in.','::1'),
('22','3','2020-09-03 15:28:33','User','User logged in.','::1'),
('23','3','2020-09-03 15:28:48','User','User logged in.','::1'),
('24','3','2020-09-03 15:28:51','Errors','Attempted to access disabled profile_pic','::1'),
('25','3','2020-09-03 15:53:27','User','User logged in.','::1'),
('26','3','2020-09-03 15:53:36','Errors','Attempted to access disabled profile_pic','::1'),
('27','3','2020-09-03 16:02:47','Errors','Attempted to access disabled profile_pic','::1'),
('28','3','2020-09-03 16:31:19','User','User logged in.','::1'),
('29','3','2020-09-03 21:16:23','Errors','Attempted to access disabled profile_pic','::1'),
('30','3','2020-09-03 21:42:10','User','User logged in.','::1'),
('31','0','2020-09-04 14:43:40','Login Fail','A failed login on login.php','::1'),
('32','0','2020-09-04 14:43:46','Login Fail','A failed login on login.php','::1'),
('33','0','2020-09-04 14:43:55','Login Fail','A failed login on login.php','::1'),
('34','1','2020-09-04 14:44:07','User','User logged in.','::1'),
('35','1','2020-09-04 14:44:51','Pages Manager','Added 3 permission(s) to up-proccess.php.','::1'),
('36','1','2020-09-04 14:44:51','Pages Manager','Retitled \'up-proccess.php\' to \'upload\'.','::1'),
('37','1','2020-09-04 14:45:18','Pages Manager','Added 3 permission(s) to files-proccess.php.','::1'),
('38','1','2020-09-04 14:45:18','Pages Manager','Retitled \'files-proccess.php\' to \'Processamento de arquivos\'.','::1'),
('39','3','2020-09-04 14:45:55','User','User logged in.','::1'),
('40','3','2020-09-04 14:47:42','User','User logged in.','::1'),
('41','3','2020-09-04 14:55:17','User','User logged in.','::1'),
('42','3','2020-09-04 14:56:53','User','User logged in.','::1'),
('43','3','2020-09-04 14:57:52','User','User logged in.','::1'),
('44','3','2020-09-04 14:59:21','User','User logged in.','::1'),
('45','3','2020-09-04 15:14:34','User','User logged in.','::1'),
('46','3','2020-09-04 15:18:45','User','User logged in.','::1'),
('47','3','2020-09-04 15:21:38','User','User logged in.','::1'),
('48','3','2020-09-04 15:21:53','User','User logged in.','::1'),
('49','3','2020-09-06 14:33:37','User','User logged in.','::1'),
('50','3','2020-09-06 18:24:41','User','User logged in.','::1'),
('51','1','2020-09-07 00:03:37','User','User logged in.','::1'),
('52','3','2020-09-07 00:18:04','User','User logged in.','::1'),
('53','3','2020-09-07 00:32:40','SendMail','Email enviado por 3 ','::1'),
('54','3','2020-09-07 00:35:17','SendMail','Email enviado por 3 ','::1'),
('55','3','2020-09-07 00:37:37','SendMail','Email enviado por 3 ','::1'),
('56','1','2020-09-07 00:38:02','User','User logged in.','::1'),
('57','1','2020-09-07 00:39:17','Email Settings','Updated from_email from yourEmail@gmail.com to noreply@tlv.ag.','::1'),
('58','1','2020-09-07 00:39:17','Email Settings','Updated email_act from 0 to 4.','::1'),
('59','1','2020-09-07 00:40:10','Email Settings','Updated email_act from 4 to 0.','::1'),
('60','3','2020-09-07 00:40:37','User','User logged in.','::1'),
('61','3','2020-09-07 00:40:52','SendMail','Email enviado por 3 ','::1'),
('62','3','2020-09-07 00:42:35','SendMail','Email enviado por 3 ','::1'),
('63','3','2020-09-07 10:29:03','SendFiles','Arquivo Email enviado por 3 ','::1'),
('64','3','2020-09-07 10:30:00','SendFiles','Arquivo Email enviado por 3 ','::1'),
('65','3','2020-09-07 10:50:08','SendFiles','Arquivo Email enviado por 3 ','::1'),
('66','3','2020-09-07 10:51:13','SendFiles','Arquivo Email enviado por 3 ','::1'),
('67','3','2020-09-07 11:53:19','SendFiles','Arquivo Email enviado por 3 ','::1'),
('68','3','2020-09-07 11:54:24','SendFiles','Arquivo Email enviado por 3 ','::1'),
('69','3','2020-09-07 11:55:17','SendFiles','Arquivo Email enviado por 3 ','::1'),
('70','3','2020-09-07 12:05:52','SendFiles','Arquivo Email enviado por 3 ','::1'),
('71','3','2020-09-07 12:06:25','SendFiles','Arquivo Email enviado por 3 ','::1'),
('72','3','2020-09-07 12:06:33','SendFiles','Arquivo Email enviado por 3 ','::1'),
('73','3','2020-09-07 12:17:54','SendFiles','Arquivo Email enviado por 3 ','::1'),
('74','3','2020-09-07 12:22:34','SendFiles','Arquivo Email enviado por 3 ','::1'),
('75','3','2020-09-07 12:26:23','SendFiles','Arquivo Email enviado por 3 ','::1'),
('76','3','2020-09-07 12:30:07','SendFiles','Arquivo Email enviado por 3 ','::1'),
('77','3','2020-09-07 14:16:23','SendFiles','Arquivo enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('78','3','2020-09-07 14:20:24','SendFiles','Arquivo enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('79','3','2020-09-07 14:21:57','SendFiles','Arquivo enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('80','3','2020-09-07 14:32:13','SendFiles','Arquivo enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('81','3','2020-09-07 14:35:06','SendFiles','Arquivo enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('82','3','2020-09-07 16:50:39','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('83','3','2020-09-07 16:52:56','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('84','3','2020-09-07 17:00:48','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('85','3','2020-09-07 17:01:36','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('86','3','2020-09-07 17:02:14','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('87','3','2020-09-07 17:02:52','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('88','3','2020-09-07 17:03:57','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('89','3','2020-09-07 17:05:02','Sendfile','[Planejamento Convidados Oficial.docx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('90','3','2020-09-07 17:22:26','Exclusão','[Planejamento Convidados Oficial.docx]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('91','3','2020-09-07 17:24:03','Exclusão','[logo-top.png]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('92','3','2020-09-07 17:25:13','Sendfile','[INFLUENCIER ENGAJAMENTO.xlsx]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('93','3','2020-09-07 17:25:24','Exclusão','[CV João Eduardo-Portfólio.pdf]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('94','3','2020-09-07 17:25:57','Exclusão','[MobiriseSetup.exe]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('95','3','2020-09-07 17:26:11','Exclusão','[Modelo Contrato Prest Serv BJM x MEI 13.08.2020 (2).docx]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('96','3','2020-09-07 17:26:27','Exclusão','[Quadro Orcamentario 2020.xlsx]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('97','3','2020-09-07 17:26:41','Exclusão','[INFLUENCIER ENGAJAMENTO.xlsx]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('98','3','2020-09-07 18:11:18','Exclusão','[logo-top.png]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('99','3','2020-09-07 18:11:20','Exclusão','[]O arquivo não existe fisicamente por algum motivo, portando foi deletado do banco de dados pelo usuário Cliente 001','::1'),
('100','3','2020-09-07 18:11:33','Exclusão','[logo-top.png]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('101','3','2020-09-07 18:11:40','Exclusão','[]O arquivo não existe fisicamente por algum motivo, portando foi deletado do banco de dados pelo usuário Cliente 001','::1'),
('102','3','2020-09-07 18:12:19','Exclusão','[logo-top.png]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('103','3','2020-09-07 18:12:55','Sendfile','[Apresentação Empresarial.pdf]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('104','3','2020-09-07 18:13:08','Exclusão','[Apresentação Empresarial.pdf]Arquivo deletado de nossa base de dados pelo usuarioCliente 001','::1'),
('105','3','2020-09-07 18:25:54','User','User logged in.','::1'),
('106','3','2020-09-07 20:09:17','Sendfile','[Apresentação Empresarial.pdf]Gerado link e enviado por Cliente 001 para o email ivinsons@gmail.com','::1'),
('107','0','2020-09-07 21:11:43','DownloadExterno','O usuário externo ivinsons@gmail.com fez o download do arquivo Apresentação Empresarial.pdf','::1'),
('108','0','2020-09-07 21:20:57','DownloadExterno','O usuário externo ivinsons@gmail.com fez o download do arquivo Apresentação Empresarial.pdf','::1'),
('109','0','2020-09-07 21:21:20','DownloadExterno','O usuário externo ivinsons@gmail.com fez o download do arquivo Apresentação Empresarial.pdf','::1'),
('110','0','2020-09-07 21:21:40','Login Fail','A failed login on login.php','::1'),
('111','1','2020-09-07 21:21:45','User','User logged in.','::1'),
('112','1','2020-09-08 12:37:09','User','User logged in.','::1'),
('113','3','2020-09-08 12:37:34','User','User logged in.','::1'),
('114','3','2020-09-08 12:37:53','User','User logged in.','::1'),
('115','1','2020-09-08 14:58:24','User','User logged in.','::1'); 


DROP TABLE IF EXISTS `logs_exempt`;
CREATE TABLE `logs_exempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `logs_exempt_type` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(255) NOT NULL,
  `parent` int(10) NOT NULL,
  `dropdown` int(1) NOT NULL,
  `logged_in` int(1) NOT NULL,
  `display_order` int(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon_class` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

INSERT INTO `menus` VALUES ('1','main','2','0','1','1','{{home}}','','fa fa-fw fa-home'),
('2','main','-1','1','1','14','','','fa fa-fw fa-cogs'),
('3','main','-1','0','1','11','{{username}}','users/account.php','fa fa-fw fa-user'),
('4','main','-1','1','0','3','{{help}}','','fa fa-fw fa-life-ring'),
('5','main','-1','0','0','2','{{register}}','users/join.php','fa fa-fw fa-plus-square'),
('6','main','-1','0','0','1','{{login}}','users/login.php','fa fa-fw fa-sign-in'),
('7','main','2','0','1','2','{{account}}','users/account.php','fa fa-fw fa-user'),
('8','main','2','0','1','3','{{hr}}','',''),
('9','main','2','0','1','4','{{dashboard}}','users/admin.php','fa fa-fw fa-cogs'),
('10','main','2','0','1','5','{{users}}','users/admin.php?view=users','fa fa-fw fa-user'),
('11','main','2','0','1','6','{{perms}}','users/admin.php?view=permissions','fa fa-fw fa-lock'),
('12','main','2','0','1','7','{{pages}}','users/admin.php?view=pages','fa fa-fw fa-wrench'),
('13','main','2','0','1','9','{{logs}}','users/admin.php?view=logs','fa fa-fw fa-search'),
('14','main','2','0','1','10','{{hr}}','',''),
('15','main','2','0','1','11','{{logout}}','users/logout.php','fa fa-fw fa-sign-out'),
('16','main','-1','0','0','0','{{home}}','','fa fa-fw fa-home'),
('17','main','-1','0','1','10','{{home}}','','fa fa-fw fa-home'),
('18','main','4','0','0','1','{{forgot}}','users/forgot_password.php','fa fa-fw fa-wrench'),
('20','main','4','0','0','99999','{{resend}}','users/verify_resend.php','fa fa-exclamation-triangle'); 


DROP TABLE IF EXISTS `message_threads`;
CREATE TABLE `message_threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_to` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_subject` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `archive_from` int(1) NOT NULL DEFAULT 0,
  `archive_to` int(1) NOT NULL DEFAULT 0,
  `hidden_from` int(1) NOT NULL DEFAULT 0,
  `hidden_to` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `message_threads` VALUES ('1','2','1','Testiing123','2017-08-06 00:13:47','1','0','0','0','0'),
('2','2','1','Testing Message Badge','2017-09-09 15:10:09','1','0','0','0','0'); 


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_body` text NOT NULL,
  `msg_read` int(1) NOT NULL,
  `msg_thread` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  `sent_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `messages` VALUES ('1','1','2','&lt;p&gt;fgds&lt;/p&gt;','0','1','0','2017-08-06 00:13:47'),
('2','1','2','&lt;p&gt;Did it work?&lt;/p&gt;','0','2','0','2017-09-09 15:10:09'); 


DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `private` int(11) NOT NULL DEFAULT 0,
  `re_auth` int(1) NOT NULL DEFAULT 0,
  `core` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

INSERT INTO `pages` VALUES ('1','index.php','Home','0','0','1'),
('2','z_us_root.php','','0','0','1'),
('3','users/account.php','Account Dashboard','1','0','1'),
('4','users/admin.php','Admin Dashboard','1','0','1'),
('14','users/forgot_password.php','Forgotten Password','0','0','1'),
('15','users/forgot_password_reset.php','Reset Forgotten Password','0','0','1'),
('16','users/index.php','Home','0','0','1'),
('17','users/init.php','','0','0','1'),
('18','users/join.php','Join','0','0','1'),
('19','users/joinThankYou.php','Join','0','0','0'),
('20','users/login.php','Login','0','0','1'),
('21','users/logout.php','Logout','0','0','1'),
('24','users/user_settings.php','User Settings','1','0','1'),
('25','users/verify.php','Account Verification','0','0','1'),
('26','users/verify_resend.php','Account Verification','0','0','1'),
('45','users/maintenance.php','Maintenance','0','0','1'),
('68','users/update.php','Update Manager','1','0','1'),
('81','users/admin_pin.php','Verification PIN Set','1','0','1'),
('90','files.php','Meus aqruivos','1','0','0'),
('91','footer.php','','1','0','0'),
('92','header.php','','1','0','0'),
('93','up-proccess.php','upload','1','0','0'),
('94','upload.php','Upload de arquivos','1','0','0'),
('95','files-proccess.php','Processamento de arquivos','1','0','0'); 


DROP TABLE IF EXISTS `permission_page_matches`;
CREATE TABLE `permission_page_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

INSERT INTO `permission_page_matches` VALUES ('2','2','27'),
('3','1','24'),
('4','1','22'),
('5','2','13'),
('6','2','12'),
('7','1','11'),
('8','2','10'),
('9','2','9'),
('10','2','8'),
('11','2','7'),
('12','2','6'),
('13','2','5'),
('14','2','4'),
('15','1','3'),
('16','2','37'),
('17','2','39'),
('19','2','40'),
('21','2','41'),
('23','2','42'),
('27','1','42'),
('28','1','27'),
('29','1','41'),
('30','1','40'),
('31','2','44'),
('32','2','47'),
('33','2','51'),
('34','2','50'),
('35','2','49'),
('36','2','53'),
('37','2','52'),
('38','2','68'),
('39','2','55'),
('40','2','56'),
('41','2','71'),
('42','2','58'),
('43','2','57'),
('44','2','53'),
('45','2','74'),
('46','2','75'),
('47','1','75'),
('48','1','76'),
('49','2','76'),
('50','1','77'),
('51','2','77'),
('52','2','78'),
('53','2','80'),
('54','1','81'),
('55','1','82'),
('56','1','83'),
('57','2','84'),
('58','1','94'),
('59','2','94'),
('60','1','90'),
('61','2','90'),
('62','1','93'),
('63','2','93'),
('64','3','93'),
('65','1','95'),
('66','2','95'),
('67','3','95'); 


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `permissions` VALUES ('1','Cliente'),
('2','Administrator'),
('3','Consultor TLV'); 


DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bio` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `profiles` VALUES ('1','1','&lt;h1&gt;This is the Admin&#039;s bio.&lt;/h1&gt;'),
('2','2','This is your bio'); 


DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `recaptcha` int(1) NOT NULL DEFAULT 0,
  `force_ssl` int(1) NOT NULL,
  `css_sample` int(1) NOT NULL,
  `us_css1` varchar(255) NOT NULL,
  `us_css2` varchar(255) NOT NULL,
  `us_css3` varchar(255) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `language` varchar(255) NOT NULL,
  `track_guest` int(1) NOT NULL,
  `site_offline` int(1) NOT NULL,
  `force_pr` int(1) NOT NULL,
  `glogin` int(1) NOT NULL DEFAULT 0,
  `fblogin` int(1) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `gsecret` varchar(255) NOT NULL,
  `gredirect` varchar(255) NOT NULL,
  `ghome` varchar(255) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `fbsecret` varchar(255) NOT NULL,
  `fbcallback` varchar(255) NOT NULL,
  `graph_ver` varchar(255) NOT NULL,
  `finalredir` varchar(255) NOT NULL,
  `req_cap` int(1) NOT NULL,
  `req_num` int(1) NOT NULL,
  `min_pw` int(2) NOT NULL,
  `max_pw` int(3) NOT NULL,
  `min_un` int(2) NOT NULL,
  `max_un` int(3) NOT NULL,
  `messaging` int(1) NOT NULL,
  `snooping` int(1) NOT NULL,
  `echouser` int(11) NOT NULL,
  `wys` int(1) NOT NULL,
  `change_un` int(1) NOT NULL,
  `backup_dest` varchar(255) NOT NULL,
  `backup_source` varchar(255) NOT NULL,
  `backup_table` varchar(255) NOT NULL,
  `msg_notification` int(1) NOT NULL,
  `permission_restriction` int(1) NOT NULL,
  `auto_assign_un` int(1) NOT NULL,
  `page_permission_restriction` int(1) NOT NULL,
  `msg_blocked_users` int(1) NOT NULL,
  `msg_default_to` int(1) NOT NULL,
  `notifications` int(1) NOT NULL,
  `notif_daylimit` int(3) NOT NULL,
  `recap_public` varchar(100) NOT NULL,
  `recap_private` varchar(100) NOT NULL,
  `page_default_private` int(1) NOT NULL,
  `navigation_type` tinyint(1) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `custom_settings` int(1) NOT NULL,
  `system_announcement` varchar(255) NOT NULL,
  `twofa` int(1) DEFAULT 0,
  `force_notif` tinyint(1) DEFAULT NULL,
  `cron_ip` varchar(255) DEFAULT NULL,
  `registration` tinyint(1) DEFAULT NULL,
  `join_vericode_expiry` int(9) unsigned NOT NULL,
  `reset_vericode_expiry` int(9) unsigned NOT NULL,
  `admin_verify` tinyint(1) NOT NULL,
  `admin_verify_timeout` int(9) NOT NULL,
  `session_manager` tinyint(1) NOT NULL,
  `template` varchar(255) DEFAULT 'standard',
  `saas` tinyint(1) DEFAULT NULL,
  `redirect_uri_after_login` text DEFAULT NULL,
  `show_tos` tinyint(1) DEFAULT 1,
  `default_language` varchar(11) DEFAULT NULL,
  `allow_language` tinyint(1) DEFAULT NULL,
  `spice_api` varchar(75) DEFAULT NULL,
  `announce` datetime DEFAULT NULL,
  `bleeding_edge` tinyint(1) DEFAULT 0,
  `err_time` int(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `settings` VALUES ('1','0','0','0','../users/css/color_schemes/bootstrap.min.css','../users/css/sb-admin.css','../users/css/custom.css','UserSpice','en','1','0','0','0','0','','','','','','','','','','0','0','6','30','4','30','0','1','0','1','0','/','db_only','','0','0','0','0','0','1','0','7','6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI','6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe','1','1','UserSpice','1','','0','0','off','1','24','15','1','120','0','standard',NULL,'files.php','1','en-US','0',NULL,'2020-09-08 12:37:09','0','15'); 


DROP TABLE IF EXISTS `updates`;
CREATE TABLE `updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migration` varchar(15) NOT NULL,
  `applied_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_skipped` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

INSERT INTO `updates` VALUES ('15','1XdrInkjV86F','2018-02-18 19:33:24',NULL),
('16','3GJYaKcqUtw7','2018-04-25 13:51:08',NULL),
('17','3GJYaKcqUtz8','2018-04-25 13:51:08',NULL),
('18','69qa8h6E1bzG','2018-04-25 13:51:08',NULL),
('19','2XQjsKYJAfn1','2018-04-25 13:51:08',NULL),
('20','549DLFeHMNw7','2018-04-25 13:51:08',NULL),
('21','4Dgt2XVjgz2x','2018-04-25 13:51:08',NULL),
('22','VLBp32gTWvEo','2018-04-25 13:51:08',NULL),
('23','Q3KlhjdtxE5X','2018-04-25 13:51:08',NULL),
('24','ug5D3pVrNvfS','2018-04-25 13:51:08',NULL),
('25','69FbVbv4Jtrz','2018-04-25 13:51:09',NULL),
('26','4A6BdJHyvP4a','2018-04-25 13:51:09',NULL),
('27','37wvsb5BzymK','2018-04-25 13:51:09',NULL),
('28','c7tZQf926zKq','2018-04-25 13:51:09',NULL),
('29','ockrg4eU33GP','2018-04-25 13:51:09',NULL),
('30','XX4zArPs4tor','2018-04-25 13:51:09',NULL),
('31','pv7r2EHbVvhD','2018-04-25 21:00:00',NULL),
('32','uNT7NpgcBDFD','2018-04-25 21:00:00',NULL),
('33','mS5VtQCZjyJs','2018-12-11 11:19:16',NULL),
('34','23rqAv5elJ3G','2018-12-11 11:19:51',NULL),
('35','qPEARSh49fob','2019-01-01 09:01:01',NULL),
('36','FyMYJ2oeGCTX','2019-01-01 09:01:01',NULL),
('37','iit5tHSLatiS','2019-01-01 09:01:01',NULL),
('38','hcA5B3PLhq6E','2020-07-16 08:27:53',NULL),
('39','VNEno3E4zaNz','2020-07-16 08:27:53',NULL),
('40','2ZB9mg1l0JXe','2020-07-16 08:27:53',NULL),
('41','B9t6He7qmFXa','2020-07-16 08:27:53',NULL),
('42','86FkFVV4TGRg','2020-07-16 08:27:53',NULL),
('43','y4A1Y0u9n2Rt','2020-07-16 08:27:53',NULL),
('44','Tm5xY22MM8eC','2020-07-16 08:27:53',NULL),
('45','0YXdrInkjV86F','2020-07-16 08:27:53',NULL),
('46','99plgnkjV86','2020-07-16 08:27:53',NULL),
('47','0DaShInkjV86','2020-07-16 08:27:53',NULL),
('48','0DaShInkjVz1','2020-07-16 08:27:53',NULL),
('49','y4A1Y0u9n2SS','2020-07-16 08:27:53',NULL),
('50','0DaShInkjV87','2020-07-16 08:27:53',NULL),
('51','0DaShInkjV88','2020-07-16 08:27:53',NULL),
('52','2019-09-04a','2020-07-16 08:27:53',NULL),
('53','2019-09-05a','2020-07-16 08:27:53',NULL),
('54','2019-09-26a','2020-07-16 08:27:53',NULL),
('55','2019-11-19a','2020-07-16 08:27:53',NULL),
('56','2019-12-28a','2020-07-16 08:27:53',NULL),
('57','2020-01-21a','2020-07-16 08:27:54',NULL),
('58','2020-03-26a','2020-07-16 08:27:54',NULL),
('59','2020-04-17a','2020-07-16 08:27:54',NULL),
('60','2020-06-06a','2020-07-16 08:27:54',NULL),
('61','2020-06-30a','2020-07-16 08:27:54',NULL),
('62','2020-07-01a','2020-07-16 08:27:54',NULL),
('63','2020-07-16a','2020-09-01 13:43:20',NULL),
('64','2020-07-30a','2020-09-01 13:43:20',NULL); 


DROP TABLE IF EXISTS `us_announcements`;
CREATE TABLE `us_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dismissed` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `ignore` varchar(50) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_fingerprint_assets`;
CREATE TABLE `us_fingerprint_assets` (
  `kFingerprintAssetID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fkFingerprintID` int(11) NOT NULL,
  `IP_Address` varchar(255) NOT NULL,
  `User_Browser` varchar(255) NOT NULL,
  `User_OS` varchar(255) NOT NULL,
  PRIMARY KEY (`kFingerprintAssetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_fingerprints`;
CREATE TABLE `us_fingerprints` (
  `kFingerprintID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fkUserID` int(11) NOT NULL,
  `Fingerprint` varchar(32) NOT NULL,
  `Fingerprint_Expiry` datetime NOT NULL,
  `Fingerprint_Added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`kFingerprintID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_form_validation`;
CREATE TABLE `us_form_validation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `us_form_validation` VALUES ('1','min','Minimum # of Characters','number'),
('2','max','Maximum # of Characters','number'),
('3','is_numeric','Must be a number','true'),
('4','valid_email','Must be a valid email address','true'),
('5','<','Must be a number less than','number'),
('6','>','Must be a number greater than','number'),
('7','<=','Must be a number less than or equal to','number'),
('8','>=','Must be a number greater than or equal to','number'),
('9','!=','Must not be equal to','text'),
('10','==','Must be equal to','text'),
('11','is_integer','Must be an integer','true'),
('12','is_timezone','Must be a valid timezone name','true'),
('13','is_datetime','Must be a valid DateTime','true'); 


DROP TABLE IF EXISTS `us_form_views`;
CREATE TABLE `us_form_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(255) NOT NULL,
  `view_name` varchar(255) NOT NULL,
  `fields` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_forms`;
CREATE TABLE `us_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_ip_blacklist`;
CREATE TABLE `us_ip_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `last_user` int(11) NOT NULL DEFAULT 0,
  `reason` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_ip_list`;
CREATE TABLE `us_ip_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `us_ip_list` VALUES ('1','::1','1','2020-09-08 14:58:24'); 


DROP TABLE IF EXISTS `us_ip_whitelist`;
CREATE TABLE `us_ip_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_management`;
CREATE TABLE `us_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `feature` varchar(255) NOT NULL,
  `access` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO `us_management` VALUES ('1','_admin_manage_ip.php','ip','IP Whitelist/Blacklist',''),
('2','_admin_messages.php','messages','Messages',''),
('3','_admin_nav.php','nav','Navigation',''),
('4','_admin_nav_item.php','nav_item','Navigation',''),
('5','_admin_notifications.php','notifications','Notifications',''),
('6','_admin_page.php','page','Page Management',''),
('7','_admin_pages.php','pages','Page Management',''),
('10','_admin_security_logs.php','security_logs','Security Logs',''),
('11','_admin_sessions.php','sessions','Session Management',''),
('12','_admin_templates.php','templates','Templates',''),
('13','_admin_tools_check_updates.php','updates','Check Updates',''); 


DROP TABLE IF EXISTS `us_plugin_hooks`;
CREATE TABLE `us_plugin_hooks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `hook` varchar(255) NOT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_plugins`;
CREATE TABLE `us_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `updates` text DEFAULT NULL,
  `last_check` datetime DEFAULT '2020-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `us_plugins` VALUES ('1','fileman','active',NULL,'2020-09-01 13:44:45'); 


DROP TABLE IF EXISTS `us_saas_levels`;
CREATE TABLE `us_saas_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(255) NOT NULL,
  `users` int(11) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_saas_orgs`;
CREATE TABLE `us_saas_orgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `us_user_sessions`;
CREATE TABLE `us_user_sessions` (
  `kUserSessionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fkUserID` int(11) unsigned NOT NULL,
  `UserFingerprint` varchar(255) NOT NULL,
  `UserSessionIP` varchar(255) NOT NULL,
  `UserSessionOS` varchar(255) NOT NULL,
  `UserSessionBrowser` varchar(255) NOT NULL,
  `UserSessionStarted` datetime NOT NULL,
  `UserSessionLastUsed` datetime DEFAULT NULL,
  `UserSessionLastPage` varchar(255) NOT NULL,
  `UserSessionEnded` tinyint(1) NOT NULL DEFAULT 0,
  `UserSessionEnded_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`kUserSessionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `user_permission_matches`;
CREATE TABLE `user_permission_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

INSERT INTO `user_permission_matches` VALUES ('100','1','1'),
('101','1','2'),
('102','2','1'),
('111','3','1'); 


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(155) NOT NULL,
  `email_new` varchar(155) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `permissions` int(11) NOT NULL,
  `logins` int(11) unsigned NOT NULL,
  `account_owner` tinyint(4) NOT NULL DEFAULT 0,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `company` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT 0,
  `vericode` varchar(15) NOT NULL,
  `active` int(1) NOT NULL,
  `oauth_provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gpluslink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fb_uid` varchar(255) NOT NULL,
  `un_changed` int(1) NOT NULL,
  `msg_exempt` int(1) NOT NULL DEFAULT 0,
  `last_confirm` datetime DEFAULT NULL,
  `protected` int(1) NOT NULL DEFAULT 0,
  `dev_user` int(1) NOT NULL DEFAULT 0,
  `msg_notification` int(1) NOT NULL DEFAULT 1,
  `force_pr` int(1) NOT NULL DEFAULT 0,
  `twoKey` varchar(16) DEFAULT NULL,
  `twoEnabled` int(1) DEFAULT 0,
  `twoDate` datetime DEFAULT NULL,
  `cloak_allowed` tinyint(1) NOT NULL DEFAULT 0,
  `org` int(11) DEFAULT NULL,
  `account_mgr` int(11) DEFAULT 0,
  `oauth_tos_accepted` tinyint(1) DEFAULT NULL,
  `vericode_expiry` datetime DEFAULT NULL,
  `language` varchar(255) DEFAULT 'en-US',
  PRIMARY KEY (`id`),
  KEY `EMAIL` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `users` VALUES ('1','userspicephp@userspice.com',NULL,'admin','$2y$12$1v06jm2KMOXuuo3qP7erTuTIJFOnzhpds1Moa8BadnUUeX0RV3ex.',NULL,'The','Admin','1','14','1','0','UserSpice','2016-01-01 00:00:00','2020-09-08 14:58:24','1','nlPsJDtyeqFWsS','0','','','','','','','0000-00-00 00:00:00','1899-11-30 00:00:00','','0','1','2017-10-08 15:24:37','1','0','1','0',NULL,'0',NULL,'0',NULL,'0',NULL,NULL,'en-US'),
('2','noreply@userspice.com',NULL,'user','$2y$12$HZa0/d7evKvuHO8I3U8Ff.pOjJqsGTZqlX8qURratzP./EvWetbkK',NULL,'Sample','User','1','0','1','0','none','2016-01-02 00:00:00','2017-10-08 15:47:41','1','2ENJN4xD8nnjOgk','1','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','0','0',NULL,'0','0','1','0',NULL,'0',NULL,'0',NULL,'0',NULL,NULL,'en-US'),
('3','cliente01@tlv.ag',NULL,'cliente','$2y$12$KbJ5At.qfohFFghJQ0pIku49E3SUy/ObZVsKU5.TUE7LYtlxek8DC',NULL,'Cliente 001','2020','1','24','1','0','','2020-09-03 15:25:06','2020-09-08 12:37:53','1','bDVicAPuu9rKeE','1','','','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','0','0',NULL,'0','0','1','0',NULL,'0',NULL,'0',NULL,'0','1','2020-09-03 15:40:23','en-US'); 


DROP TABLE IF EXISTS `users_online`;
CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `timestamp` varchar(15) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users_online` VALUES ('1','::1','1544553219','1',''); 


DROP TABLE IF EXISTS `users_session`;
CREATE TABLE `users_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uagent` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

