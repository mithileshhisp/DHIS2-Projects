
begin;



Village : NSKp6BgoWyp

Area : Qhs4ooRuAJk -- 2059185

Street : aOnYaPYR2Og -- 2053560

Household Number : ZSitRKUVu7l -- 2059186

select * from trackedentityattributevalue where trackedentityattributeid = 2053560;

select * from trackedentityattributevalue where trackedentityattributeid = 2059185;

select * from trackedentityattribute where uid = 'ZSitRKUVu7l';
select * from trackedentityattribute where uid = 'Qhs4ooRuAJk';
select * from trackedentityattribute where uid = 'ZSitRKUVu7l';


select rels.from_relationshipitemid,rels.to_relationshipitemid,rel1.relationshipitemid, rel1.trackedentityinstanceid
as from_tei,rel2.relationshipitemid, rel2.trackedentityinstanceid as to_tei from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid	
where rel1.trackedentityinstanceid in ( 306837 )
order by rel1.trackedentityinstanceid;	


insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values


update trackedentityattributevalue set created = now()::timestamp where created = '2021-06-29';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2021-06-29';




select * from trackedentityattributevalue where trackedentityattributeid = 2053560 and 
trackedentityinstanceid in ();


update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242839 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242831 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242832 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242833 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242838 and trackedentityattributeid = 2053559;


update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242849 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242850 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242826 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242882 and trackedentityattributeid = 2053559;

update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242883 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242867 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242878 and trackedentityattributeid = 2053559;

update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242893 and trackedentityattributeid = 2053559;
update trackedentityattributevalue set value  = '۳۱۵' where trackedentityinstanceid = 242894 and trackedentityattributeid = 2053559;






end;

