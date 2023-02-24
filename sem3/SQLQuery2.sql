USE uczelnia;

CREATE TRIGGER
	LUKA21
ON
	przedmioty
AFTER INSERT, UPDATE, DELETE
AS
print 'Me first trigger is work';

-- dodac nowy przedmiot do tabeli prezdmioty
INSERT INTO przedmioty
VALUES (1, 'Rachunek prawdopodobie�stwa i statystyka', 'P(X), Bayesy, Poissony, statystyki i te sprawy');

SELECT * FROM przedmioty;
-- 3 triggery do studentow

CREATE TRIGGER
	TRstudenci_OnInsert
ON
	przedmioty
AFTER INSERT
AS
print 'Dodano nowego studenta';

CREATE TRIGGER
	TRstudenci_OnUpdate
ON
	przedmioty
AFTER UPDATE
AS
print 'Zaktualizowano studenta';

CREATE TRIGGER
	TRstudenci_OnDelete
ON
	przedmioty
AFTER DELETE
AS
print 'Usuni�to studenta';

DECLARE @pattern VARCHAR(4) = 'R%'
SELECT nazwa_przedmiotu
FROM przedmioty
WHERE nazwa_przedmiotu LIKE @pattern;

DECLARE @numer INT = 3
SELECT nazwa_przedmiotu
FROM przedmioty
WHERE id_przedmiot > @numer;

DECLARE @student1mail VARCHAR(30)
SELECT @student1mail = (
	SELECT email
	FROM studenci
	WHERE id_student = 1
);
SELECT @student1mail AS 'E-mail 1-go studenta';

DECLARE @liczbeEgzaminow INT;
SELECT @liczbeEgzaminow = (
	SELECT COUNT(*) 'Liczba zdanych egzamin�w'
	FROM egzaminy
	WHERE id_student = 7 AND zdal = 'T'
)
IF @liczbeEgzaminow = 0
	PRINT 'Brak zdanych egzamin�w'
ELSE IF @liczbeEgzaminow < 4
	PRINT 'Zdane par� egzamin�w'
ELSE
	PRINT 'Zdane kilka egzamin�w';


SELECT
	ex.id_egzaminator,
	(ew.imie + ew.nazwisko) AS 'Egzaminator',
	COUNT(*)
FROM egzaminy ex JOIN egzaminatorzy ew
ON ex.id_egzaminator = ew.id_egzaminator
GROUP BY ex.id_egzaminator;

DECLARE @liEgzWykl INT;
SELECT @liEgzWykl = (
	SELECT COUNT(*) 'Liczba przeprowadzonych egzaminow'
	FROM egzaminy
	GROUP BY id_egzaminator
)

CREATE PROC imiona_studentow
AS
BEGIN
	SELECT id_student, (imie + nazwisko) as 'student'
	FROM studenci
	ORDER BY imie DESC;
END;

DROP PROC imiona_studentow;

EXEC imiona_studentow;