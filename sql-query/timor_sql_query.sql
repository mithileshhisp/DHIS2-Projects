-- timor

-- a. First I want to get the id of my chosen locale:

select * from i18nLocale where locale = 'no';


 i18nlocaleid |     uid     | code |         created         |       lastupdated       | locale |   name    | lastupdatedby 
--------------+-------------+------+-------------------------+-------------------------+--------+-----------+---------------
        52296 | oBMTTQceViV |      | 2013-11-18 13:00:43.837 | 2013-11-18 13:00:43.837 | no     | Norwegian |              
(1 row)

now I have the id = oBMTTQceViV

b. Now I can change that locale to the one I want:

UPDATE i18nLocale SET locale = 'ku' WHERE i18nLocale.uid = 'oBMTTQceViV';
UPDATE i18nLocale SET name = 'Kurdish Sorani' WHERE i18nLocale.uid = 'oBMTTQceViV';

// for timor / 23/06/2023
UPDATE i18nLocale SET locale = 'tet' WHERE i18nLocale.uid = 'sD3lxHOoGWI';
UPDATE i18nLocale SET name = 'Tetum' WHERE i18nLocale.uid = 'sD3lxHOoGWI';

-- given by dure technolies

-- before change no of table -- 321
-- after change no of table -- 321 + 7 = 328

-- delete TB Program id - TB Case Surveillance -  iOFS30Fk6D6  21/08/2023

delete from program_organisationunits where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

update program set relatedprogramid = null where 
programid = 73132;

delete from programstageinstance where programinstanceid in 
( select programinstanceid from programinstance where programid
in ( select programid from program where uid = 'iOFS30Fk6D6'));

delete from programinstance where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from programstagesection_dataelements where programstagesectionid
in ( select programstagesectionid from  programstagesection where programstageid in 
( select programstageid from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6')));

delete from programstagesection where programstageid in 
( select programstageid from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6'));

delete from programstagedataelement where programstageid in 
( select programstageid from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6'));

delete from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from program_attributes where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from trackedentityprogramowner where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from program where uid = 'iOFS30Fk6D6';

delete from dataelement where uid in (
'mgm4KZI0kji',
'nW4gOBm8JgO',
'QQqdJjkS5Js');

delete from trackedentitydatavalueaudit where dataelementid 
in ( select dataelementid from dataelement where uid in (
'mgm4KZI0kji',
'nW4gOBm8JgO',
'QQqdJjkS5Js',
'YfOzH9DqJeN',
'H2qjZE32mMF'));

-- http://172.105.47.158/ihip_timor -- ict4cop_kenya - 4646
-- delete event program -- http://172.105.47.158/ihip_timor -- 26/09/2023

select * from program where uid = 'sKFnwwYd4Bv'

select * from program where programid = 61435;


delete from programstageinstance where programinstanceid
in ( select programinstanceid from programinstance where 
programid = 61435);

delete from programinstance where 
programid = 61435;

delete from programstage where 
programid = 61435;

delete from program where programid = 61435;

