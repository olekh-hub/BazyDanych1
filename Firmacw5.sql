--a) wyswietl tylko id_pracownika oraz jego nazwisko
SELECT id_pracownika, nazwisko FROM pracownicy

--b) wyswietl tylko id pracownikow, ktorych placa jest wieksza niz 1000
SELECT id_pracownika FROM wynagrodzenie
JOIN pensje ON pensje.id_pensji = wynagrodzenie.id_pensji AND pensje.kwota > 1000

--c) wyswietl id pracownikow nieposiadajacych premii, ktorych placa jest wieksza niz 2000
SELECT id_pracownika FROM wynagrodzenie
JOIN premie ON wynagrodzenie.id_premii = premie.id_premii AND premie.kwota = '0'::money
JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji AND pensje.kwota > 2000

--d) wyswietl pracownikow, ktorych pierwsza litera imienia zaczyna sie na litere 'J'
SELECT id_pracownika,imie,nazwisko FROM pracownicy 
WHERE imie LIKE 'J%'

--e) wyswietl pracownikow, ktorych nazwisko zawiera 'n' oraz imie konczy sie na 'a'
SELECT id_pracownika,imie,nazwisko FROM pracownicy
WHERE imie LIKE '%n' AND nazwisko LIKE '%a%'

--f) wyswietl imie i nazwisko pracownikow oraz ich liczbe nadgodzin przyjmujac iz standardowy czas pracy to 160h/msc
SELECT imie,nazwisko,(liczba_godzin-160) FROM pracownicy
JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN godziny ON wynagrodzenie.id_godziny = godziny.id_godziny 

--g) wyswietl imie i nazwisko pracownikow, ktorych pensja zawiera sie w przedziale 1500-3000 pln
SELECT imie,nazwisko FROM pracownicy
JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji AND pensje.kwota BETWEEN 1500 AND 3000

--h) wyswietl imie i nazwisko pracownikow, ktorzy pracowali w nadgodzinach i nie otrzymali premii
SELECT imie,nazwisko FROM pracownicy
JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN premie ON wynagrodzenie.id_premii = premie.id_premii AND premie.kwota = '0'::money
JOIN godziny ON wynagrodzenie.id_godziny = godziny.id_godziny AND godziny.liczba_godzin > 160

--i) uszereguj pracownikow wedlug pensji
SELECT kwota,imie,nazwisko FROM pracownicy
JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji 
ORDER BY pensje.kwota

--j) uszereguj pracownikow wedlug premii i pensji malejaco
SELECT pensje.kwota,premie.kwota,imie,nazwisko FROM pracownicy
JOIN wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN premie ON wynagrodzenie.id_premii = premie.id_premii
ORDER BY pensje.kwota DESC, premie.kwota DESC

--k) zlicz i pogrupuj pracownikow wedlug pola 'stanowisko'
SELECT COUNT(stanowisko),stanowisko FROM pensje
GROUP BY stanowisko

--l) policz srednia, minimalna place dla stanowiska
SELECT AVG(kwota) AS srednia, MIN(kwota) AS minimalna, MAX(kwota) AS maksymalna
FROM pensje WHERE pensje.stanowisko = ' Mid Java Dev'

--m) policz sume wszystkich wynagrodzen
SELECT SUM(kwota) FROM pensje

--n) policz sume wynagrodzen dla danego stanowiska
SELECT stanowisko, SUM(kwota) FROM pensje
GROUP BY stanowisko

--o) wyznacz liczbe premii przyznanych dla pracownikow danego stanowiska
SELECT stanowisko, COUNT(id_premii) liczba_premii
FROM wynagrodzenie
JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
GROUP BY stanowisko

--p) usun wszystkich pracownikow majacych pensje mniejsza niz 1200
DELETE FROM pracownicy
WHERE id_pracownika IN (SELECT id_pracownika
FROM wynagrodzenie
JOIN pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
WHERE kwota < 1200);