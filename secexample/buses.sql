-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Mrz 2019 um 14:38
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
-- Datenbank: `buses`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bus`
--

CREATE TABLE `bus` (
  `bus_Id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `fk_driver` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bus_stop`
--

CREATE TABLE `bus_stop` (
  `bus_stop_id` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `fk_city_id` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `fk_route` varchar(50) DEFAULT NULL,
  `fk_bus_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `fk_bus_stop` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `drivers`
--

INSERT INTO `drivers` (`driver_id`, `age`, `phone`, `name`, `address`) VALUES
(1, 25, 688765435, 'Anes', 'leopold-moses 5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `distance` int(11) DEFAULT NULL,
  `fk_bus_stop` int(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `source1` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_Id`),
  ADD KEY `fk_driver` (`fk_driver`);

--
-- Indizes für die Tabelle `bus_stop`
--
ALTER TABLE `bus_stop`
  ADD PRIMARY KEY (`bus_stop_id`),
  ADD KEY `fk_city_id` (`fk_city_id`);

--
-- Indizes für die Tabelle `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `fk_bus_id` (`fk_bus_id`);

--
-- Indizes für die Tabelle `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_bus_stop` (`fk_bus_stop`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`fk_driver`) REFERENCES `drivers` (`driver_id`);

--
-- Constraints der Tabelle `bus_stop`
--
ALTER TABLE `bus_stop`
  ADD CONSTRAINT `bus_stop_ibfk_1` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints der Tabelle `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_Id`);

--
-- Constraints der Tabelle `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`fk_bus_stop`) REFERENCES `bus_stop` (`bus_stop_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
