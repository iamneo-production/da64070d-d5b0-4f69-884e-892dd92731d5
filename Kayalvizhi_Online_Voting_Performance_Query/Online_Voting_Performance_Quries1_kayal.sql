-----------------------------------prerformance query set 1---------------------------------------
-->INDEX
CREATE INDEX ELECTION_I
ON ELECTION(ST_NAME,YEAR,PARTYABBRE,TOTVOTPOLL,ELECTORS);

-->1. Find the total candidates who participated in the election in each state in the year 2004?
-->Query
SELECT
   ST_NAME "State", COUNT(CAND_NAME) "Total Candidates"
FROM 
   ELECTION 
WHERE 
   PARTYABBRE ='BJP'
AND
   YEAR = 2004
GROUP BY
   ST_NAME ;

-->EXPLAIN PLAN
EXPLAIN PLAN FOR
   SELECT
      ST_NAME "State", COUNT(CAND_NAME) "Total candidates"
   FROM 
      ELECTION 
   WHERE 
      PARTYABBRE ='BJP'
   AND 
      YEAR = 2004;
   GROUP BY
      ST_NAME ;

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY);

/*
	
Plan hash value: 3594639672	
------------------------------------------------------------------------------
	
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time |
	
------------------------------------------------------------------------------
	
| 0 | SELECT STATEMENT | | 3550 | 273K| 239 (1)| 00:00:01 |
	
|* 1 | TABLE ACCESS FULL| ELECTION | 3550 | 273K| 239 (1)| 00:00:01 |
	
------------------------------------------------------------------------------
*/

-->Procedure 
CREATE OR REPLACE PROCEDURE TOTAL_CAND_2004
IS 
   TYPE NAMETYPE IS TABLE OF VARCHAR(100);
   TYPE CAND_COUNT IS TABLE OF NUMBER;
   state NAMETYPE;
   count_cand CAND_COUNT;
BEGIN
   SELECT 
      ST_NAME,
      COUNT(CAND_NAME) 
   BULK COLLECT INTO 
     state,
      count_cand
   FROM 
      ELECTION 
   WHERE 
      YEAR = 2004 
   GROUP BY 
      ST_NAME;
   FOR idx IN 1..state.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(state(idx)||'  '||count_cand(idx));
   END LOOP;
END;
/
--------------------------------------------------------------------------------------------------
-->2.Find the total female candidates participating each year?

-->Query
SELECT 
   YEAR,
   COUNT(CAND_SEX) "Total Female Candidates"   
FROM 
   ELECTION 
WHERE 
   CAND_SEX = 'F' 
GROUP BY 
   YEAR;

-->Procedure
CREATE OR REPLACE PROCEDURE FEMALE_CAND_YEAR
IS
   TYPE CAND_COUNT IS TABLE OF NUMBER;
   female_cand CAND_COUNT;
   election_year CAND_COUNT;
BEGIN
   SELECT 
      COUNT(CAND_SEX), 
      YEAR 
   BULK 
      COLLECT 
   INTO 
         female_cand,election_year
   FROM 
      ELECTION 
   WHERE 
      CAND_SEX = 'F' 
   GROUP BY 
      YEAR;
  FOR idx IN 1..female_cand.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(election_year(idx)||'  '||female_cand(idx));
  END LOOP;
END;
/
--------------------------------------------------------------------------------------------------
-->3.find the total candidates who participated in West Bengal state in the year 2014?

-->Query
SELECT 
   COUNT(CAND_NAME) "Total Candidates in West Bengal 2014"
FROM 
   ELECTION
WHERE 
   ST_NAME = 'West Bengal' 
AND 
   YEAR = 2014;

-->Function
CREATE OR REPLACE FUNCTION BENGAL_CAND_2014
RETURN VARCHAR
IS
   bengal_cand NUMBER;
BEGIN
   SELECT 
      COUNT(CAND_NAME) 
   INTO 
      bengal_cand
   FROM 
      ELECTION
   WHERE 
      ST_NAME = 'West Bengal' 
   AND 
      YEAR = 2014;
   RETURN 'Total Bengal Candidates are : '||bengal_cand;
END;
/
--------------------------------------------------------------------------------------------------
SELECT BENGAL_CAND_2014() FROM DUAL;

-->4.Find the total candidates who participated in the election at each state in each year?

-->Query
SELECT 
   ST_NAME "State",
   YEAR "Year",
   COUNT(CAND_NAME) "Total Candidates"
FROM 
   ELECTION 
GROUP BY 
   YEAR,
   ST_NAME ;

-->Procedure

CREATE OR REPLACE PROCEDURE CAND_COUNT_YEAR
IS
   TYPE COUNT_TYPE IS TABLE OF NUMBER;
   TYPE NAME_TYPE IS TABLE OF VARCHAR(100);
   state NAME_TYPE;
   election_year COUNT_TYPE;
   cand_count COUNT_TYPE;
BEGIN
   SELECT 
      ST_NAME,
      YEAR,
      COUNT(CAND_NAME)
   BULK COLLECT INTO 
   state,
   election_year,
   cand_count
   FROM 
      ELECTION 
   GROUP BY 
      YEAR,
      ST_NAME ;
   FOR IDX IN 1..STATE.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(state(idx)||'  '||election_year(idx)||' '||cand_count(idx));
   END LOOP;
END;
/
--------------------------------------------------------------------------------------------------
-->5.What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

-->Query
SELECT 
   PARTYNAME 
FROM 
   ELECTION 
WHERE 
   ST_NAME = 'Uttar Pradesh' 
AND 
   YEAR = 2014 
GROUP BY 
   PARTYNAME
ORDER BY SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;

-->Procedure
CREATE OR REPLACE PROCEDURE TOP5_PARTIES
IS
   top_parties VARCHAR(100);
   CURSOR EXP_CUR 
   IS
      SELECT 
         PARTYNAME 
      FROM 
         ELECTION 
      WHERE 
         ST_NAME = 'Uttar Pradesh' 
      AND 
         YEAR = 2014 
      GROUP BY 
         PARTYNAME
      ORDER BY 
         SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;
BEGIN
      OPEN EXP_CUR;
      LOOP
         FETCH EXP_CUR INTO top_parties;
         EXIT WHEN EXP_CUR%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE(top_parties);
      END LOOP;
      CLOSE EXP_CUR;
END;
/
--------------------------------------------------------------------------------------------------
-->6. Find total votes BJP got In each state in the year 1987?

-->Query
SELECT 
   ST_NAME "State",
   SUM(TOTVOTPOLL) "Total Votes" 
FROM 
   ELECTION 
WHERE 
   PARTYABBRE = 'BJP' 
AND 
   YEAR = 1989
GROUP BY 
   ST_NAME;

-->Procedure
CREATE OR REPLACE PROCEDURE BJP_VOTES_1987
IS
   TYPE COUNT_TYPE IS TABLE OF NUMBER;
   TYPE NAME_TYPE IS TABLE OF VARCHAR(100);
   state NAME_TYPE;
   votes COUNT_TYPE;
BEGIN
   SELECT 
      ST_NAME,
      SUM(TOTVOTPOLL) 
   BULK COLLECT INTO 
      state,
      votes
   FROM 
      ELECTION 
   WHERE 
      PARTYABBRE = 'BJP' 
   AND 
      YEAR = 1989
   GROUP BY 
      ST_NAME;
   FOR idx IN 1..STATE.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(state(idx)||'  '||votes(idx));
   END LOOP;
END;
----------------------------------------------------------------------------------------------------
-->7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?

-->Query
SELECT 
   SUM(TOTVOTPOLL) "Total Votes BJP in Andhra Pradesh" 
FROM 
   ELECTION 
WHERE 
   ST_NAME = 'Andhra Pradesh' 
AND 
   YEAR = 1989;

-->Function
CREATE OR REPLACE FUNCTION AP_BJPVOT_1987
RETURN VARCHAR
IS
   ap_votes NUMBER;
BEGIN
   SELECT 
      SUM(TOTVOTPOLL) 
   INTO 
     ap_votes
   FROM 
      ELECTION 
   WHERE 
      ST_NAME = 'Andhra Pradesh' 
   AND 
      YEAR = 1989;
   RETURN 'Total BJP Votes in Andhra Pradesh : '||ap_votes;
END;
/
---------------------------------------------------------------------------------------------------    
-->8.Find the Total vote percentage of BJP get in goa state in the year 2003?

-->Query
SELECT 
    ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) "BJP Percentage"
FROM 
   ELECTION 
WHERE 
   PARTYABBRE = 'BJP' 
AND
   ST_NAME = 'Goa' 
AND 
   YEAR = 2009 ;

--Function   
CREATE OR REPLACE FUNCTION GOA_BJPPER_2003
RETURN VARCHAR
IS
   goa_percent NUMBER;
BEGIN
   SELECT 
      ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) 
   INTO 
      goa_percent
   FROM 
      ELECTION 
   WHERE 
      PARTYABBRE = 'BJP' 
   AND
      ST_NAME = 'Goa' 
   AND 
      YEAR = 2009 ;
   RETURN 'Percentage of BJP Votes in Goa State : '||goa_percent;
END;
/
----------------------------------------------------------------------------------------------------        
-->9. How many times has BJP gotten an Above 50% vote?
--> Query
SELECT 
   COUNT(1) "Total Count BJP got 50% Votes " 
FROM 
   ELECTION 
WHERE 
   PARTYABBRE = 'BJP' 
AND 
   (TOTVOTPOLL)/(ELECTORS) * 100 > 50;

--> Procedure
CREATE OR REPLACE PROCEDURE TOTAL_VOTE_BJP_50
IS
   cnt NUMBER;
BEGIN
   SELECT
      COUNT(1)
   INTO
      cnt
   FROM
      ELECTION
   WHERE 
      PARTYABBRE = 'BJP' 
   AND 
      (TOTVOTPOLL)/(ELECTORS) * 100 >50;

   DBMS_OUTPUT.PUT_LINE('Total count BJP got 50% vote : '||cnt);
END;
/

--------------------------------------------------------------------------------------
-->10. what is the state list the BJP gets below 75% vote?

-->Query

SELECT 
   ST_NAME "State" 
FROM 
   ELECTION WHERE PARTYABBRE = 'BJP' 
AND 
   (TOTVOTPOLL)/(ELECTORS) * 100 < 75
GROUP BY 
   ST_NAME; 

--> Procedure
CREATE OR REPLACE PROCEDURE STATE_BJP_VOTE75
AS
   percent NUMBER;
BEGIN
   FOR C IN ( SELECT 
                  ST_NAME 
               FROM 
                  ELECTION 
               WHERE 
                  PARTYABBRE = 'BJP' 
               AND 
                  (TOTVOTPOLL)/(ELECTORS) * 100 < 75 
               GROUP BY 
                  ST_NAME)
    LOOP
      DBMS_OUTPUT.PUT_LINE(C.ST_NAME);
    END LOOP;
END;
/

----------------------------------------------------------------------------------------------------
-->   PL/SQL Procedure
--1.
BEGIN
   TOTAL_CAND_2004();
END;
/
--2.
BEGIN
   FEMALE_CAND_YEAR();
END;
/
--3.
SELECT 
   BENGAL_CAND_2014() 
FROM 
   DUAL;
--4.
BEGIN
   CAND_COUNT_YEAR();
END;
/
--5.
BEGIN
   TOP5_PARTIES();
END;
/
--6.
BEGIN
   BJP_VOTES_1987();
END;
/
--7.
SELECT 
   AP_BJPVOT_1987() 
FROM 
   DUAL;
--8. 
SELECT 
   GOA_BJPPER_2003() 
FROM 
   DUAL;
--9.
EXECUTE TOTAL_VOTE_BJP_50();
--10.
EXECUTE STATE_BJP_VOTE75();

-------------------------------------------------------------------------

DECLARE
    starting_time  TIMESTAMP WITH TIME ZONE;
    ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
   SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
   CAND_COUNT_YEAR();
   SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
   DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;
/
--Before using INDEX OUTPUT
--Time = +000000000 00:00:00.011356000
--After using INDEX OUTPUT
--Time = +000000000 00:00:00.009989000

SELECT 
   CAND_NAME 
FROM 
   ELECTION 
WHERE 
   YEAR = 1989;

SELECT 
   PC_NAME,
   YEAR  
FROM 
   ELECTION 
WHERE 
   PARTYABBRE = 'BJP'
GROUP BY 
   YEAR 
HAVING 
   ROUND(TOTVOTPOLL/ELECTORS * 100,0)>10;
       
SELECT 
   ST_NAME,
   COUNT(ST_NAME) 
FROM 
   ELECTION 
WHERE 
   PARTYABBRE = 'BJP'
GROUP BY 
   ST_NAME 
HAVING 
   ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,0) > 10;

SELECT 
   YEAR,
   ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) "Percentage" 
FROM 
   ELECTION
WHERE 
   PARTYABBRE = 'BJP' 
GROUP BY 
   YEAR;

SELECT 
   *  
FROM 
   ELECTION 
WHERE 
   YEAR = 1999 
AND 
   PARTYABBRE = 'BJP';

-->View all Index
SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'ELECTION';