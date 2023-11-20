-- Just for checking if rows are populated
SELECT * FROM authors;

SELECT * FROM books_authors;

SELECT * FROM publisher;

SELECT * FROM books;

SELECT b.isbn
FROM books b
    JOIN publisher p ON b.pubid = p.pubid
WHERE p.pubid = 5;

SELECT * FROM book_copy;

SELECT * FROM readers;

SELECT * FROM checkout;