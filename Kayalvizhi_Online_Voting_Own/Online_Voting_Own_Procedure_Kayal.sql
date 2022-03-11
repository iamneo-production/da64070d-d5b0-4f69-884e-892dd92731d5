-->Display Voter details
CREATE OR REPLACE PROCEDURE VOTER_DETAILS
IS
    CURSOR vot
    IS
        SELECT 
            *
        FROM
            VOTER;
BEGIN
    FOR I IN vot LOOP
        DBMS_OUTPUT.PUT_LINE(I.FIRST_NAME||' '||I.LAST_NAME ||'         '||I.VOTER_ID||'        '||I.DATE_OF_BIRTH);
    END LOOP;
END;
/

EXEC VOTER_DETAILS();

-->Count number of female Voters
CREATE OR REPLACE FUNCTION TOTAL_FEMALE_VOTERS
RETURN VARCHAR
IS
cnt NUMBER;
BEGIN
    SELECT 
        COUNT(1)
    INTO
        cnt
    FROM
        VOTER
    WHERE
        GENDER = 'F';
    RETURN 'Total Female Voters ' ||cnt;
END;
/

SELECT 
    TOTAL_FEMALE_VOTERS()
FROM
    DUAL;

-->Count number of Male Voters
CREATE OR REPLACE FUNCTION TOTAL_MALE_VOTERS
RETURN VARCHAR
IS
cnt NUMBER;
BEGIN
    SELECT 
        COUNT(1)
    INTO
        cnt
    FROM
        VOTER
    WHERE
        GENDER = 'M';
    RETURN 'Total Male Voters ' ||cnt;
END;
/

SELECT 
    TOTAL_MALE_VOTERS()
FROM
    DUAL;

-->Show Party info

CREATE OR REPLACE PROCEDURE PARTY_INFO
IS
    CURSOR party 
    IS
        SELECT
            *
        FROM
            PARTY_INFO;
    FOR I IN party LOOP
        DBMS_OUTPUT.PUT_LINE(I.PARTY_NAME||'          '||I.PARTY_LEADER ||'         '||I.SYMBOL);
    END LOOP;
END;
/

EXEC PARTY_INFO();