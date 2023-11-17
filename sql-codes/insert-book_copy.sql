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