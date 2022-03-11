
--1


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



--2
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




--3

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

--4



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


--5


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































































































































