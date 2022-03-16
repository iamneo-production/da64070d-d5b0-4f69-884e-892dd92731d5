create or replace procedure  c_candidate(x in number)
IS
coun number(10);
begin
select count(*) into coun from CANDIDATE1_V where candidatetype_ids=x;
dbms_output.put_line('the count of the candidate using candidatetype_id'||coun);
END;
/

begin
c_candidate(1);
END;
/




set serveroutput on
create or replace procedure c_voter
IS
coun number(10);
begin
select count(*) into coun from voter_v;
dbms_output.put_line('the total voter count'||coun);
END;
/

begin
c_voter;
END;
/




CREATE OR REPLACE TRIGGER d_voter
BEFORE DELETE OR INSERT OR UPDATE ON  voter_v
FOR EACH ROW 
WHEN (NEW.age > 0) 
DECLARE  
BEGIN  
   dbms_output.put_line('Old age: ' || :OLD.age); 
   dbms_output.put_line('update age: ' || :NEW.age); 
END; 
/ 
--alert is arise when update or dml operation are done in the sql
set serveroutput on;
DECLARE   
   total_rows number(10);  
BEGIN  
   UPDATE  voter_v 
   SET age = 20 where voter_id=980001;  
   IF sql%notfound THEN  
      dbms_output.put_line('no row is updated');  
   ELSIF sql%found THEN  
      total_rows := sql%rowcount;  
      dbms_output.put_line( 'total_rows updated '||total_rows);  
   END IF;   
END;  
/



DECLARE 
   a voter_v.first_name%type; 
   b voter_v.date_of_birth%type; 
   c voter_v.voter_id%type; 
   CURSOR v_details is 
      SELECT first_name,date_of_birth,voter_id FROM voter_v; 
BEGIN 
   OPEN v_details; 
   LOOP 
   FETCH v_details into a, b, c; 
      EXIT WHEN v_details%notfound; 
      dbms_output.put_line('the voter name is '|| a|| ' date of birth is' || b || ' an his voter is  ' || c); 
   END LOOP; 
   CLOSE v_details; 
END; 
/


create or replace procedure count_male
is
a number(10):=0;
begin
select count(gender)into a from voter_v where gender='M';
dbms_output.put_line('the male voter are '||a||'are present'); 
END;
/
begin
count_male;
END;
/