-- Create AUTHORS table
CREATE TABLE authors (
    authorid INTEGER PRIMARY KEY,
    lname VARCHAR(255),
    fname VARCHAR(255)
);

-- Create PUBLISHER table
CREATE TABLE publisher (
    pubid INTEGER PRIMARY KEY,
    name VARCHAR(255),
    contact VARCHAR(255),
    phone INTEGER
);

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

-- Create BOOK_COPY table
CREATE TABLE book_copy (
    bookcopy_id INTEGER PRIMARY KEY,
    isbn INTEGER NOT NULL,
    pubid INTEGER NOT NULL,
    FOREIGN KEY (isbn) REFERENCES books(isbn),
    FOREIGN KEY (pubid) REFERENCES publisher(pubid)
);

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

-- Create CHECKOUT table
CREATE TABLE checkout (
    checkoutid INTEGER PRIMARY KEY,
    readerid INTEGER,
    bookcopy_id INTEGER,
    order_date DATE,
    pickup_date DATE,
    start_date DATE,
    end_date DATE,
    is_pickedup CHAR(1),
    is_returned CHAR(1),
    FOREIGN KEY (readerid) REFERENCES readers(readerid),
    FOREIGN KEY (bookcopy_id) REFERENCES book_copy(bookcopy_id)
);

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