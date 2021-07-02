
begin;

delete from categories_categoryoptions where categoryoptionid in ( 4619078,4619079 );
delete from categoryoptioncombos_categoryoptions where categoryoptionid in ( 4619078,4619079 );
delete from dataelementcategoryoption where categoryoptionid in ( 4619078,4619079 );

end;