--1. Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?

select sum(TOTVOTPOLL) from election where PARTYABBRE='BJP' and year=1996 and st_name='Bihar' ;



set serveroutput on;
CREATE OR REPLACE PROCEDURE bihar_state
IS
BEGIN 
    for i in (select sum(totvotpoll) as x from election where st_name='Bihar' and year=1996 and partyname='BJP')
    loop
    dbms_output.put_line(i.x);
    end loop;
END;
/

begin
bihar_state();
end;
/

--2. Write a SQL query to display the BJP Candidates list in descending order?

select  cand_name from election where PARTYABBRE='BJP' order by cand_name desc;



CREATE OR REPLACE PROCEDURE bjp_cand_order
IS
BEGIN 
    for i in (select cand_name from election where partyname='BJP' order by cand_name desc)
    loop
    dbms_output.put_line(i.cand_name);
    end loop;
END;
/
--run the query
begin
bjp_cand_order;
end;
/



--3. Find how many times congress gets above 50% vote in Bihar state?



SELECT count(*) FROM ELECTION WHERE ST_NAME = 'Bihar' AND PARTYABBRE = 'INC' and (TOTVOTPOLL)/(ELECTORS) * 100 > 50;

--4. Find the Sikkim Candidate list each year?

select CAND_NAME,year from election where st_name='Sikkim';



CREATE OR REPLACE PROCEDURE cand_sikkim
IS
BEGIN 
    for i in (select cand_name AS c_name,year from election where st_name='Sikkim')
    loop
    dbms_output.put_line( i.c_name|| i.year);
    end loop;
END;
/

begin
cand_sikkim;
end;
/



--5. Find total male candidates who participated in the election?

select cand_name,cand_sex from election where cand_sex='M';



CREATE OR REPLACE PROCEDURE cand_male
IS
BEGIN 
    for i in (select count(cand_sex) as cn from election where cand_sex='M')
    loop
    dbms_output.put_line(i.cn);
    end loop;
END;
/

begin
cand_male;
end;
/























































