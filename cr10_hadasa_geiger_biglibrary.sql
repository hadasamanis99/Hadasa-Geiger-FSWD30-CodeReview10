-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Feb 2018 um 09:31
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_hadasa_geiger_biglibrary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `pk_Author_id` int(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `Country_Origin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`pk_Author_id`, `First_name`, `Last_Name`, `birthdate`, `Country_Origin`) VALUES
(1, 'Sydney', 'Sheldon', '1917-02-11', 'USA'),
(2, 'Charlie', 'Chaplin', '1900-01-08', 'USA'),
(3, 'Bob', 'Dylan', '1955-04-23', 'USA'),
(4, 'T.E', 'Lawrence', '1888-11-19', 'UK'),
(5, 'Sade', 'Sade', '1959-01-16', 'Nigerian'),
(6, 'Katja ', 'Brandis', '1970-06-27', 'Germany'),
(7, 'Isaac ', 'Asimov', '1920-01-02', 'Russia'),
(8, 'Neil ', 'Gaiman', '1960-11-10', 'Poland'),
(9, 'Peter ', 'O\'Donnell', '1920-04-11', 'UK'),
(10, 'Enid', 'Blyton', '1891-08-09', 'UK');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `availabilities`
--

CREATE TABLE `availabilities` (
  `pk_Availabilities_id` int(11) NOT NULL,
  `Available` varchar(50) DEFAULT NULL,
  `Not_available` varchar(50) DEFAULT NULL,
  `Available_date` date DEFAULT NULL,
  `Reserve` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `availabilities`
--

INSERT INTO `availabilities` (`pk_Availabilities_id`, `Available`, `Not_available`, `Available_date`, `Reserve`) VALUES
(1, 'Yes', '', '2018-02-12', 'Free to reserve'),
(2, 'Not Available', 'Not Available', '2018-05-18', 'Yes');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `genre`
--

CREATE TABLE `genre` (
  `pk_Genre_id` int(11) NOT NULL,
  `Description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `genre`
--

INSERT INTO `genre` (`pk_Genre_id`, `Description`) VALUES
(1, 'Crime fiction'),
(2, 'Comedy Romance'),
(3, 'Rock Music'),
(4, 'History Drama'),
(5, 'Smooth soul'),
(6, 'Belletristik'),
(7, 'Fantasy Science Fiction'),
(8, 'Fantasy'),
(9, 'Mystery'),
(10, 'Mytery adventure');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `pk_Book_id` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Language` varchar(50) NOT NULL,
  `ISBN` varchar(50) DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `fk_Author_id` int(11) NOT NULL,
  `fk_Genre_id` int(11) NOT NULL,
  `fk_Publisher_id` int(11) NOT NULL,
  `fk_Availabilities_id` int(11) NOT NULL,
  `Synopsis` varchar(5000) DEFAULT NULL,
  `Publication_date` date DEFAULT NULL,
  `Publication_comment` varchar(500) DEFAULT NULL,
  `fk_type_id` int(11) NOT NULL,
  `picture_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`pk_Book_id`, `Title`, `Language`, `ISBN`, `Pages`, `fk_Author_id`, `fk_Genre_id`, `fk_Publisher_id`, `fk_Availabilities_id`, `Synopsis`, `Publication_date`, `Publication_comment`, `fk_type_id`, `picture_url`) VALUES
(1, 'If Tomorrow Comes', 'English', '0-446-35742-1', 416, 1, 1, 1, 1, 'If Tomorrow Comes is a 1985 crime fiction novel  by American author Sidney Sheldon. It is a story portraying an ordinary woman who is framed by the Mafia, her subsequent quest for vengeance towards them and her later life as a con artist.', '1985-01-01', 'The most intriguing author i have ever come across.A must read i would say.the plot is amazing', 1, 'img/pic9.jpg'),
(2, 'City Lights', 'English ', NULL, NULL, 2, 2, 2, 1, 'City Lights is a 1931 American pre-Code silent romantic comedy film written, produced, directed by and starring Charlie Chaplin. The story follows the misadventures of Chaplin\'s Tramp as he falls in love with a blind girl (Virginia Cherrill) and develops a turbulent friendship with an alcoholic millionaire (Harry Myers).', '1931-01-30', 'Funny but heartbreaking ', 3, 'img/pic2.jpg'),
(3, 'Dylan', 'English', NULL, NULL, 3, 3, 3, 1, 'Dylan is the 13th studio album by American singer-songwriter Bob Dylan, released on November 19, 1973 by Columbia Records. Compiled and issued by the label with no input from Dylan himself, it contains no original Dylan songs, the material consisting of two outtakes from Self Portrait and another seven from New Morning. It followed the artist\'s departure from Columbia for Asylum Records, and the announcement of his first major tour since 1966.', '1973-11-19', 'This deserves the Nobel prize', 2, 'img/pic1.jpg'),
(4, 'Lawrence of Arabia', 'English', NULL, NULL, 4, 4, 4, 1, 'Due to his knowledge of the native Bedouin tribes, British Lieutenant T.E. Lawrence (Peter O\'Toole) is sent to Arabia to find Prince Faisal (Alec Guinness) and serve as a liaison between the Arabs and the British in their fight against the Turks. With the aid of native Sherif Ali (Omar Sharif), Lawrence rebels against the orders of his superior officer and strikes out on a daring camel journey across the harsh desert to attack a well-guarded Turkish port.', '1962-12-10', 'One of the great epics of the silver screen, this is a masterpiece of direction, photography, and acting, especially from Peter O\'Toole as the enigmatic British hero of the first World War. ', 3, 'img/pic3.jpg'),
(5, 'Diamond Life', 'English', NULL, NULL, 5, 5, 5, 1, 'Diamond Life is the debut studio album by English band Sade. It was first released in the United Kingdom on 16 July 1984 by Epic Records and in the United States on 27 February 1985 by Portrait Records. After studying fashion design, and later modelling, Sade Adu began backup singing with British band Pride. During this time Adu and three of the original members of \"Pride\" - Paul Anthony Cook, Paul Denman and Stuart Matthewman - left the group to form their own band called Sade. Following various demos and performances, Sade received interest from record labels and later signed to Epic.', '1984-07-14', 'Sade has a perfect souly voice', 2, 'img/pic4.jpg'),
(6, 'Woodwalkers', 'English', ' 3950218580', 85, 6, 6, 6, 1, 'A boy appears in the woods out of the blue. Nobody knows where he came from. Carag is guarding his family’s secret: he is a  shapeshifter and grew up as a puma.\r\n\r\nHe has decided to leave his old life behind and accepts a place at a special school for walkers like him, Clearwater High. There he makes friends with other students such as Holly, a lively squirrel walker, and Brandon, whose animal persona is a clumsy and shy bison. Their lessons range from English and Maths to Transformation and Understanding Humans. When shady businessman Andrew Milling tries to blackmail Carag into helping him avenge the death of Milling’s family, Carag has to find out whom he can trust.\r\n\r\nWoodwalkers is a fast-paced, engaging novel for children ten years or older, set near Yellowstone National Park. Brandis describes the animals’ emotions in loving detail. Above all, there is much humour. Loyalty and friendship are important themes as the friends defend each other not just with words, but deeds.\r\n\r\nThis is a wonderful addition to the ever-popular animorph genre, written by one of Germany’s most successful children’s authors.', '2016-07-16', 'Very good ', 1, 'img/pic5.jpg'),
(7, 'Foundation', 'German', '0-553-29335-4', 105, 7, 7, 7, 2, 'Foundation is a science fiction novel by American writer Isaac Asimov. It is the first published in his Foundation Trilogy (later expanded into the Foundation Series). Foundation is a cycle of five interrelated short stories, first published as a single book by Gnome Press in 1951. Collectively they tell the story of the Foundation, an institute to preserve the best of galactic civilization after the collapse of the Galactic Empire.', '1951-09-11', 'People who think they know everything are a great annoyance to those of us who do.\r\nViolence is the last refuge of the incompetent.\r\nIt pays to be obvious, especially if you have a reputation for subtlety', 1, 'img/pic6.jpg'),
(8, 'The Sandman', 'English', '9788587193278', 155, 8, 8, 8, 1, 'The Sandman is a comic book series written by Neil Gaiman and published by DC Comics. Its artists include Sam Kieth, Mike Dringenberg, Jill Thompson, Shawn McManus, Marc Hempel, and Michael Zulli, with lettering by Todd Klein and covers by Dave McKean. Beginning with issue No. 47, it was placed under the Vertigo imprint. It tells the story of Dream of the Endless, who rules over the world of dreams. The original series ran for 75 issues from January 1989 to March 1996.', '1989-03-18', 'Though he won the World Fantasy Award for Short Fiction in 1991, Gaiman is best known as the writer who transformed the WWII-era DC Comics character the Sandman from a Batman-style detective/vigilante into the much darker Morpheus, aka Dream, the being who presides over the realm of Dreaming', 1, 'img/pic7.jpg'),
(9, 'Modesty Blaise', 'English', '9780907610489', 209, 9, 9, 9, 1, 'Modesty Blaise is an action-adventure/spy fiction novel by Peter O\'Donnell first published in 1965, featuring the character Modesty Blaise which O\'Donnell had created for a comic strip in 1963.', '1999-09-08', 'One of my least favourite spy movies. It\'s more about the whole mod female spy fashion and coolness, and focuses less on plot, characters, and anything else. I didn\'t care for it. Aj V. Super Reviewer. So very camp. Great actors, fine director and lovely ', 1, 'img/pic8.jpg'),
(10, 'The Famous Five', 'English ', ' 9780884368908', 99, 10, 10, 10, 2, 'When siblings Julian, Dick and Anne learn that they cannot go for their usual summer holiday to Polseath, they are invited to spend the summer with their Aunt Fanny and Uncle Quentin at their home Kirrin Cottage, in the coastal village of Kirrin. They also meet their cousin Georgina, a surly, difficult girl, who tries hard to live like a boy and only answers to the name George. Despite an uncomfortable start, the cousins become firm friends and George even introduces them to her beloved dog Timothy (Timmy), who secretly lives with a fisher boy in the village after George realises that her parents will not allow her to keep Timmy.', '1942-11-11', 'This book should be read by those who like to read books on adventure. I especially liked the brave and courageous character of the children', 1, 'img/pic10.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mediatype`
--

CREATE TABLE `mediatype` (
  `pk_type_id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `mediatype`
--

INSERT INTO `mediatype` (`pk_type_id`, `type`) VALUES
(1, 'Book'),
(2, 'CD'),
(3, 'DVD');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `member`
--

CREATE TABLE `member` (
  `pk_Member_id` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email_address` varchar(100) DEFAULT NULL,
  `Hand_phone_no` varchar(50) DEFAULT NULL,
  `cust_pass` varchar(500) DEFAULT NULL,
  `Birth_date` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `member`
--

INSERT INTO `member` (`pk_Member_id`, `First_Name`, `Last_Name`, `Email_address`, `Hand_phone_no`, `cust_pass`, `Birth_date`, `Address`) VALUES
(0, 'hadasa', NULL, 'hadasa@gmx.at', NULL, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL),
(1, 'Daniel', 'Geiger', 'DanielG@gmx.at', '06643679499', '789', '2013-10-18', 'Kettenbruckengasse 57A'),
(100, 'Daniel Yudhisthira', NULL, 'Yudhisthira@geiger.com', NULL, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL),
(103, 'dddx', NULL, 'abcx@fg.com', NULL, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL),
(104, 'fffkk', NULL, 'ss@xy.af', NULL, '534a4a8eafcd8489af32356d5a7a25f88c70cfe0448539a7c42964c1b897a359', NULL, NULL),
(105, 'Otto', NULL, 'otto@geiger.com', NULL, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `member_book`
--

CREATE TABLE `member_book` (
  `pk_Member_book_id` int(11) NOT NULL,
  `fk_Member_id` int(11) NOT NULL,
  `fk_Book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `member_book`
--

INSERT INTO `member_book` (`pk_Member_book_id`, `fk_Member_id`, `fk_Book_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `pk_Publisher_id` int(11) NOT NULL,
  `Publisher_name` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Established` date DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`pk_Publisher_id`, `Publisher_name`, `Address`, `Established`, `size`) VALUES
(1, 'Warner Books', 'Warner Books, Inc, 666 Fifth Avenue New York, N.Y. 10103', '1979-01-01', 'big'),
(2, 'United Artists', 'Bronx no 5 USA', '1977-05-02', 'big'),
(3, 'Columbia Records', 'Palm spring 10 Los Angeles', '1887-01-05', 'medium'),
(4, 'Columbia Pictures', 'New York 509 district', '1880-02-21', 'medium'),
(5, 'Epic', '270 Biscayne Blvd Way, Miami, FL 33131, USA', '1970-07-20', 'small'),
(6, 'Bild', 'Goethegasse 56/7 Frankfurt', '1988-08-03', 'small'),
(7, 'Heyne', 'Henriettenplat 7/8/9 Munich', '1934-07-23', 'small'),
(8, 'Vertigo', '27 Old Gloucester Street, London WC1N ', '1965-12-25', 'small'),
(9, 'Titan Books', '843 Finchley Road, London', '1981-10-09', 'small'),
(10, 'Hodder & Stoughton', 'Carmelite House 50 Victoria Embankment London EC4Y 0DZ ', '1840-01-19', 'big');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`pk_Author_id`);

--
-- Indizes für die Tabelle `availabilities`
--
ALTER TABLE `availabilities`
  ADD PRIMARY KEY (`pk_Availabilities_id`);

--
-- Indizes für die Tabelle `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`pk_Genre_id`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`pk_Book_id`),
  ADD KEY `fk_Author_id` (`fk_Author_id`),
  ADD KEY `fk_Genre_id` (`fk_Genre_id`),
  ADD KEY `fk_Publisher_id` (`fk_Publisher_id`),
  ADD KEY `fk_Availabilities_id` (`fk_Availabilities_id`),
  ADD KEY `fk_type_id` (`fk_type_id`);

--
-- Indizes für die Tabelle `mediatype`
--
ALTER TABLE `mediatype`
  ADD PRIMARY KEY (`pk_type_id`);

--
-- Indizes für die Tabelle `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`pk_Member_id`);

--
-- Indizes für die Tabelle `member_book`
--
ALTER TABLE `member_book`
  ADD PRIMARY KEY (`pk_Member_book_id`),
  ADD KEY `fk_Member_id` (`fk_Member_id`),
  ADD KEY `fk_Book_id` (`fk_Book_id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`pk_Publisher_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_Author_id`) REFERENCES `author` (`pk_Author_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_Genre_id`) REFERENCES `genre` (`pk_Genre_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_Publisher_id`) REFERENCES `publisher` (`pk_Publisher_id`),
  ADD CONSTRAINT `media_ibfk_4` FOREIGN KEY (`fk_Availabilities_id`) REFERENCES `availabilities` (`pk_Availabilities_id`),
  ADD CONSTRAINT `media_ibfk_5` FOREIGN KEY (`fk_type_id`) REFERENCES `mediatype` (`pk_type_id`);

--
-- Constraints der Tabelle `member_book`
--
ALTER TABLE `member_book`
  ADD CONSTRAINT `member_book_ibfk_1` FOREIGN KEY (`fk_Member_id`) REFERENCES `member` (`pk_Member_id`),
  ADD CONSTRAINT `member_book_ibfk_2` FOREIGN KEY (`fk_Book_id`) REFERENCES `media` (`pk_Book_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
