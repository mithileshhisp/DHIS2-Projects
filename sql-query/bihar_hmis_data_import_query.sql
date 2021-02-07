
begin;



update datavalue set created = now()::timestamp where created ='2019-01-04';
update datavalue set lastupdated = now()::timestamp where lastupdated ='2019-01-04';

end;