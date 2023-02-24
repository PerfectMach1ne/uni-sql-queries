-- Utworzyæ trigger do dowolnej tabeli który uruchomi sie po aktualizacji danych
CREATE TRIGGER trigger3 ON Person.Person
AFTER UPDATE
AS PRINT('trigger3');