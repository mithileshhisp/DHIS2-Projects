
begin;

delete from datavalueaudit where dataelementid in (
select dataelementid from dataelement where uid in 
('G80X0h6rkDf','f6mmviBHBto','EUSvjlhesUU'));

delete from datavalue where dataelementid in (
select dataelementid from dataelement where uid in 
('G80X0h6rkDf','f6mmviBHBto','EUSvjlhesUU'));

delete from datasetoperands where dataelementoperandid in (
select dataelementoperandid from dataelementoperand where dataelementid in (
select dataelementid from dataelement where uid in 
('G80X0h6rkDf','f6mmviBHBto','EUSvjlhesUU')));

delete from dataelementoperand where dataelementid in (
select dataelementid from dataelement where uid in 
('G80X0h6rkDf','f6mmviBHBto','EUSvjlhesUU'));

delete from datasetelement where dataelementid in (
select dataelementid from dataelement where uid in 
('G80X0h6rkDf','f6mmviBHBto','EUSvjlhesUU'));

delete from dataelement 
where uid in ('G80X0h6rkDf','f6mmviBHBto','EUSvjlhesUU');

end;


