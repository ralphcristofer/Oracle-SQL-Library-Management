-- Drop Tables --
BEGIN
  FOR t IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE "' || t.TABLE_NAME || '" CASCADE CONSTRAINTS';
  END LOOP;
END;
/

-- DROP INDEXES
BEGIN
  FOR i IN (SELECT index_name FROM user_indexes WHERE table_owner = (SELECT USER FROM DUAL)) LOOP
    EXECUTE IMMEDIATE 'DROP INDEX ' || i.index_name;
  END LOOP;
END;
/

-- DROP SEQUENCE
BEGIN
  FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
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
-- This is joining the info of books and publisher table while creating
-- book_copy unique ID
INSERT INTO book_copy (bookcopy_id, isbn, pubid)
SELECT
    book_copy_bookcopy_id_seq.nextval AS bookcopy_id,
    b.isbn,
    b.pubid
FROM books b, publisher p
WHERE b.pubid = p.pubid;

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
VALUES (checkout_checkoutid_seq.nextval, 4, 12, '2-NOV-2023', '3-NOV-2023', '11-NOV-2023', NULL, 'Y');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 4, 11, '1-DEC-2023', '2-DEC-2023', '6-DEC-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 6, 12, '27-NOV-2023', '28-NOV-2023', '2-DEC-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 2, 4, '15-NOV-2023', '16-NOV-2023', '28-NOV-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 8, 10, '19-NOV-2023', '20-NOV-2023', '28-NOV-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 9, 9, '20-NOV-2023', '21-NOV-2023', '29-NOV-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 10, 8, '28-NOV-2023', '29-NOV-2023', '15-DEC-2023', 'N', 'N');

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