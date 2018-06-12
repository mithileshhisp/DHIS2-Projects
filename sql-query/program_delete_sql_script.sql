begin;
-- delete tracker data 
-- 1) program_attributes

	delete from program_attributes where programid = 12707;
   
-- 2) program_organisationunits

	delete from program_organisationunits where programid = 12707; 

-- 3) programstagedataelement
	
	delete from programstagedataelement where programstageid in ( select programstageid from programstage where programid = 12707 );
	
-- 4) programstagesection_dataelements	
	delete from programstagesection_dataelements where programstagesectionid in ( select programstagesectionid from programstagesection where programstageid in ( select programstageid from programstage where programid = 12707) );
	
-- 5) programstagesection
	delete from programstagesection where programstageid in ( select programstageid from programstage where programid = 12707 );
	
-- 6) programstage
	delete from programstage where programid = 12707;
	
-- 7) programstage
	delete from program where programid = 12707;
end;