-- create a table
CREATE TABLE studenci (
    id INT PRIMARY KEY NOT NULL,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(30) NOT NULL,
    plec VARCHAR(1) NOT NULL,
    numer_albumu INT NOT NULL,
    id_kierunku INT NOT NULL,
    CONSTRAINT fk_id_kierunku
        FOREIGN KEY (id_kierunku)
        REFERENCES kierunki(id)
);

CREATE TABLE wykladowcy (
    id INT PRIMARY KEY NOT NULL,
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(30) NOT NULL,
    plec VARCHAR(1) NOT NULL
);

CREATE TABLE kierunki (
    id INT PRIMARY KEY NOT NULL,
    nazwa_kierunku VARCHAR(40) NOT NULL,
    tryb VARCHAR(20) NOT NULL,
    id_wydzialu INT NOT NULL,
    CONSTRAINT fk_id_wydzialu
        FOREIGN KEY (id_wydzialu)
        REFERENCES wydzialy(id)
);

CREATE TABLE wydzialy (
    id INT PRIMARY KEY NOT NULL,
    nazwa_wydzialu VARCHAR(40) NOT NULL,
    id_budynku INT NOT NULL,
    CONSTRAINT fk_id_budynku
        FOREIGN KEY (id_budynku)
        REFERENCES budynek(id)
);

CREATE TABLE budynki (
    id INT PRIMARY KEY NOT NULL,
    budynek VARCHAR(4) NOT NULL,
    adres VARCHAR(60) NOT NULL
);

CREATE TABLE przedmioty (
    id INT PRIMARY KEY NOT NULL,
    nazwa_przedmiotu VARCHAR(35) NOT NULL,
    id_wykladowcy INT NOT NULL,
    id_kierunku INT NOT NULL,
    CONSTRAINT fk_id_wykladowcy
        FOREIGN KEY (id_wykladowcy)
        REFERENCES wykladowcy(id),
    CONSTRAINT fk_id_kierunku
        FOREIGN KEY (id_kierunku)
        REFERENCES kierunek(id)
);

-- wartosci itp

INSERT INTO budynki
VALUES
    (1, 'A2', 'ul. Biala 3'),
    (2, 'A3', 'ul. Zielona 7'),
    (3, 'V', 'ul. Zielona 7'),
    (4, 'C4', 'ul. Brzozowa 1'),
    (5, 'Z', 'ul. Brzozowa 3');

INSERT INTO wydzialy
VALUES
    (1, 'Wydzial Informatyki', 2),
    (2, 'Wydzial Nauk Spolecznych', 1),
    (3, 'Wydzial Chemiczny', 4),
    (4, 'Wydzial Mechaniczny', 3);

-- id ,nazwa kierunku ,tryb, id budynku
INSERT INTO kierunki
VALUES
    (1, 'Chemia', 'Stacjonarne', 3),
    (2, 'Informatyka', 'Stacjonarne', 2),
    (3, 'Elektrotechnika', 'Stacjonarne', 4),
    (4, 'Matematyka', 'Stacjonarne', 2),
    (5, 'Ekonomia', 'Stacjonarne', 1);
    
INSERT INTO wykladowcy
VALUES
    (1, 'Adam', 'Nowak', 'M'),
    (2, 'Jan', 'Kowalski', 'M'),
    (3, 'John', 'Kowalsky', 'M'),
    (4, 'Juan', 'el Kowalski', 'M'),
    (5, 'Szymon', 'Szymon', 'M'),
    (6, 'Katarzyna', 'Adamowicz', 'F'),
    (7, 'Janina', 'Szustak', 'F');

-- id, nazwa, wykladowca id, kierunek id
INSERT INTO przedmioty
VALUES
    (1, 'Programowanie', 3, 2),
    (2, 'Programowanie', 4, 4),
    (3, 'Analiza matematyczna', 6, 4),
    (4, 'Elektrochemia', 1, 3),
    (5, 'Elektrochemia', 1, 1),
    (6, 'Podstawy ekonomii', 6, 5),
    (7, 'Matematyka dyskretna', 7, 2),
    (8, 'Finanse', 5, 5),
    (9, 'Fizyka', 2, 3),
    (10, 'Teoria mnogosci', 4, 4),
    (11, 'Bazy danych', 3, 2),
    (12, 'Chemia organiczna', 3, 1);

-- id imie nazwisko plec numeralbumu id-kierunku
INSERT INTO studenci
VALUES
    (1, 'Niejan', 'Niejanowski', 'M', 73921, 1),
    (2, 'Nieadam', 'Nieadamowicz', 'M', 82613, 3),
    (3, 'Niejanina', 'Niejanowska', 'F', 77221, 2),
    (4, 'Barbara', 'Charbarowicz', 'F', 92745, 1),
    (5, 'Cezary', 'Dariuszowicz', 'M', 92748, 3),
    (6, 'Daria', 'Ernestowa', 'F', 11823, 2),
    (7, 'Ernest', 'Fabianowski', 'M', 91330, 4),
    (8, 'Fabian', 'Gabrielowski', 'M', 75001, 5),
    (9, 'Gabriela', 'Haniowska', 'F', 94443, 2),
    (10, 'Hania', 'Barbarowksa', 'F', 99182, 2),
    (11, 'Pablo', 'Bicasso', 'M', 27254, 1),
    (12, 'Marcin', 'Smith', 'M', 01007, 2);

SELECT * FROM budynki;
SELECT '================================================================================';
SELECT * FROM wydzialy;
SELECT '================================================================================';
SELECT * FROM kierunki;
SELECT '================================================================================';
SELECT * FROM wykladowcy;
SELECT '================================================================================';
SELECT * FROM przedmioty;
SELECT '================================================================================';
SELECT * FROM studenci;