-- korzystaj¹c z pêtli while wyswietl 4 razy komunikat 'To jest wiersz', po czym wyswielt numer wiersza.
DECLARE @wiersz int = 1;

WHILE @wiersz < 5
	BEGIN
		print 'To jest wiersz ' + CAST(@wiersz AS varchar)
		SET @wiersz += 1
	END