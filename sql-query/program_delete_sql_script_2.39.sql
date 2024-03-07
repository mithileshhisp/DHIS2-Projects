begin;
-- delete program
-- 1) program_organisationunits

	delete from program_organisationunits	where programid = 239672;

-- 2) periodboundary

	delete from periodboundary where programindicatorid in (
	select programindicatorid from programindicator where programid = 239672);

-- 3) programindicator

	delete from programindicator where programid = 239672;
	
-- 5) programruleaction 

	delete from programruleaction where programruleid in (
	select programruleid from programrule where programid = 239672);

-- 6) programrule

	delete from programrule where programid = 239672;

-- 7) programrulevariable 

	delete from programrulevariable where programid = 239672;
	
-- 8) programstagesection_dataelements 

	delete from programstagesection_dataelements where programstagesectionid
	in ( select programstagesectionid from programstagesection where programstageid in (
	select programstageid from programstage where programid = 239672));

-- 9) programstagesection 

      delete from programstagesection where programstageid in (
	  select programstageid from programstage where programid = 239672);

-- 10) programstagedataelement
 
	delete from programstagedataelement where programstageid in (
	select programstageid from programstage where programid = 239672);
	
-- 11) programstage
 
	delete from programstage where programid = 239672;

-- 12) program_attributes
 
	delete from program_attributes where programid = 239672;
	
-- 13) trackedentityprogramowner
 
	delete from trackedentityprogramowner where programid = 239672;

-- 14) program
 
	delete from program where programid = 239672;	
	
end;