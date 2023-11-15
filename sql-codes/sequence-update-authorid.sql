-- This SQL will be reviewed and not final for #2c

-- Update or alter authorid using sequence
UPDATE authors
SET authorid = authors_authorid_seq.NEXTVAL
WHERE fname = 'Eliana' AND lname = 'Landry'