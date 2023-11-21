-- Package that contains function to get the most popular book
-- and a procedure to order it
CREATE OR REPLACE PACKAGE GET_POP_BOOK_PK
IS
    --Declare type_book here so that it can be returned in the function
    TYPE type_book IS RECORD (
        isbn book_copy.isbn%TYPE,
        bookcopy_id book_copy.bookcopy_id%TYPE
    );

    -- Function to get the most popular book
    FUNCTION GET_POP_BOOK_SF
        RETURN type_book;
        
    -- Procedure to order the most popular book
    PROCEDURE ORDER_POP_BOOK_SP;
    
END GET_POP_BOOK_PK;
/

CREATE OR REPLACE PACKAGE BODY GET_POP_BOOK_PK
IS
    -- Function returns the most popular book by the most checkouts
    FUNCTION GET_POP_BOOK_SF
        RETURN type_book
    IS
        rec_book type_book;
    BEGIN
        SELECT bc.isbn, a.bookcopy_id
        INTO rec_book
        FROM book_copy bc
        JOIN (
            SELECT bookcopy_id, COUNT(*) AS checkout_count
            FROM CHECKOUT 
            GROUP BY bookcopy_id
            ORDER BY checkout_count DESC
            FETCH FIRST 1 ROW ONLY
        ) a
        ON bc.bookcopy_id = a.bookcopy_id;

        RETURN rec_book;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            --Return NULL when no data found.
            NULL; 
    END GET_POP_BOOK_SF;
    
    -- Procedure to order the most popular book
    PROCEDURE ORDER_POP_BOOK_SP
        IS
            result_book GET_POP_BOOK_PK.type_book;
    BEGIN
        result_book := GET_POP_BOOK_PK.GET_POP_BOOK_SF;
        INSERT INTO book_order(bookid, isbn)
        --Use sequence to generate bookid
        VALUES (book_copy_bookcopy_id_seq.nextval, result_book.isbn);
    END ORDER_POP_BOOK_SP;
END GET_POP_BOOK_PK;
/

--Anonymous block to test the package
DECLARE 

BEGIN
    GET_POP_BOOK_PK.ORDER_POP_BOOK_SP;
END;

SELECT * FROM BOOK_ORDER;