-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2016 at 07:04 AM
-- Server version: 5.7.10-log
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_gereja`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `Adm_Id` int(11) NOT NULL,
  `Adm_Username` varchar(100) DEFAULT NULL,
  `Adm_Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`Adm_Id`, `Adm_Username`, `Adm_Password`) VALUES
(1, 'Admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_besuk`
--

CREATE TABLE `tbl_besuk` (
  `Bes_Id` int(11) NOT NULL,
  `Bes_IdJemaat` int(11) NOT NULL,
  `Bes_Tanggal` date DEFAULT NULL,
  `Bes_Jam` varchar(10) DEFAULT NULL,
  `Bes_Keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_besuk`
--

INSERT INTO `tbl_besuk` (`Bes_Id`, `Bes_IdJemaat`, `Bes_Tanggal`, `Bes_Jam`, `Bes_Keterangan`) VALUES
(1, 1, '2016-08-09', '07:00 wib', '- Tolong Bawa alkitab<br>\r\n- kumpul di gereja sebelum berangkat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hambatuhan`
--

CREATE TABLE `tbl_hambatuhan` (
  `Hat_Id` int(11) NOT NULL,
  `Hat_Nama` varchar(100) DEFAULT NULL,
  `Hat_NomorTelepon` varchar(20) DEFAULT NULL,
  `Hat_Jabatan` varchar(100) DEFAULT NULL,
  `Hat_Foto` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_hambatuhan`
--

INSERT INTO `tbl_hambatuhan` (`Hat_Id`, `Hat_Nama`, `Hat_NomorTelepon`, `Hat_Jabatan`, `Hat_Foto`) VALUES
(1, 'Yohanes Leonaruds.STh', '0853278455', 'Gembala', 'hamba1.jpg'),
(2, 'Markus Lailon', '08483834834', 'Hamba Tuhan', 'hamba2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jadwalibadah`
--

CREATE TABLE `tbl_jadwalibadah` (
  `Jib_Id` int(11) NOT NULL,
  `Jib_Ibadah` varchar(100) DEFAULT NULL,
  `Jib_Tanggal` date DEFAULT NULL,
  `Jib_Waktu` varchar(50) DEFAULT NULL,
  `Jib_Pengkhotbah` varchar(100) DEFAULT NULL,
  `Jib_Tema` varchar(100) DEFAULT NULL,
  `Jib_Liturgi` varchar(100) DEFAULT NULL,
  `Jib_Pemusik` varchar(100) DEFAULT NULL,
  `Jib_Penyambut` varchar(100) DEFAULT NULL,
  `Jib_Kolekte` varchar(100) DEFAULT NULL,
  `Jib_Penerjemah` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jemaat`
--

CREATE TABLE `tbl_jemaat` (
  `Jem_Id` int(11) NOT NULL,
  `Jem_IdKelurahan` int(11) NOT NULL,
  `Jem_Nama` varchar(100) DEFAULT NULL,
  `Jem_TanggalLahir` date DEFAULT NULL,
  `Jem_JenisKelamin` enum('Perumpuan','Laki-Laki') DEFAULT NULL,
  `Jem_Alamat` text,
  `Jem_NomorTelepon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_jemaat`
--

INSERT INTO `tbl_jemaat` (`Jem_Id`, `Jem_IdKelurahan`, `Jem_Nama`, `Jem_TanggalLahir`, `Jem_JenisKelamin`, `Jem_Alamat`, `Jem_NomorTelepon`) VALUES
(1, 1, 'Agustian Lee', '1988-01-06', 'Laki-Laki', 'Jalan Raya Grogol no 17', '08532567783'),
(2, 1, 'Albertus Tanuii', '1996-08-01', 'Laki-Laki', 'Parang Bengkok Rt 7 Rw 8 No 19', '0836262622');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kabupaten`
--

CREATE TABLE `tbl_kabupaten` (
  `Kab_Id` int(11) NOT NULL,
  `Kab_IdProvinsi` int(11) NOT NULL,
  `Kab_Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kabupaten`
--

INSERT INTO `tbl_kabupaten` (`Kab_Id`, `Kab_IdProvinsi`, `Kab_Nama`) VALUES
(1, 1, 'Jakarta Barat'),
(2, 1, 'Jakarta Timur'),
(5, 1, 'Jakarta Selatan'),
(6, 1, 'Jakarta Pusat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kecamatan`
--

CREATE TABLE `tbl_kecamatan` (
  `Kec_Id` int(11) NOT NULL,
  `Kec_IdKabupaten` int(11) NOT NULL,
  `Kec_Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kecamatan`
--

INSERT INTO `tbl_kecamatan` (`Kec_Id`, `Kec_IdKabupaten`, `Kec_Nama`) VALUES
(1, 1, 'Grogol'),
(2, 1, 'Jelambar');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelurahan`
--

CREATE TABLE `tbl_kelurahan` (
  `Kel_Id` int(11) NOT NULL,
  `Kel_IdKecamatan` int(11) NOT NULL,
  `Kel_Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_kelurahan`
--

INSERT INTO `tbl_kelurahan` (`Kel_Id`, `Kel_IdKecamatan`, `Kel_Nama`) VALUES
(1, 1, 'Petamburan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengumuman`
--

CREATE TABLE `tbl_pengumuman` (
  `Peng_Id` int(11) NOT NULL,
  `Peng_Judul` varchar(100) DEFAULT NULL,
  `Peng_Tempat` varchar(100) DEFAULT NULL,
  `Peng_Tanggal` date DEFAULT NULL,
  `Peng_Waktu` time DEFAULT NULL,
  `Peng_Keterangan` text,
  `Peng_Foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_pengumuman`
--

INSERT INTO `tbl_pengumuman` (`Peng_Id`, `Peng_Judul`, `Peng_Tempat`, `Peng_Tanggal`, `Peng_Waktu`, `Peng_Keterangan`, `Peng_Foto`) VALUES
(1, 'Doa Bersama', 'Jakarta Barat', '2016-08-01', '07:03:00', 'Doa bersama dalam rangka menyambut hari pentakosta, di harapkan kehadiran semua jemaat GKJ baik anggota jemaat maupun simpatisan.', 'noimage.jpg'),
(2, 'Ibadah Padang', 'Ancol Jakarta', '2016-08-09', '04:00:00', 'Ibadah padang rayaqwertyy di ancol', 'noimage.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_provinsi`
--

CREATE TABLE `tbl_provinsi` (
  `Pro_Id` int(11) NOT NULL,
  `Pro_Nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_provinsi`
--

INSERT INTO `tbl_provinsi` (`Pro_Id`, `Pro_Nama`) VALUES
(1, 'DKI JAKARTA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_renungan`
--

CREATE TABLE `tbl_renungan` (
  `Ren_Id` int(11) NOT NULL,
  `Ren_Judul` varchar(100) DEFAULT NULL,
  `Ren_NatsAlkitab` varchar(100) DEFAULT NULL,
  `Ren_Isi` text,
  `Ren_Foto` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_renungan`
--

INSERT INTO `tbl_renungan` (`Ren_Id`, `Ren_Judul`, `Ren_NatsAlkitab`, `Ren_Isi`, `Ren_Foto`) VALUES
(1, 'Anak Yang Hilang', 'Lukas 10 : 1 - 20', 'Anak Yang Hilang Anak Yang Hilang Anak Yang Hilang Anak Yang Hilang Anak Yang Hilang Anak Yang Hilang Anak Yang Hilang', 'anakhilang.jpg'),
(2, 'Iman Sebesar Sebiji Sawi Sawi Sawi Sawi Sawi Sawi Sawi', 'Yohanes 20 : 1 - 13', 'Iman Sebesar Sebiji Sawi Iman Sebesar Sebiji Sawi Iman Sebesar Sebiji Sawi Iman Sebesar Sebiji Sawi Iman Sebesar Sebiji Sawi Iman Sebesar Sebiji Sawi Iman Sebesar Sebiji Sawi Iman Sebesar Sebiji Sawi', 'bijisesawi.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`Adm_Id`);

--
-- Indexes for table `tbl_besuk`
--
ALTER TABLE `tbl_besuk`
  ADD PRIMARY KEY (`Bes_Id`),
  ADD KEY `Bes_IdJemaat` (`Bes_IdJemaat`);

--
-- Indexes for table `tbl_hambatuhan`
--
ALTER TABLE `tbl_hambatuhan`
  ADD PRIMARY KEY (`Hat_Id`);

--
-- Indexes for table `tbl_jadwalibadah`
--
ALTER TABLE `tbl_jadwalibadah`
  ADD PRIMARY KEY (`Jib_Id`);

--
-- Indexes for table `tbl_jemaat`
--
ALTER TABLE `tbl_jemaat`
  ADD PRIMARY KEY (`Jem_Id`),
  ADD KEY `Jem_IdKelurahan` (`Jem_IdKelurahan`);

--
-- Indexes for table `tbl_kabupaten`
--
ALTER TABLE `tbl_kabupaten`
  ADD PRIMARY KEY (`Kab_Id`),
  ADD KEY `Kab_IdProvinsi` (`Kab_IdProvinsi`);

--
-- Indexes for table `tbl_kecamatan`
--
ALTER TABLE `tbl_kecamatan`
  ADD PRIMARY KEY (`Kec_Id`),
  ADD KEY `Kec_IdKabupaten` (`Kec_IdKabupaten`);

--
-- Indexes for table `tbl_kelurahan`
--
ALTER TABLE `tbl_kelurahan`
  ADD PRIMARY KEY (`Kel_Id`),
  ADD KEY `Kel_IdKecamatan` (`Kel_IdKecamatan`);

--
-- Indexes for table `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  ADD PRIMARY KEY (`Peng_Id`);

--
-- Indexes for table `tbl_provinsi`
--
ALTER TABLE `tbl_provinsi`
  ADD PRIMARY KEY (`Pro_Id`);

--
-- Indexes for table `tbl_renungan`
--
ALTER TABLE `tbl_renungan`
  ADD PRIMARY KEY (`Ren_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `Adm_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_besuk`
--
ALTER TABLE `tbl_besuk`
  MODIFY `Bes_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_hambatuhan`
--
ALTER TABLE `tbl_hambatuhan`
  MODIFY `Hat_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_jadwalibadah`
--
ALTER TABLE `tbl_jadwalibadah`
  MODIFY `Jib_Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_jemaat`
--
ALTER TABLE `tbl_jemaat`
  MODIFY `Jem_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_kabupaten`
--
ALTER TABLE `tbl_kabupaten`
  MODIFY `Kab_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_kecamatan`
--
ALTER TABLE `tbl_kecamatan`
  MODIFY `Kec_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_kelurahan`
--
ALTER TABLE `tbl_kelurahan`
  MODIFY `Kel_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  MODIFY `Peng_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_provinsi`
--
ALTER TABLE `tbl_provinsi`
  MODIFY `Pro_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_renungan`
--
ALTER TABLE `tbl_renungan`
  MODIFY `Ren_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_besuk`
--
ALTER TABLE `tbl_besuk`
  ADD CONSTRAINT `tbl_besuk_ibfk_1` FOREIGN KEY (`Bes_IdJemaat`) REFERENCES `tbl_jemaat` (`Jem_Id`);

--
-- Constraints for table `tbl_jemaat`
--
ALTER TABLE `tbl_jemaat`
  ADD CONSTRAINT `tbl_jemaat_ibfk_1` FOREIGN KEY (`Jem_IdKelurahan`) REFERENCES `tbl_kelurahan` (`Kel_Id`);

--
-- Constraints for table `tbl_kabupaten`
--
ALTER TABLE `tbl_kabupaten`
  ADD CONSTRAINT `tbl_kabupaten_ibfk_1` FOREIGN KEY (`Kab_IdProvinsi`) REFERENCES `tbl_provinsi` (`Pro_Id`);

--
-- Constraints for table `tbl_kecamatan`
--
ALTER TABLE `tbl_kecamatan`
  ADD CONSTRAINT `tbl_kecamatan_ibfk_1` FOREIGN KEY (`Kec_IdKabupaten`) REFERENCES `tbl_kabupaten` (`Kab_Id`);

--
-- Constraints for table `tbl_kelurahan`
--
ALTER TABLE `tbl_kelurahan`
  ADD CONSTRAINT `tbl_kelurahan_ibfk_1` FOREIGN KEY (`Kel_IdKecamatan`) REFERENCES `tbl_kecamatan` (`Kec_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
