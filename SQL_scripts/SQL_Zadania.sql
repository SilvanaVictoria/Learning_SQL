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

