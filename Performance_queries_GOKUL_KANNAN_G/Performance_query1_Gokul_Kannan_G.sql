--SQL QUERY
select count(CAND_NAME) as Total_Candidates, ST_NAME FROM ELECTION WHERE YEAR = 2004 GROUP BY ST_NAME;


SELECT COUNT(CAND_SEX) as Female_Candidates, YEAR FROM ELECTION WHERE CAND_SEX = 'F' GROUP BY YEAR order by year asc;


SELECT COUNT(CAND_NAME) as Total_Candidates FROM ELECTION WHERE ST_NAME = 'West Bengal' AND YEAR = 2014;

SELECT COUNT(CAND_NAME) , ST_NAME , YEAR  FROM ELECTION group by ST_NAME , YEAR ORDER BY ST_NAME , YEAR;

SELECT PARTYNAME FROM ELECTION WHERE ST_NAME = 'Uttar Pradesh' and YEAR = 2014 group by partyname order by SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;

SELECT ST_NAME , SUM(TOTVOTPOLL) AS VOTES FROM ELECTION WHERE YEAR = 1989 AND PARTYABBRE ='BJP' GROUP BY ST_NAME ORDER BY SUM(TOTVOTPOLL);

SELECT COUNT(TOTVOTPOLL) AS TOTAL_VOTES FROM ELECTION WHERE ST_NAME = 'Andhra Pradesh' and year = 1987;

SELECT SUM((TOTVOTPOLL))/SUM((ELECTORS)) * 100 AS TOTAL_VOTES FROM ELECTION WHERE ST_NAME = 'Goa' and Year = 2004 and PARTYABBRE = 'BJP';

SELECT count(*) FROM ELECTION WHERE PARTYABBRE = 'BJP' and (TOTVOTPOLL)/(ELECTORS) * 100 > 50;
 
SELECT ST_NAME  FROM ELECTION WHERE PARTYABBRE = 'BJP' AND (TOTVOTPOLL)/(ELECTORS) * 100 < 75 GROUP BY ST_NAME;  