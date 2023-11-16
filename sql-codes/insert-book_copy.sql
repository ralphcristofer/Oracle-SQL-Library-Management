-- Insert data into the BOOK_COPY table
-- This is joining the info of books and publisher table while creating
-- book_copy unique ID
INSERT INTO book_copy (bookcopy_id, isbn, pubid)
SELECT
    book_copy_bookcopy_id_seq.nextval AS bookcopy_id,
    b.isbn,
    b.pubid
FROM books b, publisher p
WHERE b.pubid = p.pubid;