USE wspa;

CREATE TABLE adres(
    ulica VARCHAR(30) NOT NULL,
    numerMieszkania INT NOT NULL,
    numerBudynku INT DEFAULT NULL,
    miasto VARCHAR(30),
    kodPocztowy VARCHAR(8),
    kraj VARCHAR(20),
    PRIMARY KEY (ulica, numerMieszkania)
);

CREATE TABLE dane_kontaktowe(
	ID INT NOT NULL AUTO_INCREMENT,
	imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(30) NOT NULL,
    pesel VARCHAR(15) DEFAULT NULL,
    PRIMARY KEY (ID)
);

INSERT INTO adres(ulica, numerMieszkania, numerBudynku, miasto, kodPocztowy, kraj)
VALUES
    ("ul. Ulicowa", 231, 10, "Lublin", "20-839", "Polska"),
    ("Aleje Raclawickie", 67, 13, "Lublin", "21-910", "Polska"),
    ("Aleje Ulicowe", 4, 20, "Lublin", "20-283", "Polska"),
    ("ul. Pushkina", 37, 25, "Saint Petersburg", "623930", "Rosja"),
    ("Washington St.", 93, DEFAULT, "Boston", "80201", "USA"),
    ("ul. Nerudova", 19, DEFAULT, "Praga", "78-450", "Czechy");

INSERT INTO dane_kontaktowe(imie, nazwisko, pesel)
VALUES
    ("Jan", "Kowalski", "57050166826"),
    ("Janusz", "Kowalski", "94071163331"),
    ("Janina", "Kowalska", "96032117933"),
    ("John", "Smith", DEFAULT),
    ("Nikita", "Khrushchev", DEFAULT),
    ("Jan", "Kowalski", 75061195613),
    ("Adam", "Nowak", 69021398745);