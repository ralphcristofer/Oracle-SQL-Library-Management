-- This trigger makes sure that phone is a 10-digit number.
CREATE OR REPLACE TRIGGER check_phone_length
BEFORE INSERT OR UPDATE OF phone ON readers
FOR EACH ROW
BEGIN
  IF LENGTH(:NEW.phone) != 10 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Phone number should have 10 digits');
  END IF;
END;
/

-- Checks phone number to make sure it is 10 digits
INSERT INTO readers (readerid, lname, fname, email, phone, address, city, province, zip) 
VALUES (readers_readerid_seq.nextval, 'Ralph', 'Cristofer', 'ralphcristofer@gmail.com', 514, '123 Ralph St', 'Montreal', 'QC', 'H3W1K8');