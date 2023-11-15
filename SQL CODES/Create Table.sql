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
    cost INTEGER,
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

-- Create HOLD table
CREATE TABLE hold (
    holdid INTEGER PRIMARY KEY,
    readerid INTEGER NOT NULL,
    bookid INTEGER NOT NULL,
    start_time DATE,
    end_time DATE,
    is_pickedup CHAR(1),
    FOREIGN KEY (readerid) REFERENCES readers(readerid),
    FOREIGN KEY (bookid) REFERENCES books(bookid)
);

-- Create CHECKOUT table
CREATE TABLE checkout (
    checkoutid INTEGER PRIMARY KEY,
    readerid INTEGER,
    bookid INTEGER,
    orderdate DATE,
    pickupdate DATE,
    start_time DATE,
    end_time DATE,
    is_returned CHAR(1),
    FOREIGN KEY (readerid) REFERENCES readers(readerid),
    FOREIGN KEY (bookid) REFERENCES books(bookid)
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