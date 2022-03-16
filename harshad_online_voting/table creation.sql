--table creation
--election table
CREATE TABLE ELECTION (ELECTION_ID VARCHAR(20),		
		  ELECTION_TYPE VARCHAR(50) NOT NULL,
		     ELECTION_DATE DATE NOT NULL,
		     RESULT_DATE DATE NOT NULL,
		CONSTRAINT ELECTION_ID_PK PRIMARY KEY(ELECTION_ID));
		

--desc election;

--select * from election;


--states table
		CREATE TABLE STATES(STATE_ID	NUMBER,
		           STATE_NAME 	VARCHAR(50) UNIQUE NOT NULL,
		CONSTRAINT STATE_ID_PK PRIMARY KEY(STATE_ID));
		
--desc states;
--select * from states;
		
--state_info table
		CREATE TABLE STATE_INFO (STATE_NAME VARCHAR(50),
		                   STATE_POPULATION NUMBER NOT NULL,
		               		LOKSABHA_CONSTITUENCY NUMBER NOT NULL,	
		                   LEGISLATIVE_CONSTITUENCY NUMBER NOT NULL,
		CONSTRAINT STATE_NAME_PK PRIMARY KEY(STATE_NAME));
		
--desc state_info;
--select * from state_info;

--district table		

		CREATE TABLE DISTRICT (STATE_ID NUMBER NOT NULL,
		                 DISTRICT_ID NUMBER,
		CONSTRAINT DISTRICT_ID_PK  PRIMARY KEY(DISTRICT_ID),
		CONSTRAINT STATE_ID_FK FOREIGN KEY(STATE_ID) REFERENCES STATES(STATE_ID) ON DELETE CASCADE);
		
--desc district;
--select * from district;
		
--district_info

		CREATE TABLE DISTRICT_INFO(DISTRICT_ID NUMBER NOT NULL,
		                          DISTRICT_NAME VARCHAR(32),
		                          TOTAL_POPULATION NUMBER NOT NULL,
		CONSTRAINT	DISTRICT_NAME_PK PRIMARY KEY(DISTRICT_NAME),
		CONSTRAINT	DISTRICT_ID_FK FOREIGN KEY(DISTRICT_ID) REFERENCES DISTRICT(DISTRICT_ID) ON DELETE CASCADE);
		

--desc district_info;
--select * from district_info;

--constituency
		CREATE TABLE CONSTITUENCY (DISTRICT_ID NUMBER NOT NULL,
		                          CONSTITUENCY_ID NUMBER,
		CONSTRAINT CONSTITUENCY_ID_PK PRIMARY KEY(CONSTITUENCY_ID),
		CONSTRAINT DISTRICT_ID_CONS_FK FOREIGN KEY(DISTRICT_ID) REFERENCES DISTRICT(DISTRICT_ID) ON DELETE CASCADE);
		
--desc constituency;
--select * from constituency;
		
--constitutency_info
		CREATE TABLE CONSTITUENCY_INFO (CONSTITUENCY_ID NUMBER NOT NULL,
		                         CONSTITUENCY_NAME VARCHAR(32),
		              				    TOTAL_POPULATION NUMBER	NOT NULL,
                                        ELECTION_ID VARCHAR(20) NOT NULL,
		CONSTRAINT	CONSTITUENCY_NAME_PK PRIMARY KEY(CONSTITUENCY_NAME),
		CONSTRAINT CONSTITUENCY_ID_FK FOREIGN KEY(CONSTITUENCY_ID) REFERENCES CONSTITUENCY(CONSTITUENCY_ID) ON DELETE CASCADE);
		
desc constituency_info;
select * from constituency_info;

		
--voters
		CREATE TABLE VOTER (FIRST_NAME VARCHAR(32) NOT NULL,
						    MIDDLE_NAME	VARCHAR(32),
		           LAST_NAME VARCHAR(32) NOT NULL,
			          VOTER_ID NUMBER UNIQUE NOT NULL,
		           DATE_OF_BIRTH DATE NOT NULL,
		           AGE NUMBER NOT NULL,
		           AADHAAR	VARCHAR(32),
		           GENDER VARCHAR(32)	NOT NULL,
		           PASSWORD VARCHAR(20)UNIQUE NOT NULL,
		CONSTRAINT AADHAAR_vote_PK PRIMARY KEY(AADHAAR));


--desc voter;
--select * from voter;

--city 		

		CREATE TABLE CITY(ZIP_CODE	NUMBER,
					      CITY_NAME VARCHAR(32)	NOT NULL,
		CONSTRAINT ZIP_CODE_PK PRIMARY KEY(ZIP_CODE));		
		
--desc city;
--select * from city;
		
--address
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
--desc address;
--select * from address;
--party		

		CREATE TABLE PARTY (PARTY_ID NUMBER PRIMARY KEY,
		                 PARTY_NAME VARCHAR(32) UNIQUE NOT NULL
                         );
--desc party;
--select * from party;

--candidate_type 

		CREATE TABLE CANDIDATE_TYPE (CANDIDATETYPE_ID NUMBER,
		                          CANDIDATETYPE_NAME VARCHAR(32)  NOT NULL,
		CONSTRAINT CANDIDATETYPE_ID_PK  PRIMARY KEY(CANDIDATETYPE_ID)) ;
		
--desc candidate_type;
--select * from candidate_type;

--party_info
		CREATE TABLE PARTY_INFO(PARTY_NAME VARCHAR(32) NOT NULL, SYMBOL VARCHAR(32) UNIQUE NOT NULL,
		                       PARTY_LEADER VARCHAR(32),
		                       FOREIGN KEY(PARTY_NAME) REFERENCES PARTY(PARTY_NAME));
		
--desc party_info;
--select * from party_info;		
		
--candidate 
		CREATE TABLE CANDIDATE1(CANDIDATE_ID NUMBER PRIMARY KEY,
		                      CANDIDATETYPE_ID NUMBER NOT NULL,
		                      AADHAAR VARCHAR(32) NOT NULL,
		                      NAME VARCHAR(32) NOT NULL,
		                      ELECTION_ID	VARCHAR(32) NOT NULL,
		                      PARTY_ID NUMBER NOT NULL);
		--CONSTRAINT CAN_CANDIDATETYPE_ID_FK FOREIGN KEY (CANDIDATETYPE_ID) REFERENCES CANDIDATE_TYPE (CANDIDATETYPE_ID) ON DELETE CASCADE,
		--CONSTRAINT CAN_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
		--CONSTRAINT CAN_ELECTION_ID_FK FOREIGN KEY (ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
		--CONSTRAINT CAN_PARTY_ID_FK FOREIGN KEY(PARTY_ID) REFERENCES PARTY(PARTY_ID) ON DELETE CASCADE);
--drop table candidate;
--select * from candidate;


--vote_pooling

		CREATE TABLE VOTE_POOLING (AADHAAR VARCHAR(32) NOT NULL PRIMARY KEY,
		                          ELECTION_ID VARCHAR(32)  NOT NULL,
		                          CANDIDATE_ID NUMBER NOT NULL,
                                  constituency_id number not null,
                                  district_id number not null);
		--CONSTRAINT VOTE_POOL_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
		--CONSTRAINT VOTE_POOL_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
		--CONSTRAINT VOTE_POOL_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE);
--drop table vote_pooling;

	
--desc vote_pooling;
--drop table vote_pooling;
		
--vote_count
		CREATE TABLE VOTE_COUNT(CANDIDATE_ID  NUMBER primary key,
		                       ELECTION_ID VARCHAR(32) NOT NULL,
		                       VOTE_COUNT NUMBER DEFAULT 0);
	--	CONSTRAINT VOTE_COU_CANDIDATE_ID_PK PRIMARY KEY(CANDIDATE_ID),
	--	CONSTRAINT VOTE_COU_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE,
	--	CONSTRAINT VOTE_COU_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE);
--drop table vote_count;

--legislative_voted_population
		CREATE TABLE LEGISLATIVE_VOTED_POPULATION(Constituency_id number,
		                                     Election_id varchar(32) NOT NULL,
		                                     voted_population number DEFAULT 0,
		                                     Total_population number NOT NULL,
		PRIMARY KEY (Constituency_id),
		FOREIGN KEY (Election_id)  REFERENCES Election (Election_id)  ON DELETE CASCADE,
		FOREIGN KEY (Constituency_id) REFERENCES constituency (constituency_id) ON DELETE CASCADE
		);
		
--desc LEGISLATIVE_VOTED_POPULATION;

--lokshaba_voted_population
    
		CREATE TABLE LOKSHABA_VOTED_POPULATION(Election_id VARCHAR(32),
		                                       district_id number NOT NULL,
		                                       voted_population number  DEFAULT 0,
		                                       Total_population number NOT NULL,
		PRIMARY KEY (district_id),
		FOREIGN KEY (Election_id)  REFERENCES Election (Election_id)  ON DELETE CASCADE,
		FOREIGN KEY (district_id) REFERENCES district (district_id) ON DELETE CASCADE
		);
--desc lokshaba_voted_population;

--LEGISLATIVE_RESULT
		

		CREATE TABLE LEGISLATIVE_RESULT(Candidate_id number primary key,
		                             party_id number ,
		                             Election_id VARCHAR(32) not null,
		                             Constituency_id number not null,
		                             vote_count number  not null,
		                             vote_diff number   not null,
		                             Status varchar2(32),
		
		FOREIGN KEY (party_id)  REFERENCES party (party_id)  ON DELETE CASCADE,
		FOREIGN KEY (Election_id)  REFERENCES Election (election_id)  ON DELETE CASCADE,
	FOREIGN KEY (constituency_id) REFERENCES constituency (constituency_id) ON DELETE CASCADE
	);
--drop table LEGISLATIVE_RESULT;
--lokshaba_result
		CREATE TABLE LOKSHABA_RESULT(Candidate_id number,
		                           party_id number NOT NULL,
		                           Election_id VARCHAR(32) NOT NULL,
		                           district_id number NOT NULL,
		                           vote_count number DEFAULT 0,
		                           vote_diff number DEFAULT 0,
		                           Status varchar2(32) ,
		PRIMARY KEY (candidate_id) );
--		FOREIGN KEY (candidate_id)  REFERENCES candidate (candidate_id)  ON DELETE CASCADE,
--		FOREIGN KEY (party_id)  REFERENCES party (party_id)  ON DELETE CASCADE,
--		FOREIGN KEY (Election_id)  REFERENCES Election (election_id)  ON DELETE CASCADE,
--		FOREIGN KEY (district_id) REFERENCES district (district_id) ON DELETE CASCADE);
--drop table LOKSHABA_RESULT;
