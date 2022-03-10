
--1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?

select * from election where ST_NAME='Andaman & Nicobar Islands' and year=2014 and PARTYABBRE='BJP' ;

set SERVEROUTPUT on;
create or replace PROCEDURE can_bjp
IS
c_list varchar(100);
BEGIN
select cand_name into c_list from election where ST_NAME='Andaman & Nicobar Islands' and year=2014 and PARTYABBRE='BJP';
dbms_output.put_line(c_list);
END;
/

BEGIN
can_bjp;
END;
/

--2. How many Male Candidates participated in elections in each state?

SELECT COUNT(CAND_NAME),ST_NAME FROM ELECTION WHERE CAND_SEX='M' GROUP BY ST_NAME;

set serveroutput on;
create or replace procedure male_count
is
begin
for i in (SELECT COUNT(CAND_NAME) cnt,ST_NAME as s_name FROM ELECTION WHERE CAND_SEX='M' GROUP BY ST_NAME)
loop
dbms_output.PUT_LINE(i.cnt||' '||i.s_name);
end loop;
end;
/
begin
male_count();
end;
/
--3. Display the Party name in descending order?

select partyname from election order by partyname desc;

set SERVEROUTPUt on;
create or replace procedure P_NAME
is
begin
for i in (select partyname pn from election order by partyname desc)
loop
dbms_output.put_line(i.pn);
end loop;
end;
/

begin
p_name();
end;
/


-- 4.Find how many Candidates participated in the year West Bengal 1988?

select count(cand_name) from election where st_name='West Bengal' and year=1988;

CREATE OR REPLACE procedure can_wb

  w_c NUMBER;
BEGIN
  SELECT COUNT(CAND_NAME) INTO w_c FROM  ELECTION WHERE  ST_NAME = 'West Bengal' AND  YEAR = 2014;
  dbms.output.put_line(w_c);
END;
/
begin 
can_wb();
end;
/

-- 5.Display the Tamilnadu Candidate list each year?

select cand_name ,year from election where st_name ='Tamil Nadu';


set serveroutput on;
create or replace PROCEDURE tamil_cand
is 
begin 
for i in(select cand_name ,year from election where st_name ='Tamil Nadu')
loop
dbms_output.put_line(i.cand_name);
end loop;
end;
/
BEGIN
tamil_cand();
END;
/




