-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Mrz 2019 um 14:34
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `healthcare`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Catagory`
--

CREATE TABLE `Catagory` (
  `Category_ID` int(11) NOT NULL,
  `Doctor_Num` int(11) DEFAULT NULL,
  `Floor_Num` int(11) DEFAULT NULL,
  `Specialization_Name` varchar(55) DEFAULT NULL,
  `Illness_Name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Doctor`
--

CREATE TABLE `Doctor` (
  `Doctor_Num` int(11) NOT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  `Doctor_Name` varchar(55) DEFAULT NULL,
  `Doctor_Email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hospital`
--

CREATE TABLE `hospital` (
  `Doctor_ID` int(11) NOT NULL,
  `Adress` varchar(55) DEFAULT NULL,
  `Phone_Num` int(11) DEFAULT NULL,
  `Specialization_Name` varchar(55) DEFAULT NULL,
  `Patient_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `medicalDescription`
--

CREATE TABLE `medicalDescription` (
  `medical_Num` int(11) NOT NULL,
  `Illness_Name` varchar(55) DEFAULT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Report_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Patient`
--

CREATE TABLE `Patient` (
  `Patient_ID` int(11) NOT NULL,
  `Patient_Name` varchar(55) DEFAULT NULL,
  `Insurance_Num` int(11) DEFAULT NULL,
  `Patient_Date` date DEFAULT NULL,
  `Patient_Address` varchar(55) DEFAULT NULL,
  `Patient_Num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Patient`
--

INSERT INTO `Patient` (`Patient_ID`, `Patient_Name`, `Insurance_Num`, `Patient_Date`, `Patient_Address`, `Patient_Num`) VALUES
(1001, 'Anes Smajic', 2147483647, '1991-03-25', 'Grimmgasse 8/8 1150 Wien', 660378170);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Report`
--

CREATE TABLE `Report` (
  `Report_Num` int(11) NOT NULL,
  `Description` text,
  `Doctor_Num` int(11) DEFAULT NULL,
  `Illness_Name` varchar(55) DEFAULT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Floor_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Transaction`
--

CREATE TABLE `Transaction` (
  `Floor_Num` int(11) NOT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  `Patient_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Catagory`
--
ALTER TABLE `Catagory`
  ADD PRIMARY KEY (`Category_ID`),
  ADD KEY `Doctor_Num` (`Doctor_Num`),
  ADD KEY `Floor_Num` (`Floor_Num`);

--
-- Indizes für die Tabelle `Doctor`
--
ALTER TABLE `Doctor`
  ADD PRIMARY KEY (`Doctor_Num`),
  ADD KEY `Doctor_ID` (`Doctor_ID`);

--
-- Indizes für die Tabelle `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`Doctor_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indizes für die Tabelle `medicalDescription`
--
ALTER TABLE `medicalDescription`
  ADD PRIMARY KEY (`medical_Num`),
  ADD KEY `Report_Num` (`Report_Num`);

--
-- Indizes für die Tabelle `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Indizes für die Tabelle `Report`
--
ALTER TABLE `Report`
  ADD PRIMARY KEY (`Report_Num`),
  ADD KEY `Doctor_Num` (`Doctor_Num`);

--
-- Indizes für die Tabelle `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`Floor_Num`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Catagory`
--
ALTER TABLE `Catagory`
  ADD CONSTRAINT `Catagory_ibfk_1` FOREIGN KEY (`Floor_Num`) REFERENCES `Transaction` (`Floor_Num`),
  ADD CONSTRAINT `Catagory_ibfk_2` FOREIGN KEY (`Doctor_Num`) REFERENCES `Doctor` (`Doctor_Num`),
  ADD CONSTRAINT `Catagory_ibfk_3` FOREIGN KEY (`Floor_Num`) REFERENCES `Transaction` (`Floor_Num`);

--
-- Constraints der Tabelle `Doctor`
--
ALTER TABLE `Doctor`
  ADD CONSTRAINT `Doctor_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `hospital` (`Doctor_ID`);

--
-- Constraints der Tabelle `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`);

--
-- Constraints der Tabelle `medicalDescription`
--
ALTER TABLE `medicalDescription`
  ADD CONSTRAINT `medicalDescription_ibfk_1` FOREIGN KEY (`Report_Num`) REFERENCES `Report` (`Report_Num`);

--
-- Constraints der Tabelle `Report`
--
ALTER TABLE `Report`
  ADD CONSTRAINT `Report_ibfk_1` FOREIGN KEY (`Doctor_Num`) REFERENCES `Catagory` (`Doctor_Num`);

--
-- Constraints der Tabelle `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
