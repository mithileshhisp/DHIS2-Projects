begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit;
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue;

-- 3) relationship
	delete from relationship;
-- 4) trackedentitydatavalue

	delete from trackedentitydatavalue;

-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit;

-- 6) programstageinstancecomments

	delete from programstageinstancecomments;

-- 7) programstageinstance 
	delete from programstageinstance;
	
-- 8) programstageinstance 
	delete from programinstancecomments;


-- 9) programinstance 
      delete from programinstance;

-- 10) trackedentityinstance 
     delete from trackedentityaudit;	 

-- 11) trackedentityinstance 
     delete from trackedentityinstance;	 
	 
end;