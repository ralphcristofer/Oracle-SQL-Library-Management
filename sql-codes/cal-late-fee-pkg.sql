-- Declare package with two functions:
-- Calculate late fess
-- Display checked out books
CREATE OR REPLACE PACKAGE CAL_LATE_FEE_PKG
IS
    FUNCTION CALCULATE_LATE_FEE_SF
    (p_checkout_id IN checkout.checkoutid%TYPE) 
    RETURN NUMBER;
    
    FUNCTION DISPLAY_CHECKOUT_BOOK_SF
    RETURN VARCHAR2;

END;
/

CREATE OR REPLACE PACKAGE BODY CAL_LATE_FEE_PKG
IS
    -- Function to calculate the late fee for a given checkout ID
    FUNCTION CALCULATE_LATE_FEE_SF
    (p_checkout_id IN checkout.checkoutid%TYPE) 
    RETURN NUMBER
        IS
            v_pickup_date DATE;
            v_return_date DATE;
            v_late_fee_per_day NUMBER := 3;
            v_late_fee NUMBER := 0;
        BEGIN
    
            SELECT pickup_date, return_date
            INTO v_pickup_date, v_return_date
            FROM checkout
            WHERE checkoutid = p_checkout_id;
        
            --Condition that book is returned
            IF v_return_date IS NOT NULL AND ((v_return_date - v_pickup_date)-30) > 0 THEN
            --Cal late fee if the gap between the pickup date and return date is more than 30 days
                v_late_fee := ((v_return_date - v_pickup_date)-30) * v_late_fee_per_day;
            END IF;
        
            -- Ensure late fee is not negative
            IF v_late_fee < 0 THEN
                v_late_fee := 0;
            END IF;

        RETURN v_late_fee;
    END CALCULATE_LATE_FEE_SF;
    
    -- Function to display the details of all checked out books
    FUNCTION DISPLAY_CHECKOUT_BOOK_SF
    RETURN VARCHAR2
        IS
            CURSOR cur_book IS
            SELECT co.checkoutid, co.bookcopy_id, bc.isbn, b.title
            FROM checkout co 
            JOIN book_copy bc ON co.bookcopy_id = bc.bookcopy_id
            JOIN books b ON bc.isbn = b.isbn;
            result_string VARCHAR2(4000);
        BEGIN
        
            -- Loop through the results and append each book's details to the result string
            FOR checkout_rec IN cur_book LOOP
              result_string := result_string || 'Checkout ID: ' || checkout_rec.checkoutid || CHR(10);
              result_string := result_string || 'Bookcopy ID ' || checkout_rec.bookcopy_id || CHR(10);
              result_string := result_string || 'ISBN ' || checkout_rec.isbn || CHR(10);
              result_string := result_string || 'Title ' || checkout_rec.title || CHR(10);
            END LOOP;

        RETURN result_string;
    END DISPLAY_CHECKOUT_BOOK_SF;
END;
/

--Anonymous block to test the CALCULATE_LATE_FEE_SF
DECLARE
    lv_late_fee NUMBER;
BEGIN
  lv_late_fee := CAL_LATE_FEE_PKG.CALCULATE_LATE_FEE_SF(12);
  DBMS_OUTPUT.PUT_LINE(lv_late_fee);
END;
/

--Anonymous block to test the DISPLAY_CHECKOUT_BOOK_SF
DECLARE
    lv_checkout_book_info VARCHAR2(4000);
BEGIN
  lv_checkout_book_info := CAL_LATE_FEE_PKG.DISPLAY_CHECKOUT_BOOK_SF;
  DBMS_OUTPUT.PUT_LINE(lv_checkout_book_info);
END;
/
