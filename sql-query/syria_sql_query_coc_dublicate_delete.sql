SELECT categoryoptioncomboid, uid, code, created, lastupdated, lastupdatedby, name, ignoreapproval, translations, attributevalues
	FROM public.categoryoptioncombo;
	
select * from _dataelementcategoryoptioncombo where categoryoptioncomboid in ( 1864547,1866288,1866283 );	
select * from categoryoptioncombo where name = 'VC - Sarmada 5, EP-0347, mobile' order by name;	

select * from datavalue where attributeoptioncomboid in ( 1864543,1866284,1866279);

select * from datavalue where attributeoptioncomboid in ( 1864547,1866288,1866283 );



delete from categoryoptioncombo where categoryoptioncomboid in ( 1866284,1866279 ); 
delete from categorycombos_optioncombos where categoryoptioncomboid in ( 1866284,1866279 ); 
delete from categoryoptioncombos_categoryoptions where categoryoptioncomboid in ( 1866284,1866279 ); 




select * from categoryoptioncombos_categoryoptions;
select * from categorycombo;


select categoryoptioncomboname, count(categoryoptioncomboname) from _categoryoptioncomboname
group by categoryoptioncomboname having count(categoryoptioncomboname) > 1;


select name, count(name) from categoryoptioncombo
group by name having count(name) > 1;
	
	
select * from categoryoptioncombo where uid = 'f9XOmWpcbw8';	

select * from datavalue where attributeoptioncomboid in (
select categoryoptioncomboid from categoryoptioncombo where name in ( 'H - Al Iman',
'H - Ar-Raee',
'H - Balyun',
'H - Harim',
'VC - Abi-Zar, EP-0221',
'VC - Abi-Zar, EP-0221, fixed',
'VC - Abi-Zar, EP-0221, mobile',
'VC - Abi-Zar, EP-0222');

