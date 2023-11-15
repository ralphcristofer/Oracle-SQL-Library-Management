-- Data inserts
INSERT INTO authors (authorid, fname, lname) VALUES (authors_authorid_seq.NEXTVAL, 'Eliana', 'Landry');
INSERT INTO authors (authorid, fname, lname) VALUES (authors_authorid_seq.NEXTVAL, 'Amy', 'Snow');
INSERT INTO authors (authorid, fname, lname) VALUES (authors_authorid_seq.NEXTVAL, 'Antwan', 'Arias');
INSERT INTO authors (authorid, fname, lname) VALUES (authors_authorid_seq.NEXTVAL, 'Ana', 'Beltran');
INSERT INTO authors (authorid, fname, lname) VALUES (authors_authorid_seq.NEXTVAL, 'Kathleen', 'Valencia');
INSERT INTO authors (authorid, fname, lname) VALUES (authors_authorid_seq.NEXTVAL, 'Dylan', 'Huffman');


SELECT * FROM authors;

UPDATE authors
SET authorid = authors_authorid_seq.nextval
WHERE lname = 'Snow' AND fname='Amy'