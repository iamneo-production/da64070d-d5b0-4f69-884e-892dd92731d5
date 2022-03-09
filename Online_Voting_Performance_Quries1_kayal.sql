-----------------------------------prerformance query set 1---------------------------------------
-->INDEX
CREATE INDEX ELECTION_I
ON ELECTION(ST_NAME,YEAR,PARTYABBRE,TOTVOTPOLL,ELECTORS);

-->1. Find the total candidates who participated in the election in each state in the year 2004?
-->Query
SELECT
   * 
FROM 
   ELECTION 
WHERE 
   PARTYABBRE ='BJP';
-->EXPLAIN PLAN
EXPLAIN PLAN FOR
   SELECT
      * 
   FROM 
      ELECTION 
   WHERE 
      PARTYABBRE ='BJP';

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
   STATE_NAME NAMETYPE;
   COUNT_CAND CAND_COUNT;
BEGIN
   SELECT 
      ST_NAME,
      COUNT(CAND_NAME) 
   BULK COLLECT INTO 
      STATE_NAME,
      COUNT_CAND
   FROM 
      ELECTION 
   WHERE 
      YEAR = 2004 
   GROUP BY 
      ST_NAME;
  FOR IDX IN 1..STATE_NAME.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(STATE_NAME(IDX)||'  '||COUNT_CAND(IDX));
  END LOOP;
END;
/
--------------------------------------------------------------------------------------------------
-->2.Find the total female candidates participating each year?

-->Query
SELECT 
   COUNT(CAND_SEX), 
   YEAR 
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
   FEMALE_CAND CAND_COUNT;
   ELECTION_YEAR CAND_COUNT;
BEGIN
   SELECT 
      COUNT(CAND_SEX), 
      YEAR 
   BULK COLLECT INTO 
         FEMALE_CAND,ELECTION_YEAR
   FROM 
      ELECTION 
   WHERE 
      CAND_SEX = 'F' 
   GROUP BY 
      YEAR;
  FOR IDX IN 1..FEMALE_CAND.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(ELECTION_YEAR(IDX)||'  '||FEMALE_CAND(IDX));
  END LOOP;
END;
/
--------------------------------------------------------------------------------------------------
-->3.find the total candidates who participated in West Bengal state in the year 2014?

-->Query
SELECT 
   COUNT(CAND_NAME) 
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
   BENGAL_CAND NUMBER;
BEGIN
   SELECT 
      COUNT(CAND_NAME) 
   INTO 
      BENGAL_CAND
   FROM 
      ELECTION
   WHERE 
      ST_NAME = 'West Bengal' 
   AND 
      YEAR = 2014;
   RETURN 'Total Bengal Candidates are : '||BENGAL_CAND;
END;
/
--------------------------------------------------------------------------------------------------
  SELECT BENGAL_CAND_2014() FROM DUAL;

-->4.Find the total candidates who participated in the election at each state in each year?

-->Query
SELECT 
   ST_NAME,
   YEAR,
   COUNT(CAND_NAME)
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
   STATE NAME_TYPE;
   ELECTION_YEAR COUNT_TYPE;
   CAND_COUNT COUNT_TYPE;
BEGIN
   SELECT 
      ST_NAME,
      YEAR,
      COUNT(CAND_NAME)
   BULK COLLECT INTO 
      STATE,
      ELECTION_YEAR,
      CAND_COUNT
   FROM 
      ELECTION 
   GROUP BY 
      YEAR,
      ST_NAME ;
   FOR IDX IN 1..STATE.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(STATE(IDX)||'  '||ELECTION_YEAR(IDX)||' '||CAND_COUNT(IDX));
   END LOOP;
END;
/
--------------------------------------------------------------------------------------------------
-->5.What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

-->Query
SELECT 
   DISTINCT PARTYABBRE
FROM 
   ELECTION 
WHERE 
   ST_NAME = 'Uttar Pradesh' 
AND 
   ROWNUM <= 5
AND 
   YEAR = 2014
ORDER BY 
   TOTVOTPOLL ASC FETCH FIRST 5 ROWS ONLY;

-->Procedure
CREATE OR REPLACE PROCEDURE TOP5_PARTIES
IS
   TOP_PARTIES VARCHAR(100);
   CURSOR EXP_CUR 
   IS
      SELECT 
         DISTINCT PARTYABBRE
      FROM 
         ELECTION 
      WHERE 
         ST_NAME = 'Uttar Pradesh'
      AND
         ROWNUM <= 5 
      AND 
         YEAR = 2014
      ORDER BY 
         TOTVOTPOLL DESC FETCH FIRST 5 ROWS ONLY;
BEGIN
      OPEN EXP_CUR;
      LOOP
         FETCH EXP_CUR INTO TOP_PARTIES;
         EXIT WHEN EXP_CUR%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE(TOP_PARTIES);
      END LOOP;
      CLOSE EXP_CUR;
END;
/
--------------------------------------------------------------------------------------------------
-->6. Find total votes BJP got In each state in the year 1987?

-->Query
SELECT 
   ST_NAME,
   SUM(TOTVOTPOLL) 
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
   STATE NAME_TYPE;
   VOTES COUNT_TYPE;
BEGIN
   SELECT 
      ST_NAME,
      SUM(TOTVOTPOLL) 
   BULK COLLECT INTO 
      STATE,
      VOTES
   FROM 
      ELECTION 
   WHERE 
      PARTYABBRE = 'BJP' 
   AND 
      YEAR = 1989
   GROUP BY 
      ST_NAME;
   FOR IDX IN 1..STATE.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(STATE(IDX)||'  '||VOTES(IDX));
   END LOOP;
END;
----------------------------------------------------------------------------------------------------
-->7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?

-->Query
SELECT 
   SUM(TOTVOTPOLL) 
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
   AP_VOTES NUMBER;
BEGIN
   SELECT 
      SUM(TOTVOTPOLL) 
   INTO 
      AP_VOTES
   FROM 
      ELECTION 
   WHERE 
      ST_NAME = 'Andhra Pradesh' 
   AND 
      YEAR = 1989;
   RETURN 'Total BJP Votes in Andhra Pradesh : '||AP_VOTES;
END;
/
---------------------------------------------------------------------------------------------------    
-->8.Find the Total vote percentage of BJP get in goa state in the year 2003?

-->Query
SELECT 
      ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) 
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
   GOA_PERCENT NUMBER;
BEGIN
   SELECT 
      ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) 
   INTO 
      GOA_PERCENT
   FROM 
      ELECTION 
   WHERE 
      PARTYABBRE = 'BJP' 
   AND
      ST_NAME = 'Goa' 
   AND 
      YEAR = 2009 ;
   RETURN 'Percentage of BJP Votes in Goa State : '||GOA_PERCENT;
END;
/
----------------------------------------------------------------------------------------------------        
-->9. How many times has BJP gotten an Above 50% vote?

SELECT 
   PC_NAME,
   COUNT(PC_NAME) 
FROM 
   ELECTION 
WHERE 
   PARTYABBRE = 'BJP'
GROUP BY 
   PC_NAME 
HAVING 
   ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,0) > 40;

-->10. what is the state list the BJP gets below 75% vote?

SELECT 
   ST_NAME 
FROM 
   ELECTION 
WHERE 
   PARTYABBRE = 'BJP'
GROUP BY 
   ST_NAME 
HAVING  
   ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,0) < 75;
----------------------------------------------------------------------------------------------------
-->REFERENCE
BEGIN
   TOTAL_CAND_2004();
END;
/

BEGIN
   FEMALE_CAND_YEAR();
END;
/

SELECT 
   BENGAL_CAND_2014() 
FROM 
   DUAL;

BEGIN
   CAND_COUNT_YEAR();
END;
/

BEGIN
   TOP5_PARTIES();
END;
/

BEGIN
   BJP_VOTES_1987();
END;
/

SELECT 
   AP_BJPVOT_1987() 
FROM 
   DUAL;
 
SELECT 
   GOA_BJPPER_2003() 
FROM 
   DUAL;

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