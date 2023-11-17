CREATE OR REPLACE PACKAGE CHECK_AVAIL_BOOK_PKG
    IS
        PROCEDURE GET_CHECKEDOUT_BOOK_SP (p_isbn IN VARCHAR2);
END;
/
CREATE OR REPLACE PACKAGE BODY CHECK_AVAIL_BOOK_PKG
    IS
    PROCEDURE GET_CHECKEDOUT_BOOK_SP (p_isbn IN VARCHAR2)
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
                                EXIT;
                        --When isbn is found in the checkedout cursor
                        --Then it is not available
                            ELSIF tbl_item(i).isbn = p_isbn THEN
                                is_available := 'N';
                                --Exception is raised when book isn't found
                                RAISE ex_not_found;
                            END IF;
                        END LOOP;
                    EXIT WHEN cur_book%NOTFOUND;
                END LOOP;
            CLOSE cur_book;
            DBMS_OUTPUT.PUT_LINE('Book is available.');
    EXCEPTION 
        WHEN ex_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Book is not available.');
    END GET_CHECKEDOUT_BOOK_SP;
END;
/

--Anonymous block to test the package for when book isn found
DECLARE
p_isbn INTEGER:=350868646;
BEGIN
CHECK_AVAIL_BOOK_PKG.GET_CHECKEDOUT_BOOK_SP(p_isbn);
END;

--Anonymous block to test the package for when book isn't found
DECLARE
p_isbn INTEGER:=3508689646;
BEGIN
CHECK_AVAIL_BOOK_PKG.GET_CHECKEDOUT_BOOK_SP(p_isbn);
END;