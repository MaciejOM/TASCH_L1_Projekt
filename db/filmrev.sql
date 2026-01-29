-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 27, 2026 at 02:53 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `filmrev`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `rok` date DEFAULT NULL,
  `overview` varchar(1000) DEFAULT NULL,
  `plakat` varchar(200) DEFAULT NULL,
  `backdrop` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunki`
--

CREATE TABLE `gatunki` (
  `id` int(11) NOT NULL,
  `gatunek` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunki_filmu`
--

CREATE TABLE `gatunki_filmu` (
  `id` int(11) NOT NULL,
  `id_filmu` int(11) DEFAULT NULL,
  `id_gatunku` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recenzje`
--

CREATE TABLE `recenzje` (
  `id` int(11) NOT NULL,
  `id_filmy` int(11) DEFAULT NULL,
  `id_uzytkownika` int(11) DEFAULT NULL,
  `tresc` text DEFAULT NULL,
  `ocena` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `ID` int(11) NOT NULL,
  `nazwa_uzytkownika` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `haslo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok_filmy`
-- (See below for the actual view)
--
CREATE TABLE `widok_filmy` (
`id_filmu` int(11)
,`tloFilmu` varchar(200)
,`plakat` varchar(200)
,`nazwa` varchar(50)
,`rok` date
,`gatunki` mediumtext
,`opis` varchar(1000)
,`srednia_ocen` decimal(11,0)
);

-- --------------------------------------------------------

--
-- Struktura widoku `widok_filmy`
--
DROP TABLE IF EXISTS `widok_filmy`;

CREATE VIEW `widok_filmy`  AS SELECT `f`.`id` AS `id_filmu`, `f`.`backdrop` AS `tloFilmu`, `f`.`plakat` AS `plakat`, `f`.`nazwa` AS `nazwa`, `f`.`rok` AS `rok`, `x`.`nazwy_gatunków` AS `gatunki`, `f`.`overview` AS `opis`, if(`r`.`id_uzytkownika` in (select `uzytkownicy`.`ID` from `uzytkownicy`),round(avg(`r`.`ocena`),0),0) AS `srednia_ocen` FROM (((select `fg`.`id_filmu` AS `id_filmu`,group_concat(`g`.`gatunek` separator ', ') AS `nazwy_gatunków` from (`gatunki_filmu` `fg` join `gatunki` `g` on(`g`.`id` = `fg`.`id_gatunku`)) group by `fg`.`id_filmu`) `x` join `film` `f` on(`f`.`id` = `x`.`id_filmu`)) left join `recenzje` `r` on(`f`.`id` = `r`.`id_filmy`)) GROUP BY `x`.`id_filmu` ORDER BY `f`.`rok` DESC ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gatunki`
--
ALTER TABLE `gatunki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gatunki_filmu`
--
ALTER TABLE `gatunki_filmu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_filmu` (`id_filmu`,`id_gatunku`);

--
-- Indeksy dla tabeli `recenzje`
--
ALTER TABLE `recenzje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_uzytkownika` (`id_uzytkownika`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1608983;

--
-- AUTO_INCREMENT for table `gatunki`
--
ALTER TABLE `gatunki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10771;

--
-- AUTO_INCREMENT for table `gatunki_filmu`
--
ALTER TABLE `gatunki_filmu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11327;

--
-- AUTO_INCREMENT for table `recenzje`
--
ALTER TABLE `recenzje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
