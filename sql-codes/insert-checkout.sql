-- Insert checkout data
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 10, 1, '13-NOV-2023', '14-NOV-2023', '28-NOV-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 10, 2, '15-NOV-2023', '16-NOV-2023', '30-NOV-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 3, 3, '26-NOV-2023', '27-NOV-2023', '30-NOV-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 4, 12, '2-NOV-2023', '3-NOV-2023', '11-NOV-2023', NULL, 'Y');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 4, 11, '1-DEC-2023', '2-DEC-2023', '6-DEC-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 1, 12, '27-NOV-2023', '28-NOV-2023', '2-DEC-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 2, 4, '15-NOV-2023', '16-NOV-2023', '28-NOV-2023', 'Y', 'N');
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 8, 10, '19-NOV-2023', '20-NOV-2023', '28-NOV-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 9, 9, '20-NOV-2023', '21-NOV-2023', '29-NOV-2023', 'N', NULL);
INSERT INTO checkout (checkoutid, readerid, bookcopy_id, order_date, pickup_date, return_date, is_pickedup, is_returned) 
VALUES (checkout_checkoutid_seq.nextval, 10, 8, '28-NOV-2023', '29-NOV-2023', '15-DEC-2023', 'N', 'N');