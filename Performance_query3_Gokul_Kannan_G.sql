select sum(TOTVOTPOLL) as TOTAL_VOTES FROM ELECTION WHERE PARTYABBRE = 'BJP' AND YEAR = 1996 AND ST_NAME = 'Bihar';

SELECT DISTINCT(CAND_NAME) FROM ELECTION WHERE PARTYABBRE = 'BJP' ORDER BY CAND_NAME DESC;

SELECT count(*) FROM ELECTION WHERE ST_NAME = 'Bihar' AND PARTYABBRE = 'INC' and (TOTVOTPOLL)/(ELECTORS) * 100 > 20;


SELECT CAND_NAME AS CANDIDATE_NAME , YEAR FROM ELECTION WHERE ST_NAME = 'Sikkim' order by year ;

SELECT CAND_NAME AS MALE_CANIDIATE FROM ELECTION WHERE CAND_SEX = 'M';