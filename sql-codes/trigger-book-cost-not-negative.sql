-- This trigger makes sure that book cost is a non-negative value
CREATE OR REPLACE TRIGGER check_book_cost
BEFORE INSERT OR UPDATE OF cost ON books
FOR EACH ROW
BEGIN
  IF :NEW.cost < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Book cost should not be negative');
  END IF;
END;
/

-- Testing the trigger giving a negative cost value
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 9606123258, 'The Light in the Dark', '20-JUN-2001', 12, 'Plays', -100);