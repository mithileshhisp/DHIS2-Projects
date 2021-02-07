begin;
-- delete tracker data 
-- 1) program_attributes

	delete from program_attributes where programid in (333821,523275);
   
-- 2) program_organisationunits

	delete from program_organisationunits where programid in (333821,523275); 
		
	
-- 3) programstagedataelement
	
	delete from programstagedataelement where programstageid in ( select programstageid from programstage where programid in (333821,523275) );
	
-- 4) programstagesection_dataelements	
	delete from programstagesection_dataelements where programstagesectionid in ( select programstagesectionid from programstagesection where programstageid in ( select programstageid from programstage where programid in (333821,523275) ) );
	
-- 5) programstagesection
	delete from programstagesection where programstageid in ( select programstageid from programstage where programid in (333821,523275) );
	
-- 6) programstage
	delete from programstage where programid in (333821,523275);
	
-- 7) program_userroles	
	delete from program_userroles where programid in (333821,523275);

-- 8) programattributevalues
	delete from programattributevalues where programid in (333821,523275);
 
-- 9) programrule
	delete from programrule where programid in (333821,523275);
 
-- 10) program
	delete from program where programid in (333821,523275);
end;