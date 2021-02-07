begin;
-- delete programstage
-- 1) programstagetranslations

	delete from programstagetranslations where programstageid in ( 196618,155147,153142 );
   
-- 2) programstagesectiontranslations

	delete from programstagesectiontranslations where programstagesectionid in ( 
	select programstagesectionid from programstagesection where programstageid in ( 196618,155147,153142 ) );
		
	
-- 3) programstagesection_dataelements
	
	delete from programstagesection_dataelements where programstagesectionid in ( 
	select programstagesectionid from programstagesection where programstageid in ( 196618,155147,153142 ) );
	
	
-- 4) programruleaction
	delete from programruleaction where programstagesectionid in ( 
	select programstagesectionid from programstagesection where programstageid in ( 196618,155147,153142 ) );
	
-- 5) programstagesection
	delete from programstagesection where programstageid in ( 196618,155147,153142 );
	
-- 6) programstagedataelement
	delete from programstagedataelement where programstageid in ( 196618,155147,153142 );
	
-- 7) trackedentitydatavalueaudit	
	delete from trackedentitydatavalueaudit where programstageinstanceid in ( 
	select programstageinstanceid from programstageinstance where programstageid in ( 196618,155147,153142 ) );

-- 8) trackedentitydatavalue
	delete from trackedentitydatavalue where programstageinstanceid in ( 
	select programstageinstanceid from programstageinstance where programstageid in ( 196618,155147,153142 ) );
 
-- 9) programstageinstance
	delete from programstageinstance where programstageid in ( 196618,155147,153142 );
 
-- 10) programstage
	delete from programstage where programstageid in ( 196618,155147,153142 );
end;