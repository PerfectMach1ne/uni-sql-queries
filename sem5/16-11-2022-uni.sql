-- Wyœwietl imiona i nazwiska osób, których nazwiska rozpoczynaj¹ siê na literê W
-- my normal solution that is apparently wrong because it doesn't have  a 'DECLARE'
SELECT
	FirstName, LastName
FROM
	Person.Person
WHERE LastName LIKE 'W%';

-- "correct" shit copypasted from student that doesN'T EVEN WORK *hysterical vocaloid crying*
DECLARE @nazwisko VARCHAR(3) = 'A%';
SELECT
	@nazwisko = LastName
FROM
	Person.Person
WHERE
	LastName = @nazwisko;

--LOOK !!! IS WAS KINDA FUCKING RIGHT GOD DA MN IT
DECLARE @nazwisko VARCHAR(50) = 'A%';
SELECT DISTINCT(LastName)
FROM
	Person.Person
WHERE LastName LIKE @nazwisko;

-- Imiona osób do ID 10;
DECLARE @maxid INT = 10;
SELECT
	FirstName
FROM
	Person.Person
WHERE
	BusinessEntityID < @maxid;
-- Deklarujemy dowoln¹ zmienn¹. SprwdŸmy cczy jest podzielna przez 2
DECLARE @liczba INT = 25;
IF @liczba % 2 = 0
	PRINT 'Liczba jest parzysta';
ELSE
	PRINT 'Liczba jest nieparzysta';

-- Ile mamy zatrudnionych kobiet w firmie;
-- ctrl+c ctrl+v time (it's in 10-11-2022.sql ....)
DECLARE @g VARCHAR(1) = 'F';
SELECT COUNT(Gender) AS 'Kobiety w firmie'
FROM HumanResources.Employee
WHERE Gender = @g;

SELECT * FROM HumanResources.Employee;
-- zagniezdzony if z poprzedniego zadania