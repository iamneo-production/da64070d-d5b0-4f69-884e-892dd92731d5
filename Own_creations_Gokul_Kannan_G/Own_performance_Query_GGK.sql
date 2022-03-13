--1. What are the last 5 parties that got the votes in Andhra Pradesh in the year 2014?
SELECT PARTYNAME , SUM(TOTVOTPOLL) FROM ELECTION WHERE ST_NAME = 'Andhra Pradesh' and YEAR = 2014 group by partyname order by SUM(TOTVOTPOLL) ASC FETCH FIRST 5 ROWS ONLY;

--2.Find the Total Votes got by Indian National Congress in 2004?
SELECT SUM(TOTVOTPOLL) AS TOTAL_VOTES FROM ELECTION WHERE PARTYABBRE ='INC' AND YEAR = 2004;

--3. How many times has Indian National Congress gotten an Below 10% vote IN 2004?
SELECT COUNT(PARTYABBRE) FROM ELECTION WHERE (TOTVOTPOLL)/(ELECTORS) < 10 AND YEAR = 2004 AND PARTYABBRE = 'INC';

--4.Find total votes INC got In each state in the year 2014?
SELECT SUM(TOTVOTPOLL) , ST_NAME FROM ELECTION WHERE PARTYABBRE = 'INC' AND YEAR = 2014 GROUP BY ST_NAME;

--5.Find the top 5 states BJP got most votes OF All Time?
Select SUM(TOTVOTPOLL), ST_NAME FROM ELECTION WHERE PARTYABBRE = 'BJP' GROUP BY ST_NAME ORDER BY SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;

--6.Find the Candidiates who got most votes in year 2014?"
SELECT CAND_NAME , TOTVOTPOLL FROM ELECTION WHERE YEAR = 2014 ORDER BY TOTVOTPOLL DESC FETCH FIRST 1 ROWS ONLY;

--7.Find the female candidates who got above 5% of votres of all the time?
SELECT CAND_NAME FROM ELECTION WHERE CAND_SEX = 'F' AND (TOTVOTPOLL)/(ELECTORS) < 1;

--8.Find the top 5 candidate with lead votpoll in state tamilnadu year 2014?
SELECT CAND_NAME, TOTVOTPOLL ,LEAD(TOTVOTPOLL,1) OVER(ORDER BY TOTVOTPOLL desc) NEXT_LEAD FROM ELECTION WHERE ST_NAME = 'Tamil Nadu'
and year = 2014 fetch first 5 rows only;

--9.Find the top 10 canidiate with lag votpoll in state Uttar pradesh in year 1989;
SELECT CAND_NAME , TOTVOTPOLL , LAG(TOTVOTPOLL,1) OVER(ORDER BY TOTVOTPOLL DESC) NEXT_LAQG FROM ELECTION
WHERE ST_NAME = 'Andhra Pradesh' and year = 1989 fetch first 10 rows only;

--10.Find the candidates AND VOTES% with SC pc_type in tamilnadu 2014 ?
SELECT CAND_NAME , round((TOTVOTPOLL)/(ELECTORS) * 10,3) FROM ELECTION WHERE PC_TYPE ='SC' AND ST_NAME = 'Tamil Nadu' AND YEAR = 2014;

