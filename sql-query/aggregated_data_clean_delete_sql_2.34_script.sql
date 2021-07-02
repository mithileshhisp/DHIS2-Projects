begin;
-- delete aggregated data 
-- 1) datavalueaudit

	delete from datavalueaudit;
-- 2) datavalue

	delete from datavalue;

-- 3) completedatasetregistration

	delete from completedatasetregistration;
	
end;