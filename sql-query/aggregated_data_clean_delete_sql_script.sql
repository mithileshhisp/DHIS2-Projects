begin;
-- delete aggregated data 
-- 1) datavalueaudit

	delete from datavalueaudit;
-- 2) completedatasetregistration

	delete from completedatasetregistration;

-- 3) datavalue
	delete from datavalue;
end;