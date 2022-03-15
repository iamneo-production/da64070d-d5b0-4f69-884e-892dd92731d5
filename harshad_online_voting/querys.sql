--fetch for the single table
--fetch election table
select * from election;
--fetch states table where state_name is tamilnadu 
select * from states where state_name='tamilnadu';
--display state details table where state name is tamilnadu
select * from state_info where state_name='tamilnadu';
--find all district details of the district
select district_name from district_info;
--find the details of the constituency of the srikalahasti
select * from constituency_info where constituency_name='Srikalahasti';
--find count of the voter
select count(*) from VOTER;
--find pincode detail of the 517644 of the  city
select * from CITY where zip_code=517644;
--find address of the aadhhar no 94887654321
select * from ADDRESS where Vaadhaar='94887654321';
--dispaly all the party in the partytable
select * from PARTY;
--find leader of the INC party
select * from PARTY_INFO where party_name='INC';
--count of the candidate in mp constituency

select count(*) from CANDIDATE1 where candidateType_ID=2;
--dsiplay voted detail of the voter
select * from VOTE_POOLING;
--display vote_count of the candidates
select * from vote_count;
--display lokshabha_voted_population
select * from LOKSHABA_VOTED_POPULATION;
--display the legislative_result
select * from LEGISLATIVE_RESULT;
--display the lokshabh_result
select * from LOKSHABA_RESULT;
--display the lokshaba_voted_population
select * from LOKSHABA_VOTED_POPULATION;

--fetch for the mutiple tables

--display the district_id and constituency_names
select constituency.district_id ,constituency_info.constituency_id,constituency_info.constituency_name from constituency_info
full outer join constituency on constituency.constituency_id=constituency_info.constituency_id;
--find the district_id,pincode,name of the voter where his aaddhaar no is 94887654321
select address.district_id ,address.ZIP_CODE,voter.last_name from address
full outer join voter on voter.aadhaar=address.vaadhaar where voter.aadhaar='94887654321';
--find the party_id,party_leader of the inc
select party.party_id,party_info.party_leader from party
full outer join party_info on party.party_name=party_info.party_name where party_info.party_name='INC';
--find the all candidate_name and the party_name of all inc with partyid in party_info table
select name from candidate1 where party_id=11
and party_id in(select party_id from party_info);
--find lokashabresult of the candidate_id 9993 and check the district_name
select lokshaba_result.candidate_id,district_info.district_name from 
lokshaba_result full outer join district_info on lokshaba_result.district_id=district_info.district_id 
where lokshaba_result.candidate_id=9993;

--procedures

--create procedure count_the_voter
set serveroutput on
create procedure count_the_voter
IS
coun number(10);
begin
select count(*) into coun from voter;
dbms_output.put_line('the total voter count'||coun);
END;
/

begin
count_the_voter;
END;
/

--create procedure for the count_candidate of the candidatetype_id
create procedure count_candidate(x in number)
IS
coun number(10);
begin
select count(*) into coun from candidate1 where candidatetype_id=x;
dbms_output.put_line('the count of the candidate using candidatetype_id'||coun);
END;
/

begin
count_candidate(1);
END;
/

--find the voter is voted or not
create procedure voter_voted_or_not(x in varchar)
is
val number(10);
begin
select count(*) into val from vote_pooling where aadhaar=x;
if val=1 then
dbms_output.put_line('voter is voted');
else
dbms_output.put_line('voter is not voted');
end if;
end;
/

begin
voter_voted_or_not(19872345678);
end;
/


--find the vote_count of the vote_count of the candidate
--drop procedure vote_count_of_candidate;

create procedure vote_count_of_candidate(m in varchar)
is
a number(10):=0;
b number(10):=0;
x number(10):=0;
begin
select candidate_id into x from  candidate1 where name=m;
select candidate_id into a from vote_count where candidate_id=x;
select vote_count into b from vote_count where candidate_id=x;
dbms_output.put_line('the candidate_id '||'and the vote_count'||b);
end;
/
begin
vote_count_of_candidate('Avinash');
END;
/

--create procedure total_voted_population in legislative
create or replace procedure tot_vot_pop_legis
is
a number(10):=0;
begin
select sum(voted_population) into a from legislative_voted_population;
dbms_output.put_line('the total voted_population of the legislative'||a);
end;
/

begin
tot_vot_pop_legis;
end;
/

--proecedure for the total_voted_population of the assmebly

create or replace procedure tot_vot_pop_lokshaba
is
a number(10):=0;
begin
select sum(voted_population) into a from LOKSHABA_VOTED_POPULATION;
dbms_output.put_line('the total voted_population of the lokshaba '||a);
end;
/


begin
tot_vot_pop_lokshaba;
end;
/


--triggers
--triggers on the voter
CREATE OR REPLACE TRIGGER display_voter
BEFORE DELETE OR INSERT OR UPDATE ON  voter
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
   UPDATE  voter 
   SET age = 20 where voter_id=980001;  
   IF sql%notfound THEN  
      dbms_output.put_line('no row is updated');  
   ELSIF sql%found THEN  
      total_rows := sql%rowcount;  
      dbms_output.put_line( 'total_rows updated '||total_rows);  
   END IF;   
END;  
/

-- triggers candidate
--display the candidate_details
CREATE OR REPLACE TRIGGER display_candidate
BEFORE DELETE OR INSERT OR UPDATE ON  candidate1
FOR EACH ROW 
WHEN (NEW.candidate_id> 0) 
DECLARE  
BEGIN  
   dbms_output.put_line('Old aadhaar: ' || :OLD.aadhaar); 
   dbms_output.put_line('update aadhaar: ' || :NEW.aadhaar); 
END; 
/ 
-- find the alert when update is occur in the candidate table
DECLARE   
   total_rows number(10);  
BEGIN  
   UPDATE  candidate 
   SET aadhaar =192175660728  where candidate_id=980001;  
   IF sql%notfound THEN  
      dbms_output.put_line('no row is updated');  
   ELSIF sql%found THEN  
      total_rows := sql%rowcount;  
      dbms_output.put_line( 'total_rows updated '||total_rows);  
   END IF;   
END;  
/ 
--cursors voter
--fetch th voter details

DECLARE 
   a voter.first_name%type; 
   b voter.date_of_birth%type; 
   c voter.voter_id%type; 
   CURSOR voter_details is 
      SELECT first_name,date_of_birth,voter_id FROM voter; 
BEGIN 
   OPEN voter_details; 
   LOOP 
   FETCH voter_details into a, b, c; 
      EXIT WHEN voter_details%notfound; 
      dbms_output.put_line('the voter name is '|| a|| ' date of birth is' || b || ' an his voter is  ' || c); 
   END LOOP; 
   CLOSE voter_details; 
END; 
/


--candidate
--fetch the candidate_details

DECLARE 
   a candidate1.candidate_id%type; 
   b candidate1.name%type; 
   c candidate1.party_id%type; 
   CURSOR candidate_details is 
      SELECT candidate_id,name,party_id FROM candidate; 
BEGIN 
   OPEN candidate_details; 
   LOOP 
   FETCH candidate_details into a, b, c; 
      EXIT WHEN candidate_details%notfound; 
      dbms_output.put_line('the candidate_id is '|| a|| 'name is' || b || ' an his partyid is  ' || c); 
   END LOOP; 
   CLOSE candidate_details; 
END; 
/

--performance query

--find the count of male voter in the voter table
create or replace procedure find_count_male_voters
is
a number(10):=0;
begin
select count(gender)into a from voter where gender='M';
dbms_output.put_line('the male voter are '||a||'are present'); 
END;
/
begin
find_count_male_voters;
END;
/

/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
find_count_male_voters;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.0000001
*/

--display the  mp candidate_name in the candidate_table
create or replace procedure mp_candidate_name
is
begin
for i in (select name from candidate1 where candidatetype_id=2)
loop
dbms_output.put_line('the mp candidate names are the'||i.name);
end loop;
end;
/

begin
mp_candidate_name;
end;
/
--time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
mp_candidate_name;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.00000001
*/

--find the legislative_voted_population details
create or replace procedure leg_details
is
begin
for i in (select constituency_id as a,voted_population as b,total_population as c from legislative_voted_population)
loop
dbms_output.put_line('the legislative_voted_population'||i.b||'total_population'||i.c||'the constituency_id is'||i.a);
end loop;
end;
/

begin
leg_details;
end;
/
--time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
leg_details;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.00000001
*/




--dsiplay the lokshabha_details
create or replace procedure lok_details
is
begin
for i in (select district_id as a,voted_population as b,total_population as c from LOKSHABA_VOTED_POPULATION)
loop
dbms_output.put_line('the lokshaba_voted_population'||i.b||'total_population'||i.c||'the district_id is'||i.a);
end loop;
end;
/

begin
lok_details;
end;
/
--time complexity

/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
lok_details;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.00000001
*/

-- display the lokshaba_result
create or replace procedure lok_result
is
begin
for i in (select candidate_id,status from LOKSHABA_RESULT)
loop
dbms_output.put_line('candidate_id'||i.candidate_id||' status'||i.status);
end loop;
end;
/

begin
lok_result;
end;
/
----  time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
lok_result;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.00000001
*/