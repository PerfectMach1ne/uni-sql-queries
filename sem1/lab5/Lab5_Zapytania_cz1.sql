# SELECT DISTINCT
# Zapytanie nie zwracające duplikatów wierszy
SELECT DISTINCT kraj FROM adres;

# WHERE
# Działa jak warunek zwrócenia zapytania
# LIKE & WILDCARDS
# Zwraca wyniki według określonego wzoru
# AND, OR, NOT
# Do operacji logicznych
SELECT ulica, kraj FROM adres WHERE kraj = 'Polska' AND numerBudynku NOT LIKE 20;
SELECT imie, nazwisko, pesel FROM dane_kontaktowe WHERE pesel LIKE '9%';
SELECT imie, nazwisko FROM dane_kontaktowe WHERE imie LIKE '_a_';

# ORDER BY
# Sortuje na podstawie podanej kolumny badz warunku
SELECT * FROM adres ORDER BY kraj;

# SELECT TOP
# W MySQL jako "LIMIT"; ogranicza wyniki zapytania
SELECT * FROM adres LIMIT 3;

# Constraints
# (W definicji tabeli) ograniczenia dodawane w definicji tabeli po okresleniu nazwy kolumny i jej typu, np:
# NOT NULL, PRIMARY KEY, FOREIGN KEY, DEFAULT [wartosc]
# DEFAULT
# (W definicji tabeli) Ustawia wartosc na domyslna, okreslona w tabeli wartosc, gdy nie jest ona podana przy dodawaniu nowego wiersza
# AUTO_INCREMENT
# (W definicji tabeli) Sluzy do automatycznego zwiekszania danych liczbowych przy dodawaniu nowego wiersza
# NOT NULL
# (W definicji tabeli) Kolumna nie przyjmuje atrybutu NOT NULL
# PRIMARY KEY
# (Takze w definicji tabel) Okresla klucz glowny
# UPDATE
# Aktualizuje dane w tabeli
UPDATE dane_kontaktowe
SET pesel = 555555555
WHERE id = 4;

# DELETE
# Usuwa dane z tabeli
DELETE FROM dane_kontaktowe
WHERE id = 5 AND imie = 'Nikita' AND nazwisko = 'Khrushchev';

# IN
# Umozliwia wyszukiwanie danych na podstawie podanego zbioru danych z WHERE
SELECT imie FROM dane_kontaktowe
WHERE imie IN ('Jan', 'Janina', 'Janusz');

SELECT ulica FROM adres
WHERE miasto IN ('Saint Petersburg', 'Praga', 'Boston');

SELECT ulica FROM adres
WHERE kraj IN ('Polska', 'Czechy');

# BETWEEN
# Dziala podobnie jak IN, tyle ze na przedziale wartosci
SELECT numerMieszkania, numerBudynku FROM adres
WHERE numerBudynku BETWEEN 20 AND 30;

# Funkcje i funkcje agregujace
# Min, Max, Count, Avg, Sum
# min()/max() - zwraca najmniejsza/wieksza wartosc; count() - zwraca liczbe wystapien w wierszach;
# avg() - zwraca srednia wartosci; sum() - zwraca sume wartosci
# Aliasy
SELECT concat(imie, ' ', nazwisko) AS imieNazwisko FROM dane_kontaktowe;
SELECT AVG(numerMieszkania), SUM(numerMieszkania), COUNT(*), MAX(numerMieszkania), MIN(numerMieszkania) FROM adres;

# BACKUP
# Kopia zapasowa bazy danych
BACKUP DATABASE wspa
TO DISK = 'D:\DazaBanych.bak';