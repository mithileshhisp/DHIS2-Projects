
begin;

delete from datavalue;
delete from datavalueaudit;
delete from completedatasetregistration;

delete from dataelementgroupsetdimension_items;
delete from visualization_dataelementgroupsetdimensions;
delete from visualization_dataelementgroupsetdimensions;
delete from dataelementgroupsetmembers;
delete from dataelementgroupsetdimension;
delete from dataelementgroupset;

delete from dataelementgroupmembers where dataelementgroupid in (221067,
221152,221069,221153,520427,215560,220891,221196,21736745,21736744,243829);

delete from dataelementgroup where dataelementgroupid in (221067,
221152,221069,221153,520427,215560,220891,221196,21736745,21736744,243829);
 -- dataset
 
delete from datasetelement where datasetid in( 215631,
234702,235834,235928,235920,234585,520434,520431,235351,235136,336202,
235911,235193,234766,234801,234537,215737);
 
delete from datasetsource where datasetid in( 215631,
234702,235834,235928,235920,234585,520434,520431,235351,235136,336202,
235911,235193,234766,234801,234537,215737);

delete from completedatasetregistration where datasetid in( 215631,
234702,235834,235928,235920,234585,520434,520431,235351,235136,336202,
235911,235193,234766,234801,234537,215737);

delete from datasetindicators where datasetid in( 215631,
234702,235834,235928,235920,234585,520434,520431,235351,235136,336202,
235911,235193,234766,234801,234537,215737);

delete from sectiondataelements where sectionid in (
select sectionid from section where datasetid in( 215631,
234702,235834,235928,235920,234585,520434,520431,235351,235136,336202,
235911,235193,234766,234801,234537,215737));

delete from section where datasetid in( 215631,
234702,235834,235928,235920,234585,520434,520431,235351,235136,336202,
235911,235193,234766,234801,234537,215737);

delete from dataset where datasetid in( 215631,
234702,235834,235928,235920,234585,520434,520431,235351,235136,336202,
235911,235193,234766,234801,234537,215737);

--dashboard
delete from dashboard_items;
delete from dashboarduseraccesses;
delete from dashboard;
delete from dashboarditem;

delete from eventreport_columns;
delete from eventreport_dataelementdimensions;
delete from eventreport_organisationunits;
delete from eventreport_rows;
delete from eventreport;

-- not required
delete from reporttable_columns;
delete from reporttable_organisationunits;
delete from reporttable_rows;
delete from reporttable;
delete from reporttable_periods;
delete from reporttable_orgunitlevels;
delete from reporttable_orgunitgroupsetdimensions;
delete from reporttable_organisationunits;
delete from reporttable_itemorgunitgroups;
delete from reporttable_filters;
delete from reporttable_dataelementgroupsetdimensions;
delete from reporttable_datadimensionitems;
delete from reporttable_columns;
delete from reporttable_categoryoptiongroupsetdimensions;
delete from reporttable_categorydimensions;

-- visualization / pivote
delete from visualization_columns;
delete from visualization_filters;
delete from visualization_organisationunits;
delete from visualization_datadimensionitems;
delete from visualization_rows;
delete from visualization_periods;
delete from visualization_yearlyseries;
delete from visualization_categorydimensions;
delete from visualization_categoryoptiongroupsetdimensions;
delete from visualization;


delete from datadimensionitem where dataelementid in ();
delete from dataelementattributevalues where dataelementid in ();
delete from dataelement where dataelementid in (
180895,
207334,
207342,
207345,
180844,
207379,
180833,
207307,
180856,
180877,
207366,
207386,
180885,
207313,
180897,
207315,
207310,
207325,
207341,
207371,
207364,
207388,
207387,
207356,
180848,
180847,
207314,
207369,
180858,
207399,
180857,
180903,
207404,
180872,
180908,
180880,
180835,
180917,
180896,
207398,
180818,
207322,
207340,
207378,
180869,
180914,
180888,
180919,
207349,
207351,
207391,
180824,
180913,
207330,
207332,
207389,
207337,
180906,
180874,
207360,
180854,
180816,
180905,
207338,
207326,
180892,
207331,
180820,
207323,
207376,
180841,
180863,
207306,
180852,
180891,
207382,
180829,
207384,
180862,
207343,
180814,
180812,
180832,
180867,
180866,
180875,
180861,
207357,
180834,
207355,
207396,
180855,
207318,
207354,
180843,
207358,
180850,
207397,
207394,
207401,
180883,
180911,
207395,
180901,
180842,
180898,
207335,
180902,
207339,
207336,
207344,
207362,
207365,
207359,
207316,
207400,
207377,
180868,
180918,
207346,
207350,
207403,
180873,
207309,
207374,
180822,
180916,
180823,
180825,
207319,
207390,
180876,
180860,
207392,
207363,
180813,
207385,
207402,
180870,
180815,
180912,
207353,
180894,
180840,
180864,
207308,
207321,
180915,
180871,
180907,
180893,
207370,
207328,
207347,
207329,
207317,
207320,
207312,
180859,
180900,
207393,
180831,
180904,
207381,
180838,
207327,
180849,
180882,
180878,
180846,
180887,
207368,
207373,
180836,
180839,
207375,
207380,
207333,
180851,
180886,
180909,
207305,
207405,
180865,
207361,
180889,
180819,
180910,
180890,
207352,
180884,
207311,
180899,
180828,
180845,
180827,
180881,
207324,
180879,
207383,
207372,
207367,
207408,
207406,
207407,
500875,
500877,
520412,
520416,
520414,
207348,
657133,
657135,
207304,
659605,
659607,
520409,
4466826,
4466827,
180837,
180821,
180826,
336201,
21735825,
21735821,
21735828,
21735822,
21735826,
21735823,
21735824,
21735827);





end;