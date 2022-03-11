
--1. Find the total candidates who participated in the election in each state in the year 2004?

select count(CAND_NAME), ST_NAME FROM ELECTION WHERE YEAR = 2004 GROUP BY ST_NAME;



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

--2. Find the total female candidates participating each year?

SELECT COUNT(CAND_NAME), YEAR FROM ELECTION WHERE CAND_SEX = 'F' GROUP BY YEAR;



--3. find the total candidates who participated in West Bengal state in the year 2014?

 
SELECT COUNT(CAND_NAME) FROM ELECTION WHERE ST_NAME = 'WEST BENGAL' AND YEAR = 2014;



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

--4. Find the total candidates who participated in the election at each state in each year?

SELECT COUNT(CAND_NAME) , ST_NAME , YEAR  FROM ELECTION group by ST_NAME , YEAR;


--5. What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

SELECT PARTYNAME FROM ELECTION WHERE ST_NAME = 'Uttar Pradesh' and YEAR = 2014 group by partyname order by SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;
 
 
 --6. Find total votes BJP got In each state in the year 1987?

 SELECT ST_NAME ,SUM(TOTVOTPOLL) AS VOTES FROM ELECTION WHERE YEAR = 1987 AND PARTYNAME = 'BJP';



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

--7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?


select sum(TOTVOTPOLL)  from ELECTION where year=1987
and ST_NAME='Andhra Pradesh' and PARTYABBRE='BJP';


--8. Find the Total vote percentage of BJP get in goa state in the year 2003?

select round(sum(TOTVOTPOLL)/sum(ELECTORS)*100,2)  as percentage from election where year=2003 and st_name='Goa' and partyabbre='BJP';
select * from election;



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
tot_goa;
end;
/

--9. How many times has BJP gotten an Above 50% vote?

SELECT count(*)  FROM ELECTION WHERE PARTYABBRE = 'BJP' and sum(TOTVOTPOLL)/(ELECTORS) * 100 > 50;

--10. what is the state list the BJP gets below 75% vote?

SELECT distinct(ST_NAME ) FROM ELECTION WHERE PARTYABBRE = 'BJP' AND (TOTVOTPOLL)/(ELECTORS) * 100 < 75 GROUP BY ST_NAME; 





































