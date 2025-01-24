-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2023 at 04:00 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sin-nilai`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_absensi`
--

CREATE TABLE `tb_absensi` (
  `id_absensi` int(15) NOT NULL,
  `nisn` int(11) NOT NULL,
  `sakit` int(11) NOT NULL,
  `ijin` int(11) NOT NULL,
  `tanpa_keterangan` int(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
--

CREATE TABLE `tb_guru` (
  `nip` int(11) NOT NULL,
  `id_kelas` varchar(20) NOT NULL,
  `nama_guru` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `status` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori_kelas`
--

CREATE TABLE `tb_kategori_kelas` (
  `id_kategoriK` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori_kelas`
--

INSERT INTO `tb_kategori_kelas` (`id_kategoriK`, `nama_kategori`) VALUES
(1, 'IPA'),
(2, 'IPS'),
(3, 'MIPA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` varchar(20) NOT NULL,
  `nip` int(11) NOT NULL,
  `id_kategoriK` int(11) NOT NULL,
  `nama_kelas` varchar(255) NOT NULL,
  `jumlah_siswa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nip`, `id_kategoriK`, `nama_kelas`, `jumlah_siswa`) VALUES
('1', 232343, 1, 'IPA 1', 23);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id_mapel` int(11) NOT NULL,
  `nama_mapel` varchar(200) NOT NULL,
  `kkm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mapel`
--

INSERT INTO `tb_mapel` (`id_mapel`, `nama_mapel`, `kkm`) VALUES
(1, 'Alqur\'an Hadist', 62),
(2, 'Tarikh', 62),
(3, 'Fikih', 62),
(4, 'Matematika', 62),
(5, 'Biologi', 62),
(6, 'Sejarah', 62),
(7, 'Kimia', 62),
(8, 'Bahasa Inggris', 62),
(9, 'Fisika', 62);

-- --------------------------------------------------------

--
-- Table structure for table `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` int(11) NOT NULL,
  `nisn` int(11) NOT NULL,
  `nip` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `nilai` int(11) NOT NULL DEFAULT 0,
  `predikat_nilai` varchar(1) DEFAULT '-',
  `tugas` int(11) NOT NULL DEFAULT 0,
  `predikat_tugas` varchar(1) NOT NULL DEFAULT '-',
  `uts` int(11) NOT NULL DEFAULT 0,
  `predikat_uts` varchar(1) NOT NULL DEFAULT '-',
  `uas` int(11) NOT NULL DEFAULT 0,
  `predikat_uas` varchar(1) NOT NULL DEFAULT '-',
  `sikap` varchar(2) NOT NULL DEFAULT '-',
  `kompetensi` varchar(2) NOT NULL DEFAULT '-',
  `keterampilan` varchar(2) NOT NULL DEFAULT '-',
  `catatan` text NOT NULL,
  `tahun_ajaran` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengembangan_diri`
--

CREATE TABLE `tb_pengembangan_diri` (
  `id_pengembangan` int(11) NOT NULL,
  `jenis_kegiatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_semester`
--

CREATE TABLE `tb_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_semester`
--

INSERT INTO `tb_semester` (`id_semester`, `semester`) VALUES
(1, 'ganjil'),
(2, 'genap');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nisn` int(11) NOT NULL,
  `id_kelas` varchar(20) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `agama` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(12) NOT NULL,
  `telepon` varchar(18) NOT NULL,
  `tempat_lahir` varchar(200) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `no_kk` int(11) NOT NULL,
  `nama_ayah` varchar(200) NOT NULL DEFAULT '-',
  `nama_ibu` varchar(200) NOT NULL DEFAULT '-',
  `tahun_ajaran` varchar(20) NOT NULL,
  `penilaian` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD PRIMARY KEY (`id_absensi`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `tb_kategori_kelas`
--
ALTER TABLE `tb_kategori_kelas`
  ADD PRIMARY KEY (`id_kategoriK`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `tb_pengembangan_diri`
--
ALTER TABLE `tb_pengembangan_diri`
  ADD PRIMARY KEY (`id_pengembangan`);

--
-- Indexes for table `tb_semester`
--
ALTER TABLE `tb_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nisn`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  MODIFY `id_absensi` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_kategori_kelas`
--
ALTER TABLE `tb_kategori_kelas`
  MODIFY `id_kategoriK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `tb_pengembangan_diri`
--
ALTER TABLE `tb_pengembangan_diri`
  MODIFY `id_pengembangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
