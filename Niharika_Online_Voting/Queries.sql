
--display count of candidates using candidatetype id
create or replace procedure  candidate_n(x in number)
IS
coun number(10);
begin
select count(*) into coun from CANDIDATE_A_N where candidatetype_id=x;
dbms_output.put_line('the count of the candidate using candidatetype_id: '||coun);
END;
/

begin
candidate_n(1);
END;
/

--display count of male voters
create or replace procedure male_count
is
x number(10):=0;
begin
select count(gender)into x from voter_a_n where gender='M';
dbms_output.put_line('the male voter are  '||x||' are present'); 
END;
/
begin
male_count();
END;
/


--total count of the voters

set serveroutput on
create or replace procedure voters_count
IS
a number(10);
begin
select count(*) into a from voter_a_n;
dbms_output.put_line('the total voter count' || a);
END;
/

begin
voters_count;
END;
/


--create procedure total_voted_population in legislative
create or replace procedure total_legislative_population
is
x number(10):=0;
begin
select sum(voted_population) into x from legislative_voted_population_a_n;
dbms_output.put_line('the total voted_population of the legislative  '||x);
end;
/

begin
total_legislative_population;
end;
/



--updating voter's age
CREATE OR REPLACE TRIGGER voter_update
BEFORE DELETE OR INSERT OR UPDATE ON  voter_a_n
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
   UPDATE  voter_a_n
   SET age = 20 where voter_id=980001;  
   IF sql%notfound THEN  
      dbms_output.put_line('no row is updated');  
   ELSIF sql%found THEN  
      total_rows := sql%rowcount;  
      dbms_output.put_line( 'total_rows updated '||total_rows);  
   END IF;   
END;  
/


--voter details
DECLARE 
   a voter_a_n.first_name%type; 
   b voter_a_n.date_of_birth%type; 
   c voter_a_n.voter_id%type; 
   CURSOR details_voter is 
      SELECT first_name,date_of_birth,voter_id FROM voter_a_n; 
BEGIN 
   OPEN details_voter; 
   LOOP 
   FETCH details_voter into a, b, c; 
      EXIT WHEN details_voter%notfound; 
      dbms_output.put_line('the voter name is  '|| a|| '  date of birth is ' || b || ' an his voter is  ' || c); 
   END LOOP; 
   CLOSE details_voter; 
END; 
/































