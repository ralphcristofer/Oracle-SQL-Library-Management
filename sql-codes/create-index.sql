-- Create index for foreign keys of the created table
-- BOOKS table
-- I picked the title to be indexed as it is the most frequently searched imo
CREATE INDEX idx_books_title ON books(title);

-- PUBLISHER table
CREATE INDEX idx_publisher_name ON publisher(name);

-- BOOK_COPY table
CREATE INDEX idx_book_copy_isbn ON book_copy(isbn);
CREATE INDEX idx_book_copy_pubid ON book_copy(pubid);

-- HOLD table
CREATE INDEX idx_hold_readerid ON hold(readerid);
CREATE INDEX idx_hold_bookid ON hold(bookid);

-- CHECKOUT table
CREATE INDEX idx_checkout_readerid ON checkout(readerid);
CREATE INDEX idx_checkout_bookid ON checkout(bookid);