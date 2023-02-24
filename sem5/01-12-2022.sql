		CREATE TABLE lekarze (
	id INT IDENTITY(1,1),
	imie VARCHAR(15) NOT NULL,
	nazwisko VARCHAR(20) NOT NULL,
	gabinet VARCHAR(3),
	CONSTRAINT PK_id_lekarze PRIMARY KEY NONCLUSTERED (id)
);

CREATE TABLE pacjenci (
	id INT IDENTITY(1,1),
	imie VARCHAR(20) NOT NULL,
	nazwisko VARCHAR(30) NOT NULL,
	data_urodzenia DATE NOT NULL,
	miasto TEXT NOT NULL,
	ulica TEXT NOT NULL,
	nr_domu VARCHAR(6),
	nr_lokalu VARCHAR(3),
	kod_pocztowy VARCHAR(6),
	telefon VARCHAR(15),
	CONSTRAINT PK_id_pacjenci PRIMARY KEY NONCLUSTERED (id)
);

CREATE TABLE wyniki (
	id INT IDENTITY(1,1),
	data_wystawienia DATE,
	wyniki_badan TEXT,
	notatki_lekarza TEXT,
	CONSTRAINT PK_id_wyniki PRIMARY KEY NONCLUSTERED (id)
);

CREATE TABLE wizyty (
	id INT IDENTITY(1,1),
	lekarz_id INT NOT NULL,
	pacjent_id INT NOT NULL,
	data_wizyty DATE NOT NULL,
	wyniki_id INT NOT NULL,
	CONSTRAINT PK_id_wizyty PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_lekarz_id FOREIGN KEY (lekarz_id)
		REFERENCES lekarze (id),
	CONSTRAINT FK_pacjent_id FOREIGN KEY (pacjent_id)
		REFERENCES pacjenci (id),
	CONSTRAINT FK_wyniki_id FOREIGN KEY (wyniki_id)
		REFERENCES wyniki (id)
);
-- https://learn.microsoft.com/en-us/sql/relational-databases/tables/create-foreign-key-relationships?view=sql-server-ver16

--DROP TABLE wizyty;
--DROP TABLE pacjenci, lekarze;

-- 1.) imiona i nazwiska pacjentów którzy zapisali sie d okulisty o nazwisku kowalski
SELECT p.imie, p.nazwisko
FROM pacjenci p JOIN wizyty w
ON w.pacjent_id = p.id
JOIN lekarze l
ON l.id = w.lekarz_id
WHERE l.nazwisko = 'Kowalski';

-- 2.) wyœwietl ilu pacjentów zapisalo sie na wizyte w ciagu ostatniego roku
SELECT COUNT(p.id)
FROM pacjenci p JOIN wizyty w
ON p.id = w.pacjent_id
WHERE YEAR(w.data_wizyty) = YEAR(SYSDATETIME()) - 1;

SELECT YEAR('2010-04-30T01:01:01.1234567-07:00');
SELECT YEAR(SYSDATETIME());
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/sysdatetime-transact-sql?view=sql-server-ver16

EXEC sp_help 'dbo.wyniki';

ALTER TABLE dbo.wyniki
ALTER COLUMN data_wystawienia DATE NOT NULL;
ALTER TABLE dbo.wyniki
ALTER COLUMN wyniki_badan TEXT NOT NULL;

-- 3.) Który pacjent wyda³ najwiecej pieniedzy na us³ugê

-- 4.) Który pacjent w ostatnim miesi¹cu zap³aci³ za us³ugi najwiêcej(?)
