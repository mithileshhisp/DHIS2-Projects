
begin;

-- 1) datavalue
delete from datavalue where sourceid in ( select organisationunitid from organisationunit where uid in ('W9DjTilUGdR','cXvUN1Ms90m','T3YOT4fMCQT','NFnOUxlgg8h') );
-- 2) datavalueaudit
delete from datavalueaudit where organisationunitid in ( select organisationunitid from organisationunit where uid in ('W9DjTilUGdR','cXvUN1Ms90m','T3YOT4fMCQT','NFnOUxlgg8h') );
-- 3) reporttable_organisationunits
delete from reporttable_organisationunits where organisationunitid in ( select organisationunitid from organisationunit where uid in ('W9DjTilUGdR','cXvUN1Ms90m','T3YOT4fMCQT','NFnOUxlgg8h') );
-- 4) userdatavieworgunits
delete from userdatavieworgunits where organisationunitid in ( select organisationunitid from organisationunit where uid in ('W9DjTilUGdR','cXvUN1Ms90m','T3YOT4fMCQT','NFnOUxlgg8h') );
-- 5) usermembership
delete from usermembership where organisationunitid in ( select organisationunitid from organisationunit where uid in ('W9DjTilUGdR','cXvUN1Ms90m','T3YOT4fMCQT','NFnOUxlgg8h') );
-- 6) datasetsource
delete from datasetsource where sourceid in ( select organisationunitid from organisationunit where uid in ('W9DjTilUGdR','cXvUN1Ms90m','T3YOT4fMCQT','NFnOUxlgg8h') );
-- 7) organisationunit
delete from organisationunit where organisationunitid in ( select organisationunitid from organisationunit where uid in ('W9DjTilUGdR','cXvUN1Ms90m','T3YOT4fMCQT','NFnOUxlgg8h') );

end;