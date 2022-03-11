
--1

CREATE OR REPLACE PROCEDURE tot_cand_ele
IS
BEGIN 
    for i in(select count(Cand_name) as cand,st_name as s_name from election where year=2004 group by st_name)
    loop
    dbms_output.put_line(i.cand|| i.s_name);
    end loop;
END;
/


begin
tot_cand_ele();
end;
/



--2

CREATE OR REPLACE PROCEDURE tot_cand_2014
IS
BEGIN 
    for i in(select count(cand_name) as t_c from election where year=2014 and st_name='West Bengal')
    loop
    dbms_output.put_line(i.t_c);
    end loop;
END;
/


begin
tot_cand_2014();
end;
/



--3


 CREATE OR REPLACE PROCEDURE bjp_year
IS
BEGIN 
    for i in (select sum(totvotpoll) as tot_vot,partyname ,st_name  from election where partyname='BJP'and  year=1987 group by partyname,st_name)
    loop
    dbms_output.put_line(i.tot_vot||' '||i.partyname||' '||i.st_name);a
    end loop;
END;
/
begi
bjp_year();
end;
/



--4


CREATE OR REPLACE PROCEDURE tot_goa
IS
BEGIN 
    for i in (select  round(sum(totvotpoll)/(select sum(distinct electors)  from election where st_name='Goa' and year=2003) *100,2) as tot_value,year from election where st_name='Goa' and partyname='BJP'and year=2003 group by partyname,year)
    loop
    dbms_output.put_line(i.tot_value);
    end loop;
END;
/
begin
tot_goa();
end;
/


--5

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

--6

CREATE OR REPLACE PROCEDURE bjp_cand_order
IS
BEGIN 
    for i in (select cand_name from election where partyname='BJP' order by cand_name desc)
    loop
    dbms_output.put_line(i.cand_name);
    end loop;
END;
/

begin
bjp_cand_order();
end;
/


--7

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
cand_sikkim();
end;
/

--8

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































































