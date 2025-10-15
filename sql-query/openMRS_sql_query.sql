-- openMRS

select * from patient p;

select * from person;

select * from person_name limit 100;

select * from person_name;

select count(*) from person_name; -- 1370337
select count(*) from person_name where given_name like '****'; -- 1370308

select count(*) from person_name where given_name not like '****'; -- 29

select * from person_name where given_name not like '****';

select * from person_name where given_name = '****';

select * from person_name where given_name is null;

update person_name SET given_name = '****' , middle_name = '****', family_name = '****'
-- where given_name != '****';

select * from person_name order by person_id ;
