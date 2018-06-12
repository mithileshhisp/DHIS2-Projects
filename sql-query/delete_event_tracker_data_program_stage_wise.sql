-- 1) trackedentitydatavalue
  delete from trackedentitydatavalue where programstageinstanceid in 
  	( select programstageinstanceid from programstageinstance where programstageid = 910 );

-- 2) trackedentitydatavalueaudit 
   delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid = 910 );

-- 3) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(select programstageinstanceid from programstageinstance where programstageid = 910);

-- 4) programstageinstance 
	delete from programstageinstance where programstageid = 910;
