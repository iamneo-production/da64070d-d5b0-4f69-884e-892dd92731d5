CREATE TABLE ELECTION (ELECTION_ID VARCHAR(20),
      ELECTION_TYPE VARCHAR(50) NOT NULL,
      ELECTION_DATE DATE NOT NULL,
      RESULT_DATE DATE NOT NULL,
CONSTRAINT ELECTION_ID_PK PRIMARY KEY(ELECTION_ID));


CREATE TABLE STATES(STATE_ID	NUMBER,
            STATE_NAME 	VARCHAR(50) UNIQUE NOT NULL,
CONSTRAINT STATE_ID_PK PRIMARY KEY(STATE_ID));


CREATE TABLE STATE_INFO (STATE_NAME VARCHAR(50),
                    STATE_POPULATION NUMBER NOT NULL,
                		LOKSABHA_CONSTITUENCY NUMBER NOT NULL,	
                    LEGISLATIVE_CONSTITUENCY NUMBER NOT NULL,
CONSTRAINT STATE_NAME_PK PRIMARY KEY(STATE_NAME));


CREATE TABLE DISTRICT (STATE_ID NUMBER NOT NULL,
                  DISTRICT_ID NUMBER,
CONSTRAINT DISTRICT_ID_PK  PRIMARY KEY(DISTRICT_ID),
CONSTRAINT STATE_ID_FK FOREIGN KEY(STATE_ID) REFERENCES STATES(STATE_ID) ON DELETE CASCADE);


CREATE TABLE DISTRICT_INFO(DISTRICT_ID NUMBER NOT NULL,
                           DISTRICT_NAME VARCHAR(32),
                           TOTAL_POPULATION NUMBER NOT NULL, 
CONSTRAINT	DISTRICT_NAME_PK PRIMARY KEY(DISTRICT_NAME),
CONSTRAINT	DISTRICT_ID_FK FOREIGN KEY(DISTRICT_ID) REFERENCES DISTRICT(DISTRICT_ID) ON DELETE CASCADE);


CREATE TABLE CONSTITUENCY (DISTRICT_ID NUMBER NOT NULL,
                           CONSTITUENCY_ID NUMBER,
CONSTRAINT CONSTITUENCY_ID_PK PRIMARY KEY(CONSTITUENCY_ID),
CONSTRAINT DISTRICT_ID_CONS_FK FOREIGN KEY(DISTRICT_ID) REFERENCES DISTRICT(DISTRICT_ID) ON DELETE CASCADE);


CREATE TABLE CONSTITUENCY_INFO (CONSTITUENCY_ID NUMBER NOT NULL,
                          CONSTITUENCY_NAME VARCHAR(32),
               				    TOTAL_POPULATION NUMBER	NOT NULL,
CONSTRAINT	CONSTITUENCY_NAME_PK PRIMARY KEY(CONSTITUENCY_NAME),
CONSTRAINT CONSTITUENCY_ID_FK FOREIGN KEY(CONSTITUENCY_ID) REFERENCES CONSTITUENCY(CONSTITUENCY_ID) ON DELETE CASCADE);


CREATE TABLE VOTER (FIRST_NAME VARCHAR(32) NOT NULL,
				    MIDDLE_NAME	VARCHAR(32),
            LAST_NAME VARCHAR(32) NOT NULL,
	          VOTER_ID NUMBER UNIQUE NOT NULL,
            DATE_OF_BIRTH DATE NOT NULL,
            AGE NUMBER NOT NULL,
            AADHAAR	VARCHAR(32),
            GENDER VARCHAR(32)	NOT NULL,
            PASSWORD VARCHAR(20)UNIQUE NOT NULL,
CONSTRAINT AADHAAR_ID_PK PRIMARY KEY(AADHAAR));


CREATE TABLE CITY(ZIP_CODE	NUMBER,
			      CITY_NAME VARCHAR(32)	NOT NULL,
CONSTRAINT ZIP_CODE_PK PRIMARY KEY(ZIP_CODE));		


CREATE TABLE  ADDRESS(VAADHAAR   VARCHAR(32),
				STATE_ID		NUMBER     NOT NULL,
				DISTRICT_ID		NUMBER     NOT NULL,
				CONSTITUENCY_ID	NUMBER     NOT NULL,
				ZIP_CODE		NUMBER     NOT NULL,
				PHONE_NUMBER	NUMBER     NOT NULL,
CONSTRAINT AADHAAR_PK  PRIMARY KEY(VAADHAAR),
CONSTRAINT ADD_VAADHAAR_FK FOREIGN KEY(VAADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
CONSTRAINT ADD_STATE_ID_FK FOREIGN KEY(STATE_ID) REFERENCES STATES(STATE_ID) ON DELETE CASCADE,
CONSTRAINT ADD_DISTRICT_ID_FK FOREIGN KEY(DISTRICT_ID) REFERENCES DISTRICT(DISTRICT_ID) ON DELETE CASCADE,
CONSTRAINT ADD_CONSTITUENCY_ID_FK FOREIGN KEY(CONSTITUENCY_ID) REFERENCES CONSTITUENCY(CONSTITUENCY_ID) ON DELETE CASCADE,
CONSTRAINT ADD_ZIP_CODE_FK FOREIGN KEY(ZIP_CODE) REFERENCES CITY(ZIP_CODE) ON DELETE CASCADE);


CREATE TABLE PARTY (PARTY_ID NUMBER,
                  PARTY_NAME VARCHAR(32) UNIQUE NOT NULL,
                  SYMBOL VARCHAR(32) NOT NULL,
                  PARTY_LEADER VARCHAR(32) NOT NULL,
CONSTRAINT PARTY_ID_PK  PRIMARY KEY(PARTY_ID));
ALTER TABLE PARTY DROP COLUMN SYMBOL;
ALTER TABLE PARTY DROP COLUMN PARTY_LEADER;
ALTER TABLE PARTY SET UNUSED SYMBOL;
SELECT * FROM PARTY;
CREATE TABLE CANDIDATE_TYPE (CANDIDATETYPE_ID NUMBER,
                           CANDIDATETYPE_NAME VARCHAR(32)  NOT NULL,
CONSTRAINT CANDIDATETYPE_ID_PK  PRIMARY KEY(CANDIDATETYPE_ID)) ;

CREATE TABLE PARTY_INFO(PARTY_NAME VARCHAR(32) NOT NULL, SYMBOL VARCHAR(32) UNIQUE NOT NULL,
                        PARTY_LEADER VARCHAR(32),
                        FOREIGN KEY(PARTY_NAME) REFERENCES PARTY(PARTY_NAME));

DROP TABLE PARTY_INFO;

CREATE TABLE CANDIDATE(CANDIDATE_ID NUMBER,
                       CANDIDATETYPE_ID NUMBER NOT NULL,
                       AADHAAR VARCHAR(32) NOT NULL,
                       NAME VARCHAR(32) NOT NULL,
                       ELECTION_ID	VARCHAR(32) NOT NULL,
                       PARTY_ID NUMBER NOT NULL,
CONSTRAINT CANDIDATE_ID_PK PRIMARY KEY(CANDIDATE_ID),
CONSTRAINT CAN_CANDIDATETYPE_ID_FK FOREIGN KEY (CANDIDATETYPE_ID) REFERENCES CANDIDATE_TYPE (CANDIDATETYPE_ID) ON DELETE CASCADE,
CONSTRAINT CAN_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
CONSTRAINT CAN_ELECTION_ID_FK
FOREIGN KEY (ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
CONSTRAINT CAN_PARTY_ID_FK FOREIGN KEY(PARTY_ID) REFERENCES PARTY(PARTY_ID) ON DELETE CASCADE);


CREATE TABLE VOTE_POOLING (AADHAAR VARCHAR(32) NOT NULL,
                           ELECTION_ID VARCHAR(32)  NOT NULL,
                           CANDIDATE_ID NUMBER NOT NULL,
CONSTRAINT VOTE_POOL_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
CONSTRAINT VOTE_POOL_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
CONSTRAINT VOTE_POOL_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE);


CREATE TABLE VOTE_COUNT(CANDIDATE_ID  NUMBER,
                        ELECTION_ID VARCHAR(32) NOT NULL,
                        VOTE_COUNT NUMBER DEFAULT 0,
CONSTRAINT VOTE_COU_CANDIDATE_ID_PK PRIMARY KEY(CANDIDATE_ID),
CONSTRAINT VOTE_COU_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE,
CONSTRAINT VOTE_COU_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE);


CREATE TABLE LEGISLATIVE_VOTED_POPULATION(Constituency_id number,
                                      Election_id varchar(32) NOT NULL,
                                      voted_population number DEFAULT 0,
                                      Total_population number NOT NULL,
PRIMARY KEY (Constituency_id),
FOREIGN KEY (Election_id)  REFERENCES Election (Election_id)  ON DELETE CASCADE,
FOREIGN KEY (Constituency_id) REFERENCES constituency (constituency_id) ON DELETE CASCADE
);


CREATE TABLE LOKSHABA_VOTED_POPULATION(Election_id VARCHAR(32),
                                        district_id number NOT NULL,
                                        voted_population number  DEFAULT 0,
                                        Total_population number NOT NULL,
PRIMARY KEY (district_id),
FOREIGN KEY (Election_id)  REFERENCES Election (Election_id)  ON DELETE CASCADE,
FOREIGN KEY (district_id) REFERENCES district (district_id) ON DELETE CASCADE
);


CREATE TABLE LEGISLATIVE_RESULT(Candidate_id number,
                              party_id number NOT NULL,
                              Election_id VARCHAR(32) NOT NULL,
                              Constituency_id number NOT NULL,
                              vote_count number DEFAULT 0,
                              vote_diff number  DEFAULT 0,
                              Status varchar2(32),
PRIMARY KEY (candidate_id),
FOREIGN KEY (candidate_id)  REFERENCES candidate (candidate_id)  ON DELETE CASCADE,
FOREIGN KEY (party_id)  REFERENCES party (party_id)  ON DELETE CASCADE,
FOREIGN KEY (Election_id)  REFERENCES Election (election_id)  ON DELETE CASCADE,
FOREIGN KEY (constituency_id) REFERENCES constituency (constituency_id) ON DELETE CASCADE
);

CREATE TABLE LOKSHABA_RESULT(Candidate_id number,
                            party_id number NOT NULL,
                            Election_id VARCHAR(32) NOT NULL,
                            district_id number NOT NULL,
                            vote_count number DEFAULT 0,
                            vote_diff number DEFAULT 0,
                            Status varchar2(32),
PRIMARY KEY (candidate_id),
FOREIGN KEY (candidate_id)  REFERENCES candidate (candidate_id)  ON DELETE CASCADE,
FOREIGN KEY (party_id)  REFERENCES party (party_id)  ON DELETE CASCADE,
FOREIGN KEY (Election_id)  REFERENCES Election (election_id)  ON DELETE CASCADE,
FOREIGN KEY (district_id) REFERENCES district (district_id) ON DELETE CASCADE);


SELECT COUNT(TABLE_NAME) FROM USER_TABLE;

desc party_info;
