--perfomance Queries set 3

-- 1.Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?

--> Query
SELECT 
    SUM(TOTVOTPOLL) "Votes"
FROM 
    ELECTION
WHERE 
    ST_NAME = 'Bihar' 
AND 
    YEAR = 1996;

EXPLAIN PLAN FOR
   SELECT 
       SUM(TOTVOTPOLL) "Votes"
   FROM 
       ELECTION
   WHERE 
       ST_NAME = 'Bihar' 
   AND 
       YEAR = 1996;

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY);

/*
Plan hash value: 2055522871
	
	
--------------------------------------------------------------------------------
	
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time |
	
--------------------------------------------------------------------------------
	
| 0 | SELECT STATEMENT | | 1 | 21 | 10 (0)| 00:00:01 |
	
| 1 | SORT AGGREGATE | | 1 | 21 | | |
	
|* 2 | INDEX RANGE SCAN| ELECTION_I | 1474 | 30954 | 10 (0)| 00:00:01 |

*/	
--------------------------------------------------------------------------------
-->Function

CREATE OR REPLACE FUNCTION BIHAR_VOT_1996
RETURN VARCHAR
IS
  bjp_vot NUMBER;
BEGIN
    SELECT 
       SUM(TOTVOTPOLL) 
    INTO 
       bjp_vot 
    FROM 
        ELECTION
    WHERE 
        ST_NAME = 'Bihar' 
    AND YEAR = 1996;
    RETURN 'Total Bihar Votes for BJP in the year of 1996 : '||bjp_vot;
END;
/
--------------------------------------------------------------------------------------------

-- 2.Write a SQL query to display the BJP Candidates list in descending order?

--> Query
SELECT 
DISTINCT
    (CAND_NAME) "Candidates"
FROM 
    ELECTION 
WHERE 
    PARTYABBRE = 'BJP'
ORDER BY 
    CAND_NAME 
DESC;

--> Procedure

CREATE OR REPLACE PROCEDURE BJP_CAND
IS
    TYPE NAME_TYPE IS TABLE OF VARCHAR(100);
    bjp_cand_name NAME_TYPE;
BEGIN
    SELECT 
    DISTINCT
        (CAND_NAME) 
    BULK 
        COLLECT 
    INTO 
        bjp_cand_name
    FROM 
        ELECTION 
    WHERE 
        PARTYABBRE = 'BJP'
    ORDER BY 
        CAND_NAME 
    DESC;
    FOR idx IN 1..bjp_cand_name.COUNT
    LOOP
      DBMS_OUTPUT.PUT_LINE(bjp_cand_name(idx));
    END LOOP;
END;
/
------------------------------------------------------------------------------------

-- 3. Find how many times congress gets above 50% vote in Bihar state?

--> Query
SELECT 
DISTINCT YEAR,
    ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS),2)*100 
FROM 
    ELECTION 
WHERE 
    PARTYABBRE = 'INC' 
GROUP BY 
    YEAR
HAVING 
    ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS),2)*100 > 20;

 --> Procedure
CREATE OR REPLACE PROCEDURE TOTAL_VOTE_INC_50
IS
    CURSOR inc
    IS 
        SELECT 
        DISTINCT YEAR,
            ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS),2)*100 
        FROM 
            ELECTION 
        WHERE 
            PARTYABBRE = 'INC' 
        GROUP BY 
            YEAR
        HAVING 
            ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS),2)*100 > 20;
        TYPE inc_tab IS TABLE OF inc%ROWTYPE INDEX BY BINARY_INTEGER;
        v_inc inc_tab;
BEGIN
    OPEN inc;
    FETCH inc BULK COLLECT INTO v_inc;
        DBMS_OUTPUT.PUT_LINE('Total count INC got 50% vote '||v_inc.COUNT);
    CLOSE inc;
END;
/

------------------------------------------------------------------------------------- 
--4. Find the Sikkim Candidate list each year?

--> Query
SELECT 
    YEAR   "Election Year",  CAND_NAME  "Candidates"
FROM 
    ELECTION 
WHERE 
    ST_NAME = 'Sikkim'
ORDER BY 
    YEAR;

EXPLAIN PLAN FOR
    SELECT 
        YEAR   "Election Year",  CAND_NAME  "Candidates"
    FROM 
        ELECTION 
    WHERE 
        ST_NAME = 'Sikkim'
    ORDER BY 
        YEAR;

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY);
/*
	
PLAN_TABLE_OUTPUT
	
Plan hash value: 3362854993
	
	
---------------------------------------------------------------------------------------------------
	
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time |
	
---------------------------------------------------------------------------------------------------
	
| 0 | SELECT STATEMENT | | 59 | 2006 | 3 (34)| 00:00:01 |
	
| 1 | SORT ORDER BY | | 59 | 2006 | 3 (34)| 00:00:01 |
	
| 2 | TABLE ACCESS BY INDEX ROWID BATCHED| ELECTION | 59 | 2006 | 2 (0)| 00:00:01 |
	
|* 3 | INDEX RANGE SCAN | INDEX_NAME | 59 | | 1 (0)| 00:00:01 |
	
---------------------------------------------------------------------------------------------------
*/
--> Procedure

CREATE OR REPLACE PROCEDURE SIK_CAND_YEAR
IS
    TYPE NAME_TYPE IS TABLE OF VARCHAR(100);
    TYPE COUNT_TYPE IS TABLE OF NUMBER;
    election_year COUNT_TYPE;
    cd_name NAME_TYPE;
BEGIN
    SELECT 
        YEAR ,  CAND_NAME
    BULK 
        COLLECT
    INTO 
        election_year,
        cd_name
    FROM 
        ELECTION 
    WHERE 
        ST_NAME = 'Sikkim'
    ORDER BY 
        YEAR;
    FOR idx IN 1.. election_year.COUNT
    LOOP
       DBMS_OUTPUT.PUT_LINE (Election_year(idx)||' '||cd_name(idx));
    END LOOP;
END;
/
-----------------------------------------------------------------------------------------------

--5. Find total male candidates who participated in the election?

--> Query
SELECT 
    COUNT(CAND_NAME)    "Candidate Count"
FROM 
    ELECTION 
WHERE 
    CAND_SEX = 'M';

--> Function

CREATE OR REPLACE FUNCTION MALE_CAND
RETURN VARCHAR
IS
    male_cand_count NUMBER;
BEGIN
    SELECT 
        COUNT(CAND_NAME) 
    INTO 
        male_cand_count
    FROM 
        ELECTION 
    WHERE 
        CAND_SEX = 'M';
    RETURN 'Total Male Candidates : '||male_cand_count;
END;
/
------------------------------------------------------------------------------------

-->PL/SQL Execution
--1.
SELECT 
    BIHAR_VOT_1996() 
FROM 
    DUAL;
--2.
BEGIN
    BJP_CAND();
END;
/
--3.
EXECUTE TOTAL_VOTE_INC_50();
--4.
BEGIN
    SIK_CAND_YEAR();
END;
/
--5.
SELECT 
    MALE_CAND() 
FROM 
    DUAL;
