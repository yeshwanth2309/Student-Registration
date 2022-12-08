/* registering the user data */
CREATE TABLE register(
     user_name varchar2(30),
     roll_no varchar2(10),
     mobile_no varchar2(10),
     email_id varchar2(100),
     p_wrd varchar2(20)
);

/*Procedure to insert record into database table*/
CREATE OR REPLACE PROCEDURE insertion(
    user_name varchar2,
    roll_no varchar2,
    mobile_no varchar2 ,
    email_id varchar2,
    p_wrd varchar2
)IS
BEGIN
INSERT INTO register VALUES(user_name,roll_no,mobile_no,email_id,p_wrd);
COMMIT;
END;
/

/*Function to verify Login */

CREATE OR REPLACE FUNCTION l_check(
  email varchar2
  ,pwd varchar2
) RETURN number IS rn number;

BEGIN
SELECT COUNT(*) INTO rn FROM register WHERE email_id=email AND p_wrd=pwd;
IF rn>0 THEN
   RETURN 1;
ELSE
   RETURN 0;
END IF;
END;
/
