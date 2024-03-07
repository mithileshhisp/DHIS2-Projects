begin;

-- 1) 
alter table program_attributes 
alter column programattributeid  DROP NOT NULL;

-- 2) 
alter table program_attributes DROP constraint
fk_program_attributeid;

-- 3) 
alter table program_attributes DROP constraint
program_attributes_pkey CASCADE;

-- 4) 
alter table program_attributes add constraint
program_attributes_pkey primary key(programtrackedentityattributeid);

-- 5) 
ALTER TABLE program_attributes
ADD CONSTRAINT fk_program_attributeid
FOREIGN KEY (trackedentityattributeid) 
REFERENCES trackedentityattribute (trackedentityattributeid);

-- 6) 
ALTER TABLE programtrackedentityattributegroupmembers
ADD CONSTRAINT fk_programtrackedentityattributegroupmembers_attributeid
FOREIGN KEY (programtrackedentityattributeid) 
REFERENCES program_attributes (programtrackedentityattributeid);
	
	
end;