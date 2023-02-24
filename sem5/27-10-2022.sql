USE Programowanie_lab;

CREATE TABLE studenci (
	id_student INT NOT NULL PRIMARY KEY,
	imie VARCHAR(32),
	nazwisko VARCHAR(32),
	ulica VARCHAR(32),
	numer_lokalu VARCHAR(8),
	miasto VARCHAR(24),
	data_ur DATE
);

CREATE TABLE przedmioty (
	id_przedmiot INT NOT NULL PRIMARY KEY,
	nazwa_przedmiotu VARCHAR(48)
);

CREATE TABLE wykladowcy (
	id_wykladowca INT NOT NULL PRIMARY KEY,
	imie VARCHAR(32),
	nazwisko VARCHAR(32),
	ulica VARCHAR(32),
	numer_lokalu VARCHAR(8),
	miasto VARCHAR(24),
	data_ur DATE
);

CREATE TABLE egzaminy (
	id_egz INT NOT NULL PRIMARY KEY,
	id_student INT NOT NULL REFERENCES studenci(id_student),
	id_wykladowca INT NOT NULL REFERENCES wykladowcy(id_wykladowca),
	id_przedmiot INT NOT NULL REFERENCES przedmioty(id_przedmiot),
	data_egz DATE,
	ocena VARCHAR(1)
);

INSERT INTO wykladowcy(id_wykladowca, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(1, 'Arkadiusz', 'Arkadiowski', 'ul. Czerwona', '20/21', 'Lublin', '1989-02-23');
INSERT INTO wykladowcy(id_wykladowca, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(2, 'Barbara', 'Barbarowska', 'ul. Czarna', '9/10', 'Lublin', '1976-10-27'),
	(3, 'Cezary', 'Cezar', 'Aleje Rac³awickie', '7/45', 'Lublin', '1965-06-11'),
	(4, 'Barbara', 'Barbarowska', 'ul. Bia³a', '710', 'Lublin', '1977-07-10'),
	(5, 'Dariusz', 'Dariuszowicz', 'ul. Szara', '6/6', 'Lublin', '1945-06-06');

INSERT INTO studenci(id_student, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(1, 'Anna', 'Annowska', 'ul. Zielona', '23', 'Lublin', '1999-03-13'),
	(2, 'Barbara', 'Barbarowicz', 'ul. Niebieska', '88', 'Lublin', '2000-05-06'),
	(3, 'Daria', 'Dariowska', 'Aleje Rac³awickie', '4/75', 'Lublin', '2001-08-22'),
	(4, 'Anna', 'Barbarowska', 'ul. Czerwona', '71/1', 'Lublin', '1997-10-20'),
	(5, 'Jan £ukasz', 'Janowski', 'ul. Janowska', '2/3', 'Lublin', '2002-04-02');
	
INSERT INTO przedmioty(id_przedmiot, nazwa_przedmiotu)
VALUES
	(1,'Programowanie w jêzyku Java'),
	(2,'Bazy danych'),
	(3,'Wprowadzenie do Business Intelligence'),
	(4,'Statystyka z jêzykiem R'),
	(5,'Projektowanie baz danych');

INSERT INTO egzaminy(id_egz, id_student, id_wykladowca, id_przedmiot, data_egz, ocena)
VALUES
	(1, 2, 5, 1, '2021-02-15', '5'),
	(2, 5, 5, 1, '2021-02-15', '3'),
	(3, 1, 5, 1, '2021-02-15', '4'),
	(4, 4, 1, 2, '2021-02-01', '2'),
	(5, 3, 1, 2, '2021-02-11', '3'),
	(6, 2, 1, 2, '2021-02-22', '5'),
	(7, 5, 3, 5, '2021-02-18', '2'),
	(8, 3, 3, 5, '2021-02-14', '4'),
	(9, 4, 3, 5, '2021-02-14', '3'),
	(10, 1, 2, 4, '2021-02-22', '2'),
	(11, 4, 2, 4, '2021-02-22', '3'),
	(12, 5, 4, 4, '2022-01-21', '5');

SELECT * FROM studenci;
SELECT * FROM wykladowcy;
SELECT * FROM przedmioty;
SELECT * FROM egzaminy;

INSERT INTO studenci(id_student, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(6, 'Szymon', 'Szymon', 'ul. Ró¿owa', '2/16', 'Zamoœæ', '1999-01-25'),
	(7, '£ukasz Jan', '£ukowicz', 'ul. Be¿owa', '3/16', 'Zamoœæ', '2004-02-28');
-- 1.) Wyswietl imiona i nazwiska studentow ktorzy sa z miasta Lublin
SELECT imie, nazwisko FROM studenci WHERE miasto = 'Lublin';
-- 2.) Wyœwietl nazwy przedmiotów z jakich przeprowadzono egzaminy.
SELECT DISTINCT p.id_przedmiot, nazwa_przedmiotu FROM przedmioty p, egzaminy e
WHERE p.id_przedmiot = e.id_przedmiot;
-- 3.) Wyœwietl imiona i nazwiska studentów oraz oraz liczbê zdawanych przez nich egzaminów
SELECT s.id_student, imie, nazwisko, COUNT(id_egz) AS 'Zdane egzaminy' FROM studenci s, egzaminy e
WHERE e.id_student = s.id_student
GROUP BY s.id_student, imie, nazwisko;
-- 	4.) Wyœwietl datê pierwszego i ostatniego egzaminu do jakiego przyst¹pi³ student o pewnym nazwisku.
SELECT s.id_student, MIN(data_egz) AS 'Pierwszy egzamin', MAX(data_egz) AS 'Ostatni egzamin' FROM studenci s, egzaminy e
WHERE e.id_student = s.id_student AND nazwisko = 'Janowski'
GROUP BY s.id_student;

SELECT s.id_student, data_egz FROM studenci s, egzaminy e
WHERE e.id_student = s.id_student AND nazwisko = 'Janowski';