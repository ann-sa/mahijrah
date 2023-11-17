-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2019 at 07:18 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahijrah03`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `barang_terlaris` ()  NO SQL
select nama_barang, count(nama_barang) AS frekuensi_dibeli FROM qbarangjual GROUP BY nama_barang order BY frekuensi_dibeli DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `beli_per_bulan` ()  NO SQL
select `qbarangbeli`.`tgl_beli`,sum(`qbarangbeli`.`jlh_barang`) AS `jlh_barang`,`qbarangbeli`.`total` AS `total` from `mahijrah03`.`qbarangbeli` group by month(`qbarangbeli`.`tgl_beli`) order by month(`qbarangbeli`.`tgl_beli`)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRJ01` ()  BEGIN
SELECT * FROM getstok WHERE kode_barang='CRJ01';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRJ02` ()  BEGIN
SELECT * FROM getstok WHERE kode_barang='CRJ02';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRJ04` ()  BEGIN
SELECT * FROM getstok WHERE kode_barang='CRJ04';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `daftar_pembeli` ()  NO SQL
select nama_pembeli, count(nama_pembeli) AS frekuensi_beli FROM qbarangjual GROUP BY nama_pembeli order BY frekuensi_beli DESC limit 13$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HSK01` ()  BEGIN
SELECT * FROM getstok WHERE kode_barang='HSK01';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HSK02` ()  BEGIN
SELECT * FROM getstok WHERE kode_barang='HSK02';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `jual_per_bulan` ()  NO SQL
select `qbarangjual`.`tgl_jual`,sum(`qbarangjual`.`jlh_barang`) AS `jlh_barang`,`qbarangjual`.`total` AS `total` from `mahijrah03`.`qbarangjual` group by month(`qbarangjual`.`tgl_jual`) order by month(`qbarangjual`.`tgl_jual`)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KSK01` ()  NO SQL
BEGIN
SELECT * FROM getstok WHERE kode_barang='KSK01' and bahan='NLN';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KSK02` ()  NO SQL
BEGIN
SELECT * FROM getstok WHERE kode_barang='KSK02';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KSK11` ()  NO SQL
BEGIN
SELECT * FROM getstok WHERE kode_barang='KSK01' and bahan='PLY';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NQB01` ()  NO SQL
BEGIN
SELECT * FROM getstok WHERE kode_barang='NQB01';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NQB02` ()  NO SQL
BEGIN
SELECT * FROM getstok WHERE kode_barang='NQB02';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NQB03` ()  NO SQL
BEGIN
SELECT * FROM getstok WHERE kode_barang='NQB03';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `STG` ()  NO SQL
BEGIN
SELECT * FROM getstok WHERE kode_barang='STG';
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `jlhbarangbeli` () RETURNS INT(11) BEGIN
DECLARE jumlah INT;
SELECT SUM(jumlah_keseluruhan) INTO jumlah FROM listpembelian;
RETURN jumlah;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `jlhbarangjual` () RETURNS INT(11) BEGIN
DECLARE jumlah INT;
SELECT SUM(jumlah_keseluruhan) INTO jumlah FROM listpenjualan;
RETURN jumlah;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_admin` varchar(7) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `foto_profil` varchar(256) NOT NULL,
  `cookie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_admin`, `username`, `password`, `nama`, `email`, `jenis_kelamin`, `tgl_lahir`, `foto_profil`, `cookie`) VALUES
('0000107', 'anis000107', 'c64b88aa5288e5ce715653ca5aea3088', 'Rizky Annisa Fitri', 'rizkyannisa3262@gmail.com', 'Perempuan', '2000-01-07', 'Capture1.PNG', ''),
('9990113', 'nisa990113', 'c1c52723fddb0c53c21f8e50dfd8efb0', 'Annisa', 'nisa990113@gmail.com', 'Perempuan', '1999-01-13', 'IMG_4825.jpg', '365EvAjQfHTiJ1aNcNRV4G8x24cY70WwzdtXpyAtOw2Pxqu0vl9F9YDIC7kgkCIj');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`) VALUES
('BRU', 'Baru'),
('CRJ01', 'Ciput Rajut 1 Warna'),
('CRJ02', 'Ciput Rajut 2 Warna'),
('CRJ04', 'Ciput Rajut 4 Warna'),
('HSK01', 'Handsock Jempol'),
('HSK02', 'Handsock Cincin'),
('KSK01', 'Kaos Kaki Polos'),
('KSK02', 'Kaos Kaki Motif'),
('NQB01', 'Niqab Tali 2 Layer'),
('NQB02', 'Niqab Bandana Biasa'),
('NQB03', 'Niqab Bandana Poni'),
('STG', 'Sarung Tangan');

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `barang_add` AFTER INSERT ON `barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Penambahan data pada kode barang = ', new.kode_barang), concat('Nama barang ', new.nama_barang), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barang_delete` AFTER DELETE ON `barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Menghapus data pada kode barang = ', old.kode_barang), concat('Nama barang ', old.nama_barang), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barang_update` AFTER UPDATE ON `barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Perubahan data pada kode barang = ', new.kode_barang), concat('Nama barang ', new.nama_barang), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_bahan`
--

CREATE TABLE `detail_bahan` (
  `kode_bahan` varchar(10) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_bahan`
--

INSERT INTO `detail_bahan` (`kode_bahan`, `nama_bahan`) VALUES
('CBD', 'Cerutty Baby Doll'),
('JRS', 'Jersey'),
('kaos2', 'kaos'),
('NLN', 'Nylon'),
('PLY', 'Polyster'),
('RJT', 'Rajut'),
('SFS', 'Sifon Silky');

--
-- Triggers `detail_bahan`
--
DELIMITER $$
CREATE TRIGGER `dbahan_add` AFTER INSERT ON `detail_bahan` FOR EACH ROW insert into
 log_aktivitas values (concat('Penambahan data pada kode bahan = ', new.kode_bahan), concat('Nama bahang ', new.nama_bahan), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dbahan_delete` AFTER DELETE ON `detail_bahan` FOR EACH ROW insert into
 log_aktivitas values (concat('Mengubah data pada kode bahan = ', old.kode_bahan), concat('Nama bahan ', old.nama_bahan), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dbahan_update` AFTER UPDATE ON `detail_bahan` FOR EACH ROW insert into
 log_aktivitas values (concat('Mengubah data pada kode bahan = ', new.kode_bahan), concat('Nama bahan ', new.nama_bahan), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang`
--

CREATE TABLE `detail_barang` (
  `kode_barang` varchar(10) NOT NULL,
  `kode_model` varchar(10) NOT NULL,
  `kode_warna` varchar(10) NOT NULL,
  `kode_ukuran` varchar(10) NOT NULL,
  `kode_bahan` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_barang`
--

INSERT INTO `detail_barang` (`kode_barang`, `kode_model`, `kode_warna`, `kode_ukuran`, `kode_bahan`, `harga`, `jumlah`) VALUES
('NQB01', 'PLS01', 'HTM', 'UNQB01', 'CBD', 15000, 3),
('NQB01', 'PLS01', 'PCH', 'UNQB01', 'CBD', 15000, 0),
('NQB01', 'PLS01', 'MRN', 'UNQB01', 'CBD', 15000, 4),
('NQB01', 'PLS01', 'NVY', 'UNQB01', 'CBD', 15000, 1),
('NQB01', 'PLS01', 'UGUT', 'UNQB01', 'CBD', 15000, 1),
('NQB01', 'PLS01', 'LVD', 'UNQB01', 'CBD', 15000, 0),
('NQB01', 'PLS01', 'RSEP', 'UNQB01', 'CBD', 15000, 0),
('NQB01', 'PLS01', 'CRL', 'UNQB01', 'CBD', 15000, 0),
('NQB01', 'PLS01', 'PTH', 'UNQB01', 'CBD', 15000, 2),
('NQB01', 'PLS01', 'MTD', 'UNQB01', 'CBD', 15000, 2),
('NQB01', 'PLS01', 'ARMD', 'UNQB01', 'CBD', 15000, 2),
('NQB01', 'PLS01', 'CKLTM', 'UNQB01', 'CBD', 15000, 2),
('NQB01', 'PLS01', 'BRUD', 'UNQB01', 'CBD', 15000, 2),
('NQB02', 'PLS01', 'HTM', 'UNQB', 'SFS', 25000, 0),
('NQB03', 'PLS01', 'HTM', 'UNQB', 'SFS', 35000, 2),
('NQB03', 'PLS01', 'CKLT', 'UNQB', 'SFS', 35000, 1),
('NQB03', 'PLS01', 'ARM', 'UNQB', 'SFS', 35000, 1),
('NQB03', 'PLS01', 'MRN', 'UNQB', 'SFS', 35000, 0),
('NQB03', 'PLS01', 'UGU', 'UNQB', 'SFS', 35000, 0),
('STG', 'PLS01', 'ABU', 'USTG', 'JRS', 12000, 1),
('STG', 'PLS01', 'HTM', 'USTG', 'JRS', 12000, 0),
('KSK02', 'MTF01', 'MXD', 'UKSK', 'PLY', 8000, 5),
('KSK01', 'PLS01', 'ARM', 'UKSK', 'NLN', 10000, 0),
('KSK01', 'PLS01', 'NVY', 'UKSK', 'NLN', 10000, 0),
('KSK01', 'PLS01', 'ABT', 'UKSK', 'NLN', 10000, 0),
('KSK01', 'PLS01', 'ABM', 'UKSK', 'NLN', 10000, 0),
('KSK01', 'PLS01', 'CKLT', 'UKSK', 'NLN', 10000, 0),
('KSK01', 'PLS01', 'HTM', 'UKSK', 'NLN', 10000, 0),
('KSK01', 'PLS01', 'MRN', 'UKSK', 'PLY', 8000, 1),
('KSK01', 'PLS01', 'SLMP', 'UKSK', 'PLY', 8000, 0),
('KSK01', 'PLS01', 'NVY', 'UKSK', 'PLY', 8000, 0),
('KSK01', 'PLS01', 'BBYP', 'UKSK', 'PLY', 8000, 1),
('KSK01', 'PLS01', 'DSTP', 'UKSK', 'PLY', 8000, 0),
('KSK01', 'PLS01', 'CKLT', 'UKSK', 'PLY', 8000, 3),
('KSK01', 'PLS01', 'HTM', 'UKSK', 'PLY', 8000, 0),
('KSK01', 'PLS01', 'ABT', 'UKSK', 'PLY', 8000, 0),
('KSK01', 'PLS01', 'CKLTMC', 'UKSK', 'PLY', 8000, 3),
('KSK01', 'PLS01', 'LVD', 'UKSK', 'PLY', 8000, 0),
('KSK01', 'PLS01', 'MRH', 'UKSK', 'PLY', 8000, 2),
('KSK01', 'PLS01', 'HJML', 'UKSK', 'PLY', 8000, 1),
('KSK01', 'PLS01', 'ABM', 'UKSK', 'PLY', 8000, 0),
('KSK01', 'PLS01', 'HTSCT', 'UKSK', 'PLY', 8000, 2),
('KSK01', 'PLS01', 'UGUT', 'UKSK', 'PLY', 8000, 2),
('KSK01', 'PLS01', 'CRM', 'UKSK', 'PLY', 8000, 2),
('HSK02', 'PLS01', 'HTM', 'UHSK', 'JRS', 12000, 0),
('HSK02', 'PLS01', 'CKLT', 'UHSK', 'JRS', 12000, 2),
('HSK02', 'PLS01', 'MRHB', 'UHSK', 'JRS', 12000, 1),
('HSK02', 'PLS01', 'CRL', 'UHSK', 'JRS', 12000, 1),
('HSK02', 'PLS01', 'CKLTM', 'UHSK', 'JRS', 12000, 2),
('HSK02', 'PLS01', 'ABT', 'UHSK', 'JRS', 12000, 0),
('HSK02', 'PLS01', 'ABM', 'UHSK', 'JRS', 12000, 0),
('HSK02', 'PLS01', 'MGT', 'UHSK', 'JRS', 12000, 1),
('HSK02', 'PLS01', 'BBYP', 'UHSK', 'JRS', 12000, 0),
('HSK02', 'PLS01', 'DSTP', 'UHSK', 'JRS', 12000, 1),
('HSK02', 'PLS01', 'UGU', 'UHSK', 'JRS', 12000, 0),
('HSK02', 'PLS01', 'SLMP', 'UHSK', 'JRS', 12000, 0),
('HSK02', 'PLS01', 'CRM', 'UHSK', 'JRS', 12000, 1),
('KSK01', 'PLS01', 'BRUE', 'UKSK', 'PLY', 8000, 2),
('HSK02', 'PLS01', 'BRU', 'UHSK', 'JRS', 12000, 1),
('HSK02', 'PLS01', 'BRUE', 'UHSK', 'JRS', 12000, 1),
('HSK01', 'PLS01', 'HTM', 'UHSK', 'JRS', 12000, 6),
('HSK01', 'PLS01', 'NVY', 'UHSK', 'JRS', 12000, 4),
('HSK01', 'PLS01', 'MRN', 'UHSK', 'JRS', 12000, 3),
('HSK01', 'PLS01', 'ABT', 'UHSK', 'JRS', 12000, 1),
('HSK01', 'PLS01', 'ABM', 'UHSK', 'JRS', 12000, 3),
('HSK01', 'PLS01', 'PTH', 'UHSK', 'JRS', 12000, 2),
('HSK01', 'PLS01', 'UGU', 'UHSK', 'JRS', 12000, 1),
('HSK01', 'PLS01', 'LVD', 'UHSK', 'JRS', 12000, 2),
('HSK01', 'PLS01', 'BRUE', 'UHSK', 'JRS', 12000, 2),
('HSK01', 'PLS01', 'BRUM', 'UHSK', 'JRS', 12000, 2),
('HSK01', 'PLS01', 'CRL', 'UHSK', 'JRS', 12000, 1),
('HSK01', 'PLS01', 'MTD', 'UHSK', 'JRS', 12000, 2),
('HSK01', 'PLS01', 'CKLTC', 'UHSK', 'JRS', 12000, 3),
('HSK01', 'PLS01', 'CKLTS', 'UHSK', 'JRS', 12000, 1),
('HSK01', 'PLS01', 'HTSC', 'UHSK', 'JRS', 12000, 0),
('HSK01', 'PLS01', 'DSTP', 'UHSK', 'JRS', 12000, 0),
('HSK01', 'PLS01', 'BBYP', 'UHSK', 'JRS', 12000, 0),
('HSK01', 'PLS01', 'MGT', 'UHSK', 'JRS', 12000, 1),
('HSK01', 'PLS01', 'HTSCT', 'UHSK', 'JRS', 12000, 0),
('HSK01', 'PLS01', 'HTSCM', 'UHSK', 'JRS', 12000, 1),
('HSK01', 'PLS01', 'CKLTTU', 'UHSK', 'JRS', 12000, 3),
('HSK01', 'PLS01', 'HJU', 'UHSK', 'JRS', 12000, 1),
('CRJ01', 'PLS01', 'MXD', 'USTD', 'RJT', 8000, 9),
('CRJ02', 'PLS02', 'MXD', 'USTD', 'RJT', 8000, 7),
('CRJ04', 'PLS04', 'MXD', 'USTD', 'RJT', 8000, 18),
('BRU', 'MTF01', 'ABM', 'UHSK', 'CBD', 10000, 10000);

--
-- Triggers `detail_barang`
--
DELIMITER $$
CREATE TRIGGER `dbarang_add` AFTER INSERT ON `detail_barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Penambahan data pada barang dengan kode = ', new.kode_barang), concat('Memiliki kode model ', new.kode_model, 'dengan warna ', new.kode_warna, 'dengan ukuran', new.kode_ukuran, ' berjumlah ', new.jumlah, 'dijual dengan harga ', new.harga), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dbarang_delete` AFTER DELETE ON `detail_barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Menghapus data pada barang dengan kode = ', old.kode_barang), concat('Memiliki kode model ', old.kode_model, 'dengan warna ', old.kode_warna, 'dengan ukuran', old.kode_ukuran, ' berjumlah ', old.jumlah, 'dijual dengan harga ', old.harga), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dbarang_update` AFTER UPDATE ON `detail_barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Mengubah data pada barang dengan kode = ', new.kode_barang), concat('Memiliki kode model ', new.kode_model, 'dengan warna ', new.kode_warna, 'dengan ukuran', new.kode_ukuran, ' berjumlah ', new.jumlah, 'dijual dengan harga ', new.harga), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi_beli`
--

CREATE TABLE `detail_transaksi_beli` (
  `id_beli` int(11) NOT NULL,
  `tgl_beli` date NOT NULL,
  `nama_penjual` text NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `kode_bahan` varchar(10) NOT NULL,
  `kode_model` varchar(10) NOT NULL,
  `kode_ukuran` varchar(10) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `kode_warna` varchar(10) NOT NULL,
  `jlh_barang` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi_beli`
--

INSERT INTO `detail_transaksi_beli` (`id_beli`, `tgl_beli`, `nama_penjual`, `kode_barang`, `kode_bahan`, `kode_model`, `kode_ukuran`, `harga_jual`, `kode_warna`, `jlh_barang`, `harga_beli`) VALUES
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'PCH', 2, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'MRN', 5, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'BRUD', 5, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'HTM', 7, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'UGUT', 2, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'LVD', 2, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'RSEP', 2, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'CRL', 1, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'PTH', 2, 9249),
(1, '2019-02-18', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'MTD', 2, 9249),
(2, '2019-02-18', 'Alnoor Niqab', 'NQB02', 'SFS', 'PLS01', 'UNQB', 25000, 'HTM', 4, 20650),
(2, '2019-02-18', 'Alnoor Niqab', 'NQB03', 'SFS', 'PLS01', 'UNQB', 35000, 'HTM', 2, 29650),
(3, '2019-02-23', '@SambuMedan', 'CRJ01', 'RJT', 'PLS01', 'USTD', 8000, 'MXD', 20, 4000),
(3, '2019-02-23', '@SambuMedan', 'CRJ01', 'RJT', 'PLS01', 'USTD', 8000, 'MXD', 10, 5500),
(4, '2019-02-23', '@PasarBrayan', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'CRM', 4, 7000),
(4, '2019-02-23', '@PasarBrayan', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'HTM', 8, 7000),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'HTM', 5, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'NVY', 3, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'MRN', 3, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLTTU', 3, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'ABT', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'ABM', 2, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'PTH', 2, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'UGU', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'LVD', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'BRUE', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'BRUM', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'HJU', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'CRL', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'MTD', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLTC', 2, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLTS', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'HTSC', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'HTM', 3, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLT', 2, 5500),
(6, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'MRHB', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'CRL', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLTM', 2, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'ABT', 2, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'ABM', 2, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'BRUE', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'CRJ01', 'JRS', 'PLS01', 'UHSK', 12000, 'MGT', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'BBYP', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'DSTP', 2, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'BRU', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'UGU', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'SLMP', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'HSK02', 'JRS', 'PLS01', 'UHSK', 12000, 'CRM', 1, 5500),
(5, '2019-03-23', 'Rc Zahro', 'NQB03', 'SFS', 'PLS01', 'UNQB', 35000, 'HTM', 4, 23000),
(5, '2019-03-23', 'RcZahro', 'NQB03', 'SFS', 'PLS01', 'UNQB', 35000, 'UGU', 1, 23000),
(5, '2019-03-23', 'Rc Zahro', 'NQB03', 'SFS', 'PLS01', 'UNQB', 35000, 'ARM', 1, 23000),
(5, '2019-03-23', 'Rc Zahro', 'NQB03', 'SFS', 'PLS01', 'UNQB', 35000, 'MRN', 1, 23000),
(5, '2019-03-23', 'Rc Zahro', 'NQB03', 'SFS', 'PLS01', 'UNQB', 35000, 'CKLT', 1, 23000),
(5, '2019-03-23', 'Rc Zahro', 'CRJ01', 'RJT', 'PLS01', 'USTD', 8000, 'MXD', 5, 4000),
(5, '2019-03-23', 'Rc Zahro', 'CRJ02', 'RJT', 'PLS02', 'USTD', 8000, 'MXD', 7, 4000),
(5, '2019-03-23', 'Rc Zahro', 'CRJ04', 'RJT', 'PLS04', 'USTD', 8000, 'MXD', 7, 4000),
(8, '2019-04-20', 'Rc Zahro', 'CRJ01', 'RJT', 'PLS01', 'USTD', 8000, 'MXD', 8, 4000),
(8, '2019-04-20', 'Rc Zahro', 'CRJ02', 'RJT', 'PLS02', 'USTD', 8000, 'MXD', 8, 4000),
(8, '2019-04-20', 'Rc Zahro', 'CRJ04', 'RJT', 'PLS04', 'USTD', 8000, 'MXD', 19, 4000),
(7, '2019-04-20', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'HTM', 7, 9071),
(7, '2019-04-20', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'MRN', 4, 9071),
(7, '2019-04-20', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'NVY', 4, 9071),
(7, '2019-04-20', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'PTH', 2, 9071),
(7, '2019-04-20', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'CKLTS', 2, 9071),
(7, '2019-04-20', 'Rumah Jahit', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 15000, 'ARM', 2, 9071),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'HTM', 3, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'MRN', 2, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'NVY', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'ABT', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'ABM', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'BRUE', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'BRUM', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'UGU', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'LVD', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'MGT', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'DSTP', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'BBYP', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'HTSCT', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'HTSCM', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'MTD', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLTC', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLTS', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'HSK01', 'JRS', 'PLS01', 'UHSK', 12000, 'CKLTTU', 1, 5500),
(8, '2019-04-20', 'Rc Zahro', 'STG', 'JRS', 'PLS01', 'USTG', 12000, 'HTM', 2, 7500),
(8, '2019-04-20', 'Rc Zahro', 'STG', 'JRS', 'PLS01', 'USTG', 12000, 'ABU', 1, 7500),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK02', 'PLY', 'MTF01', 'UKSK', 8000, 'MXD', 12, 6375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'MRN', 4, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'SLMP', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'BRUE', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'NVY', 4, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'BBYP', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'RSEP', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'CKLT', 4, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'HTM', 6, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'ABT', 4, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'CKLTMC', 4, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'LVD', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'MRH', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'HJML', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'ABM', 4, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'HTSCT', 2, 3375),
(9, '2019-04-27', 'Daw Aksesoris', 'KSK01', 'PLY', 'PLS01', 'UKSK', 8000, 'UGUTU', 2, 3375),
(8, '2019-04-20', 'Rc Zahro', 'CRJ04', 'RJT', 'PLS04', 'USTD', 8000, 'MXD', 40, 4000),
(8, '2019-04-20', 'Rc Zahro', 'KSK01', 'NLN', 'PLS01', 'UKSK', 10000, 'NVY', 2, 7000),
(8, '2019-04-20', 'Rc Zahro', 'KSK01', 'NLN', 'PLS01', 'UKSK', 10000, 'ABT', 2, 7000),
(8, '2019-04-20', 'Rc Zahro', 'KSK01', 'NLN', 'PLS01', 'UKSK', 10000, 'ABM', 2, 7000),
(8, '2019-04-20', 'Rc Zahro', 'KSK01', 'NLN', 'PLS01', 'UKSK', 10000, 'CKLT', 2, 7000),
(8, '2019-04-20', 'Rc Zahro', 'KSK01', 'NLN', 'PLS01', 'UKSK', 10000, 'ARM', 2, 7000),
(8, '2019-04-20', 'Rc Zahro', 'KSK01', 'NLN', 'PLS01', 'UKSK', 10000, 'HTM', 2, 7000);

--
-- Triggers `detail_transaksi_beli`
--
DELIMITER $$
CREATE TRIGGER `DTransaksi_beli_add` AFTER INSERT ON `detail_transaksi_beli` FOR EACH ROW insert into
 log_transaksi_beli values (new.id_beli, concat('Penambahan data pada ID = ', new.id_beli), concat('Membeli barang dengan kode ', new.kode_barang, ', kode warna ', new.kode_warna, ' berjumlah ', new.jlh_barang, ' di ', new.nama_penjual, ' dengan harga ', new.harga_beli), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DTransaksi_beli_delete` BEFORE DELETE ON `detail_transaksi_beli` FOR EACH ROW insert into
 log_transaksi_beli values (old.id_beli,concat('Menghapus data pada ID = ', old.id_beli), concat('Membeli barang dengan kode ', old.kode_barang, ', kode warna ', old.kode_warna, ' berjumlah ', old.jlh_barang, ' di ', old.nama_penjual, ' dengan harga ', old.harga_beli), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DTransaksi_beli_update` AFTER UPDATE ON `detail_transaksi_beli` FOR EACH ROW insert into
 log_transaksi_beli values (new.id_beli, concat('Pengubahan data pada ID = ', new.id_beli), concat('Membeli barang dengan kode ', new.kode_barang, ', kode warna ', new.kode_warna, ' berjumlah ', new.jlh_barang, ' di ', new.nama_penjual, ' dengan harga ', new.harga_beli), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi_jual`
--

CREATE TABLE `detail_transaksi_jual` (
  `id_jual` int(11) NOT NULL,
  `tgl_jual` date NOT NULL,
  `nama_pembeli` text NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `kode_bahan` varchar(10) NOT NULL,
  `kode_model` varchar(10) NOT NULL,
  `kode_ukuran` varchar(10) NOT NULL,
  `kode_warna` varchar(10) NOT NULL,
  `jlh_barang` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_transaksi_jual`
--

INSERT INTO `detail_transaksi_jual` (`id_jual`, `tgl_jual`, `nama_pembeli`, `kode_barang`, `kode_bahan`, `kode_model`, `kode_ukuran`, `kode_warna`, `jlh_barang`, `harga_jual`) VALUES
(1, '2019-06-05', 'Ade Ilhamia', 'CRJ04', 'RJT', 'PLS04', 'USTD', 'MXD', 40, 7500),
(43, '2019-05-10', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'BRUD', 1, 15000),
(44, '2019-02-20', 'Suci', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'MRN', 1, 15000),
(45, '2019-02-23', 'Tuti', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'HTM', 3, 15000),
(45, '2019-02-23', 'Tuti', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'NVY', 2, 15000),
(45, '2019-02-23', 'Tuti', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'MRN', 2, 15000),
(45, '2019-02-23', 'Tuti', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'PTH', 1, 15000),
(45, '2019-02-23', 'Tuti', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'LVD', 1, 15000),
(46, '2019-02-25', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'HTM', 3, 15000),
(46, '2019-02-25', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'NVY', 1, 15000),
(46, '2019-02-25', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'MRN', 2, 15000),
(46, '2019-02-25', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'KNGL', 1, 15000),
(46, '2019-02-25', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'CRL', 1, 15000),
(46, '2019-02-25', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'RSEP', 1, 15000),
(47, '2019-02-26', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'PTH', 1, 15000),
(48, '2019-02-28', 'Lita', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'LVD', 1, 15000),
(48, '2019-02-28', 'Lita', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'NVY', 1, 15000),
(49, '2019-03-02', 'Tuti', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'HTM', 1, 15000),
(50, '2019-03-03', 'Vicha', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'PCH', 1, 15000),
(51, '2019-03-05', 'Suci', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'RSEP', 1, 15000),
(52, '2019-03-07', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'UGU', 1, 15000),
(53, '2019-05-10', 'Ema', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'PCH', 1, 15000),
(53, '2019-05-10', 'Ema', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'UGUT', 1, 15000),
(54, '2019-03-24', 'Annisa', 'NQB02', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 25000),
(55, '2019-02-27', 'Tuti', 'NQB02', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 25000),
(56, '2019-03-06', 'Ratna', 'NQB02', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 25000),
(57, '2019-03-13', 'Anis', 'NQB02', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 25000),
(58, '2019-03-09', 'Imah', 'NQB03', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 35000),
(58, '2019-03-09', 'Imah', 'NQB03', 'SFS', 'PLS01', 'UNQB', 'MRN', 1, 35000),
(60, '2019-03-27', 'Tiya', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTSC', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'BRUE', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'ABM', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'ABT', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'LVD', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'PTH', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLTC', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'BRUM', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'MRN', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLTS', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'MTD', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CRL', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'UGU', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTSC', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'NVY', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLT', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(61, '2019-04-08', 'Oca', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(62, '2019-04-11', 'Tuti', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'ABM', 1, 12000),
(63, '2019-04-17', 'Anis', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(63, '2019-04-17', 'Anis', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'MRN', 1, 12000),
(64, '2019-03-24', 'Via', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLTM', 1, 12000),
(65, '2019-03-31', 'Aju', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLTC', 1, 12000),
(66, '2019-05-04', 'Annisa', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(67, '2019-04-14', 'Aflah', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'MRN', 1, 12000),
(67, '2019-04-14', 'Aflah', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'NVY', 1, 12000),
(68, '2019-03-31', 'Tiya', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'SLMP', 1, 12000),
(69, '2019-04-21', 'Annisa', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'ABT', 1, 12000),
(70, '2019-04-24', 'Mila', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'BBYP', 1, 12000),
(71, '2019-03-12', 'Anis', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'UGU', 1, 12000),
(72, '2019-04-16', 'Aisyah', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(73, '2019-05-14', 'Eva', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(74, '2019-05-11', 'Vichor', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'ABM', 1, 12000),
(74, '2019-05-11', 'Vichor', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'DSTP', 1, 12000),
(75, '2019-05-10', 'Ema', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'ABM', 1, 12000),
(75, '2019-05-10', 'Ema', 'HSK02', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(76, '2019-02-26', 'Anis', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 15000),
(77, '2019-03-01', 'Annisa', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 15000),
(78, '2019-03-04', 'Annisa', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 15000),
(79, '2019-03-15', 'Fatimah', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 15000),
(80, '2019-03-14', 'Ulfah', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 1, 15000),
(81, '2019-03-27', 'Mala', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 1, 15000),
(82, '2019-04-04', 'Ema', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 1, 15000),
(83, '2019-02-25', 'Susi', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 2, 8000),
(84, '2019-03-02', 'Anis', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 2, 8000),
(85, '2019-03-06', 'Annisa', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 2, 8000),
(86, '2019-03-11', 'Annisa', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 1, 8000),
(87, '2019-05-14', 'Ulfah', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'CKLT', 1, 8000),
(88, '2019-03-20', 'Tuti', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 1, 8000),
(89, '2019-04-08', 'Vicha', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 2, 8000),
(90, '2019-04-24', 'Tuti', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 1, 8000),
(91, '2019-03-26', 'Tiya', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 6, 7500),
(92, '2019-05-15', 'Annisa', 'CRJ04', 'RJT', 'PLS04', 'USTD', 'MXD', 3, 7500),
(93, '2019-03-26', 'Annisa', 'CRJ02', 'RJT', 'PLS02', 'USTD', 'MXD', 2, 7500),
(94, '2019-04-09', 'Ayna', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 7500),
(95, '2019-04-05', 'Ema', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 7500),
(96, '2019-04-17', 'Erna', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 7500),
(97, '2019-03-28', 'Annisa', 'CRJ02', 'RJT', 'PLS02', 'USTD', 'MXD', 2, 7500),
(98, '2019-03-28', 'Annisa', 'NQB03', 'SFS', 'PLS01', 'UNQB', 'HJU', 1, 35000),
(98, '2019-03-28', 'Annisa', 'NQB03', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 35000),
(99, '2019-04-01', 'Annisa', 'NQB03', 'SFS', 'PLS01', 'UNQB', 'UGU', 1, 35000),
(100, '2019-04-10', 'Lidia', 'NQB03', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 35000),
(101, '2019-04-11', 'Cyntia', 'NQB03', 'SFS', 'PLS01', 'UNQB', 'HTM', 1, 35000),
(102, '2019-04-30', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'HTM', 2, 15000),
(103, '2019-05-02', 'Cyntia', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'HTM', 1, 15000),
(104, '2019-05-11', 'Rahmi', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'BRUD', 1, 15000),
(104, '2019-05-11', 'Rahmi', 'NQB01', 'CBD', 'PLS01', 'UNQB01', 'HTM', 1, 15000),
(105, '2019-04-30', 'Anis', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 1, 7500),
(106, '2019-04-22', 'Annisa', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 4, 7500),
(107, '2019-05-11', 'Rury', 'CRJ04', 'RJT', 'PLS04', 'USTD', 'MXD', 2, 7500),
(108, '2019-05-13', 'Nur Indah', 'CRJ02', 'RJT', 'PLS02', 'USTD', 'MXD', 1, 7500),
(108, '2019-05-13', 'Nur Indah', 'CRJ04', 'RJT', 'PLS04', 'USTD', 'MXD', 1, 7500),
(109, '2019-05-11', 'Yuli', 'CRJ02', 'RJT', 'PLS02', 'USTD', 'MXD', 1, 7500),
(110, '2019-04-21', 'Presty', 'CRJ04', 'RJT', 'PLS04', 'USTD', 'MXD', 2, 7500),
(111, '2019-05-14', 'Nining', 'CRJ02', 'RJT', 'PLS02', 'USTD', 'MXD', 2, 7500),
(112, '2019-05-16', 'Dewi', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 7500),
(113, '2019-05-16', 'Ningnong', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 7500),
(114, '2019-05-15', 'Indah', 'CRJ01', 'RJT', 'PLS01', 'USTD', 'MXD', 2, 7500),
(115, '2019-04-25', 'Eva', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'ABT', 1, 12000),
(116, '2019-04-26', 'Anis', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'BBYP', 1, 12000),
(117, '2019-04-30', 'Annisa', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'UGU', 1, 12000),
(118, '2019-05-03', 'Anis', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'DSTP', 1, 12000),
(119, '2019-05-07', 'Aisyah', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'MRN', 1, 12000),
(120, '2019-05-15', 'Siska', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTSCT', 1, 12000),
(120, '2019-05-15', 'Siska', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(121, '2019-05-14', 'Eva', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLTTU', 1, 12000),
(122, '2019-05-13', 'Ema', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLTS', 1, 12000),
(122, '2019-05-13', 'Ema', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'MRN', 1, 12000),
(123, '2019-05-12', 'Siska', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'BRU', 1, 12000),
(123, '2019-05-12', 'Siska', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTSC', 1, 12000),
(124, '2019-05-10', 'Ema', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'CKLT', 1, 12000),
(124, '2019-05-10', 'Ema', 'HSK01', 'JRS', 'PLS01', 'UHSK', 'HTM', 1, 12000),
(125, '2019-04-24', 'Aflah', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'ABM', 1, 10000),
(125, '2019-04-24', 'Aflah', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'ABT', 1, 10000),
(125, '2019-04-24', 'Aflah', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'NVY', 1, 10000),
(126, '2019-04-30', 'Anis', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'ABT', 1, 10000),
(126, '2019-04-30', 'Anis', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'ARM', 1, 10000),
(126, '2019-04-30', 'Anis', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'NVY', 1, 10000),
(126, '2019-04-30', 'Anis', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'CKLT', 2, 10000),
(127, '2019-05-03', 'Annisa', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'ARM', 1, 10000),
(127, '2019-05-03', 'Annisa', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'HTM', 1, 10000),
(128, '2019-05-06', 'Cyntia', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'ABM', 1, 10000),
(129, '2019-05-07', 'Rahmi', 'KSK01', 'NLN', 'PLS01', 'UKSK', 'HTM', 1, 10000),
(130, '2019-04-21', 'Annisa', 'STG', 'JRS', 'PLS01', 'USTG', 'HTM', 1, 12000),
(131, '2019-04-26', 'Nur Indah', 'STG', 'JRS', 'PLS01', 'USTG', 'HTM', 1, 12000),
(132, '2019-04-28', 'Btk', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'NVY', 1, 8000),
(132, '2019-04-28', 'Btk', 'KSK02', 'PLY', 'MTF01', 'UKSK', 'MXD', 1, 8000),
(133, '2019-04-30', 'Btk', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'ABM', 1, 8000),
(133, '2019-04-30', 'Btk', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'NVY', 1, 8000),
(134, '2019-04-30', 'Yazki', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'NVY', 1, 8000),
(134, '2019-04-30', 'Yazki', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'SLMP', 1, 8000),
(135, '2019-05-01', 'Berutu', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'ABT', 1, 8000),
(135, '2019-05-01', 'Berutu', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'MRN', 1, 8000),
(136, '2019-05-03', 'T2', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'ABT', 1, 8000),
(136, '2019-05-03', 'T2', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'MRN', 1, 8000),
(137, '2019-05-04', 'Nining', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'DSTP', 1, 8000),
(137, '2019-05-04', 'Nining', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 1, 8000),
(138, '2019-05-06', 'Rini', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'ABM', 1, 8000),
(138, '2019-05-06', 'Rini', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'DSTP', 1, 8000),
(139, '2019-05-07', 'Mba', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'BRU', 1, 8000),
(139, '2019-05-07', 'Mba', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HJU', 1, 8000),
(139, '2019-05-07', 'Mba', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'PTH', 1, 8000),
(140, '2019-05-07', 'Ema', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'BRU', 1, 8000),
(140, '2019-05-07', 'Ema', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'CRM', 1, 8000),
(140, '2019-05-07', 'Ema', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HJU', 1, 8000),
(141, '2019-04-11', 'Ema', 'KSK02', 'PLY', 'MTF01', 'UKSK', 'MXD', 2, 8000),
(142, '2019-05-16', 'Aisyah', 'KSK02', 'PLY', 'MTF01', 'UKSK', 'MXD', 2, 8000),
(143, '2019-05-14', 'Yazki', 'KSK02', 'PLY', 'MTF01', 'UKSK', 'MXD', 2, 8000),
(144, '2019-05-18', 'Zara', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'ABM', 1, 8000),
(144, '2019-05-18', 'Zara', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'NVY', 1, 8000),
(145, '2019-05-19', 'Vicha', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'ABT', 2, 8000),
(145, '2019-05-19', 'Vicha', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'MRN', 1, 8000),
(145, '2019-05-19', 'Vicha', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'UGU', 1, 8000),
(146, '2019-05-19', 'Ema', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'CKLTTU', 1, 8000),
(146, '2019-05-19', 'Ema', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'SLMP', 1, 8000),
(147, '2019-05-19', 'Endah', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'ABM', 1, 8000),
(147, '2019-05-19', 'Endah', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'UGUTU', 1, 8000),
(148, '2019-05-21', 'Rury', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'BBYP', 1, 8000),
(148, '2019-05-21', 'Rury', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'CKLTMC', 1, 8000),
(149, '2019-05-26', 'Dita', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HTM', 2, 8000),
(149, '2019-05-26', 'Dita', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'LVD', 2, 8000),
(150, '2019-05-29', 'Indah', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'CKLTS', 1, 8000),
(150, '2019-05-29', 'Indah', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'HJML', 1, 8000),
(150, '2019-05-29', 'Indah', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'CRM', 1, 8000),
(150, '2019-05-29', 'Indah', 'KSK01', 'PLY', 'PLS01', 'UKSK', 'RSEP', 1, 8000);

--
-- Triggers `detail_transaksi_jual`
--
DELIMITER $$
CREATE TRIGGER `DTransaksi_jual_add` AFTER INSERT ON `detail_transaksi_jual` FOR EACH ROW insert into
 log_transaksi_jual values (new.id_jual,concat('Penambahan data pada ID = ', new.id_jual), concat('Kode barang yang dibeli ', new.kode_barang, ' dengan kode warna ', new.kode_warna, ' berjumlah ', new.jlh_barang, ', dibeli oleh ', new.nama_pembeli, ' dengan harga ', new.harga_jual), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DTransaksi_jual_delete` BEFORE DELETE ON `detail_transaksi_jual` FOR EACH ROW insert into
 log_transaksi_jual values (old.id_jual,  concat('Menghapus data pada ID = ', old.id_jual), concat('Kode barang yang dibeli ', old.kode_barang, ' dengan kode warna ', old.kode_warna, ' berjumlah ', old.jlh_barang, ' dibeli oleh ', old.nama_pembeli, ' dengan harga ', old.harga_jual), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DTransaksi_jual_update` AFTER UPDATE ON `detail_transaksi_jual` FOR EACH ROW insert into
 log_transaksi_jual values (new.id_jual, concat('Mengubah data pada ID = ', new.id_jual), concat('Kode barang yang dibeli ', new.kode_barang, ' dengan kode warna ', new.kode_warna, ' berjumlah ', new.jlh_barang, ' dibeli oleh ', new.nama_pembeli, ' dengan harga ', new.harga_jual), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `getstok`
-- (See below for the actual view)
--
CREATE TABLE `getstok` (
`kode_barang` varchar(10)
,`nama_barang` varchar(100)
,`warna` varchar(50)
,`bahan` varchar(10)
,`jumlah` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `listpembelian`
-- (See below for the actual view)
--
CREATE TABLE `listpembelian` (
`tgl_beli` date
,`nama_penjual` text
,`jlh_barang` decimal(32,0)
,`jumlah_keseluruhan` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `listpenjualan`
-- (See below for the actual view)
--
CREATE TABLE `listpenjualan` (
`tgl_jual` date
,`nama_pembeli` text
,`jlh_barang` decimal(32,0)
,`jumlah_keseluruhan` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `perihal` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `waktu` datetime NOT NULL,
  `nama_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`perihal`, `detail`, `waktu`, `nama_user`) VALUES
('Penambahan data pada barang dengan kode = BRU', 'Memiliki kode model MTF01dengan warna ABMdengan ukuranUHSK berjumlah 10000dijual dengan harga 10000', '2019-07-02 00:02:05', 'root@localhost');

-- --------------------------------------------------------

--
-- Stand-in structure for view `log_beli`
-- (See below for the actual view)
--
CREATE TABLE `log_beli` (
`perihal` varchar(255)
,`detail` text
,`waktu` datetime
,`admin_id` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `log_jual`
-- (See below for the actual view)
--
CREATE TABLE `log_jual` (
`perihal` varchar(255)
,`detail` text
,`waktu` datetime
,`admin_id` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `log_transaksi_beli`
--

CREATE TABLE `log_transaksi_beli` (
  `id_beli` int(11) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `waktu` datetime NOT NULL,
  `nama_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_transaksi_beli`
--

INSERT INTO `log_transaksi_beli` (`id_beli`, `perihal`, `detail`, `waktu`, `nama_user`) VALUES
(1, 'Penambahan data pada ID = 1', 'Membeli barang BRUdengan warna ABM berjumlah 4dan membeli dengan nisnidengan harga23000', '2019-07-01 23:11:30', 'root@localhost'),
(1, 'Menghapus data pada ID = 1', 'Membeli barang BRUdengan warna ABM berjumlah 4dan membeli dengan nisnidengan harga23000', '2019-07-01 23:12:15', 'root@localhost'),
(36, 'Penambahan data pada ID = 36', 'Membeli barang dengan kode BRU, kode warna ABM berjumlah 10000 di ni dengan harga 10', '2019-07-02 00:02:05', 'root@localhost'),
(36, 'Menghapus data pada ID = 36', 'Membeli barang dengan kode BRU, kode warna ABM berjumlah 10000 di ni dengan harga 10', '2019-07-02 00:51:12', 'root@localhost');

-- --------------------------------------------------------

--
-- Table structure for table `log_transaksi_jual`
--

CREATE TABLE `log_transaksi_jual` (
  `id_jual` int(11) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `waktu` datetime NOT NULL,
  `nama_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `model_barang`
--

CREATE TABLE `model_barang` (
  `kode_model` varchar(10) NOT NULL,
  `nama_model` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model_barang`
--

INSERT INTO `model_barang` (`kode_model`, `nama_model`) VALUES
('MTF01', 'Motif'),
('PLS01', 'Polos 1 Warna'),
('PLS02', 'Polos 2 Warna'),
('PLS04', 'Polos 4 Warna');

--
-- Triggers `model_barang`
--
DELIMITER $$
CREATE TRIGGER `model_add` AFTER INSERT ON `model_barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Penambahan data pada kode model = ', new.kode_model), concat('Nama model ', new.nama_model), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `model_delete` AFTER DELETE ON `model_barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Menghapus data pada kode model = ', old.kode_model), concat('Nama model ', old.nama_model), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `model_update` AFTER UPDATE ON `model_barang` FOR EACH ROW insert into
 log_aktivitas values (concat('Perubahan data pada kode model = ', new.kode_model), concat('Nama model ', new.nama_model), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `qbarangbeli`
-- (See below for the actual view)
--
CREATE TABLE `qbarangbeli` (
`total` bigint(21)
,`nama_penjual` text
,`tgl_beli` date
,`jlh_barang` int(11)
,`harga_beli` int(11)
,`nama_barang` varchar(100)
,`nama_bahan` varchar(100)
,`nama_model` varchar(50)
,`ukuran` varchar(50)
,`warna` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qbarangjual`
-- (See below for the actual view)
--
CREATE TABLE `qbarangjual` (
`total` bigint(21)
,`nama_pembeli` text
,`tgl_jual` date
,`jlh_barang` int(11)
,`harga_jual` int(11)
,`nama_barang` varchar(100)
,`nama_bahan` varchar(100)
,`nama_model` varchar(50)
,`ukuran` varchar(50)
,`warna` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_beli`
--

CREATE TABLE `transaksi_beli` (
  `id_beli` int(11) NOT NULL,
  `admin_id` varchar(10) NOT NULL,
  `identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_beli`
--

INSERT INTO `transaksi_beli` (`id_beli`, `admin_id`, `identifier`) VALUES
(1, '9990113', 'e61d40d037213380fa3e69877d2dd35c'),
(2, '9990113', '45ec290548f78d1c8f0d1cf9011b2d5a'),
(3, '9990113', 'cd96706fcdca185b450145123bc841db'),
(4, '9990113', '36c3934cf8465565ae4305de240c9ae2'),
(5, '9990113', '5cf058c3c4d28e0330e69425642d66d2'),
(6, '9990113', '689094c42ff650d294b2ceb84fa16a69'),
(7, '9990113', '683a485b01189785a929b38a38c9b9df'),
(8, '9990113', '09f15d301d04b9463e86d73bf2416b94'),
(9, '9990113', '620b0605bba0c25b82325e472e94d517'),
(10, '9990113', '3f69316b3103900ff9c58cd480896125'),
(11, '9990113', '3759aae88ccc98ab0f68e1ccd69bc2d3'),
(28, '9990113', 'ccb15cb4fea1516790befb44db2ee50a'),
(29, '9990113', '3a3bae28b02ef1c037a5ce1c71b3b9bb'),
(30, '9990113', '834b2ae2f9d99f4c5288fc6b8a7f652c'),
(31, '9990113', 'a2b70b4a6bd22766c556ebc1bf5028f7'),
(32, '9990113', 'b71867dc8646e9a553b566b39d4250c5'),
(33, '9990113', '78772787a9f71d709107aabfcfa6c8e4'),
(34, '9990113', 'ebe9444351d8a1bc496180271eeaad33'),
(35, '9990113', 'd24fbf83294eec99850161d3849a733a'),
(36, '9990113', '3914d251b4e22c94998069cc9df1078a');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_jual`
--

CREATE TABLE `transaksi_jual` (
  `id_jual` int(11) NOT NULL,
  `admin_id` varchar(10) NOT NULL,
  `identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_jual`
--

INSERT INTO `transaksi_jual` (`id_jual`, `admin_id`, `identifier`) VALUES
(1, '9990113', 'db7b971745cf6ed027e66338dc75b1de'),
(42, '9990113', 'a3beefcf29a247deacd0fe655b1a8a3c'),
(43, '9990113', '0f25fdbc422ac265af5a95ffb2da7281'),
(44, '9990113', 'd257f1eb27ab4a4ac162e8d03caf8a7e'),
(45, '9990113', '6f2da3ea882d28c48a950fea6677c884'),
(46, '9990113', '181bbadc2c883ed9ee74d88d9118babd'),
(47, '9990113', '67a4351a1c4802dae00724e9c32f70b5'),
(48, '9990113', '2ef524451b396de5560bdc73322fe7cf'),
(49, '9990113', '94c77e437557501720115d8cd6339a96'),
(50, '9990113', 'b4112a04c87deede9939fcc1dc5fd2f4'),
(51, '9990113', '7ac6389d2c05a2f3514a5ada5d018dd5'),
(52, '9990113', '1063c83bdf6ed3357d215051d289e17e'),
(53, '9990113', '29d44be4a8f4df3aeaf4805262cc746e'),
(54, '9990113', '92ee277a8f49a963503462740c24a473'),
(55, '9990113', '80ff105be3618c45d8ff4a92106c42ae'),
(56, '9990113', '9e494eac513a8f29e34259eb2b26f865'),
(57, '9990113', 'fefaf3c12ef97360a97dad871f0a8f85'),
(58, '9990113', 'bceab1ebadb9c3e16926e50975620a78'),
(59, '9990113', '1a923ba3ee23ab0df8f914d2c98e8c41'),
(60, '9990113', '2737d680bca1a6e051186411645c9109'),
(61, '9990113', 'c65b3e3a026816b9999a582bbdc6d81f'),
(62, '9990113', 'f73bea8cd1f183791046e7e05d6c60ee'),
(63, '9990113', 'be965de0294008121ebe79c4581491a2'),
(64, '9990113', '94203623e2746e25dd5288af3e2f266a'),
(65, '9990113', '4b5fa2bd1c4ff2baf461e608738f9194'),
(66, '9990113', '86b17a25d577d7e11602a8970128b388'),
(67, '9990113', '205d86d09a17dcd8dc56a0345124946c'),
(68, '9990113', '3385044707da00d61b709c8639e61995'),
(69, '9990113', 'dfc2921522cb94329776d6667ac5e418'),
(70, '9990113', '31789e9ef8872e9028450ad498b3509d'),
(71, '9990113', '539e77e3769f64c621803666a3ca5ccc'),
(72, '9990113', '6c6ea6941ecf4eb6c682792cb8810500'),
(73, '9990113', '07a3d73205e60014df65ef1ec8088b1e'),
(74, '9990113', '3aa2ca4c5a3585ca23a8619decc4d2a9'),
(75, '9990113', '3854ad6704d64babe77edf36f0dc5ead'),
(76, '9990113', 'c34e04be251b461b2c59d4e7dae8ceb6'),
(77, '9990113', 'f8f8f649c7f22d5ba0b8f6400a240c37'),
(78, '9990113', '881bead1323d0a7cc23bcc8afbf4c2d5'),
(79, '9990113', '2002a04f6cd57308db3b694538e95da6'),
(80, '9990113', '3b24a72d0bc726bb98e1bdb4da75e5d7'),
(81, '9990113', '51fff17ba9d1a3069633fde91f3eaaac'),
(82, '9990113', '15cc8f197bad2aa10b08b71bfd86db23'),
(83, '9990113', '3a648cf2b5bc8332b3ff5b6407c77696'),
(84, '9990113', '8a72410bf44316eb4adfc406f31710cc'),
(85, '9990113', 'ca225ece399cd7e0f1019bde723f1b20'),
(86, '9990113', '362d6d2ee31bf48f6a10c03d8038c54c'),
(87, '9990113', '81ca0d39bab65c85eb60d36c5441b167'),
(88, '9990113', '4ebefdc6872462ad7db5dcea91fb7cc0'),
(89, '9990113', '495174e0479c79ecf63da46ad18bb9a0'),
(90, '9990113', '1bff9200e034da948818a7a86ae0e985'),
(91, '9990113', '25c028f0f3aa6668c77cd95624d99e85'),
(92, '9990113', 'c6fb93401ff507a291bb62059e189828'),
(93, '9990113', '223128b1f7a5b5e18f627a08a5e8751e'),
(94, '9990113', 'b1da2c9193750c8e22eac999e10d338e'),
(95, '9990113', 'a9a4e5aacfd8bfa651fb2f63ef81e3d7'),
(96, '9990113', 'b9c9b83ad3e73020739e4296398e16dd'),
(97, '9990113', 'b78c0d8af4a8b61e0884a1198c28016c'),
(98, '9990113', '35570ce5aa4d0b789530caf7b9624d82'),
(99, '9990113', 'e56f2846f0186e5e6a513bfeb8b249ff'),
(100, '9990113', 'ba0d4540259435980b41f221d015de11'),
(101, '9990113', 'eba45ea12601d3cb24b2c499229bced0'),
(102, '9990113', '4ca803a383eef808b4842d207a728d92'),
(103, '9990113', '3968c4cae39d445a812bf5cbfa06f90b'),
(104, '9990113', 'd31f1aed13fab68cd37957368a3d1b69'),
(105, '9990113', '8a2eadb73046f8e01690765ff9d86b00'),
(106, '9990113', 'bb1e4c0e74cdb61546d0e477e1227a84'),
(107, '9990113', '7fe2d3465324b21fa313956552d52520'),
(108, '9990113', '99190389ce161d005226e849b212c41f'),
(109, '9990113', 'f5f253aa1dd647709a3fc4c8bf581ece'),
(110, '9990113', 'fbb8c33afef8677dcad3b05dff3d6ada'),
(111, '9990113', '7ceea299423eaaf542bb3af8123af493'),
(112, '9990113', 'e77830722a614b39a7c77bf92f1ead26'),
(113, '9990113', 'a32d1b6e314aecd135121d02ccf60865'),
(114, '9990113', '64abc337dcb7922f6c40605112d1d8be'),
(115, '9990113', 'd041f0c47c3b1b6485fb78532e50d29c'),
(116, '9990113', 'c28bfbaae86fe9f6fa2cdf2d3ae70016'),
(117, '9990113', '3b6372e6d581b96356526f51f8a7a249'),
(118, '9990113', 'f52ac36202492231409ad541c355f20c'),
(119, '9990113', 'ddc4c4ddbbd746d9fb5497c68db619d8'),
(120, '9990113', '80bf4eaa2e5c17dd445fb52cb742d4ed'),
(121, '9990113', '085b0a85a83e10f7d131c84e6ad5d475'),
(122, '9990113', 'b866e6c6bf98fbee7548e232a95ad316'),
(123, '9990113', '0176be46d46fb4917b16e8408da754ce'),
(124, '9990113', 'c80796983e8d9a3ae664736d4e5c5015'),
(125, '9990113', '1af843c36453afa07105c38ddbb20bbb'),
(126, '9990113', '9770509232d2ce6dd5058a20174ade65'),
(127, '9990113', '857a84fda847d949b3d0863344161980'),
(128, '9990113', '956d202c5f1210fd4252758045a7a801'),
(129, '9990113', '448917148e0cf6a504043454412f73ca'),
(130, '9990113', 'da5380cff78210c8b023d41fbfeede68'),
(131, '9990113', 'c96e7b026d5a0cf468c23d73a6bf2c7b'),
(132, '9990113', '9a7f57e96fe9a1ec1d787cebad18da09'),
(133, '9990113', '5025cfd8c008461ceeed360939c13926'),
(134, '9990113', 'b6da8e09508e17440beba30ca2b2020a'),
(135, '9990113', '5a5b8c2307b41d39c5623529d329cbd7'),
(136, '9990113', 'd7b27900134a5faf795614d0951d11ab'),
(137, '9990113', 'cd202571ec059fc857458547944f33c1'),
(138, '9990113', '23180e779c44a1159bb881724a933d3b'),
(139, '9990113', '6134e65f422b246306328452d6f4ebb0'),
(140, '9990113', 'c377d1d9115797f4892da8b6591fee9c'),
(141, '9990113', 'ef5f30eb39760700308cb5b5b779e5a6'),
(142, '9990113', 'd1786222ec5d6b2cfe9577c4f5af7aeb'),
(143, '9990113', 'ffb9565718c81e81450cb51cc782ffd0'),
(144, '9990113', 'a2b6a6bac36f0bde1aab9ebdd8cc81bf'),
(145, '9990113', 'f7aad51191784fd0a205c1772610504b'),
(146, '9990113', 'ec0d5043db8122ab7da7597ec1680975'),
(147, '9990113', '920acdd9b7167cb34a23e80023c0c35b'),
(148, '9990113', '524f4f6906ca9345aa8278877b3829e4'),
(149, '9990113', 'd3e338e001410908d29afaaab24e00fb'),
(150, '9990113', '1d0df8a3b59c83d5707c86c2c4ebd778'),
(151, '9990113', '104492378c73585638235baa40c49842'),
(152, '9990113', 'd034f83080f925805e4147fe2f1120d7'),
(153, '9990113', '4367e09889c4a7f68df6c9c1ca84467b'),
(154, '9990113', 'af83cf27c164416943e80b2bfcb2ac09'),
(155, '9990113', '6f4bcea4370d341193b0b1bf08616d75');

-- --------------------------------------------------------

--
-- Table structure for table `ukuran`
--

CREATE TABLE `ukuran` (
  `kode_ukuran` varchar(10) NOT NULL,
  `ukuran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ukuran`
--

INSERT INTO `ukuran` (`kode_ukuran`, `ukuran`) VALUES
('UHSK', '35cm'),
('UKSK', '30cm'),
('UNQB', '(45x35)cm'),
('UNQB01', '(40x30)cm'),
('USTD', 'Standar'),
('USTG', '25cm');

--
-- Triggers `ukuran`
--
DELIMITER $$
CREATE TRIGGER `ukuran_add` AFTER INSERT ON `ukuran` FOR EACH ROW insert into
 log_aktivitas values (concat('Penambahan data pada kode ukuran = ', new.kode_ukuran), concat('Memiliki ukuran ', new.ukuran), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ukuran_delete` AFTER DELETE ON `ukuran` FOR EACH ROW insert into
 log_aktivitas values (concat('Menghapus data pada kode ukuran = ', old.kode_ukuran), concat('Memiliki ukuran ', old.ukuran), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ukuran_update` AFTER UPDATE ON `ukuran` FOR EACH ROW insert into
 log_aktivitas values (concat('Perubahan data pada kode ukuran = ', new.kode_ukuran), concat('Memiliki ukuran ', new.ukuran), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `warna`
--

CREATE TABLE `warna` (
  `kode_warna` varchar(10) NOT NULL,
  `warna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warna`
--

INSERT INTO `warna` (`kode_warna`, `warna`) VALUES
('ABM', 'Abu Muda'),
('ABT', 'Abu Tua'),
('ABU', 'Abu-abu'),
('ARM', 'Army'),
('ARMD', 'Dark Army'),
('BBYP', 'Baby Pink'),
('BRU', 'Biru'),
('BRUD', 'Biru Dongker'),
('BRUE', 'Biru Elektrik'),
('BRUM', 'Biru Muda'),
('BRUT', 'Biru Tua'),
('CKLT', 'Coklat'),
('CKLTC', 'Coklat Cappucino'),
('CKLTM', 'Coklat Milo'),
('CKLTMC', 'Coklat Mocca'),
('CKLTMU', 'Coklat Muda'),
('CKLTS', 'Coklat Susu'),
('CKLTTU', 'Coklat Tua'),
('CRL', 'Coral'),
('CRM', 'Cream'),
('DSTP', 'Dusty Pink'),
('HJML', 'Hijau Melon'),
('HJU', 'Hijau'),
('HJUT', 'Hijau Tua'),
('HJUU', 'Hijau'),
('HTM', 'Hitam'),
('HTSC', 'Hijau Tosca'),
('HTSCM', 'Hijau Tosca Muda'),
('HTSCT', 'Hijau Tosca Tua'),
('KNG', 'Kuning'),
('KNGL', 'Kuning Lime'),
('LVD', 'Lavender'),
('MGT', 'Magenta'),
('MRH', 'Merah'),
('MRHB', 'Merah Bata'),
('MRHHT', 'Merah Hati'),
('MRHM', 'Merah Muda'),
('MRN', 'Maroon'),
('MTD', 'Mustard'),
('MXD', 'Mixed'),
('NVY', 'Navy'),
('PCH', 'Peach'),
('PTH', 'Putih'),
('RSEP', 'Rose Pink'),
('SLMP', 'Pink Salem'),
('SLV', 'Silver'),
('UGU', 'Ungu'),
('UGUT', 'Ungu Terong'),
('UGUTU', 'Ungu Tua');

--
-- Triggers `warna`
--
DELIMITER $$
CREATE TRIGGER `warna_add` AFTER INSERT ON `warna` FOR EACH ROW insert into
 log_aktivitas values (concat('Penambahan data pada kode warna = ', new.kode_warna), concat('Memiliki warna ', new.warna), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `warna_delete` AFTER DELETE ON `warna` FOR EACH ROW insert into
 log_aktivitas values (concat('Menghapus data pada kode warna = ', old.kode_warna), concat('Memiliki warna ', old.warna), now(), CURRENT_USER)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `warna_update` AFTER UPDATE ON `warna` FOR EACH ROW insert into
 log_aktivitas values (concat('Perubahan data pada kode warna = ', new.kode_warna), concat('Memiliki warna ', new.warna), now(), CURRENT_USER)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `getstok`
--
DROP TABLE IF EXISTS `getstok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getstok`  AS  select `barang`.`kode_barang` AS `kode_barang`,`barang`.`nama_barang` AS `nama_barang`,`warna`.`warna` AS `warna`,`detail_barang`.`kode_bahan` AS `bahan`,`detail_barang`.`jumlah` AS `jumlah` from ((`barang` join `warna`) join `detail_barang`) where ((`barang`.`kode_barang` = `detail_barang`.`kode_barang`) and (`warna`.`kode_warna` = `detail_barang`.`kode_warna`)) ;

-- --------------------------------------------------------

--
-- Structure for view `listpembelian`
--
DROP TABLE IF EXISTS `listpembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listpembelian`  AS  select `detail_transaksi_beli`.`tgl_beli` AS `tgl_beli`,`detail_transaksi_beli`.`nama_penjual` AS `nama_penjual`,sum(`detail_transaksi_beli`.`jlh_barang`) AS `jlh_barang`,sum((`detail_transaksi_beli`.`jlh_barang` * `detail_transaksi_beli`.`harga_beli`)) AS `jumlah_keseluruhan` from `detail_transaksi_beli` group by `detail_transaksi_beli`.`id_beli` ;

-- --------------------------------------------------------

--
-- Structure for view `listpenjualan`
--
DROP TABLE IF EXISTS `listpenjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listpenjualan`  AS  select `detail_transaksi_jual`.`tgl_jual` AS `tgl_jual`,`detail_transaksi_jual`.`nama_pembeli` AS `nama_pembeli`,sum(`detail_transaksi_jual`.`jlh_barang`) AS `jlh_barang`,sum((`detail_transaksi_jual`.`jlh_barang` * `detail_transaksi_jual`.`harga_jual`)) AS `jumlah_keseluruhan` from `detail_transaksi_jual` group by `detail_transaksi_jual`.`id_jual` ;

-- --------------------------------------------------------

--
-- Structure for view `log_beli`
--
DROP TABLE IF EXISTS `log_beli`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `log_beli`  AS  select `log_transaksi_beli`.`perihal` AS `perihal`,`log_transaksi_beli`.`detail` AS `detail`,`log_transaksi_beli`.`waktu` AS `waktu`,`transaksi_beli`.`admin_id` AS `admin_id` from (`log_transaksi_beli` join `transaksi_beli`) where (`log_transaksi_beli`.`id_beli` = `transaksi_beli`.`id_beli`) ;

-- --------------------------------------------------------

--
-- Structure for view `log_jual`
--
DROP TABLE IF EXISTS `log_jual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `log_jual`  AS  select `log_transaksi_jual`.`perihal` AS `perihal`,`log_transaksi_jual`.`detail` AS `detail`,`log_transaksi_jual`.`waktu` AS `waktu`,`transaksi_jual`.`admin_id` AS `admin_id` from (`log_transaksi_jual` join `transaksi_jual`) where (`log_transaksi_jual`.`id_jual` = `transaksi_jual`.`id_jual`) ;

-- --------------------------------------------------------

--
-- Structure for view `qbarangbeli`
--
DROP TABLE IF EXISTS `qbarangbeli`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qbarangbeli`  AS  select (`detail_transaksi_beli`.`jlh_barang` * `detail_transaksi_beli`.`harga_beli`) AS `total`,`detail_transaksi_beli`.`nama_penjual` AS `nama_penjual`,`detail_transaksi_beli`.`tgl_beli` AS `tgl_beli`,`detail_transaksi_beli`.`jlh_barang` AS `jlh_barang`,`detail_transaksi_beli`.`harga_beli` AS `harga_beli`,`barang`.`nama_barang` AS `nama_barang`,`detail_bahan`.`nama_bahan` AS `nama_bahan`,`model_barang`.`nama_model` AS `nama_model`,`ukuran`.`ukuran` AS `ukuran`,`warna`.`warna` AS `warna` from (((((`detail_transaksi_beli` join `barang`) join `detail_bahan`) join `model_barang`) join `ukuran`) join `warna`) where ((`detail_transaksi_beli`.`kode_barang` = `barang`.`kode_barang`) and (`detail_transaksi_beli`.`kode_bahan` = `detail_bahan`.`kode_bahan`) and (`detail_transaksi_beli`.`kode_model` = `model_barang`.`kode_model`) and (`detail_transaksi_beli`.`kode_ukuran` = `ukuran`.`kode_ukuran`) and (`detail_transaksi_beli`.`kode_warna` = `warna`.`kode_warna`)) ;

-- --------------------------------------------------------

--
-- Structure for view `qbarangjual`
--
DROP TABLE IF EXISTS `qbarangjual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qbarangjual`  AS  select (`detail_transaksi_jual`.`jlh_barang` * `detail_transaksi_jual`.`harga_jual`) AS `total`,`detail_transaksi_jual`.`nama_pembeli` AS `nama_pembeli`,`detail_transaksi_jual`.`tgl_jual` AS `tgl_jual`,`detail_transaksi_jual`.`jlh_barang` AS `jlh_barang`,`detail_transaksi_jual`.`harga_jual` AS `harga_jual`,`barang`.`nama_barang` AS `nama_barang`,`detail_bahan`.`nama_bahan` AS `nama_bahan`,`model_barang`.`nama_model` AS `nama_model`,`ukuran`.`ukuran` AS `ukuran`,`warna`.`warna` AS `warna` from (((((`detail_transaksi_jual` join `barang`) join `detail_bahan`) join `model_barang`) join `ukuran`) join `warna`) where ((`detail_transaksi_jual`.`kode_barang` = `barang`.`kode_barang`) and (`detail_transaksi_jual`.`kode_bahan` = `detail_bahan`.`kode_bahan`) and (`detail_transaksi_jual`.`kode_model` = `model_barang`.`kode_model`) and (`detail_transaksi_jual`.`kode_ukuran` = `ukuran`.`kode_ukuran`) and (`detail_transaksi_jual`.`kode_warna` = `warna`.`kode_warna`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `detail_bahan`
--
ALTER TABLE `detail_bahan`
  ADD PRIMARY KEY (`kode_bahan`);

--
-- Indexes for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `detail_barang_ibfk_2` (`kode_model`),
  ADD KEY `detail_barang_ibfk_3` (`kode_ukuran`),
  ADD KEY `detail_barang_ibfk_4` (`kode_warna`),
  ADD KEY `detail_barang_ibfk_5` (`kode_bahan`);

--
-- Indexes for table `detail_transaksi_beli`
--
ALTER TABLE `detail_transaksi_beli`
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `transaksi_beli_ibfk_3` (`kode_warna`),
  ADD KEY `transaksi_beli_ibfk_4` (`kode_bahan`),
  ADD KEY `transaksi_beli_ibfk_5` (`kode_model`),
  ADD KEY `transaksi_beli_ibfk_6` (`kode_ukuran`),
  ADD KEY `detail_transaksi_beli_ibfk_2` (`id_beli`);

--
-- Indexes for table `detail_transaksi_jual`
--
ALTER TABLE `detail_transaksi_jual`
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `transaksi_jual_ibfk_3` (`kode_warna`),
  ADD KEY `transaksi_jual_ibfk_4` (`kode_bahan`),
  ADD KEY `transaksi_jual_ibfk_5` (`kode_model`),
  ADD KEY `transaksi_jual_ibfk_6` (`kode_ukuran`),
  ADD KEY `detail_transaksi_jual_ibfk_2` (`id_jual`);

--
-- Indexes for table `model_barang`
--
ALTER TABLE `model_barang`
  ADD PRIMARY KEY (`kode_model`);

--
-- Indexes for table `transaksi_beli`
--
ALTER TABLE `transaksi_beli`
  ADD PRIMARY KEY (`id_beli`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `transaksi_jual`
--
ALTER TABLE `transaksi_jual`
  ADD PRIMARY KEY (`id_jual`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `ukuran`
--
ALTER TABLE `ukuran`
  ADD PRIMARY KEY (`kode_ukuran`);

--
-- Indexes for table `warna`
--
ALTER TABLE `warna`
  ADD PRIMARY KEY (`kode_warna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi_beli`
--
ALTER TABLE `transaksi_beli`
  MODIFY `id_beli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `transaksi_jual`
--
ALTER TABLE `transaksi_jual`
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD CONSTRAINT `detail_barang_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_barang_ibfk_2` FOREIGN KEY (`kode_model`) REFERENCES `model_barang` (`kode_model`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_barang_ibfk_3` FOREIGN KEY (`kode_ukuran`) REFERENCES `ukuran` (`kode_ukuran`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_barang_ibfk_4` FOREIGN KEY (`kode_warna`) REFERENCES `warna` (`kode_warna`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_barang_ibfk_5` FOREIGN KEY (`kode_bahan`) REFERENCES `detail_bahan` (`kode_bahan`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_transaksi_beli`
--
ALTER TABLE `detail_transaksi_beli`
  ADD CONSTRAINT `detail_transaksi_beli_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_beli_ibfk_2` FOREIGN KEY (`id_beli`) REFERENCES `transaksi_beli` (`id_beli`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_beli_ibfk_3` FOREIGN KEY (`kode_warna`) REFERENCES `warna` (`kode_warna`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_beli_ibfk_4` FOREIGN KEY (`kode_bahan`) REFERENCES `detail_bahan` (`kode_bahan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_beli_ibfk_5` FOREIGN KEY (`kode_model`) REFERENCES `model_barang` (`kode_model`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_beli_ibfk_6` FOREIGN KEY (`kode_ukuran`) REFERENCES `ukuran` (`kode_ukuran`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_transaksi_jual`
--
ALTER TABLE `detail_transaksi_jual`
  ADD CONSTRAINT `detail_transaksi_jual_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_jual_ibfk_2` FOREIGN KEY (`id_jual`) REFERENCES `transaksi_jual` (`id_jual`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_jual_ibfk_3` FOREIGN KEY (`kode_warna`) REFERENCES `warna` (`kode_warna`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_jual_ibfk_4` FOREIGN KEY (`kode_bahan`) REFERENCES `detail_bahan` (`kode_bahan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_jual_ibfk_5` FOREIGN KEY (`kode_model`) REFERENCES `model_barang` (`kode_model`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_jual_ibfk_6` FOREIGN KEY (`kode_ukuran`) REFERENCES `ukuran` (`kode_ukuran`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_beli`
--
ALTER TABLE `transaksi_beli`
  ADD CONSTRAINT `transaksi_beli_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`ID_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_jual`
--
ALTER TABLE `transaksi_jual`
  ADD CONSTRAINT `transaksi_jual_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`ID_admin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
