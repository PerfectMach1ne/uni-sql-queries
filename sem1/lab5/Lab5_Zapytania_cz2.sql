# Self Join
# Zlaczenie tabeli samej z soba
SELECT a.imie, a.nazwisko, b.imie, b.nazwisko
FROM dane_kontaktowe a, dane_kontaktowe b
WHERE a.imie = b.imie;

SELECT a.ulica, b.ulica, a.kodPocztowy
FROM adres a, adres b
WHERE a.ulica = b.ulica AND a.kodPocztowy LIKE '%-%';

SELECT a.ulica, b.ulica, a.kodPocztowy
FROM adres a, adres b
WHERE a.ulica = b.ulica AND b.kodPocztowy <> a.kodPocztowy;

# INDEX
# Indeksy mozna dodac to tabeli w celu przyspieszenia wyszukiwania danych. Indeksy musza byc unikatowe i nie moga byc wyszukiwane
# prze uzytkownikow bazy danych
CREATE INDEX i_imie ON dane_kontaktowe (imie);

# ALTER TABLE
# Zmienia definicję tabeli
# CASE
# Odpowiednik dla SQL slowa kluczowego "switch case" uzywanego w jezykach programowania
# CHECK
# Uzywane w definicji tabeli, sprawdza podany warunek przy dodawaniu wartosci
ALTER TABLE dane_kontaktowe
ADD COLUMN wiek int,
ADD CONSTRAINT CHECK (wiek >= 18);

SELECT
CASE
	WHEN nazwisko LIKE 'Kowalsk_' THEN 'Kowalscy'
    WHEN nazwisko = 'Nowak' THEN 'Nowakowie'
    WHEN nazwisko = 'Smith' THEN 'Smiths'
    ELSE nazwisko = 'Inni'
END AS rodzina
FROM dane_kontaktowe
GROUP BY rodzina;

# "W jakich sytuacjach uzywamy polecenia 'set sql_safe_update'?"
# Wlaczenie (ustawienie wartosci na 1) trybu sql_safe_update powoduje bledy, gdy polecenia UPDATE badz DELETE nie sa ograniczone
# poprzez warunek w WHERE badz limit danych poprzez LIMIT. Jest to zabezpieczenie przed przypadkowym, nieumyslnym usunieciu badz
# aktualizacji nieprawidlowych danych.