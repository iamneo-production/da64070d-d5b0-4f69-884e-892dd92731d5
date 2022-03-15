--election table
insert into election values ('MPELECION2021','MP','22-JUL-2020','16-OCT-2020');
insert into election values ('MLAELECION2021','MLA','21-AUG-2020','12-NOV-2020');


--election table
select * from election;
--states table
insert into states values (1001,'Andhra Pradesh');
insert into states values (1002,'Tamil Nadu');
insert into states values (1003,'Kerala');
insert into states values (1004,'Maharashtra');
--states table
--select * from states;

-- state_info
insert into state_info values ('Tamil Nadu',700000000,14,20);
--insert into state_info values ('tamilnadu',20000000,18,15);
insert into state_info values ('Kerala',800000000,21,19);
insert into state_info values ('Maharashtra',1000000,3,16);
--select * from state_info;

-- district
 insert into district values (1001,2001);
 insert into district values (1001,2002);
 insert into district values (1001,2003);
 insert into district values (1002,3001);
 insert into district values (1002,3002);
 insert into district values (1002,3003);
 insert into district values (1003,4001);
 insert into district values (1003,4002);
 insert into district values (1003,4003);
 insert into district values (1004,5001);
 insert into district values (1004,5002);
 insert into district values (1004,5003);
 --select * from district;
 
 --district_info
 --desc district_info;
INSERT INTO DISTRICT_INFO VALUES(2001,'Nagpur',600000);
INSERT INTO DISTRICT_INFO VALUES(2002,'Guntur',200000);
INSERT INTO DISTRICT_INFO VALUES(3001,'Chennai',170000);
INSERT INTO DISTRICT_INFO VALUES(3002,'Kallakurichi',280000);
INSERT INTO DISTRICT_INFO VALUES(3003,'Madurai',950000);
INSERT INTO DISTRICT_INFO VALUES(4001,'Malappuram',650000);
INSERT INTO DISTRICT_INFO VALUES(4002,'Kannur',870000);
INSERT INTO DISTRICT_INFO VALUES(4003,'Idukki',960000);
INSERT INTO DISTRICT_INFO VALUES(2001,'Kodagu',600000);
INSERT INTO DISTRICT_INFO VALUES(5001,'Suryapet',390000);
INSERT INTO DISTRICT_INFO VALUES(5002,'Chittoor',830000);
--select * from district_info;
--desc district_info;
--delete from constituency
INSERT INTO CONSTITUENCY VALUES(2001,10001); 
INSERT INTO CONSTITUENCY VALUES(2001,10002);
INSERT INTO CONSTITUENCY VALUES(2001,10003);
INSERT INTO CONSTITUENCY VALUES(2001,10004);
INSERT INTO CONSTITUENCY VALUES(2002,20001);
INSERT INTO CONSTITUENCY VALUES(2002,20002);
INSERT INTO CONSTITUENCY VALUES(2002,20003);
INSERT INTO CONSTITUENCY VALUES(3001,30001);
INSERT INTO CONSTITUENCY VALUES(3001,30002);
INSERT INTO CONSTITUENCY VALUES(3001,30003);
INSERT INTO CONSTITUENCY VALUES(3002,40001);
INSERT INTO CONSTITUENCY VALUES(3002,40002);
INSERT INTO CONSTITUENCY VALUES(3002,40003);
--desc constituency12;
--delete  constituency12;
--select * from constituency12;
--desc constituency_info;
--delete from constituency_info
INSERT INTO CONSTITUENCY_INFO VALUES(1001,'Bhimili',60000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(1002,'Tirupati',400000,'MLAELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(1003,'Nandigama',50000,'MLAELECION2021');
INSERT INTO constituency_info values(1004,'puttur',30000,'MLAELECION2021');

INSERT INTO CONSTITUENCY_INFO VALUES(2001,'Vemuru',50000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(2002,'Sankarapuram',16000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(2003,'Narasaraopet',80000,'MLAELECION2021');

INSERT INTO CONSTITUENCY_INFO VALUES(3001,'perambur',69000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(3002,'kolathur',80000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(3003,'Villivakkam',80000,'MLAELECION2021');

INSERT INTO CONSTITUENCY_INFO VALUES(4001,'Nippani',10096,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(4002,'Hukkeri',10006,'MLAELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(4003,'Terdal',190097,'MLAELECION2021');

--desc constituency_info21;
--select * from constituency_info21;

--delete from voter
INSERT INTO VOTER VALUES('Girish',' ','Arani',900001,'21-MAR-2001',21, '94887689321', 'M', 'girish21@');
INSERT INTO VOTER VALUES('Ram',' ','Pothineni',980001,'09-MAY-1990',23, '12345678987', 'M', 'ram@431124');
INSERT INTO VOTER VALUES('Konidela',' ','Ram',500001,'09-MAR-1991',27, '59678904321', 'M', 'ramk@2');
INSERT INTO VOTER VALUES('P',' ','Vivaan',6700001,'09-APRIL-1992',29, '13579086420', 'M', 'vivaan12@7890');
INSERT INTO VOTER VALUES('Shiv',' ','Teja',8900001,'09-APRIL-1993',28, '18912345678', 'M', '123456789');
INSERT INTO VOTER VALUES('R',' ','Shivani',8100001,'09-APRIL-1993',28, '18934567812', 'F', '7894561239');
INSERT INTO VOTER VALUES('Shourya',' ','Sharma',980001,'09-APRIL-1993',28, '19123945678', 'M', 'shouryas2@1');
INSERT INTO VOTER VALUES('M',' ','aditya',700001,'09-APRIL-1993',28, '18912367845', 'M', 'aditya@989');
INSERT INTO VOTER VALUES('P',' ','Advaith',8800001,'09-APRIL-1993',28, '18956789999', 'M', 'advaith&456');
INSERT INTO VOTER VALUES('J',' ','Krish',6600001,'09-APRIL-1993',28, '98734345678', 'M', 'krissh@j');
INSERT INTO VOTER VALUES('v',' ','abinaya',7890001,'09-APRIL-1993',28, '18912397652', 'F', 'abinaya981');
INSERT INTO VOTER VALUES('m','kumar ','Aahva',750001,'09-APRIL-1993',28, '19872345678', 'M', 'Aahva876');
INSERT INTO VOTER VALUES('k',' ','Aaidan',8973201,'09-APRIL-1993',28, '18912308178', 'M', 'Aaidan');
INSERT INTO VOTER VALUES('V',' ','Anagha',8973001,'09-APRIL-1999',23, '92175660728', 'F', 'anagha12@3');
insert into voter values('Meghana','','Lokesh',7849561,'01-JAN-1989',32,89746812374,'F','lokeshmegha123%');

--select * from voter;
--city
--delete from city

INSERT INTO city values(517644 ,'Atmakur');
INSERT INTO city values(517101 ,'tirupathi');
INSERT INTO city values(517501 ,'puttur');
INSERT INTO city values(517102 ,'srikalahasti');
INSERT INTO city values(524201 ,'kavali');
INSERT INTO city values(518422 ,'Chandragiri');

--delete from address

INSERT INTO address values('94887654321',1001,2001,10001,517101,9987653257);
INSERT INTO address values('12345678987',1001,2001,10001,517101,9817624857);
INSERT INTO address values('59678904321',1001,2001,10001,517101,9987223421);
INSERT INTO address values('13579086420',1001,2001,10001,517101,9985632427);
INSERT INTO address values('18912345678',1001,2001,10001,517101,9972654325);
--INSERT INTO address values('19123945678',101,201,1001,517101,9987643257);
INSERT INTO address values('18912367845',1001,2001,10001,517101,9876543257);
INSERT INTO address values('18956789999',1001,2001,10001,517101,9881232579);

--desc address;

-- party;

INSERT INTO PARTY VALUES(10,'TDP');
INSERT INTO PARTY VALUES(11,'Jana Sena');
INSERT INTO PARTY VALUES(12,'INC');
INSERT INTO PARTY VALUES(13,'TRS');
INSERT INTO PARTY VALUES(15,'BJP');
INSERT INTO PARTY VALUES(16,'TMC');
INSERT INTO PARTY VALUES(17,'DMK'	);
INSERT INTO PARTY VALUES(18,'ADMK'	);
INSERT INTO PARTY VALUES(19,'CPI' );
INSERT INTO PARTY VALUES(20,'CPM');
INSERT INTO PARTY VALUES(21,'NOTA');
--desc party_info;
--select * from party_info

INSERT INTO PARTY_INFO VALUES(   'INC','Hand','Soniya Gandhi');
INSERT INTO PARTY_INFO VALUES(  'BJP','Lotus','J.P.Natta');
INSERT INTO PARTY_INFO VALUES(   'YSR Congress','Fan','YS Jegan Mohan Reddy');
INSERT INTO PARTY_INFO VALUES(  'Jana Sena','Glass Tumbler','Pawan Kalyan');
INSERT INTO PARTY_INFO VALUES(  'TDP','Cycle','Chandrababu Naidu');
INSERT INTO PARTY_INFO VALUES(   'TMC','Match Box','M. Kodandaram');
INSERT INTO PARTY_INFO VALUES(  'DMK','Rising Sun','MK Stalin');
INSERT INTO PARTY_INFO VALUES(  'ADMK','Two Leaves','O.Panner Selvam');
INSERT INTO PARTY_INFO VALUES(   'CPI','Red Star','PinarayiVijan');
INSERT INTO PARTY_INFO VALUES(  'CPM','Hammer','MV ragavan');

--select * from candidate_type

INSERT INTO CANDIDATE_TYPE VALUES(1,'MLA');
INSERT INTO CANDIDATE_TYPE VALUES(2,'MP');

--select * from candidate
--desc candidate;

INSERT INTO CANDIDATE1 VALUES(9991,2	, '192175660728',	 'kumar'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(9992,2	, '142755619926',	 'Avinash'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(9993,2	, '816047191549',	 'Madhu'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(9994,2	, '874808985462',	 'Santhosh'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(9995,2	, '954505189745','akash'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(9996,2	, '287265522144','jhansi'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(9997,2	, '668229971724','rakesh'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(9998,2	,'846515424962','Rohan'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(9999,2	,'815962645614','Vikas'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(10000,2,'451994505585','Ramya'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(10001,2,'158209669441','jhanu'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(10002,2,'717391716181','Krishna'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(10003,2,'841789912855','naresh'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(10004,2,'818349568979','mahesh'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(10005,2,'795567249946','afreen'	, 'MPELECION2021',	11);I
INSERT INTO CANDIDATE1 VALUES(10006,2,'451954715894','girichadna'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(10007,2,'461829879857','Aravind'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(10008,2,'944545894652','Venkadesh'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(10009,2,'515147079967','Chandu'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(10010,2,'542499664147','siva'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(10011,2,'592622499162','murali'	, 'MPELECION2021',	11);
INSERT INTO CANDIDATE1 VALUES(10012,2,'728996541951','gopi'	, 'MPELECION2021',	12);
INSERT INTO CANDIDATE1 VALUES(10013,1,'277885444976','ravi'	, 'MLAELECION2021',	15);
INSERT INTO CANDIDATE1 VALUES(10014,1,'257097681782','priya'	, 'MLAELECION2021',	15);
INSERT INTO CANDIDATE1 VALUES(10015,1,'818189417967','fazil'	, 'MLAELECION2021',	15);
INSERT INTO CANDIDATE1 VALUES(10016,1,'466078417957','sanjana'	, 'MLAELECION2021',	15);
INSERT INTO CANDIDATE1 VALUES(10017,1,'116882974547','Rahul'	, 'MLAELECION2021',	15);
INSERT INTO CANDIDATE1 VALUES(10018,1,'159712894127','mahesh'	, 'MLAELECION2021',	16);
INSERT INTO CANDIDATE1 VALUES(10019,1,'147439515615','kittu'	, 'MLAELECION2021',	17);
INSERT INTO CANDIDATE1 VALUES(10020,1,'677496771858','veena'	, 'MLAELECION2021',	19);
INSERT INTO CANDIDATE1 VALUES(10021,1,'426636912678',	 'krishna'	, 'MLAELECION2021',	20);



--select * from vote_pooling;

---vote_polling for mpelections
insert into vote_pooling values(94887654321,'MPELECION2021',9991,1001,201);
insert into vote_pooling values(12345678987,'MPELECION2021',9991,1001,201);
insert into vote_pooling values(59678904321,'MPELECION2021',9993,3002,301);
insert into vote_pooling values(13579086420,'MPELECION2021',9991,1001,201);
insert into vote_pooling values(18912345678,'MPELECION2021',9992,1001,202);
insert into vote_pooling values(18934567812,'MPELECION2021',9992,1001,202);
insert into vote_pooling values(18912367845,'MPELECION2021',9992,1001,202);
insert into vote_pooling values(18956789999,'MPELECION2021',9992,1001,202);
insert into vote_pooling values(98734345678,'MPELECION2021',9993,3001,301);
insert into vote_pooling values(18912397652,'MPELECION2021',9993,3001,301);

--vote_polling for mlaelections
insert into vote_pooling values(19872345678,'MLAELECION2021',10013,1004,201);
insert into vote_pooling values(18912308178,'MLAELECION2021',10013,1004,201);
insert into vote_pooling values(92175660728,'MLAELECION2021',10013,1004,201);
insert into vote_pooling values(89746812374,'MLAELECION2021',10015,1002,201);


--vote_count
--insert the table using procedures
create procedure create_vote_count_table
is
begin
insert into vote_count(candidate_id,election_id,vote_count)
select candidate_id,election_id,count(*) as coun from vote_pooling  group by candidate_id,election_id;
END;


SET SERVEROUTPUT ON
BEGIN
delete from vote_count;
create_vote_count_table;
END;
/



-- legislative_voted_population;
create procedure create_legislative_vote_table
is 
begin
for i in (select constituency_id as a,total_population as b from constituency_info where election_id='MLAELECION2021')
loop
for j in (select count(*)as c,constituency_id as d ,election_id as e from vote_pooling  where election_id='MLAELECION2021' group by constituency_id,election_id)
loop
if i.a=j.d  then
insert into legislative_voted_population values(i.a,j.e,j.c,i.b);
end if;
end loop;
end loop;
end;
/


BEGIN
delete from legislative_voted_population;
create_legislative_vote_table;
END;
/

--select * from legislative_voted_population;


--LOKSHABA_VOTED_POPULATION
--desc LOKSHABA_VOTED_POPULATION;

create table lokshaba_vote_sample as
select total_population,district_id from district_info
 where district_id in (select district_id from constituency where constituency_id 
in (select constituency_id from vote_pooling where election_id='MPELECION2021' group by constituency_id)
group by district_id);


create procedure create_lokshaba_vote_table
is
begin
for i in (select total_population as a,district_id as b from lokshaba_vote_sample)
loop
for j in (select count(*) as c,district_id as d from vote_pooling group by district_id)
loop
if i.b=j.d then
insert into LOKSHABA_VOTED_POPULATION values('MPELECION2021',i.b,j.c,i.a);
end if;
end loop;
end loop;
end;
/

BEGIN
delete from LOKSHABA_VOTED_POPULATION;
create_lokshaba_vote_table;
END;
/






