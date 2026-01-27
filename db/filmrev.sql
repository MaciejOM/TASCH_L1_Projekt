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

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `nazwa`, `rok`, `overview`, `plakat`, `backdrop`) VALUES
(30484, 'Królowa wojowników', '1987-01-26', '‎W starożytnych Pompejach kobiety i mężczyźni są kupowani i sprzedawani do prac domowych i seksu. Tajemnicza królowa, obracając się wśród elity, potajemnie pomaga niewolnikom w ucieczce. W końcu jej życie jest również zagrożone, a gdy wybucha Wezuwiusz, ona i niewolnicy próbują uciec z miasta, ścigani przez wojsko.‎', 'https://image.tmdb.org/t/p/w500/P0j17mJRpSIZOglbtPkakHSD1S.jpg', 'https://image.tmdb.org/t/p/original/iZcknWnGqXNJFEb9YrxT7q21KJ.jpg'),
(62029, 'Bingo Bongo', '1982-12-23', '', 'https://image.tmdb.org/t/p/w500/cqiWWn2tnQwJHFmAMaLR2JdRbzC.jpg', 'https://image.tmdb.org/t/p/original/mFDQ8f2lPHorGwtuE0fjnUIbKLF.jpg'),
(83533, 'Avatar: Ogień i popiół', '2025-12-17', 'W obliczu niszczycielskiej wojny z RDA i utraty najstarszego syna, Jake Sully i Neytiri stają w obliczu nowego zagrożenia na Pandorze: Ash People, brutalnego i żądnego władzy plemienia Na\'vi dowodzonego przez bezwzględnego Varanga. Rodzina Jake\'a musi walczyć o przetrwanie i przyszłość Pandory w konflikcie, który popycha ich do granic możliwości emocjonalnych i fizycznych.', 'https://image.tmdb.org/t/p/w500/ecbiOccMRXoAOv0bKr1izpHA0ch.jpg', 'https://image.tmdb.org/t/p/original/3Dqievkc7krcTtDE2hjRkIsEzB1.jpg'),
(284053, 'Thor: Ragnarok', '2017-10-02', 'Minęło trochę czasu od wydarzeń przedstawionych w filmie \"Thor: Mroczny Świat\". Thor (Chris Hemsworth) jest uwięziony przez wrogów jego rodzinnego Asgardu w odległej części wszechświata. Pewnego dnia gromowładny zostaje zmuszony do udziału w pojedynkach gladiatorów. Niespodziewanie okazuje się, że ma stanąć do walki z dawnym sojusznikiem, Hulkiem (Mark Ruffalo). Superbohaterowie zwierają szyki nie tylko po to, żeby odzyskać wolność. Muszą też pokonać potężną Helę (Cate Blanchett) - boginię śmierci, która zawładnęła Asgardem. Jeśli się im to nie uda, świat czeka Ragnarok - mityczny zmierzch bogów, którego nie przetrwa żaden gatunek.', 'https://image.tmdb.org/t/p/w500/2m2nF7W0Kw15R08hVXlajmLlgBZ.jpg', 'https://image.tmdb.org/t/p/original/6G2fLCVm9fiLyHvBrccq6GSe2ih.jpg'),
(284054, 'Czarna Pantera', '2018-02-13', 'T’Challa (Chadwick Boseman) po śmierci swojego ojca, króla Wakandy, wraca do rodzinnego kraju, by objąć tron. Wkrótce Wakanda zostaje napadnięta przez dawnego wroga. W obliczu niebezpieczeństwa młody władca zbiera sojuszników i robi wszystko, aby pokonać groźnego przeciwnika i ochronić swój dotąd pozostający w izolacji lud, jego kulturę i całą wysoce rozwiniętą technologicznie cywilizację. By udowodnić, że jest godzien miana króla, T’Challa jako Czarna Pantera staje w obronie nie tylko swojej ojczyzny, ale i całego świata.', 'https://image.tmdb.org/t/p/w500/hHR6hcnt4UQIH2306R6gYKPG6Y4.jpg', 'https://image.tmdb.org/t/p/original/b6ZJZHUdMEFECvGiDpJjlfUWela.jpg'),
(299536, 'Avengers: Wojna bez granic', '2018-04-25', 'Po ostatnich wydarzeniach jakie zaszły między Avengersami są oni podzieleni i nie tworzą dłużej jednej zgranej grupy jak za dawnych czasów. Nadciąga jednak nowe wyzwanie. Thanos (Josh Brolin) przybywa na ziemię, a jego celem jest zebranie wszystkich 6 kamieni nieskończoności, które razem dają temu kto je posiada niewyobrażalną moc. Kapitan Ameryka (Chris Evans), Iron Man (Robert Downey Jr.) i reszta superbohaterów będą musieli zjednoczyć się po raz kolejny, aby bronić swojego świata przed zagrożeniem jakiego jeszcze nie było.  [opis dystrybutora dvd]', 'https://image.tmdb.org/t/p/w500/zLLs37yOubp9Snt5n1UE0DKvWGo.jpg', 'https://image.tmdb.org/t/p/original/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg'),
(302946, 'Księgowy', '2016-10-13', 'Christiana Wolffa, geniusza matematycznego, którego więcej łączy z liczbami niż z ludźmi. Pod osłoną małomiasteczkowego biura rachunkowego pracuje dla najbardziej niebezpiecznych organizacji przestępczych na świecie w charakterze niezależnego księgowego. Kiedy Wydział ds. ścigania przestępstw Departamentu Skarbu, prowadzony przez Raya Kinga, zaczyna się nim coraz bardziej interesować, Christian podejmuje współpracę z legalnym klientem - nowoczesną firmą specjalizującą się w dziedzinie robotyki. Jej księgowa wykryła niezgodność opiewającą na miliony dolarów. Jednak, kiedy Christianowi udaje się uzyskać prawdziwy obraz sytuacji finansowej firmy i zbliżyć się do odkrycia prawdy, liczba ofiar zaczyna niebezpiecznie wzrastać.', 'https://image.tmdb.org/t/p/w500/mF36nnx8TbpkhblPx28xFDQbhfp.jpg', 'https://image.tmdb.org/t/p/original/dTGECn8He16tZeBHQTLf6rVydE8.jpg'),
(315635, 'Spider-Man: Homecoming', '2017-07-05', 'Młody Peter Parker / Spider-Man (Tom Holland), który zadebiutował w filmie \"Kapitan Ameryka: Wojna bohaterów\", zaczyna rozumieć i kontrolować nowo odkrytą tożsamość super bohatera. Po wstrząsających doświadczeniach z Avengersami, Peter wraca do domu do cioci May (Marisa Tomei) i pod czujne oko swego nowego mentora Tony\'ego Starka (Robert Downey Jr.). Mimo że stara się wieść normalne życie, to jednak nie potrafi pozbyć się myśli, że jest jednak kimś więcej niż Spider-Manem z sąsiedztwa. Tymczasem pojawia się Vulture (Michael Keaton), groźny wróg, który zagraża wszystkiemu, co dla Petera jest ważne.', 'https://image.tmdb.org/t/p/w500/2lY3hLaHnMhsOSZxOhefzyhcE7x.jpg', 'https://image.tmdb.org/t/p/original/tPpYGm2mVecue7Bk3gNVoSPA5qn.jpg'),
(321612, 'Piękna i Bestia', '2017-03-16', 'Bella (Emma Watson) jest piękną i wrażliwą dziewczyną, która żyje razem z ojcem Maurycym (Kevin Kline) w małej francuskiej wiosce. Pewnego dnia mężczyzna wpada w tarapaty. Zostaje uwięziony w magicznym zamku przez mieszkającą tam bestię (Dan Stevens). Aby uwolnić ojca, Bella ofiarowuje gospodarzowi własną wolność. Dziewczyna dostaje komnatę na zamku, gdzie usługują jej zaczarowane przedmioty – zegar Trybik, świecznik Płomyk, czy miotełka Puf Puf. Chcąc ratować córkę, Maurycy prosi o pomoc butnego myśliwego – Gastona (Luke Evans), który pragnie ożenić się z Bellą. Dziewczyna tymczasem odkrywa, że potwór wcale nie jest taki straszny, jak początkowo myślała…', 'https://image.tmdb.org/t/p/w500/a3PqhWKtA49t278tbBMjBm642m9.jpg', 'https://image.tmdb.org/t/p/original/uU1Mt4JWhDvl4vKb3AfxNsorkoM.jpg'),
(425274, 'Iluzja 3', '2025-11-12', 'Legendarni Czterej Jeźdźcy łączą siły z grupą młodych, zbuntowanych iluzjonistów, by dokonać zuchwałej kradzieży bezcennego diamentu i pokrzyżować szyki międzynarodowej organizacji przestępczej.', 'https://image.tmdb.org/t/p/w500/vV7tqLh6eeNokqM6TkMWuYEurzw.jpg', 'https://image.tmdb.org/t/p/original/ufqytAlziHq5pljKByGJ8IKhtEZ.jpg'),
(436969, 'Legion samobójców. The Suicide Squad', '2021-07-28', 'Władze wysyłają największych superzłoczyńców świata – Bloodsporta, Peacemakera, King Sharka i Harley Quinn na odległą, pełną wrogów wyspę Corto Maltese. Wyposażeni w zaawansowaną technologicznie broń, przemierzają niebezpieczną dżunglę, by odszukać i zniszczyć cel. Grupę łotrów może ujarzmić jedynie towarzyszący im pułkownik Rick Flag. Jak zwykle, wystarczy jeden zły ruch by zginąć. Gdyby ktoś miał się zakładać, to rozsądek nakazywałby nigdy na nich nie stawiać!', 'https://image.tmdb.org/t/p/w500/f3simt2nobpDrv44MoRQSFpuyJa.jpg', 'https://image.tmdb.org/t/p/original/rAgsOIhqRS6tUthmHoqnqh9PIAE.jpg'),
(464052, 'Wonder Woman 1984', '2020-12-16', 'Losy świata ponownie są zagrożone i tylko Wonder Woman może je uratować. Rozpoczyna się nowy rozdział w jej historii, a tymczasem Diana Prince wiedzie spokojne życie wśród śmiertelników w latach 80. XX wieku. Chociaż główna bohaterka dysponuje już pełnią mocy, nadal pozostaje w cieniu, opiekując się starożytnymi artefaktami. Teraz jednak Diana jest zmuszona wyjść z ukrycia i wykorzystać całą swoją mądrość, aby ocalić ludzi przed światem, który sami stworzyli.', 'https://image.tmdb.org/t/p/w500/lUfpvTcfeh0FdWQoIX5ScZjkQhl.jpg', 'https://image.tmdb.org/t/p/original/XSTGtPVegdHD1xy5GPuK0tURTQ.jpg'),
(541671, 'Ballerina. Z uniwersum Johna Wicka', '2025-06-04', 'Osierocona przez porywacza, który zabił jej ojca i uprowadził młodszą siostrę, 7-letnia Eve trafia do rodziny zastępczej. Przepełniona gniewem i żądzą zemsty zwraca na siebie uwagę tajemniczej organizacji Ruska Roma, która przygarnia ją i doskonali w sztuce tańca i zabijania.', 'https://image.tmdb.org/t/p/w500/mKp4euM5Cv3m2U1Vmby3OGwcD5y.jpg', 'https://image.tmdb.org/t/p/original/sItIskd5xpiE64bBWYwZintkGf3.jpg'),
(552524, 'Lilo i Stich', '2025-05-17', 'Szalenie zabawna i wzruszająca historia samotnej dziewczyny z Hawajów i zbiegłego kosmity, który pomaga jej pojednać się z rozbitą rodziną.', 'https://image.tmdb.org/t/p/w500/bsvtqtXdlO5i7sdt0igQyu40OqF.jpg', 'https://image.tmdb.org/t/p/original/7Zx3wDG5bBtcfk8lcnCWDOLM4Y4.jpg'),
(574475, 'Oszukać przeznaczenie: Więzy krwi', '2025-05-14', 'Dręczona przez powtarzający się koszmar, studentka Stefanie wraca do domu, aby odnaleźć osobę, która mogłaby przerwać cykl i ocalić jej rodzinę przed makabryczną śmiercią, która nieuchronnie czeka ich wszystkich.', 'https://image.tmdb.org/t/p/w500/yZLpK3RByn57oju9l54bIkatko7.jpg', 'https://image.tmdb.org/t/p/original/uIpJPDNFoeX0TVml9smPrs9KUVx.jpg'),
(575265, 'Mission: Impossible - The Final Reckoning', '2025-05-17', 'Ethan Hunt i zespół IMF kontynuują poszukiwania przerażającej SI znanej jako Entity - która zinfiltrowała sieci wywiadowcze na całym świecie - z rządami świata i tajemniczym duchem z przeszłości Ethana na ich tropie. Dołączyli do nich nowi sojusznicy i uzbrojeni w środki, aby raz na zawsze zamknąć Entity, Hunt ściga się z czasem, aby zapobiec zmianie świata, jaki znamy, na zawsze.', 'https://image.tmdb.org/t/p/w500/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg', 'https://image.tmdb.org/t/p/original/aEG09hZZEDZ23Y9WYI701W6Gwnb.jpg'),
(628847, 'Trap House', '2025-11-14', 'Tajny agent DEA i jego partner rozpoczynają grę w kotka i myszkę z odważną i zaskakującą grupą złodziei –  zbuntowanymi nastolatkami, którzy zaczęli okradać niebezpieczny kartel, wykorzystując w tym celu taktykę swoich rodziców i ściśle tajne informacje.', 'https://image.tmdb.org/t/p/w500/6tpAPeuuqbVnYWWPoOLEDLSBU7a.jpg', 'https://image.tmdb.org/t/p/original/oIJjO1CvEdTMFNkWfHaV0RB584G.jpg'),
(666154, 'Kayara Niepokonana', '2025-01-02', 'Dawni posłańcy inkaskiego imperium dostarczają najważniejsze wiadomości, więc muszą być szybcy, silni… i mogą to być tylko mężczyźni. Wszystko się jednak zmieni, gdy młoda dziewczyna o imieniu Kayara postanowi jako pierwsza dołączyć do tego elitarnego grona. Bohaterka decyduje się wziąć udział w Wyścigu Posłańców przebrana za chłopca. Całej konkurencji z uwagą przypatruje się cesarz Inków, więc kiedy w pewnym momencie wychodzi na jaw prawdziwa tożsamość Kayary, grozi jej dotkliwa kara. Na szczęście, pewien młody książę bardzo jej kibicuje i udaje się jej dopiąć celu. Kayara wspólnie z zaprzyjaźnionym chomikiem będzie mogła teraz odkrywać pełne magii historie swojej krainy oraz być może uda się jej zapobiec nadciągającemu niebezpieczeństwu w postaci hiszpańskich konkwistadorów.', 'https://image.tmdb.org/t/p/w500/a3GZXS9umDNjLaIkSnGcZkLhiXy.jpg', 'https://image.tmdb.org/t/p/original/6YaTxghwL1HFBjcj43UHlP3zv5P.jpg'),
(713364, 'Frendo', '2025-05-08', 'Quinn i jej ojciec właśnie przeprowadzili się do spokojnego miasteczka Kettle Springs, mając nadzieję na nowy początek. Zamiast tego odkrywa rozbitą społeczność, która popadła w ciężkie czasy po tym, jak spaliła się ceniona fabryka syropu kukurydzianego Baypen. Podczas gdy miejscowi kłócą się między sobą, a napięcia sięgają zenitu, złowroga, uśmiechnięta postać wyłania się z pól kukurydzy, aby oczyścić miasto z jego obciążeń, jedną krwawą ofiarę na raz.', 'https://image.tmdb.org/t/p/w500/xGFIDIx7BQb0cg1llvP0co4yBfx.jpg', 'https://image.tmdb.org/t/p/original/gIwG9UWJLsiSBfaG5GJWGj9ghXD.jpg'),
(755898, 'Wojna światów', '2025-07-29', 'Will Radford jest czołowym analitykiem ds. cyberbezpieczeństwa w Homeland Security, który śledzi potencjalne zagrożenia dla bezpieczeństwa narodowego za pomocą programu masowej inwigilacji. Aż pewnego dnia atak nieznanej jednostki sprawia, że zaczyna się zastanawiać, czy rząd czegoś przed nim nie ukrywa... i przed resztą świata.', 'https://image.tmdb.org/t/p/w500/s20qugrUD5mPGQdyQ1LMLCYUOmy.jpg', 'https://image.tmdb.org/t/p/original/iZLqwEwUViJdSkGVjePGhxYzbDb.jpg'),
(757725, 'Shadow Force', '2025-05-01', 'Kyrah i Isaac byli kiedyś przywódcami wielonarodowej grupy sił specjalnych o nazwie Shadow Force. Złamali zasady, zakochując się w sobie i aby chronić swojego syna, schodzą do podziemia. Za ich głowy wyznaczono wysoką nagrodę. Shadow Force rusza ich tropem. Walka jednej rodziny o życie w spokoju, przeradza się w wojnę totalną.', 'https://image.tmdb.org/t/p/w500/7IEW24vBiZerZrDlgLVSUU3oT1C.jpg', 'https://image.tmdb.org/t/p/original/v67tbCB03CMcJRWit8CS7JdJp6.jpg'),
(870028, 'Księgowy 2', '2025-04-23', 'Kiedy dawny znajomy zostaje zamordowany, Wolff jest zmuszony rozwiązać sprawę. Zdając sobie sprawę, że konieczne są bardziej ekstremalne środki, Wolff rekrutuje do pomocy swojego brata, Braxa, z którym jest w separacji i jest śmiertelnie niebezpieczny. We współpracy z Marybeth Mediną odkrywają śmiertelny spisek, stając się celem bezwzględnej siatki zabójców, którzy nie cofną się przed niczym, aby ukryć swoje sekrety.', 'https://image.tmdb.org/t/p/w500/xwEoSZfuNFLugS5lEEjwwIarnZw.jpg', 'https://image.tmdb.org/t/p/original/yBDvgpyynDsbMyK21FoQu1c2wYR.jpg'),
(950387, 'Minecraft. Film', '2025-03-31', 'Czwórka outsiderów zmaga się ze zwykłymi problemami, gdy nagle zostają wciągnięci przez tajemniczy portal do Overworld: dziwacznej, sześciennej krainy czarów, która rozkwita dzięki wyobraźni. Aby wrócić do domu, będą musieli opanować ten świat, wyruszając na magiczną wyprawę z niespodziewanym, doświadczonym rzemieślnikiem, Stevem.', 'https://image.tmdb.org/t/p/w500/9fa0zIIPqKqS5YE9xweWW0xXtR3.jpg', 'https://image.tmdb.org/t/p/original/2Nti3gYAX513wvhp8IiLL6ZDyOm.jpg'),
(991494, 'SpongeBob: Klątwa pirata', '2025-12-16', 'Zdesperowany, aby zostać wielkim, SpongeBob wyrusza, aby udowodnić swoją odwagę Panu Krabsowi, podążając za Latającym Holendrem - tajemniczym piratem-duchem - podczas przygody, która zabierze go w najgłębsze głębiny morskie, gdzie żadna gąbka nie dotarła wcześniej.', 'https://image.tmdb.org/t/p/w500/vTqCjkM4yGl4v77wPQdpUBmGDhr.jpg', 'https://image.tmdb.org/t/p/original/gbjK8p5S1aLXWCwOoXqr9aWZvqG.jpg'),
(1017163, 'Bezkarni - ostateczna odpłata', '2024-04-24', '\"Monster Cop\" Ma Seok-do bada nielegalny biznes hazardowy online prowadzony przez byłego STS Baek i geniusza IT CEO Chang. Ma proponuje Jangowi nieoczekiwany sojusz i rozpoczyna polowanie na przestępców.', 'https://image.tmdb.org/t/p/w500/jucHQwnRSma1O9V2bM007e4eSd7.jpg', 'https://image.tmdb.org/t/p/original/mO9oOVXM8tTlC11VFM4FBBNnL3f.jpg'),
(1034716, 'Ludzie, których spotykamy na wakacjach', '2026-01-06', 'Każdego lata przez niemal dekadę wyluzowana Poppy i introwertyczny Alex ruszali razem na wakacyjną przygodę. Coś się jednak popsuło i na długo przestali się do siebie odzywać. Teraz jednak spotykają się na wspólnym wyjeździe, podczas którego będą wreszcie musieli uzewnętrznić ukrywane uczucia.', 'https://image.tmdb.org/t/p/w500/xzZaU0MN6L9oc1pl0RUXSB7hWwD.jpg', 'https://image.tmdb.org/t/p/original/qth56RA3rkUlhbDRDKGeMJEssdi.jpg'),
(1043197, 'Kraina Mroku', '2025-12-11', 'Ośmioletnia dziewczynka prosi tajemniczego sąsiada o pomoc w zgładzeniu potwora żyjącego pod jej łóżkiem, którego podejrzewa o pożarcie jej rodziny.', 'https://image.tmdb.org/t/p/w500/vobigFZFvbYPf6ElYJu07P9rH8C.jpg', 'https://image.tmdb.org/t/p/original/AecGG1XVCmkk7fT10ko3FC0dLIP.jpg'),
(1084242, 'Zwierzogród 2', '2025-11-26', 'Detektywi Judy Hops i Nick Bajer depczą po piętach pewnemu nieuchwytnemu gadowi, który zjawia się w mieście ssaków i wywraca je do góry nogami. Aby rozgryźć tę sprawę, policjanci muszą buszować incognito po nieznanych im dzielnicach, których mroczne realia wystawią na próbę ich partnerski układ.', 'https://image.tmdb.org/t/p/w500/lC8K6xaG5d2RHa8sP0NWfj0ahHQ.jpg', 'https://image.tmdb.org/t/p/original/7nfpkR9XsQ1lBNCXSSHxGV7Dkxe.jpg'),
(1087192, 'Jak wytresować smoka', '2025-06-06', 'Na surowej wyspie Berk, gdzie wikingowie i smoki są zaciekłymi wrogami od pokoleń, Czkawka wyróżnia się, rzucając wyzwanie wiekom tradycji, gdy zaprzyjaźnia się z Szczerbatkiem, budzącym grozę smokiem Nocnej Furii. Ich nieprawdopodobna więź ujawnia prawdziwą naturę smoków, podważając same fundamenty społeczeństwa wikingów.', 'https://image.tmdb.org/t/p/w500/uZ7O27EdRGbisSftY0TLFYfHxU3.jpg', 'https://image.tmdb.org/t/p/original/qEFTuoFIAwrnVn7IsvE8RVt2TK3.jpg'),
(1087891, 'Amator', '2025-04-09', 'Kiedy jego życie wywraca się do góry nogami po tym, jak jego żona ginie w zamachu terrorystycznym w Londynie, błyskotliwy, ale introwertyczny agent CIA bierze sprawy w swoje ręce, gdy jego przełożeni odmawiają podjęcia działań.', 'https://image.tmdb.org/t/p/w500/SNEoUInCa5fAgwuEBMIMBGvkkh.jpg', 'https://image.tmdb.org/t/p/original/6van4BavoNXaZhCPdzLHNQ4Uc8H.jpg'),
(1131759, 'Omniscient Reader: The Prophecy', '2025-07-23', 'Ulubiona powieść fantasy Kim Dok-ji, zwykłego pracownika biurowego, nagle staje się rzeczywistością. Uwięziony w świecie powieści, musi stawić czoła apokaliptycznym wyzwaniom u boku głównego bohatera, Yoo Jung-hyeoka – potężnego wojownika obdarzonego zdolnością powrotu do życia po śmierci.', 'https://image.tmdb.org/t/p/w500/lWQRM7IOCyJT9E5kOnoUvZNELHQ.jpg', 'https://image.tmdb.org/t/p/original/tVwFrpeGPYyk75rS82benPjtK6.jpg'),
(1197306, 'Fachowiec', '2025-03-26', 'Levon Cade zostawił za sobą utytułowaną karierę wojskową w operacjach specjalnych, aby wieść proste życie pracując w budownictwie. Ale kiedy córka jego szefa, która jest dla niego jak rodzina, zostaje porwana przez handlarzy ludźmi, jego poszukiwania, aby ją sprowadzić do domu, odkrywają świat korupcji o wiele większy, niż kiedykolwiek mógł sobie wyobrazić.', 'https://image.tmdb.org/t/p/w500/svOxLFytPajfYOuAjzySRzLwIB5.jpg', 'https://image.tmdb.org/t/p/original/fTrQsdMS2MUw00RnzH0r3JWHhts.jpg'),
(1199974, 'Párvulos: Hijos Del Apocalipsis', '2024-10-18', 'Dystopijny horror o dorastaniu trzech młodych braci, którzy mieszkają w domku w środku lasu i ukrywają w piwnicy mroczną, niepokojącą tajemnicę.', 'https://image.tmdb.org/t/p/w500/oAj9KEuPZgQjd0UO2VmBqAY0wnd.jpg', 'https://image.tmdb.org/t/p/original/mSIp4SUvsFOjA2vKnLTS5AnyR1A.jpg'),
(1208348, 'Rodzina do wynajęcia', '2025-11-20', '', 'https://image.tmdb.org/t/p/w500/qgnVFFhRwUxADwq5Dj3g71ai71v.jpg', 'https://image.tmdb.org/t/p/original/ufuabtiOem0kHeYz6b8x8MjBb2L.jpg'),
(1225916, '3ão: Uma História Sem Fim', '2023-12-11', '', 'https://image.tmdb.org/t/p/w500/ghNV52iBTQgtkd0nFZkAyvngCbr.jpg', 'https://image.tmdb.org/t/p/original/8CVlB19seZnYVDxGvTK5gU7xj9y.jpg'),
(1228246, 'Pięć koszmarnych nocy 2', '2025-12-03', 'Były ochroniarz Mike oraz policjantka Vanessa ukrywali przed 11-letnią siostrą Mike\'a, Abby, prawdę o losie jej animatronicznych przyjaciół. Jednak gdy Abby wymyka się, by ponownie połączyć się z Freddy\'m, Bonniem, Chicą i Foxym, uruchamia to przerażającą serię wydarzeń, które odkrywają mroczne sekrety związane z prawdziwym pochodzeniem Freddy\'ego i uwalniają zapomniany horror, który był ukrywany przez dekady.', 'https://image.tmdb.org/t/p/w500/16RtXHk9Rcb62WNYy1Qo6B4fYqS.jpg', 'https://image.tmdb.org/t/p/original/mOeBBD49M72vCEXzgA1dS2MwGno.jpg'),
(1233413, 'Grzesznicy', '2025-04-16', 'Chcąc zostawić za sobą burzliwą przeszłość, bracia bliźniacy wracają do rodzinnego miasta, żeby zacząć życie od nowa. Na miejscu przekonują się, że czeka na nich jeszcze gorsze zło.', 'https://image.tmdb.org/t/p/w500/xX737WktKAaCfPMTPVZMqyQna2Y.jpg', 'https://image.tmdb.org/t/p/original/7dQTILcUKw8chDiLj8TgPXxRuED.jpg'),
(1239193, 'Pod przykrywką', '2025-06-12', 'Dynamiczna komedia akcji z Bryce Dallas Howard w roli Kat, nauczycielki komedii improwizowanej, która zastanawia się, czy nie przegapiła swojej szansy na sukces. Gdy tajny glina oferuje jej rolę życia, rekrutuje swoich dwóch uczniów, aby wspólnie przeniknąć do londyńskiego półświatka, podszywając się pod niebezpiecznych przestępców.', 'https://image.tmdb.org/t/p/w500/wN1Qr79bhqR52hUEViSl4HkFdPm.jpg', 'https://image.tmdb.org/t/p/original/lOje1iz4VYWELYWRkZAwI7oIJd0.jpg'),
(1240475, 'Obława', '2024-02-12', 'Policjant z wydziału narkotykowego i tajemniczy mężczyzna będą zmuszeni połączyć siły, aby walczyć z przestępczością.', 'https://image.tmdb.org/t/p/w500/m5UBHbEjQJx3AkRZWRY6A4l4ZDT.jpg', 'https://image.tmdb.org/t/p/original/eRNMOrA6Bigonug3dT1R7aLZQaq.jpg'),
(1241894, 'Zmiennokształtni', '2024-10-17', 'Carag potrafi zmieniać się w pumę. W tajnej szkole uczy się kontrolować swoje moce. Z nowymi przyjaciółmi odkrywa świat zmiennokształtnych, ale wkrótce musi stawić czoła niebezpieczeństwu, by ocalić swoich bliskich.', 'https://image.tmdb.org/t/p/w500/n84V8SLmc7242ltKRePD5uvP8Xb.jpg', 'https://image.tmdb.org/t/p/original/d53MM15mO9EEiHzNlfvJK0otaaM.jpg'),
(1242501, 'Lodowa pułapka', '2025-10-16', 'Gdy strażniczka Annie zatrzymuje kłusownika, nie spodziewa się, że ich życie wkrótce się zmieni. Oboje trafiają na celownik bezwzględnego gangu, który zrobi wszystko by zdobyć pieniądze. Rozpoczyna się brutalna walka o życie na wielkim zamarzniętym jeziorze, gdzie każdy fałszywy krok może być tym ostatnim.', 'https://image.tmdb.org/t/p/w500/5Byv6nznAb2Izd0gHpODOXnuSbo.jpg', 'https://image.tmdb.org/t/p/original/gQimJqYMKCkwHIo8wwYKhmnCfBr.jpg'),
(1242898, 'Predator: Strefa zagrożenia', '2025-11-05', 'Wygnany ze swojego klanu, obcy łowca i jego nieoczekiwany sojusznik wyruszają w niebezpieczną podróż w poszukiwaniu największego przeciwnika.', 'https://image.tmdb.org/t/p/w500/zzlCI1DKmnhx4jRL3vLiNkDK9qp.jpg', 'https://image.tmdb.org/t/p/original/ebyxeBh56QNXxSJgTnmz7fXAlwk.jpg'),
(1252037, 'Czołg', '2025-09-18', 'Front wschodni, rok 1943: niemiecka załoga czołgu Tygrys zostaje wysłana na niebezpieczną misję głęboko za linią frontu, gdzie toczą się zacięte walki. Podczas podróży przez śmiertelną ziemię niczyją muszą stawić czoła zarówno wrogowi, jak i własnym wewnętrznym demonom.', 'https://image.tmdb.org/t/p/w500/x8pInGKDozm6C02RIcfiRd1gYp8.jpg', 'https://image.tmdb.org/t/p/original/vMxOmgmBGegjVObjlb8ugsjGgkD.jpg'),
(1257960, 'सिकंदर', '2025-03-29', '', 'https://image.tmdb.org/t/p/w500/41s42CRXafa3OuRGvCtfYPEBmse.jpg', 'https://image.tmdb.org/t/p/original/4MNRH73XmwBK2ycv3qvLpa07O5F.jpg'),
(1284120, 'Brzydka siostra', '2025-03-07', 'W baśniowym królestwie, w którym piękno jest brutalną sztuką, Elvira musi rywalizować ze swoją niezwykle piękną przyrodnią siostrą i zrobi wszystko, by zwrócić na siebie uwagę księcia.', 'https://image.tmdb.org/t/p/w500/mk4vGUy03tUCgJsOuwkYy877RYo.jpg', 'https://image.tmdb.org/t/p/original/eQV9rSQ6S1ja4lGTwHTnQuVhoG.jpg'),
(1289601, 'Life After Fighting', '2024-06-07', 'Emerytowany mistrz świata w sztukach walki Alex Faulkner prowadzi zwyczajne życie, gdy zniknięcie dwóch jego uczennic prowadzi do niewyobrażalnego odkrycia blisko domu. Właśnie wtedy, gdy wszelka nadzieja na odnalezienie dzieci została utracona, odnajduje uwięzione dziewczynki i ujawnia międzynarodową operację handlu dziećmi, która wciąga go z powrotem w walkę swojego życia przeciwko tym, którzy za nią stoją.', 'https://image.tmdb.org/t/p/w500/uKWAk4BHzyEOMmLKUDXoIAPhH36.jpg', 'https://image.tmdb.org/t/p/original/7TIoq6DRnMn2aDViSRfPooWZkga.jpg'),
(1301122, 'Erbsünde - Veil of Sin', '2024-10-13', '', 'https://image.tmdb.org/t/p/w500/3daBOc5ZcICXMzAVNhzJTSgweaP.jpg', 'https://image.tmdb.org/t/p/original/j3OksPD3jY3vhqf1sKOWXWLQEMB.jpg'),
(1306368, 'Łup', '2026-01-13', 'Gdy grupa policjantów z Miami znajduje w zapuszczonej melinie miliony dolarów, wzajemne zaufanie wyparowuje, a zasady i przyjaźnie stają pod znakiem zapytania.', 'https://image.tmdb.org/t/p/w500/p4bW2sJKAwcHuLpfoZK7Zo63osA.jpg', 'https://image.tmdb.org/t/p/original/3F2EXWF1thX0BdrVaKvnm6mAhqh.jpg'),
(1311031, 'Demon Slayer: Kimetsu no Yaiba – Infinity Castle', '2025-07-18', 'Gdy w ramach przygotowań do nadchodzącej bitwy z demonami członkowie Oddziału Zabójców Demonów oraz Filarowie rozpoczynają grupowe szkolenie, tzw. trening Filarów, Muzan Kibutsuji pojawia się w rezydencji Ubuyashikich. Tanjirō i Filarowie ruszają na pomoc przywódcy oddziału, ale zostają wciągnięci w tajemniczą otchłań przez Muzana Kibutsujiego. W ten sposób Tanjirō i Oddział Zabójców Demonów trafiają do twierdzy demonów — Zamku Nieskończoności. Oto miejsce, w którym rozegra się ostateczna walka między Oddziałem Zabójców a demonami.', 'https://image.tmdb.org/t/p/w500/ylCHprN1XfKIe5Mcbo7E65CwW0Y.jpg', 'https://image.tmdb.org/t/p/original/1RgPyOhN4DRs225BGTlHJqCudII.jpg'),
(1315988, 'Mikaela', '2025-01-31', '', 'https://image.tmdb.org/t/p/w500/jm6lNbpmKcxX6M0pieaKhP6hs3w.jpg', 'https://image.tmdb.org/t/p/original/8SaEH4kYCy7JlviyhKtSVsMkt4r.jpg'),
(1326878, 'Strangers', '2024-08-16', 'Szukając zemsty na swoim mężu, który ją znęca, życie kobiety przybiera mroczny obrót, gdy spotyka tajemniczego płatnego zabójcę. Wciągnięta w burzliwy romans, wpada w niebezpieczną spiralę samosądów. Gdy liczba ofiar rośnie, zaczyna odkrywać prawdziwą naturę swojego partnera i sekrety, które oboje skrywają.', 'https://image.tmdb.org/t/p/w500/ohpuwSBMgP44OPduPkpOtLxh90w.jpg', 'https://image.tmdb.org/t/p/original/xGbNoh7aWmU81oYuxJoFI07Rz5I.jpg'),
(1368166, 'Pomoc domowa', '2025-12-18', 'Milli ma za sobą niełatwą przeszłość, więc to czego dziś szuka, to spokojna przystań z dala od zgiełku i potencjalnych kłopotów. Chętnie więc zatrudnia się jako pomoc domowa w wielkim domu bogatego małżeństwa Winchesterów. Sprząta, gotuje, odbiera ze szkoły córkę swych pracodawców, a wolne chwile spędza samotnie w małym pokoju na poddaszu. Choć zachowania domowników zaczynają budzić jej coraz większy niepokój, stara się to ignorować. Mimo wszystko zazdrości pani Winchester jej pełnego przepychu, idealnego życia. Jednak, gdy pewnego dnia odkryje, skrywany za grubymi murami posiadłości, sekret Winchesterów, zrozumie, że znalazła się w obliczu śmiertelnego zagrożenia. Nieoczekiwanie z pomocą mogą przyjść jej doświadczenia trudnej przeszłości.', 'https://image.tmdb.org/t/p/w500/vVWQm8xikIKMQSwPuArsapJoYhY.jpg', 'https://image.tmdb.org/t/p/original/sK3z0Naed3H1Wuh7a21YRVMxYqt.jpg'),
(1376434, 'Predator: Pogromca zabójców', '2025-06-05', 'Oryginalna animowana antologia opowiada o trójce największych wojowników w historii ludzkości: skandynawskiej wojowniczce, która prowadzi swojego syna w wyprawie po krwawą zemstę; wojowniku ninja w feudalnej Japonii, który występuje przeciwko bratu w brutalnej walce o dziedzictwo; pilocie, który w czasie II wojny światowej bada pozaziemskie zagrożenie.', 'https://image.tmdb.org/t/p/w500/1MEV1CssOHKFxWm4h2RUnMc3nBp.jpg', 'https://image.tmdb.org/t/p/original/a3F9cXjRH488qcOqFmFZwqawBMU.jpg'),
(1379587, 'Utopia', '2024-12-09', 'Żołnierz poszukujący swojej zaginionej żony włamuje się do ośrodka high-tech, wierząc, że została złapana w siatce handlu ludźmi. Ale za jego murami znajduje surrealistyczny, futurystyczny park fantasy, w którym rzeczywistość i iluzja się zacierają. Podczas gdy porusza się po tym uwodzicielskim i niebezpiecznym świecie, szokująca prawda wciąga go głębiej w śmiertelną grę, w której nic nie jest takie, jak się wydaje.', 'https://image.tmdb.org/t/p/w500/yef0tY1Nw3BX8PJTfBLieqHj5Hw.jpg', 'https://image.tmdb.org/t/p/original/79tWkw0oc4Az96bzw5jGsMI05DS.jpg'),
(1411773, 'The Last Stand of Ellen Cole', '2024-10-18', '', 'https://image.tmdb.org/t/p/w500/oq1pGVQ2t3Cy4v7sA4LRhNjtZuJ.jpg', 'https://image.tmdb.org/t/p/original/rRIz3KweJDjnJ4GtCZJT3JPEYgL.jpg'),
(1412598, 'Killer Whale', '2026-01-16', 'Opowiada historię najlepszych przyjaciółek Maddie i Trish, które zostają uwięzione w odległej lagunie z niebezpiecznym wielorybem orką o imieniu Ceto.', 'https://image.tmdb.org/t/p/w500/cqbXxAw9sUr4tJ5ffEwtnz6IL9o.jpg', 'https://image.tmdb.org/t/p/original/ykigHs1OIyqqV04zfFqIlSHp546.jpg'),
(1419406, 'Bu Feng Zhui Ying', '2025-08-16', 'Policja w Makau sprowadza z emerytury doświadczonego policjanta, aby pomógł w schwytaniu niebezpiecznej grupy zawodowych złodziei.', 'https://image.tmdb.org/t/p/w500/o25Tk1FYQi2BLk0OEAvx2h69QvB.jpg', 'https://image.tmdb.org/t/p/original/4BtL2vvEufDXDP4u6xQjjQ1Y2aT.jpg'),
(1426776, 'Ostatnia kropla', '2025-06-05', 'Co będzie kroplą, która przeleje czarę goryczy? Katastrofalny dzień popycha ciężko pracującą samotną matkę na skraj szokującej desperacji.', 'https://image.tmdb.org/t/p/w500/64JUsYfYigXgDL4uS61J0jHf92r.jpg', 'https://image.tmdb.org/t/p/original/wnnu8htEZBLtwrke9QYfLKx6zjp.jpg'),
(1443762, 'Fałszerz', '2026-01-22', 'W tym dramacie inspirowanym prawdziwymi wydarzeniami początkujący artysta zostaje mistrzem fałszerstw w służbie gangów działających w mrocznym półświatku Rzymu lat 70.', 'https://image.tmdb.org/t/p/w500/bGLgIRasU93kIZbmOClkBA51E5T.jpg', 'https://image.tmdb.org/t/p/original/uHavtqbnMDcwqVK9Y94ZQSWxtCw.jpg'),
(1450599, 'Nokaut', '2025-06-05', 'Były zawodnik MMA musi odnaleźć zaginionego syna przeciwnika, którego nieumyślnie zabił przed wieloma laty. A to oznacza starcie z niezwykle brutalnym gangiem w Marsylii.', 'https://image.tmdb.org/t/p/w500/seRK8OszDJrDgnPvHmvNnZgrLde.jpg', 'https://image.tmdb.org/t/p/original/rU9kRB3rBU5O7AMReZCiuIy7zmE.jpg'),
(1511417, 'Baahubali: The Epic', '2025-10-29', '', 'https://image.tmdb.org/t/p/w500/z9YIo2qscyaXYgRqIdRJtND3bw8.jpg', 'https://image.tmdb.org/t/p/original/wCwZ4ljSsWyZyTiyk1tGQtBHTDx.jpg'),
(1512623, 'Risqué', '2025-08-01', '', 'https://image.tmdb.org/t/p/w500/h6OsRrDwbspLnKMvlFl57QFDP7d.jpg', 'https://image.tmdb.org/t/p/original/novE5UrqfLIFEMe5QBnjm18GG4E.jpg'),
(1608982, 'Z popiołów: Podziemna pułapka', '2026-01-21', 'Uwięzione w podziemnym dole podczas burzy trzy uczennice żeńskiej szkoły muszą zmierzyć się z własnymi konfliktami, walcząc jednocześnie o przetrwanie.', 'https://image.tmdb.org/t/p/w500/3OBRXbnlhZxMPpfLMLzQwF29IMC.jpg', 'https://image.tmdb.org/t/p/original/uiSaYXR0jLLWma0EPA1tcBhX6wT.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunki`
--

CREATE TABLE `gatunki` (
  `id` int(11) NOT NULL,
  `gatunek` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gatunki`
--

INSERT INTO `gatunki` (`id`, `gatunek`) VALUES
(12, 'Przygodowy'),
(14, 'Fantasy'),
(16, 'Animacja'),
(18, 'Dramat'),
(27, 'Horror'),
(28, 'Akcja'),
(35, 'Komedia'),
(36, 'Historyczny'),
(37, 'Western'),
(53, 'Thriller'),
(80, 'Kryminał'),
(99, 'Dokumentalny'),
(878, 'Sci-Fi'),
(9648, 'Tajemnica'),
(10402, 'Muzyczny'),
(10749, 'Romans'),
(10751, 'Familijny'),
(10752, 'Wojenny'),
(10770, 'film TV');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunki_filmu`
--

CREATE TABLE `gatunki_filmu` (
  `id` int(11) NOT NULL,
  `id_filmu` int(11) DEFAULT NULL,
  `id_gatunku` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gatunki_filmu`
--

INSERT INTO `gatunki_filmu` (`id`, `id_filmu`, `id_gatunku`) VALUES
(11062, 30484, 12),
(11060, 30484, 28),
(11061, 30484, 36),
(11167, 62029, 35),
(11277, 83533, 12),
(11278, 83533, 14),
(11276, 83533, 878),
(11081, 284053, 12),
(11080, 284053, 28),
(11082, 284053, 878),
(7661, 284054, 12),
(7660, 284054, 28),
(7662, 284054, 878),
(9975, 299536, 12),
(9976, 299536, 28),
(9977, 299536, 878),
(11079, 302946, 18),
(11078, 302946, 53),
(11077, 302946, 80),
(9257, 315635, 12),
(9259, 315635, 18),
(9256, 315635, 28),
(9258, 315635, 878),
(9254, 321612, 14),
(9255, 321612, 10749),
(9253, 321612, 10751),
(11321, 425274, 53),
(11322, 425274, 80),
(11323, 425274, 9648),
(9262, 436969, 12),
(9260, 436969, 28),
(9261, 436969, 35),
(1984, 464052, 12),
(1985, 464052, 14),
(1983, 464052, 28),
(11139, 541671, 28),
(11140, 541671, 53),
(11141, 541671, 80),
(11097, 552524, 12),
(11096, 552524, 35),
(11095, 552524, 878),
(11094, 552524, 10751),
(565, 568770, 27),
(566, 568770, 9648),
(11084, 574475, 27),
(11085, 574475, 9648),
(11068, 575265, 12),
(11067, 575265, 28),
(11069, 575265, 53),
(11173, 628847, 28),
(11175, 628847, 53),
(11174, 628847, 80),
(11132, 666154, 12),
(11133, 666154, 16),
(11134, 666154, 10751),
(11112, 713364, 27),
(11114, 713364, 53),
(11113, 713364, 9648),
(11303, 755898, 53),
(11302, 755898, 878),
(11047, 757725, 18),
(11045, 757725, 28),
(11046, 757725, 53),
(569, 822119, 28),
(570, 822119, 53),
(571, 822119, 878),
(7851, 870028, 28),
(11100, 870028, 53),
(11099, 870028, 80),
(11098, 870028, 9648),
(11136, 950387, 12),
(11138, 950387, 14),
(11137, 950387, 35),
(11135, 950387, 10751),
(11282, 991494, 12),
(11283, 991494, 14),
(11279, 991494, 16),
(11281, 991494, 35),
(11280, 991494, 10751),
(11121, 1017163, 18),
(11119, 1017163, 28),
(11123, 1017163, 35),
(11122, 1017163, 53),
(11120, 1017163, 80),
(11178, 1034716, 18),
(11177, 1034716, 35),
(11176, 1034716, 10749),
(11268, 1043197, 14),
(11267, 1043197, 28),
(11269, 1043197, 53),
(11296, 1084242, 12),
(11294, 1084242, 16),
(11295, 1084242, 35),
(11298, 1084242, 9648),
(11297, 1084242, 10751),
(11103, 1087192, 14),
(11101, 1087192, 28),
(11102, 1087192, 10751),
(11087, 1087891, 28),
(11086, 1087891, 53),
(11317, 1131759, 12),
(11318, 1131759, 14),
(11316, 1131759, 28),
(11054, 1197306, 28),
(11056, 1197306, 53),
(11055, 1197306, 80),
(9971, 1199974, 27),
(11198, 1208348, 18),
(11197, 1208348, 35),
(11131, 1225916, 12),
(11130, 1225916, 10751),
(11199, 1228246, 27),
(11200, 1228246, 53),
(567, 1232546, 27),
(568, 1232546, 9648),
(11304, 1233413, 27),
(11305, 1233413, 28),
(11306, 1233413, 53),
(11109, 1239193, 28),
(11110, 1239193, 35),
(11111, 1239193, 80),
(11108, 1240475, 28),
(564, 1241436, 28),
(563, 1241436, 10752),
(11076, 1241894, 14),
(11075, 1241894, 10751),
(11284, 1242501, 28),
(11286, 1242501, 53),
(11285, 1242501, 80),
(11275, 1242898, 12),
(11273, 1242898, 28),
(11274, 1242898, 878),
(11301, 1252037, 18),
(11300, 1252037, 28),
(11299, 1252037, 10752),
(10905, 1257960, 18),
(10904, 1257960, 28),
(11065, 1284120, 14),
(11066, 1284120, 18),
(11063, 1284120, 27),
(11064, 1284120, 35),
(11128, 1289601, 18),
(11127, 1289601, 28),
(11129, 1289601, 53),
(11181, 1301122, 27),
(11182, 1301122, 28),
(11183, 1301122, 878),
(11163, 1306368, 18),
(11264, 1306368, 28),
(11265, 1306368, 53),
(11266, 1306368, 80),
(11164, 1306368, 9648),
(11309, 1311031, 14),
(11307, 1311031, 16),
(11308, 1311031, 28),
(11115, 1315988, 28),
(11116, 1315988, 53),
(11270, 1326878, 28),
(11271, 1326878, 53),
(11272, 1326878, 80),
(11293, 1368166, 53),
(11292, 1368166, 9648),
(11091, 1376434, 16),
(11092, 1376434, 28),
(11093, 1376434, 878),
(11106, 1379587, 28),
(11105, 1379587, 53),
(11107, 1379587, 878),
(11104, 1379587, 9648),
(11071, 1411773, 12),
(11070, 1411773, 28),
(11288, 1412598, 27),
(11289, 1412598, 28),
(11287, 1412598, 53),
(11291, 1412598, 878),
(11290, 1412598, 9648),
(11312, 1419406, 18),
(11310, 1419406, 28),
(11313, 1419406, 53),
(11311, 1419406, 80),
(11089, 1426776, 18),
(11088, 1426776, 53),
(11090, 1426776, 80),
(11326, 1443762, 18),
(11324, 1443762, 53),
(11325, 1443762, 80),
(11126, 1450599, 12),
(11125, 1450599, 18),
(11124, 1450599, 28),
(11320, 1511417, 18),
(11319, 1511417, 28),
(11194, 1512623, 28),
(11196, 1512623, 53),
(11195, 1512623, 80),
(11315, 1608982, 18),
(11314, 1608982, 53);

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
