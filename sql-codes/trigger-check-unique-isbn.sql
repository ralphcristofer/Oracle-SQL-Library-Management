-- This triggers makes sure that all books have unique ISBN

CREATE OR REPLACE TRIGGER check_unique_isbn
BEFORE INSERT OR UPDATE OF isbn ON books
FOR EACH ROW
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*)
  INTO v_count
  FROM books
  WHERE isbn = :NEW.isbn;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20005, 'The book ISBN must be unique');
  END IF;
END;
/

-- Testing to add a book with ISBN 9606784258 which is already in the database
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 9606784258, 'War Zone', '10-JUN-2023', 12, 'Plays', 79.99);