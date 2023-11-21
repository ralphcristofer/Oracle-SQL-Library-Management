-- Drops all tables
BEGIN
  FOR t IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE "' || t.TABLE_NAME || '" CASCADE CONSTRAINTS';
  END LOOP;
END;
/

-- Drops all indexes
BEGIN
  FOR i IN (SELECT index_name FROM user_indexes WHERE table_owner = (SELECT USER FROM DUAL)) LOOP
    EXECUTE IMMEDIATE 'DROP INDEX ' || i.index_name;
  END LOOP;
END;
/

-- Drops all sequences
BEGIN
  FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
  END LOOP;
END;
/

-- Drops all triggers
BEGIN
  FOR t IN (SELECT trigger_name FROM user_triggers) LOOP
    EXECUTE IMMEDIATE 'DROP TRIGGER ' || t.trigger_name;
  END LOOP;
END;
/

-- Drops all packages
BEGIN
  FOR p IN (SELECT object_name FROM user_objects WHERE object_type = 'PACKAGE') LOOP
    EXECUTE IMMEDIATE 'DROP PACKAGE ' || p.object_name;
  END LOOP;
END;
/


-- Create sequence for AUTHORS table
CREATE SEQUENCE authors_authorid_seq 
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Create AUTHORS table
CREATE TABLE authors (
    authorid INTEGER PRIMARY KEY,
    lname VARCHAR(255),
    fname VARCHAR(255)
);

-- Insert data from authors
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Eliana', 'Landry');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Amy', 'Snow');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Antwan', 'Arias');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Ana', 'Beltran');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Kathleen', 'Valencia');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Dylan', 'Huffman');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Raelynn', 'Russo');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Anaya', 'Solomon');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Leah', 'Wilkinson');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Blake', 'Mullen');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Ellias', 'Ellis');
INSERT INTO authors (authorid, fname, lname) 
VALUES (authors_authorid_seq.NEXTVAL, 'Zoe', 'Ware');

-- Create sequence for PUBLISHER table
CREATE SEQUENCE publishers_pubid_seq 
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Create PUBLISHER table
CREATE TABLE publisher (
    pubid INTEGER PRIMARY KEY,
    name VARCHAR(255),
    contact VARCHAR(255),
    phone INTEGER
);

-- Insert publisher data
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Raven Mccann', 'raven.mccann@gmail.com', '5143225600');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Immanuel Higgins', 'immanuel.higgins@gmail.com', '2502478228');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Karsyn Crane', 'karsyn.crane@gmail.com', '4189461697');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Conrad Barton', 'conrad.barton@gmail.com', '5063616098');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Jordyn Bray', 'jordyn.bray@gmail.com', '7098815059');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Keenan Cowan', 'keenan.cowan@yahoo.com', '4163931348');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Dominick Giles', 'dominick.giles@yahoo.com', '4168576650');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Laci Poole', 'laci.poole@yahoo.com', '5147912512');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Deven Gibbs', 'deven.gibbs@yahoo.com', '2508469787');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Reagan Lewis', 'reagan.lewis@yahoo.com', '4169466243');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Cara Beltran', 'cara.beltran@gmail.com', '2894598662');
INSERT INTO publisher (pubid, name, contact, phone) 
VALUES (publishers_pubid_seq.nextval, 'Jocelyn Hansen', 'jocelyn.hansen@yahoo.com', '4169736058');

-- Create index for PUBLISHER table
CREATE INDEX idx_publisher_name ON publisher(name);

-- Create sequence for BOOKS table
CREATE SEQUENCE books_bookid_seq 
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Create BOOKS table
CREATE TABLE books (
    bookid INTEGER PRIMARY KEY,
    isbn INTEGER UNIQUE NOT NULL,
    title VARCHAR(255),
    pubdate DATE,
    pubid INTEGER,
    category VARCHAR(255),
    cost DECIMAL(5,2),
    FOREIGN KEY (pubid) REFERENCES publisher(pubid)
);

-- Insert books data
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 5111129073, 'The Sanctuary of Legend', '15-JUL-2010', 1, 'Adventure stories', 14.99);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 1136427511, 'Polar Exile', '16-AUG-2002', 2, 'Classics', 22.49);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 5819445988, 'Taste of Wolves', '17-SEP-2013', 3, 'Crime', 29.98);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 1582980624, 'The Silhouette in the Dark City', '18-OCT-2000', 4, 'Fairy tales, fables, and folk tales', 60.00);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 8629488247, 'The Gun in the Painting', '19-NOV-2018', 5, 'Fantasy', 70.99);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 3508689646, 'Death of the Fake Falcon', '20-DEC-2020', 6, 'Historical fiction', 40.00);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 5665170631, 'Clue of the Cold Map', '21-JAN-2007', 7, 'Horror', 55.00);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 3649138913, 'Plague of Death', '22-FEB-2008', 8, 'Humour and satire', 80.00);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 7093496717, 'Tinder Tender', '23-MAR-2004', 9, 'Literary fiction', 90.49);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 7770207150, 'Eclipse of Solaris', '24-APR-2011', 10, 'Mystery', 99.99);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 5941091990, 'Polar Angel', '25-MAY-2016', 11, 'Poetry', 88.50);
INSERT INTO books (bookid, isbn, title, pubdate, pubid, category, cost) 
VALUES (books_bookid_seq.nextval, 9606784258, 'Twilight of Algorab', '26-JUN-2003', 12, 'Plays', 79.99);

-- Create index for BOOKS table
CREATE INDEX idx_books_title ON books(title);

-- Create sequence for BOOK_COPY table
CREATE SEQUENCE book_copy_bookcopy_id_seq 
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Create BOOK_COPY table
CREATE TABLE book_copy (
    bookcopy_id INTEGER PRIMARY KEY,
    isbn INTEGER NOT NULL,
    pubid INTEGER NOT NULL,
    FOREIGN KEY (isbn) REFERENCES books(isbn),
    FOREIGN KEY (pubid) REFERENCES publisher(pubid)
);

-- Insert data into the BOOK_COPY table
-- Notice that there is repeated ISBN and even pubid but not the
-- bookcopy_id. This is because the bookcopy_id is a primary key
INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,5111129073, 1);

INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,5665170631, 7);

INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,5665170631, 7);

INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,5941091990, 11);

INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,5941091990, 11);

INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,3649138913, 8);

INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,3508689646, 6);

INSERT INTO book_copy (bookcopy_id, isbn, pubid)
VALUES(book_copy_bookcopy_id_seq.nextval,3508689646, 6);

-- Create index for BOOK_COPY table
CREATE INDEX idx_book_copy_isbn ON book_copy(isbn);
CREATE INDEX idx_book_copy_pubid ON book_copy(pubid);

-- Create sequence for READERS table
CREATE SEQUENCE readers_readerid_seq 
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Create READERS table
CREATE TABLE readers (
    readerid INTEGER PRIMARY KEY,
    lname VARCHAR(255),
    fname VARCHAR(255),
    email VARCHAR(255),
    phone INTEGER,
    address VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(255),
    zip VARCHAR(255)
);

-- Insert readers data
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Kane', 'Ada', 'ada.kane@gmail.com', 7052815839, '123 Main St', 'Toronto', 'ON', 'M1M1M1');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Combs', 'Christian', 'christian.combs@gmail.com', 2509289146, '456 Maple Ave', 'Vancouver', 'BC', 'V1V1V1');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Mercer', 'Natasha', 'natasha.mercer@gmail.com', 4189099471, '789 Oak St', 'Quebec City', 'QC', 'G1G1G1');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Larsen', 'Josie', 'josie.larsen@gmail.com', 9029985964, '321 Pine St', 'Halifax', 'NS', 'B2B2B2');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Boyle', 'Emerson', 'emerson.boyle@gmail.com', 7808339688, '654 Elm St', 'Edmonton', 'AB', 'T3T3T3');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Boone', 'Anabella', 'anabella.boone@gmail.com', 3063653302, '987 Cedar St', 'Saskatoon', 'SK', 'S4S4S4');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Whitaker', 'Kristopher', 'kristopher.whitaker@gmail.com', 4183813590, '147 Spruce St', 'Quebec City', 'QC', 'G2G2G2');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Torres', 'Jenny', 'jenny.torres@gmail.com', 2049755580, '258 Birch St', 'Winnipeg', 'MB', 'R3R3R3');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Mann', 'Leilani', 'leilani.mann@gmail.com', 7052012261, '369 Willow St', 'Toronto', 'ON', 'M4M4M4');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Mcmillan', 'Averie', 'averie.mcmillan@gmail.com', 8679253980, '741 Poplar St', 'Yellowknife', 'NT', 'X1X1X1');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Coffey', 'Valeria', 'valeria.coffey@gmail.com', 2263247918, '852 Cherry St', 'London', 'ON', 'N5N5N5');
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Mora', 'Carley', 'carley.mora@gmail.com', 3068235252, '963 Walnut St', 'Saskatoon', 'SK', 'S6S6S6');

-- Create index for READERS table
CREATE INDEX idx_readers_lname ON readers(lname);
CREATE INDEX idx_readers_phone ON readers(phone);

-- Create sequence for CHECKOUT table
CREATE SEQUENCE checkout_checkoutid_seq 
    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Create CHECKOUT table
CREATE TABLE checkout (
    checkoutid INTEGER PRIMARY KEY,
    readerid INTEGER,
    bookcopy_id INTEGER,
    order_date DATE,
    pickup_date DATE,
    return_date DATE,
    is_pickedup CHAR(1),
    is_returned CHAR(1),
    FOREIGN KEY (readerid) REFERENCES readers(readerid),
    FOREIGN KEY (bookcopy_id) REFERENCES book_copy(bookcopy_id)
);

-- Insert checkout data
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 10, 1, '13-NOV-2023', '14-NOV-2023', '28-NOV-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 10, 2, '15-NOV-2023', '16-NOV-2023', '30-NOV-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 3, 3, '26-NOV-2023', '27-NOV-2023', '30-NOV-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 4, 4, '2-NOV-2023', '3-NOV-2023', '11-NOV-2023', NULL, 'Y');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 4, 5, '1-DEC-2023', '2-DEC-2023', '6-DEC-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 6, 6, '27-NOV-2023', '28-NOV-2023', '2-DEC-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 2, 7, '15-NOV-2023', '16-NOV-2023', '28-NOV-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 8, 8, '19-NOV-2023', '20-NOV-2023', '28-NOV-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 7, 7, '12-NOV-2023', '20-NOV-2023', '31-DEC-2023', 'Y', 'Y');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 7, 7, '25-NOV-2023', '30-NOV-2023', '30-JAN-2024', 'Y', 'Y');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned)
VALUES (checkout_checkoutid_seq.nextval, 7, 7, '31-OCT-2023', '1-DEC-2023', '15-DEC-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned)
VALUES (checkout_checkoutid_seq.nextval, 10, 1, '20-JULY-2023', '22-JULY-2023', '20-JAN-2024', 'Y', 'Y');

-- Create index for CHECKOUT table
CREATE INDEX idx_checkout_readerid ON checkout(readerid);
CREATE INDEX idx_checkout_bookcopy_id ON checkout(bookcopy_id);

-- Create BOOKS_AUTHORS table
CREATE TABLE books_authors (
    books_bookid INTEGER,
    authors_authorid INTEGER,
    FOREIGN KEY (books_bookid) REFERENCES books(bookid),
    FOREIGN KEY (authors_authorid) REFERENCES authors(authorid),
    -- I use composite key because it is frequently be used for joins
    -- It will be automatically indexed
    PRIMARY KEY (books_bookid, authors_authorid)
);

-- Insert data from BOOKS_AUTHORS table from BOOKS and AUTHORS table
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (1,1);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (2,2);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (3,3);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (4,4);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (5,5);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (6,6);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (7,7);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (8,8);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (9,9);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (10,10);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (11,11);
INSERT INTO books_authors (books_bookid, authors_authorid)
VALUES (12,12);

-- Create BOOK_ORDER table
CREATE TABLE book_order (
    bookid INTEGER PRIMARY KEY,
    isbn INTEGER NOT NULL,
    order_date DATE DEFAULT SYSDATE
);

------------------------------------------------------
----------------TRIGGER SECTION-----------------------
------------------------------------------------------

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

-- This trigger makes sure that phone is a 10-digit number.
CREATE OR REPLACE TRIGGER check_phone_length
BEFORE INSERT OR UPDATE OF phone ON readers
FOR EACH ROW
BEGIN
  IF LENGTH(:NEW.phone) != 10 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Phone number should have 10 digits');
  END IF;
END;
/

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

-- This trigger checks the status of the checkedout book
-- If the book is already pickedup, it makes sure to record 
-- that the book is not returned yet.
-- If the book is not yet pickedup, then it nothing to return.
CREATE OR REPLACE TRIGGER update_checkout_status
BEFORE INSERT OR UPDATE ON checkout
FOR EACH ROW
BEGIN
  IF :NEW.pickup_date IS NOT NULL THEN
    :NEW.is_pickedup := 'Y';
    :NEW.is_returned := 'N';
  ELSE
    :NEW.is_pickedup := 'N';
    :NEW.is_returned := NULL;
  END IF;
END;
/

------------------------------------------------------
----------------PACKAGE SECTION-----------------------
------------------------------------------------------

-- Declare package with a procedure to get books by title
CREATE OR REPLACE PACKAGE BOOK_SEARCH_PKG
    IS
        PROCEDURE GET_BOOKS_BY_TITLE_SP (
        p_title IN VARCHAR2);
END;
/

-- Body of the package and procedure
CREATE OR REPLACE PACKAGE BODY BOOK_SEARCH_PKG
    IS
    PROCEDURE GET_BOOKS_BY_TITLE_SP (
        p_title IN VARCHAR2)
    IS
        v_cursor SYS_REFCURSOR;
        v_bookid books.bookid%TYPE;
        v_isbn books.isbn%TYPE;
        v_title books.title%TYPE;
        ex_book_notfound EXCEPTION;
    BEGIN
        OPEN v_cursor FOR
            SELECT b.bookid, b.isbn, b.title
            FROM books b
            WHERE title LIKE '%' || p_title || '%';
        --Use loop because there can be multipe search result
        LOOP
            FETCH v_cursor INTO v_bookid, v_isbn, v_title;
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Book ID ' || v_bookid || ' ISBN ' || v_isbn || ' Title ' || v_title);
        END LOOP;
        
        -- Raise an exception if no books were found
        IF v_cursor%NOTFOUND THEN
            RAISE ex_book_notfound;   
        END IF;
        
        CLOSE v_cursor;
        
        -- Handle the exception and output a message
        EXCEPTION
            WHEN ex_book_notfound THEN
            DBMS_OUTPUT.PUT_LINE('Not found!');
            
    END GET_BOOKS_BY_TITLE_SP;
END;
/

------------------------------------------------------
------------------------------------------------------

-- Declare package with two functions:
-- Calculate late fess
-- Display checked out books
CREATE OR REPLACE PACKAGE CAL_LATE_FEE_PKG
IS
    FUNCTION CALCULATE_LATE_FEE_SF
    (p_checkout_id IN checkout.checkoutid%TYPE) 
    RETURN NUMBER;
    
    FUNCTION DISPLAY_CHECKOUT_BOOK_SF
    RETURN VARCHAR2;

END;
/

CREATE OR REPLACE PACKAGE BODY CAL_LATE_FEE_PKG
IS
    -- Function to calculate the late fee for a given checkout ID
    FUNCTION CALCULATE_LATE_FEE_SF
    (p_checkout_id IN checkout.checkoutid%TYPE) 
    RETURN NUMBER
        IS
            v_pickup_date DATE;
            v_return_date DATE;
            v_late_fee_per_day NUMBER := 3;
            v_late_fee NUMBER := 0;
        BEGIN
    
            SELECT pickup_date, return_date
            INTO v_pickup_date, v_return_date
            FROM checkout
            WHERE checkoutid = p_checkout_id;
        
            --Condition that book is returned
            IF v_return_date IS NOT NULL AND ((v_return_date - v_pickup_date)-30) > 0 THEN
            --Cal late fee if the gap between the pickup date and return date is more than 30 days
                v_late_fee := ((v_return_date - v_pickup_date)-30) * v_late_fee_per_day;
            END IF;
        
            -- Ensure late fee is not negative
            IF v_late_fee < 0 THEN
                v_late_fee := 0;
            END IF;

        RETURN v_late_fee;
    END CALCULATE_LATE_FEE_SF;
    
    -- Function to display the details of all checked out books
    FUNCTION DISPLAY_CHECKOUT_BOOK_SF
    RETURN VARCHAR2
        IS
            CURSOR cur_book IS
            SELECT co.checkoutid, co.bookcopy_id, bc.isbn, b.title
            FROM checkout co 
            JOIN book_copy bc ON co.bookcopy_id = bc.bookcopy_id
            JOIN books b ON bc.isbn = b.isbn;
            result_string VARCHAR2(4000);
        BEGIN
        
            -- Loop through the results and append each book's details to the result string
            FOR checkout_rec IN cur_book LOOP
              result_string := result_string || 'Checkout ID: ' || checkout_rec.checkoutid || CHR(10);
              result_string := result_string || 'Bookcopy ID ' || checkout_rec.bookcopy_id || CHR(10);
              result_string := result_string || 'ISBN ' || checkout_rec.isbn || CHR(10);
              result_string := result_string || 'Title ' || checkout_rec.title || CHR(10);
            END LOOP;

        RETURN result_string;
    END DISPLAY_CHECKOUT_BOOK_SF;
END;
/

------------------------------------------------------
------------------------------------------------------

-- Declare a package with a procedure to get checked out books by ISBN
CREATE OR REPLACE PACKAGE CHECK_AVAIL_BOOK_PKG
    IS
        PROCEDURE GET_CHECKEDOUT_BOOK_SP (p_isbn IN INTEGER);
END;
/

-- Body of the package and procedure
CREATE OR REPLACE PACKAGE BODY CHECK_AVAIL_BOOK_PKG
    IS
    
    -- Procedure to check if a book with a given ISBN is checked out
    PROCEDURE GET_CHECKEDOUT_BOOK_SP (p_isbn IN INTEGER)
        AS
             is_available VARCHAR2(1);
             ex_not_found EXCEPTION;
             ex_found EXCEPTION;
             --Cursor to hold the checkedout book from the query
             CURSOR cur_book IS
             SELECT b.title AS title, b.isbn AS isbn
                        FROM checkout c
                            JOIN book_copy bc ON c.bookcopy_id = bc.bookcopy_id
                            JOIN books b ON bc.isbn = b.isbn
                        WHERE c.is_pickedup = 'Y';
            --ROWTYPE is used because cursor may hold multiple values
             TYPE type_book IS TABLE OF cur_book%ROWTYPE
                INDEX BY PLS_INTEGER;
                tbl_item type_book;
        BEGIN
            OPEN cur_book;
                LOOP
                    FETCH cur_book BULK COLLECT INTO tbl_item;
                        FOR i IN 1..tbl_item.COUNT LOOP
                        --When isbn isn't found in the checkedout cursor
                        --Then it is available
                            IF tbl_item(i).isbn <> p_isbn THEN
                                is_available := 'Y';
                        --When isbn is found in the checkedout cursor
                        --Then it is not available
                            ELSIF tbl_item(i).isbn = p_isbn THEN
                                --Exception is raised when book isn't found
                                RAISE ex_not_found;
                            END IF;
                        END LOOP;
                    EXIT WHEN cur_book%NOTFOUND;
                END LOOP;
            CLOSE cur_book;
            IF is_available = 'Y' THEN
            DBMS_OUTPUT.PUT_LINE('Book is available.');
            END IF;
    EXCEPTION 
        WHEN ex_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Book is not available.');
    END GET_CHECKEDOUT_BOOK_SP;
END;
/

------------------------------------------------------
------------------------------------------------------

-- Procedure to fetch books by title from the 'books' table and output the details
CREATE OR REPLACE PROCEDURE GET_BOOKS_BY_TITLE_SP (
        p_title IN VARCHAR2)
    IS
        v_cursor SYS_REFCURSOR;
        v_bookid books.bookid%TYPE;
        v_isbn books.isbn%TYPE;
        v_title books.title%TYPE;
        ex_book_notfound EXCEPTION;
    BEGIN
        OPEN v_cursor FOR
            SELECT b.bookid, b.isbn, b.title
            FROM books b
            WHERE title LIKE '%' || p_title || '%';
        --Use loop because there can be multipe search result
        LOOP
            FETCH v_cursor INTO v_bookid, v_isbn, v_title;
            EXIT WHEN v_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Book ID ' || v_bookid || ' ISBN ' || v_isbn || ' Title ' || v_title);
        END LOOP;
        
        -- Raise an exception if no books were found
        IF v_cursor%NOTFOUND THEN
            RAISE ex_book_notfound;   
        END IF;
        
        CLOSE v_cursor;
        
        -- Handle the exception and output a message
        EXCEPTION
            WHEN ex_book_notfound THEN
            DBMS_OUTPUT.PUT_LINE('Not found!');
            
END GET_BOOKS_BY_TITLE_SP;
/

------------------------------------------------------
------------------------------------------------------

-- Package that contains function to get the most popular book
-- and a procedure to order it
CREATE OR REPLACE PACKAGE GET_POP_BOOK_PK
IS
    --Declare type_book here so that it can be returned in the function
    TYPE type_book IS RECORD (
        isbn book_copy.isbn%TYPE,
        bookcopy_id book_copy.bookcopy_id%TYPE
    );

    -- Function to get the most popular book
    FUNCTION GET_POP_BOOK_SF
        RETURN type_book;
        
    -- Procedure to order the most popular book
    PROCEDURE ORDER_POP_BOOK_SP;
    
END GET_POP_BOOK_PK;
/

CREATE OR REPLACE PACKAGE BODY GET_POP_BOOK_PK
IS
    -- Function returns the most popular book by the most checkouts
    FUNCTION GET_POP_BOOK_SF
        RETURN type_book
    IS
        rec_book type_book;
    BEGIN
        SELECT bc.isbn, a.bookcopy_id
        INTO rec_book
        FROM book_copy bc
        JOIN (
            SELECT bookcopy_id, COUNT(*) AS checkout_count
            FROM CHECKOUT 
            GROUP BY bookcopy_id
            ORDER BY checkout_count DESC
            FETCH FIRST 1 ROW ONLY
        ) a
        ON bc.bookcopy_id = a.bookcopy_id;

        RETURN rec_book;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            --Return NULL when no data found.
            NULL; 
    END GET_POP_BOOK_SF;
    
    -- Procedure to order the most popular book
    PROCEDURE ORDER_POP_BOOK_SP
        IS
            result_book GET_POP_BOOK_PK.type_book;
    BEGIN
        result_book := GET_POP_BOOK_PK.GET_POP_BOOK_SF;
        INSERT INTO book_order(bookid, isbn)
        --Use sequence to generate bookid
        VALUES (book_copy_bookcopy_id_seq.nextval, result_book.isbn);
    END ORDER_POP_BOOK_SP;
END GET_POP_BOOK_PK;
/