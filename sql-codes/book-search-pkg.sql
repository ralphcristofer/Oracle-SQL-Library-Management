CREATE OR REPLACE PACKAGE BOOK_SEARCH_PKG
    IS
        PROCEDURE GET_BOOKS_BY_TITLE_SP (
        p_title IN VARCHAR2);
END;
/

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
        
        IF v_cursor%NOTFOUND THEN
            RAISE ex_book_notfound;   
        END IF;
        
        CLOSE v_cursor;
        
        EXCEPTION
            WHEN ex_book_notfound THEN
            DBMS_OUTPUT.PUT_LINE('Not found!');
            
    END GET_BOOKS_BY_TITLE_SP;
END;
/

--Anonymous block for testing
DECLARE
    p_title VARCHAR2(225):= '&Enter_Book_Name';
BEGIN
    BOOK_SEARCH_PKG.GET_BOOKS_BY_TITLE_SP(p_title);
END;