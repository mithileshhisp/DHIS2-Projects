begin;

Copy(select * from dataelement)TO STDOUT (format CSV, HEADER);

end;