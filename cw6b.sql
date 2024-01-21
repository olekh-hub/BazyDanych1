-- cwiczenia 6b
--a) Zmodyfikuj numer telefonu  w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48)
ALTER TABLE pracownicy
ALTER COLUMN telefon TYPE VARCHAR(15);
UPDATE pracownicy 
SET telefon = 
	CASE
	WHEN id_pracownika = 'AAW1' THEN '+48-234-597-890'
	WHEN id_pracownika = 'AAW2' THEN '+48-234-567-890'
	WHEN id_pracownika = 'AAW3' THEN '+48-345-678-901'
	WHEN id_pracownika = 'AAW4' THEN '+48-456-789-012'
	WHEN id_pracownika = 'AAW5' THEN '+48-567-890-123'
	WHEN id_pracownika = 'AAW6' THEN '+48-678-901-234'
	WHEN id_pracownika = 'AAW7' THEN '+48-789-012-345'
	WHEN id_pracownika = 'AAW8' THEN '+48-890-123-456'
	WHEN id_pracownika = 'AAW9' THEN '+48-901-234-567'
	WHEN id_pracownika = 'AW10' THEN '+48-987-654-321'
END;

--b)
UPDATE pracownicy
SET telefon = SUBSTR(telefon, 1, 3) || '-' || 
SUBSTR(telefon, 4, 3) || '-' || SUBSTR(telefon, 7, 3);

--c) wyswietl dane pracownika, ktorego nazwisko jest najdluzsze uzywajac duzych liter
SELECT UPPER(nazwisko) FROM pracownicy
ORDER BY LENGTH(nazwisko) DESC
LIMIT 1;

--d) wyswietl dane pracownikow i ich pensje zakodowane przy pomocy algorytmu md5
SELECT pracownicy.id_pracownika,imie,nazwisko, md5(pensje.kwota::text) FROM pracownicy
JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN pensje ON pensje.id_pensji = wynagrodzenie.id_pensji 

--f) wyswietl pracownikow, ich pensje oraz premie, wykorzystaj zlaczenie lewostronne
SELECT pracownicy.id_pracownika,imie,nazwisko,pensje.kwota AS pensja,premie.kwota AS premia FROM pracownicy
LEFT JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
LEFT JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
LEFT JOIN premie ON wynagrodzenie.id_premii = premie.id_premii

--g) wygeneruj raport, ktory zwroci w wyniku tresc wg ponizszego szablonu
SELECT 'Pracownik ' || pracownicy.imie || pracownicy.nazwisko || ' w dniu' || godziny.data || 'otrzymal pensje
calkowita na kwote ' || (pensje.kwota::money + premie.kwota ) || 'zl, gdzie wynagrodzenie zasadnicze wynioslo '
|| pensje.kwota || 'zl, premia ' || premie.kwota 'zl, nadgodziny 0zl' FROM pracownicy
JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN premie ON wynagrodzenie.id_premii = premie.id_premii
JOIN godziny ON wynagrodzenie.id_godziny = godziny.id_godziny



