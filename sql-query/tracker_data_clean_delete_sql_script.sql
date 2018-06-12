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
-- 6) programstageinstancemembers
 
	delete from programstageinstancemembers;
	
-- 7) programstageinstancecomments

	delete from programstageinstancecomments;

-- 8) programstageinstance 
	delete from programstageinstance;
	
-- 9) programstageinstance 
	delete from programinstancecomments;


-- 10) programinstance 
      delete from programinstance;

-- 11) trackedentityinstance 
     delete from trackedentityinstance;

end;