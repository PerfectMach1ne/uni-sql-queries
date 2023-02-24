USE uczelnia;

CREATE TABLE egzaminatorzy (
	id_egzaminator	VARCHAR(4) PRIMARY KEY,
	nazwisko		VARCHAR(25),
	imie			VARCHAR(15),
	kod_pocztowy	VARCHAR(5),
	miasto			VARCHAR(15),
	ulica			VARCHAR(30),
	numer			VARCHAR(8),
	telefon			VARCHAR(12),
	fax				VARCHAR(12),
	email			VARCHAR(30)
);

CREATE TABLE studenci (
	id_student		VARCHAR(7),
	nazwisko		VARCHAR(25),
	imie			VARCHAR(15),
	data_urodzenia	DATE,
	miejsce			VARCHAR(15),
	pesel			VARCHAR(11),
	kod_pocztowy	VARCHAR(5),
	miasto			VARCHAR(15),
	ulica			VARCHAR(30),
	numer			VARCHAR(8),
	telefon			VARCHAR(12),
	fax				VARCHAR(12),
	email			VARCHAR(30),
	nr_ecdl			VARCHAR(9),
	data_ecdl		DATE
);
-- https://docs.microsoft.com/en-us/sql/relational-databases/tables/view-the-table-definition?view=sql-server-ver15
EXEC sp_help 'dbo.studenci';

-- both don't work
-- if you execute ALTER COLUMN first and then ADD CONSTRAINT, it works
ALTER TABLE studenci
ALTER COLUMN id_student VARCHAR(7) NOT NULL;
ALTER TABLE studenci
ADD CONSTRAINT pk_id_student PRIMARY KEY (id_student);

CREATE TABLE przedmioty (
	id_przedmiot		INT PRIMARY KEY,
	nazwa_przedmiotu	VARCHAR(40),
	opis				VARCHAR(200)
);

--ALTER TABLE przedmioty
--ALTER COLUMN id_przedmiot INT NOT NULL;
--ALTER TABLE przedmioty
--ADD CONSTRAINT pk_id_student PRIMARY KEY (id_student);

CREATE TABLE osrodki (
	id_osrodek INT,
	nazwa_osrodka VARCHAR(30),
	kod_pocztowy	VARCHAR(5),
	miasto			VARCHAR(15),
	ulica			VARCHAR(30),
	numer			VARCHAR(8)
);

ALTER TABLE osrodki
ALTER COLUMN id_osrodek INT NOT NULL;

ALTER TABLE osrodki
ADD CONSTRAINT pk_id_osrodek PRIMARY KEY (id_osrodek);

CREATE TABLE egzaminy (
	numer_egzaminu INT NOT NULL PRIMARY KEY,
	id_student VARCHAR(7) NOT NULL,
	id_przedmiot INT NOT NULL,
	id_egzaminator VARCHAR(4) NOT NULL,
	data_egzaminu DATE,
	id_osrodek INT NOT NULL,
	zdal VARCHAR(1),
	CONSTRAINT FK_id_student FOREIGN KEY (id_student)
		REFERENCES studenci (id_student)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_id_przedmiot FOREIGN KEY (id_przedmiot)
		REFERENCES przedmioty (id_przedmiot)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_id_egzaminatorzy FOREIGN KEY (id_egzaminator)
		REFERENCES egzaminatorzy (id_egzaminator)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_id_osrodek FOREIGN KEY (id_osrodek)
		REFERENCES osrodki (id_osrodek)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);