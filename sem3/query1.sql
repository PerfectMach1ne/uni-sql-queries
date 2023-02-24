USE uczelnia;

CREATE TABLE studenci (
	id			INT				NOT NULL	PRIMARY KEY	IDENTITY(1,1),
	imie		VARCHAR	(24)	NOT NULL,
	nazwisko	VARCHAR	(32)	NOT NULL,
);

CREATE TABLE wykladowcy (
	id			INT				NOT NULL	PRIMARY KEY	IDENTITY(1,1),
	imie		VARCHAR	(24)	NOT NULL,
	nazwisko	VARCHAR	(32)	NOT NULL
);

CREATE TABLE osrodki (
	id			INT		NOT NULL	PRIMARY KEY	IDENTITY(1,1),
	nazwa_osrodka		VARCHAR	(64) NOT NULL
);

CREATE TABLE przedmioty (
	id			INT			NOT NULL	PRIMARY KEY	IDENTITY(1,1),
	nazwa_przedmiotu		VARCHAR	(64) NOT NULL,
	id_osrodka				INT			 NOT NULL,
	imie_wykladowcy			VARCHAR	(24) NOT NULL,
	nazwisko_wykladowcy		VARCHAR	(32) NOT NULL,
	CONSTRAINT fk_id_osrodka FOREIGN KEY (id_osrodka)
	REFERENCES osrodki(id)
);

CREATE TABLE egzaminy (
	id			INT			NOT NULL	PRIMARY KEY	IDENTITY(1,1),
	nazwa_przedmiotu		VARCHAR	(64) NOT NULL,
	imie_egzaminatora		VARCHAR	(24) NOT NULL,
	nazwisko_egzaminatora	VARCHAR	(32) NOT NULL
);

CREATE TABLE oceny (
	id			INT		NOT NULL	PRIMARY KEY	IDENTITY(1,1),
	nazwa_przedmiotu	VARCHAR	(64) NOT NULL,
	ocena		INT		NOT NULL,
	imie_studenta		VARCHAR	(24) NOT NULL,
	nazwisko_studenta	VARCHAR	(32) NOT NULL
);

INSERT INTO
	studenci (imie, nazwisko)
VALUES
	('Jan', 'Kowalski'),
	('John', 'Kowalski'),
	('Juan', 'el Kowalski');

SELECT imie, id_osrodka
FROM studenci
WHERE id_osrodka IN (2,4);