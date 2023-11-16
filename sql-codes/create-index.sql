-- Create index for foreign keys of the created table
-- BOOKS table
-- I picked the title to be indexed as it is the most frequently searched imo
CREATE INDEX idx_books_title ON books(title);

-- Create index for PUBLISHER table
CREATE INDEX idx_publisher_name ON publisher(name);

-- Create index for BOOK_COPY table
CREATE INDEX idx_book_copy_isbn ON book_copy(isbn);
CREATE INDEX idx_book_copy_pubid ON book_copy(pubid);

-- Create index for READERS table
CREATE INDEX idx_readers_lname ON readers(lname);
CREATE INDEX idx_readers_phone ON readers(phone);

-- Create index for CHECKOUT table
CREATE INDEX idx_checkout_readerid ON checkout(readerid);
CREATE INDEX idx_checkout_bookcopy_id ON checkout(bookcopy_id);
