SELECT UnitPrice FROM InvoiceLine WHERE UnitPrice >  0.99;
SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total FROM Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId;

SELECT c.FirstName customer_first_name, c.LastName customer_last_name, 
e.FirstName rep_first_name, e.LastName rep_last_name 
FROM Customer c JOIN Employee e ON c.SupportRepId = e.EmployeeId;

SELECT t.Name FROM Track t JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId WHERE pt.PlaylistId = 5;

SELECT COUNT(pt.TrackId) FROM PlaylistTrack pt 
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId WHERE p.Name = 'Music';

SELECT  t.Name, p.Name playlist_name FROM Track t JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId JOIN Playlist p 
ON pt.PlaylistId = p.PlaylistId;

SELECT t.Name track_name, a.title album_title FROM Track t JOIN Album a ON
t.AlbumId = a.AlbumId JOIN Genre g ON g.GenreId = t.GenreId WHERE g.Name = 'Alternative';

SELECT *, p.Name playlist_name, g.Name genre_name, al.Title album_title, ar.Name artist_name FROM PlayListTrack pt
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId 
JOIN Track t ON t.TrackId = pt.TrackId
JOIN Genre g ON g.GenreId = t.GenreId 
JOIN Album al ON al.AlbumId = t.AlbumId
JOIN Artist ar ON ar.ArtistId = al.ArtistId;

/* */

/* */
/* Subqueries */
SELECT * FROM InvoiceLine WHERE UnitPrice IN (SELECT UnitPrice FROM InvoiceLine WHERE UnitPrice > 0.99);

SELECT * FROM PlaylistTrack WHERE PlaylistId IN (SELECT PlaylistId FROM Playlist WHERE Name = 'Music');
SELECT * FROM PlaylistTrack pt WHERE pt.PlaylistId = (SELECT p.PlaylistId FROM Playlist p WHERE p.Name = 'Music');

SELECT * FROM Track WHERE GenreId IN (SELECT GenreId FROM Genre WHERE Name = 'Comedy');
SELECT * FROM Track t WHERE t.GenreId = (SELECT g.GenreId FROM Genre g WHERE g.Name = 'Comedy');

SELECT * FROM Track WHERE AlbumId IN (SELECT AlbumId FROM Album WHERE Title = 'Fireball');

SELECT * FROM Track WHERE AlbumId IN ( SELECT AlbumId FROM Album al WHERE ArtistId IN (
	SELECT ArtistId FROM Artist WHERE Name = 'Queen' 
));

/* */

/*Updating Rows */
UPDATE Customer SET FAX = NULL WHERE FAX IS NOT NULL;
SELECT * FROM Customer;

UPDATE Customer SET Company = 'Self' WHERE Company IS NULL;

UPDATE Customer SET LastName = 'Thompson' WHERE FirstName = 'Julia';

UPDATE Customer SET SupportRepId = 4 WHERE Email = 'luisrojas@yahoo.cl';

UPDATE Track SET Composer = 'The darkness around us' WHERE GenreId IN 
(SELECT GenreId FROM Genre WHERE Name = 'Metal');

/* Group By */
SELECT COUNT(*), g.Name FROM Track t 
JOIN Genre g ON t.GenreId = g.GenreId 
GROUP BY g.Name;

SELECT COUNT(*), g.Name FROM Track t 
JOIN Genre g ON t.GenreId = g.GenreId 
GROUP BY g.Name HAVING g.Name = 'Pop' OR g.Name = 'Rock';

SELECT ar.Name, COUNT(*) FROM Artist ar 
JOIN Album al ON ar.ArtistId = al.ArtistId GROUP BY ar.Name; 

/* Distinct Columns */
SELECT DISTINCT Composer FROM Track;

SELECT DISTINCT BillingPostalCode FROM Invoice;

SELECT DISTINCT Company FROM Customer;

/**/

/* Delete Rows */
DELETE FROM practice_delete WHERE Type = 'bronze';
DELETE FROM practice_delete WHERE Type = 'silver';
DELETE FROM practice_delete WHERE Value = 150;
/* */

/* eCommmerce Simulation */
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    name VARCHAR(50),
    price INTEGER
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id)
)

INSERT INTO users  ( name, email) VALUES ( 'Ali ALhaddad', 'devmtnali@gmail.com');
INSERT INTO users  ( name, email) VALUES ( 'Ali Q ALhaddad', 'aalhaddad1997@gmail.com');
INSERT INTO users  ( name, email) VALUES ( 'Ali Q Alhaddad', 'AQA1997@'); */
 INSERT INTO products  ( name, price) VALUES ( 'Bottle Rocket', 20);
INSERT INTO products  ( name, price) VALUES ( 'Basketball', 10);
INSERT INTO products  ( name, price) VALUES ( 'Football', 8); 
INSERT INTO orders (product_id) VALUES (1);
INSERT INTO orders (product_id) VALUES (2);
INSERT INTO orders (product_id) VALUES (3); 

