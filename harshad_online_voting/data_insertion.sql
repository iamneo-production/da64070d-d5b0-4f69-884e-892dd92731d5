--election table
insert into election values ('MPELECION2021','MP','17-DEC-2021','12-FEB-2022');
insert into election values ('MLAELECION2021','MLA','23-DEC-2021','12-MAR-2022');


--election table
select * from election;
--states table
insert into states values (101,'andhra pradesh');
insert into states values (102,'tamilnadu');
insert into states values (103,'kerala');
insert into states values (104,'maharashtra');
--states table
--select * from states;

-- state_info
insert into state_info values ('tamilnadu',100000000,20,10);
--insert into state_info values ('tamilnadu',30000000,10,12);
insert into state_info values ('kerala',400000000,12,19);
insert into state_info values ('maharashtra',9000000,8,13);
--select * from state_info;

-- district
 insert into district values (101,201);
 insert into district values (101,202);
 insert into district values (101,203);
 insert into district values (102,301);
 insert into district values (102,302);
 insert into district values (102,303);
 insert into district values (103,401);
 insert into district values (103,402);
 insert into district values (103,403);
 insert into district values (104,501);
 insert into district values (104,502);
 insert into district values (104,503);
 --select * from district;
 
 --district_info
 --desc district_info;
INSERT INTO DISTRICT_INFO VALUES(201,'chittoor',900000);
INSERT INTO DISTRICT_INFO VALUES(202,'nellore',100000);
INSERT INTO DISTRICT_INFO VALUES(301,'Chennai',140000);
INSERT INTO DISTRICT_INFO VALUES(302,'Kallakurichi',230000);
INSERT INTO DISTRICT_INFO VALUES(303,'Madurai',920000);
INSERT INTO DISTRICT_INFO VALUES(401,'malappuram',220000);
INSERT INTO DISTRICT_INFO VALUES(402,'Kannur',900000);
INSERT INTO DISTRICT_INFO VALUES(403,'idukki',100000);
INSERT INTO DISTRICT_INFO VALUES(501,'pune',200000);
INSERT INTO DISTRICT_INFO VALUES(502,'sangli',100000);
--select * from district_info;
--desc district_info;
--delete from constituency
INSERT INTO CONSTITUENCY VALUES(201,1001); 
INSERT INTO CONSTITUENCY VALUES(201,1002);
INSERT INTO CONSTITUENCY VALUES(201,1003);
INSERT INTO CONSTITUENCY VALUES(201,1004);
INSERT INTO CONSTITUENCY VALUES(202,2001);
INSERT INTO CONSTITUENCY VALUES(202,2002);
INSERT INTO CONSTITUENCY VALUES(202,2003);
INSERT INTO CONSTITUENCY VALUES(301,3001);
INSERT INTO CONSTITUENCY VALUES(301,3002);
INSERT INTO CONSTITUENCY VALUES(301,3003);
INSERT INTO CONSTITUENCY VALUES(302,4001);
INSERT INTO CONSTITUENCY VALUES(302,4002);
INSERT INTO CONSTITUENCY VALUES(302,4003);
--desc constituency12;
--delete  constituency12;
--select * from constituency12;
--desc constituency_info;
--delete from constituency_info
INSERT INTO CONSTITUENCY_INFO VALUES(1001,'Tirupati',60000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(1002,'Srikalahasti',400000,'MLAELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(1003,'chandragiri',50000,'MLAELECION2021');
INSERT INTO constituency_info values(1004,'puttur',30000,'MLAELECION2021');

INSERT INTO CONSTITUENCY_INFO VALUES(2001,'kavali',50000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(2002,'atmakur',16000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(2003,'kovuru',80000,'MLAELECION2021');

INSERT INTO CONSTITUENCY_INFO VALUES(3001,'perambur',69000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(3002,'kolathur',80000,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(3003,'Villivakkam',80000,'MLAELECION2021');

INSERT INTO CONSTITUENCY_INFO VALUES(4001,'rishivandiyam',10096,'MPELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(4002,'sankarapuram',10006,'MLAELECION2021');
INSERT INTO CONSTITUENCY_INFO VALUES(4003,'kallakurichi',190097,'MLAELECION2021');

--desc constituency_info21;
--select * from constituency_info21;

--delete from voter
INSERT INTO VOTER VALUES('shaik',' ','jakeer',900001,'09-JUL-1989',31, '94887654321', 'M', 'jakker12@');
INSERT INTO VOTER VALUES('shaik',' ','jaffer',980001,'09-MAY-1990',23, '12345678987', 'M', 'jafeer124');
INSERT INTO VOTER VALUES('muni',' ','siva',500001,'09-MAR-1991',27, '59678904321', 'M', 'sivam12');
INSERT INTO VOTER VALUES('s',' ','shankeer',6700001,'09-APRIL-1992',29, '13579086420', 'M', 'shankeer7890');
INSERT INTO VOTER VALUES('shaik',' ','Aaban',8900001,'09-APRIL-1993',28, '18912345678', 'M', '123456789');
INSERT INTO VOTER VALUES('k',' ','mani',8100001,'09-APRIL-1993',28, '18934567812', 'M', '7894561239');
INSERT INTO VOTER VALUES('l',' ','Aadit',980001,'09-APRIL-1993',28, '19123945678', 'M', 'ule12@1');
INSERT INTO VOTER VALUES('o',' ','aaditeya',700001,'09-APRIL-1993',28, '18912367845', 'M', 'aaditeya@989');
INSERT INTO VOTER VALUES('p',' ','Aadvay',8800001,'09-APRIL-1993',28, '18956789999', 'M', 'aadvay&456');
INSERT INTO VOTER VALUES('shaik',' ','Aaftab',6600001,'09-APRIL-1993',28, '98734345678', 'M', 'sahik*123');
INSERT INTO VOTER VALUES('v',' ','aabneya',7890001,'09-APRIL-1993',28, '18912397652', 'M', 'aabneya981');
INSERT INTO VOTER VALUES('m','kumar ','Aahva',750001,'09-APRIL-1993',28, '19872345678', 'M', 'Aahva876');
INSERT INTO VOTER VALUES('k',' ','Aaidan',8973201,'09-APRIL-1993',28, '18912308178', 'M', 'Aaidan');
INSERT INTO VOTER VALUES('k',' ','kumar',8973001,'09-APRIL-1999',23, '92175660728', 'M', 'kumar12@3');
insert into voter values('meghana','','lokesh',7849561,'01-JAN-1989',32,89746812374,'F','lokeshmegha123%');

--select * from voter;
--city
--delete from city

INSERT INTO city values(517644 ,'srikalahasti');
INSERT INTO city values(517101 ,'tirupathi');
INSERT INTO city values(517501 ,'puttur');
INSERT INTO city values(517102 ,'chandragiri');
INSERT INTO city values(524201 ,'kavali');
INSERT INTO city values(518422 ,'atamakur');

--delete from address

INSERT INTO address values('94887654321',101,201,1001,517101,9987653257);
INSERT INTO address values('12345678987',101,201,1001,517101,9817624857);
INSERT INTO address values('59678904321',101,201,1001,517101,9987223421);
INSERT INTO address values('13579086420',101,201,1001,517101,9985632427);
INSERT INTO address values('18912345678',101,201,1001,517101,9972654325);
--INSERT INTO address values('19123945678',101,201,1001,517101,9987643257);
INSERT INTO address values('18912367845',101,201,1001,517101,9876543257);
INSERT INTO address values('18956789999',101,201,1001,517101,9881232579);

--desc address;

-- party;

INSERT INTO PARTY VALUES(10,'BJP');
INSERT INTO PARTY VALUES(11,'INC');
INSERT INTO PARTY VALUES(12,'YSR Congress');
INSERT INTO PARTY VALUES(13,'Jana Sena');
INSERT INTO PARTY VALUES(15,'Telugu Desam');
INSERT INTO PARTY VALUES(16,'TJS');
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
INSERT INTO PARTY_INFO VALUES(  'Telugu Desam','Cycle','Chandrababu Naidu');
INSERT INTO PARTY_INFO VALUES(   'TJS','Match Box','M. Kodandaram');
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

--


-- LEGISLATIVE_RESULT;
create or replace procedure create_legis_result_tab
is
status varchar(10):='LOSE';
diff number(10):=0;
m number(10):=0;
v number(10):=0;
begin
for j in (select count(vote_pooling.constituency_id)as e ,vote_pooling.constituency_id as f from vote_pooling
full outer join candidate on candidate.candidate_id=vote_pooling.candidate_id where vote_pooling.election_id='MLAELECION2021' group by vote_pooling.constituency_id)
loop
for i in (select distinct vote_pooling.candidate_id as a,candidate.party_id as b,vote_pooling.election_id as c,vote_pooling.constituency_id as d from vote_pooling
full outer join candidate on candidate.candidate_id=vote_pooling.candidate_id where vote_pooling.election_id='MLAELECION2021')
loop

if i.d=j.f then
select count(*) into m from vote_pooling where election_id='MLAELECION2021' and constituency_id=j.f and candidate_id=i.a;
select count(*) into v from vote_pooling where election_id='MLAELECION2021' and constituency_id=j.f;
diff:=m/v;
if diff=50 then
status:='WIN';
end if;
insert into LEGISLATIVE_RESULT values(i.a,i.b,i.c,i.d,j.e,diff,status);
end if;
end loop;
end loop;
end;
/


--execute create_legis_result_tab;
begin
delete from LEGISLATIVE_RESULT;
create_legis_result_tab;
END;
/
--select * from LEGISLATIVE_RESULT;

--select * from LEGISLATIVE_RESULT;


--select * from LEGISLATIVE_RESULT;



 
--lokshaba_result;

create or replace procedure lokshaba_result_1
is
m number(10):=0;
v number(10):=0;
status varchar(10):='LOSE';
b number(10):=0;
diff number(10):=0;
begin
for i in (select count(*) as x,candidate_id ,district_id from vote_pooling
where election_id='MPELECION2021' group by candidate_id,district_id)
loop
for j in (select  district_id,total_population from district_info)
loop
if i.district_id=j.district_id then

select count(*) into m from vote_pooling where election_id='MPELECION2021' and candidate_id=i.candidate_id and district_id=i.district_id;
select count(*) into v from vote_pooling where election_id='MPELECION2021' and district_id=i.district_id;

diff:=m/v;

if diff>20 then
status:='WIN';
end if;

select party_id  into b from candidate1 where candidate_id=i.candidate_id;

insert into LOKSHABA_RESULT values(i.candidate_id,b,'MPELECION2021',j.district_id,i.x,diff,status);

end if;
end loop;
end loop;
end;
/

begin
lokshaba_result_1;
end;
/



--select * from LOKSHABA_RESULT;