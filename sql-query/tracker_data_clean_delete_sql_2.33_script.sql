begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit;
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue;

-- 3) relationship

	update  relationshipitem set relationshipid = null;
	delete from relationship;
	delete from relationshipitem;
	
-- 4) trackedentitydatavalue

-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit;

-- 6) programstageinstancecomments

	delete from programstageinstancecomments;

-- 7) programstageinstance 
    delete from programmessage_deliverychannels;
	delete from programmessage_phonenumbers;
	delete from programmessage;
	delete from programstageinstance;
	
-- 8) programstageinstance 
	delete from programinstancecomments;

-- 9) programinstance 

	  delete from programinstanceaudit;	
      delete from programinstance;

-- 10) trackedentityinstance
     delete from trackedentityprogramowner;	 
	 
-- 11) programownershiphistory
     delete from programownershiphistory;	

-- 12) trackedentityinstance
     delete from trackedentityinstance;	 
	 
end;