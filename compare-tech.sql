-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.12-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- compare-tech için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `compare-tech` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `compare-tech`;

-- tablo yapısı dökülüyor compare-tech.telefon
CREATE TABLE IF NOT EXISTS `telefon` (
  `telefon_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `telefon_ad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefon_marka` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `telefon_model` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `telefon_ekran_id` int(11) unsigned NOT NULL,
  `telefon_batarya_id` int(11) unsigned NOT NULL DEFAULT 0,
  `telefon_islemci_id` int(11) unsigned NOT NULL DEFAULT 0,
  `arka_kamera_id` int(11) unsigned NOT NULL DEFAULT 0,
  `on_kamera_id` int(11) unsigned NOT NULL DEFAULT 0,
  `telefon_ram` int(11) NOT NULL DEFAULT 0,
  `telefon_ram_frekansi` int(11) NOT NULL DEFAULT 0,
  `telefon_dahili_depolama` int(11) NOT NULL DEFAULT 0,
  `telefon_boy` double NOT NULL DEFAULT 0,
  `telefon_en` double NOT NULL DEFAULT 0,
  `telefon_agirlik` double NOT NULL DEFAULT 0,
  `isletim_sistemi_id` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`telefon_id`),
  KEY `Ekran_id` (`telefon_ekran_id`),
  KEY `Batarya_id` (`telefon_batarya_id`),
  KEY `Islemci_id` (`telefon_islemci_id`),
  KEY `Isletim-Sistemi_id` (`isletim_sistemi_id`),
  KEY `arka_kamera_id` (`arka_kamera_id`),
  KEY `on_kamera_id` (`on_kamera_id`),
  CONSTRAINT `Arka_KameraFK` FOREIGN KEY (`arka_kamera_id`) REFERENCES `telefon_arka_kamera` (`kamera_id`),
  CONSTRAINT `BataryaFK` FOREIGN KEY (`telefon_batarya_id`) REFERENCES `telefon_batarya` (`batarya_id`),
<<<<<<< HEAD:Compare-Techh.sql
  CONSTRAINT `EkranFK` FOREIGN KEY (`telefon_ekran_id`) REFERENCES `telefon_ekran` (`ekran_id`),
  CONSTRAINT `IslemciFK` FOREIGN KEY (`telefon_islemci_id`) REFERENCES `telefon_islemcileri` (`islemci_id`),
  CONSTRAINT `Isletim_SistemiFK` FOREIGN KEY (`isletim_sistemi_id`) REFERENCES `telefon_isletimsistemi` (`isletim_sistemi_id`),
  CONSTRAINT `On_KameaFK` FOREIGN KEY (`on_kamera_id`) REFERENCES `telefon_on_kamera` (`kamera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon`;
/*!40000 ALTER TABLE `telefon` DISABLE KEYS */;
INSERT INTO `telefon` (`telefon_id`, `telefon_ad`, `telefon_marka`, `telefon_model`, `telefon_ekran_id`, `telefon_batarya_id`, `telefon_islemci_id`, `arka_kamera_id`, `on_kamera_id`, `telefon_ram`, `telefon_ram_frekansi`, `telefon_dahili_depolama`, `telefon_boy`, `telefon_en`, `telefon_agirlik`, `isletim_sistemi_id`) VALUES
	(11, 'Xiaomi Redmi Note 8', 'Xiaomi', 'Redmi Note 8', 1, 1, 1, 1, 1, 6, 2133, 64, 161.3, 76.4, 199, 1),
	(12, 'Apple iPhone X', 'Apple', 'iPhone X', 2, 2, 2, 6, 2, 3, 0, 64, 143.6, 70.9, 174, 2),
	(32, 'Deneme Xiamoi Redmi Note 8', 'Xiaomi', 'Redmi Note 8', 1, 1, 1, 1, 1, 6, 800, 64, 158, 195, 199, 1);
/*!40000 ALTER TABLE `telefon` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_arka_kamera
CREATE TABLE IF NOT EXISTS `telefon_arka_kamera` (
  `kamera_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `telefon_model` varchar(100) COLLATE utf8_unicode_ci DEFAULT '0',
  `kamera_cozunurlugu` int(5) NOT NULL DEFAULT 0,
  `optik_goruntu_sabitleyici` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `flas` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `diafram_acikligi` double NOT NULL DEFAULT 0,
  `video_kayit_cozunurlugu` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `video_fps_degeri` int(11) NOT NULL DEFAULT 0,
  `iki_kamera_cozunurlugu` int(5) DEFAULT 0,
  `iki_diafram_acikligi` double DEFAULT NULL,
  `uc_kamera_cozunurlugu` int(5) DEFAULT 0,
  `uc_diafram_acikligi` double DEFAULT NULL,
  `dort_kamera_cozunurlugu` int(5) DEFAULT 0,
  `dort_diafram_acikligi` double DEFAULT NULL,
  `bes_kamera_cozunurlugu` int(5) DEFAULT 0,
  `bes_diafram_acikligi` double DEFAULT NULL,
  PRIMARY KEY (`kamera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_arka_kamera: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_arka_kamera`;
/*!40000 ALTER TABLE `telefon_arka_kamera` DISABLE KEYS */;
INSERT INTO `telefon_arka_kamera` (`kamera_id`, `telefon_model`, `kamera_cozunurlugu`, `optik_goruntu_sabitleyici`, `flas`, `diafram_acikligi`, `video_kayit_cozunurlugu`, `video_fps_degeri`, `iki_kamera_cozunurlugu`, `iki_diafram_acikligi`, `uc_kamera_cozunurlugu`, `uc_diafram_acikligi`, `dort_kamera_cozunurlugu`, `dort_diafram_acikligi`, `bes_kamera_cozunurlugu`, `bes_diafram_acikligi`) VALUES
	(1, 'Redmi Note 8', 64, 'Yok', 'Dual-LED-Tek Tonlu Flaş', 1.89, '2160p (Ultra HD) 4K', 30, 8, 2.2, 2, 2.4, 2, 2.4, 0, NULL),
	(6, 'iPhone X', 12, 'Var', 'Quad-LED-Çift Tonlu', 1.8, '2160p (Ultra HD) 4K', 60, 12, 2.4, 0, NULL, 0, NULL, 0, NULL),
	(9, 'Redmi Note 8sdsd', 642, 'Yok', 'Dual2LED-Tek Tonlu Flaş', 1.8119, '2160psadas (Ultra HD) 4K', 3022, 81, 21.2, 12, 21.4, 21, 21.4, 10, NULL),
	(11, 'deneme', 108, 'var', 'var tabi', 2.2, '1080p', 36, 1, 0.2, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `telefon_arka_kamera` ENABLE KEYS */;

=======
  CONSTRAINT `EkranFk` FOREIGN KEY (`telefon_ekran_id`) REFERENCES `telefon_ekran` (`ekran_id`),
  CONSTRAINT `IslemciFK` FOREIGN KEY (`telefon_islemci_id`) REFERENCES `telefon_islemcileri` (`islemci_id`) ON DELETE CASCADE,
  CONSTRAINT `Isletim-SistemiFk` FOREIGN KEY (`isletim_sistemi_id`) REFERENCES `telefon_isletimsistemi` (`isletim_sistemi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon`;
/*!40000 ALTER TABLE `telefon` DISABLE KEYS */;
INSERT INTO `telefon` (`telefon_id`, `telefon_ad`, `telefon_marka`, `telefon_model`, `telefon_ekran_id`, `telefon_batarya_id`, `telefon_islemci_id`, `telefon_ram`, `telefon_ram_frekansi`, `telefon_dahili_depolama`, `telefon_boy`, `telefon_en`, `telefon_agirlik`, `telefon_renk`, `isletim_sistemi_id`) VALUES
	(1, 'Xiaomi Redmi Note 8 Pro', 'Xiaomi', 'Redmi Note 8', 1, 1, 1, 6, 2133, 64, 161, 76.4, 199, 'Beyaz-Siyah-Mavi-Yesil', 1),
	(9, 'Apple iPhone X ', 'Apple', 'iPhone X', 2, 2, 2, 3, 0, 64, 143.6, 70.9, 174, 'Gümüş-Siyah', 2);
/*!40000 ALTER TABLE `telefon` ENABLE KEYS */;

>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
-- tablo yapısı dökülüyor compare-tech.telefon_batarya
CREATE TABLE IF NOT EXISTS `telefon_batarya` (
  `batarya_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `batarya_kapasitesi` int(7) NOT NULL DEFAULT 0,
  `batarya_teknolojisi` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `hizli_sarj_ozelligi` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`batarya_id`)
<<<<<<< HEAD:Compare-Techh.sql
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_batarya: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
=======
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_batarya: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
DELETE FROM `telefon_batarya`;
/*!40000 ALTER TABLE `telefon_batarya` DISABLE KEYS */;
INSERT INTO `telefon_batarya` (`batarya_id`, `batarya_kapasitesi`, `batarya_teknolojisi`, `hizli_sarj_ozelligi`) VALUES
	(1, 4500, 'Lithium Polymer (Li-Po)', 'Var'),
<<<<<<< HEAD:Compare-Techh.sql
	(2, 2716, 'Lithium Ion (Li-Ion)', 'Var'),
	(3, 0, '', ''),
	(4, 5000, 'li', 'var');
=======
	(2, 2716, 'Lithium Ion (Li-Ion)', 'Var');
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
/*!40000 ALTER TABLE `telefon_batarya` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_ekran
CREATE TABLE IF NOT EXISTS `telefon_ekran` (
  `ekran_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ekran_boyutu` double unsigned NOT NULL DEFAULT 0,
  `ekran_teknolojisi` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ekran_cozunurlugu` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `piksel_yogunlugu` int(5) NOT NULL DEFAULT 0,
  `ekran_dayanikligi` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`ekran_id`)
<<<<<<< HEAD:Compare-Techh.sql
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_ekran: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_ekran`;
/*!40000 ALTER TABLE `telefon_ekran` DISABLE KEYS */;
INSERT INTO `telefon_ekran` (`ekran_id`, `ekran_boyutu`, `ekran_teknolojisi`, `ekran_cozunurlugu`, `piksel_yogunlugu`, `ekran_dayanikligi`) VALUES
	(1, 6.3, 'IPS LCD', '1080x2340 (FHD+) Piksel', 395, 'Corning Gorilla Glass 5'),
	(2, 5.8, 'OlED', '1125x2436 (FHD+) Piksel', 458, 'Oleophobic Coating'),
	(3, 5.2, '?ps', '1080', 452, 'gorilla glass 5');
=======
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_ekran: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_ekran`;
/*!40000 ALTER TABLE `telefon_ekran` DISABLE KEYS */;
INSERT INTO `telefon_ekran` (`ekran_id`, `ekran_boyutu`, `ekran_teknolojisi`, `ekran_cozunurlugu`, `piksel_yogunlugu`, `ekran_dayanikliligi`) VALUES
	(1, 6.3, 'IPS LCD', '1080x2340 (FHD+) Piksel', 395, 'Corning Gorilla Glass 5'),
	(2, 5.8, 'OlED', '1125x2436 (FHD+) Piksel', 458, 'Oleophobic Coating');
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
/*!40000 ALTER TABLE `telefon_ekran` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_islemcileri
CREATE TABLE IF NOT EXISTS `telefon_islemcileri` (
  `islemci_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `yonga_seti` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ana_islemci` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cpu_frekansi` double NOT NULL DEFAULT 0,
  `cpu_cekirdegi` int(11) NOT NULL DEFAULT 0,
  `islemci_mimarisi` int(11) NOT NULL DEFAULT 0,
  `birinci_yardimci_islemci` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `grafik_islemcisi_gpu` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `gpu_frekansi` int(11) NOT NULL DEFAULT 0,
  `cpu_uretim_teknolojisi` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`islemci_id`)
<<<<<<< HEAD:Compare-Techh.sql
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_islemcileri: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
=======
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_islemcileri: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
DELETE FROM `telefon_islemcileri`;
/*!40000 ALTER TABLE `telefon_islemcileri` DISABLE KEYS */;
INSERT INTO `telefon_islemcileri` (`islemci_id`, `yonga_seti`, `ana_islemci`, `cpu_frekansi`, `cpu_cekirdegi`, `islemci_mimarisi`, `birinci_yardimci_islemci`, `grafik_islemcisi_gpu`, `gpu_frekansi`, `cpu_uretim_teknolojisi`) VALUES
	(1, 'MediaTek Helio G90T', '	\r\nDual-core 2.05 GHz ARM Cortex-A76', 2.05, 8, 64, 'Hexa-core 2.0 GHz ARM Cortex-A55', '	\r\nMali-G76 MC4', 800, 12),
<<<<<<< HEAD:Compare-Techh.sql
	(2, 'Apple A11 Bionic ', 'Dual-core', 2.1, 6, 64, 'Quad-core', 'Three-Core', 0, 10),
	(3, '', '', 2.5, 0, 0, '', '', 0, 0);
=======
	(2, 'Apple A11 Bionic ', 'Dual-core', 2.1, 6, 64, 'Quad-core', 'Three-Core', 0, 10);
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
/*!40000 ALTER TABLE `telefon_islemcileri` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_isletimsistemi
CREATE TABLE IF NOT EXISTS `telefon_isletimsistemi` (
  `isletim_sistemi_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isletim_sistemi_versiyon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `isletim_sistemi` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`isletim_sistemi_id`)
<<<<<<< HEAD:Compare-Techh.sql
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_isletimsistemi: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
=======
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_isletimsistemi: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
DELETE FROM `telefon_isletimsistemi`;
/*!40000 ALTER TABLE `telefon_isletimsistemi` DISABLE KEYS */;
INSERT INTO `telefon_isletimsistemi` (`isletim_sistemi_id`, `isletim_sistemi_versiyon`, `isletim_sistemi`) VALUES
	(1, 'Android 9.0 (Pie)', 'Android'),
<<<<<<< HEAD:Compare-Techh.sql
	(2, 'iOS 11', 'iOS'),
	(3, '', '');
/*!40000 ALTER TABLE `telefon_isletimsistemi` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_on_kamera
CREATE TABLE IF NOT EXISTS `telefon_on_kamera` (
=======
	(2, 'iOS 11', 'iOS');
/*!40000 ALTER TABLE `telefon_isletimsistemi` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_kamera
CREATE TABLE IF NOT EXISTS `telefon_kamera` (
  `telefon_id` int(11) unsigned NOT NULL,
  `kamera_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`telefon_id`,`kamera_id`),
  KEY `kamera-kamera_id-FK` (`kamera_id`),
  CONSTRAINT `fk_kamera_telefon` FOREIGN KEY (`kamera_id`) REFERENCES `telefon_kameralari` (`Kamera_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_telefon_kamera` FOREIGN KEY (`telefon_id`) REFERENCES `telefon` (`telefon_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_kamera: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_kamera`;
/*!40000 ALTER TABLE `telefon_kamera` DISABLE KEYS */;
INSERT INTO `telefon_kamera` (`telefon_id`, `kamera_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(9, 6),
	(9, 7),
	(9, 8);
/*!40000 ALTER TABLE `telefon_kamera` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_kameralari
CREATE TABLE IF NOT EXISTS `telefon_kameralari` (
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql
  `kamera_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `telefon_model` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `kamera_cozunurlugu` int(5) NOT NULL DEFAULT 0,
  `video_cozunurlugu` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `video_fps_degeri` int(5) NOT NULL DEFAULT 0,
  `diafram_acikligi` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`kamera_id`)
<<<<<<< HEAD:Compare-Techh.sql
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_on_kamera: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_on_kamera`;
/*!40000 ALTER TABLE `telefon_on_kamera` DISABLE KEYS */;
INSERT INTO `telefon_on_kamera` (`kamera_id`, `telefon_model`, `kamera_cozunurlugu`, `video_cozunurlugu`, `video_fps_degeri`, `diafram_acikligi`) VALUES
	(1, 'Redmi Note 8', 20, '1080p', 30, 2),
	(2, 'iPhone X', 7, '1080p', 30, 2.2),
	(3, '', 0, '', 0, 0);
/*!40000 ALTER TABLE `telefon_on_kamera` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_renk
CREATE TABLE IF NOT EXISTS `telefon_renk` (
  `telefon_id` int(11) unsigned NOT NULL,
  `renk_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`telefon_id`,`renk_id`),
  KEY `renk_id` (`renk_id`),
  CONSTRAINT `Renk_TelefonFK` FOREIGN KEY (`renk_id`) REFERENCES `telefon_renkleri` (`renk_id`),
  CONSTRAINT `Telefon_RenkFK` FOREIGN KEY (`telefon_id`) REFERENCES `telefon` (`telefon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_renk: ~11 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_renk`;
/*!40000 ALTER TABLE `telefon_renk` DISABLE KEYS */;
INSERT INTO `telefon_renk` (`telefon_id`, `renk_id`) VALUES
	(11, 1),
	(11, 2),
	(11, 3),
	(11, 4),
	(12, 1),
	(12, 5),
	(12, 6),
	(32, 1),
	(32, 2),
	(32, 3),
	(32, 4);
/*!40000 ALTER TABLE `telefon_renk` ENABLE KEYS */;

-- tablo yapısı dökülüyor compare-tech.telefon_renkleri
CREATE TABLE IF NOT EXISTS `telefon_renkleri` (
  `renk_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `renk_adi` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`renk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_renkleri: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_renkleri`;
/*!40000 ALTER TABLE `telefon_renkleri` DISABLE KEYS */;
INSERT INTO `telefon_renkleri` (`renk_id`, `renk_adi`) VALUES
	(1, 'Siyah'),
	(2, 'Beyaz'),
	(3, 'Mavi'),
	(4, 'Yeşil'),
	(5, 'Gümüş'),
	(6, 'Kırmızı'),
	(7, 'Kahverengi'),
	(9, 'pembe');
/*!40000 ALTER TABLE `telefon_renkleri` ENABLE KEYS */;
=======
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- compare-tech.telefon_kameralari: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `telefon_kameralari`;
/*!40000 ALTER TABLE `telefon_kameralari` DISABLE KEYS */;
INSERT INTO `telefon_kameralari` (`kamera_id`, `kamera_on_arka`, `kamera_cozunurlugu`, `optik_goruntu_sabitleyici`, `flas`, `diafram_acikligi`, `video_kayit_cozunurlugu`, `video_fps_degeri`) VALUES
	(1, 'Arka', 64, 'Yok', 'Dual-LED-Tek Tonlu Flaş', 1.89, '2160p (Ultra HD) 4K', 30),
	(2, 'Arka', 8, '0', '0', 2.2, '0', 0),
	(3, 'Arka', 2, '0', '0', 2.4, '0', 0),
	(4, 'Arka', 2, '0', '0', 2.4, '0', 0),
	(5, 'Ön', 20, 'Yok', '0', 2, '1080p', 30),
	(6, 'Arka', 12, 'Var', 'Quad-LED-Çift Tonlu', 1.8, '2160p (Ultra HD) 4K', 60),
	(7, 'Arka', 12, 'Var', '0', 2.4, '0', 0),
	(8, 'Ön', 7, 'Yok', '0', 2.2, '1080p', 30);
/*!40000 ALTER TABLE `telefon_kameralari` ENABLE KEYS */;
>>>>>>> c7c97d23615d0bea9006f5273b68ff99fb887338:compare-tech.sql

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
