-Year in SQLite
SELECT
    LastName,
    FirstName,
    strftime('%Y', BirthDate) AS Year_of_birth
FROM
    employees
;
---

--Month in SQLite
SELECT
    LastName,
    FirstName,
    strftime('%m', BirthDate) AS month_of_birth
FROM
    employees
;

---zad. 2.2
SELECT
    LastName,
    FirstName,
    strftime('%Y', BirthDate) AS Year_of_birth,
    strftime('%m', BirthDate) AS Month_of_birth,
    strftime('%d', BirthDate) AS Day_of_birth,
    strftime('%w', BirthDate) AS Day_of_week_of_birth
FROM
    employees
;
---

--zad.2.3
SELECT
    LastName,
    FirstName
FROM
    employees
WHERE
    strftime('%Y', BirthDate)='1973'

;

--zad.2.5.
SELECT
    DATETIME(CURRENT_TIMESTAMP, 'localtime') AS czas
;

--zad.2.6.
SELECT
    strftime('%Y', DATETIME(CURRENT_TIMESTAMP, 'localtime')) - 1990 AS ile_lat
;

--zadania ze str. Samouczekprogramisty.pl, Klauzula JOIN w zapytaniach SQL;
--zad. zapyt, które zwróci liczbę wierszy w iloczynie kartezjańskim 3 tabel (trochę to potrwało)
SELECT COUNT (*)
    FROM tracks,
        invoices,
        invoice_items;

SELECT COUNT (*)
    FROM tracks
;
--3503

SELECT COUNT (*)
    FROM invoices
;
--412

SELECT COUNT (*)
    FROM
    invoice_items;
--2240
--szybciej zajęły pojedyncze zapytania; potrójny select count (*) trwał 894 s;

--Zad2.
SELECT
    Title
FROM
    albums
JOIN artists ON albums.ArtistID = artists.ArtistID
WHERE artists.Name LIKE 's%';

--zad.3 zapyt, które zwróci identyfikator i nazwę list utworów (tabela playlist), które są puste, - przerobione zapewne przez różne zawartości tabel, w tym kolumn
-- pokazuje, te dla których kompozytor w tabeli tracks ma pustą wartość + pokazuje tytuł utworu, by było więcej danych
SELECT
    playlists.PlaylistId,
    playlists.Name,
    tracks.Name
FROM
    playlists
LEFT JOIN playlist_track ON playlist_track.PlaylistId = playlists.PlaylistId
LEFT JOIN tracks ON tracks.TrackId = playlist_track.TrackId
WHERE tracks.Composer IS NULL
;

--zad.4 - nazwy 3 najczęściej występ. gatunków muz. (kol. name w tab. genre) wraz z odp. im liczbą utworów (Tab. tracks) posort. malejąco po liczbie utworów;
SELECT genres.Name,
    COUNT (*) AS ile_utworów
    FROM
    genres
LEFT JOIN tracks ON tracks.GenreId = genres.GenreId
GROUP BY genres.Name
ORDER BY ile_utworów DESC
LIMIT 3;

--zad.5 tytuły 5 najdłuższych albumow (kol. title w tab. album) posortowanych malejąco po ich długości (kol. milliseconds w tab. trancks)
SELECT albums.Title,
    tracks.Milliseconds
    FROM
    albums
JOIN tracks ON albums.AlbumId = tracks.AlbumId
GROUP BY albums.AlbumId
ORDER BY SUM(tracks.Milliseconds) DESC
LIMIT 5;

--zad.6 tytuły albumów, na których występują utwory z gatunku "Reggae"; distinct - by się nie powtarzało
SELECT DISTINCT
    albums.Title
    FROM
    albums
JOIN tracks ON tracks.AlbumId = albums.AlbumId
JOIN genres ON genres.GenreId = tracks.GenreId
WHERE genres.Name = 'Reggae'
;

--zad.7 - 5 nazw list utworów, które są najdroższe (suma cen wsz. ścieżek jest największa)
SELECT
    playlists.Name,
    SUM(tracks.UnitPrice)
    FROM
    playlists
JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
JOIN tracks ON tracks.TrackId = playlist_track.TrackId
GROUP BY playlists.Name
ORDER BY SUM(tracks.UnitPrice) DESC
LIMIT 5
;

--funkcje-i-grupowanie-wierszy-w-sql/
--Zad.1 zapyt, które zwróci średnią, min i max wartość kolumny total w tab invoices
SELECT
    AVG(total),
    MIN(total),
    MAX(total)
FROM
    invoices
;

--zad.2 liczba wierszy w tab. invoices, w których dlugość kolumny billingcountry jest większa niż 5;
SELECT COUNT (*)
FROM
    invoices
WHERE LENGTH(BillingCountry) > 5
;

--Zad.3 liczba unikalnych dat (kol. invoicedate), w których wystawiono faktury (tab. invoices)
SELECT COUNT (DISTINCT InvoiceDate)
    FROM
    invoices
;
