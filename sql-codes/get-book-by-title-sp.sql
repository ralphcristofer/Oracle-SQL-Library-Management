-- Procedure to fetch books by title from the 'books' table and output the details
CREATE OR REPLACE PROCEDURE GET_BOOKS_BY_TITLE_SP (
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
        
        -- Raise an exception if no books were found
        IF v_cursor%NOTFOUND THEN
            RAISE ex_book_notfound;   
        END IF;
        
        CLOSE v_cursor;
        
        -- Handle the exception and output a message
        EXCEPTION
            WHEN ex_book_notfound THEN
            DBMS_OUTPUT.PUT_LINE('Not found!');
            
END GET_BOOKS_BY_TITLE_SP;
/
