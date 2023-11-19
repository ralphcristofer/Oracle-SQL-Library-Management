-- This trigger checks the status of the checkedout book
-- If the book is already pickedup, it makes sure to record 
-- that the book is not returned yet.
-- If the book is not yet pickedup, then it nothing to return.
CREATE OR REPLACE TRIGGER update_checkout_status
BEFORE INSERT OR UPDATE ON checkout
FOR EACH ROW
BEGIN
  IF :NEW.pickup_date IS NOT NULL THEN
    :NEW.is_pickedup := 'Y';
    :NEW.is_returned := 'N';
  ELSE
    :NEW.is_pickedup := 'N';
    :NEW.is_returned := NULL;
  END IF;
END;
/

INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date) 
VALUES (checkout_checkoutid_seq.nextval, 10, 8, '28-NOV-2023', '29-NOV-2023', '15-DEC-2023');

SELECT * FROM checkout;