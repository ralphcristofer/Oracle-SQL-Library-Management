-- Unsure of what value to start so I just made them all like this
-- Made them all from the beginning so it is easy to locate
-- Create sequence for BOOKS table
CREATE SEQUENCE books_bookid_seq START WITH 1 INCREMENT BY 1;

-- Create sequence for AUTHORS table
CREATE SEQUENCE authors_authorid_seq START WITH 1 INCREMENT BY 1;

-- Create sequence for READERS table
CREATE SEQUENCE readers_readerid_seq START WITH 1 INCREMENT BY 1;

-- Create sequence for PUBLISHER table
CREATE SEQUENCE publishers_pubid_seq START WITH 1 INCREMENT BY 1;

-- Create sequence for BOOK_COPY table
CREATE SEQUENCE book_copy_bookid_seq START WITH 1 INCREMENT BY 1;

-- Create sequence for HOLD table
CREATE SEQUENCE hold_holdid_seq START WITH 1 INCREMENT BY 1;

-- Create sequence for CHECKOUT table
CREATE SEQUENCE checkout_checkoutid_seq START WITH 1 INCREMENT BY 1;