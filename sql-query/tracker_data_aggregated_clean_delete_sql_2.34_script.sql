begin;

-- delete aggregated data
-- 1) delete datavalueaudit
    
	delete from datavalueaudit;

-- 2) delete datavalue
    
	delete from datavalue;

-- 3) delete completedatasetregistration
    
	delete from completedatasetregistration;

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
	
-- 7) programmessage

	delete from programmessage_phonenumbers;
	delete from programmessage_emailaddresses;
	delete from programmessage_deliverychannels;
	delete from programmessage;
	
-- 8) programstageinstance 
	delete from programstageinstance;
	

-- 9) programstageinstance 
	delete from programinstancecomments;

-- 10) programinstance 

	  delete from programinstanceaudit;	
      delete from programinstance;

-- 11) programownershiphistory
     delete from programownershiphistory;	 
	 
-- 12) trackedentityprogramowner
     delete from trackedentityprogramowner;	  
	  
-- 13) trackedentityinstance
     delete from trackedentityinstance;	 
	 
end;