
--1. Find the total candidates who participated in the election in each state in the year 2004?

select count(CAND_NAME), ST_NAME FROM ELECTION WHERE YEAR = 2004 GROUP BY ST_NAME;

--2. Find the total female candidates participating each year?

SELECT COUNT(CAND_NAME), YEAR FROM ELECTION WHERE CAND_SEX = 'F' GROUP BY YEAR;

--3. find the total candidates who participated in West Bengal state in the year 2014?
 

SELECT COUNT(CAND_NAME) FROM ELECTION WHERE ST_NAME = 'WEST BENGAL' AND YEAR = 2014;

--4. Find the total candidates who participated in the election at each state in each year?

SELECT COUNT(CAND_NAME) , ST_NAME , YEAR  FROM ELECTION group by ST_NAME , YEAR;

--5. What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

SELECT PARTYNAME FROM ELECTION WHERE ST_NAME = 'Uttar Pradesh' and YEAR = 2014 group by partyname order by SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;
 
 
 --6. Find total votes BJP got In each state in the year 1987?

 SELECT ST_NAME ,SUM(TOTVOTPOLL) AS VOTES FROM ELECTION WHERE YEAR = 1987 AND PARTYNAME = 'BJP';

--7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?


select sum(TOTVOTPOLL)  from ELECTION where year=1987
and ST_NAME='Andhra Pradesh' and PARTYABBRE='BJP';


--8. Find the Total vote percentage of BJP get in goa state in the year 2003?

select round(sum(TOTVOTPOLL)/sum(ELECTORS)*100,2)  as percentage from election where year=2003 and st_name='Goa' and partyabbre='BJP';
select * from election;

--9. How many times has BJP gotten an Above 50% vote?

SELECT count(*)  FROM ELECTION WHERE PARTYABBRE = 'BJP' and sum(TOTVOTPOLL)/(ELECTORS) * 100 > 50;

--10. what is the state list the BJP gets below 75% vote?

SELECT distinct(ST_NAME ) FROM ELECTION WHERE PARTYABBRE = 'BJP' AND (TOTVOTPOLL)/(ELECTORS) * 100 < 75 GROUP BY ST_NAME; 


