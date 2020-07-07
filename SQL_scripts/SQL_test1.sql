SELECT * FROM albums limit 10;

SELECT COUNT(*) FROM albums;

SELECT COUNT(*) FROM artists;

SELECT COUNT(*) FROM genres;

SELECT * FROM albums
    WHERE title LIKE 'A%';

--
SELECT InvoiceId, CustomerID, InvoiceDate, Total
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-10-31'

--
SELECT InvoiceId, CustomerID, InvoiceDate, Total
FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
WHERE Country = 'France'
AND InvoiceDate BETWEEN '2009-03-01' AND '2009-03-31'
---


