/**
 * Created by hisp on 2/12/15.
 */
msfReportsApp.directive('calendar', function () {
    return {
        require: 'ngModel',
        link: function (scope, el, attr, ngModel) {
            $(el).datepicker({
                dateFormat: 'yy-mm-dd',
                onSelect: function (dateText) {
                    scope.$apply(function () {
                        ngModel.$setViewValue(dateText);
                    });
                }
            });
        }
    };
});
msfReportsApp
    .controller('TodayScheduleController', function ($rootScope,
        $scope,
        $timeout,
        MetadataService) {


        //PSI
        //const SQLVIEW_TEI_PS =  "FcXYoEGIQIR";
        // const SQLVIEW_TEI_ATTR = "WMIMrJEYUxl";
        var def = $.Deferred();
        //MSF
        const SQLVIEW_TEI_PS = "Ysi6iyNK1Ha";
        const SQLVIEW_TEI_ATTR = "GoPX942y3eV";

        $timeout(function () {
            $scope.date = {};
            $scope.date.startDate = new Date();
            $scope.date.endDate = new Date();
        }, 0);

        //initially load tree
        selection.load();

        getAllPrograms();

        // Listen for OU changes
        selection.setListenerFunction(function () {
            $scope.selectedOrgUnitUid = selection.getSelected();

            if ($scope.selectedOrgUnitUid == "wnDm6jbp27v")
                alert("Please select the Level below 1")
            else
                loadPrograms();
        }, false);

        loadPrograms = function () {
            MetadataService.getOrgUnit($scope.selectedOrgUnitUid).then(function (orgUnit) {
                $timeout(function () {
                    $scope.selectedOrgUnit = orgUnit;
                });
            });
        }
        function getAllPrograms() {
            MetadataService.getAllPrograms().then(function (prog) {
                $scope.allPrograms = prog.programs;
                $scope.programs = [];
                for (var i = 0; i < prog.programs.length; i++) {
                    if (prog.programs[i].withoutRegistration == false) {
                        $scope.programs.push(prog.programs[i]);
                    }
                }
            });
        }

        $scope.updateStartDate = function (startdate) {
            $scope.startdateSelected = startdate;
            //  alert("$scope.startdateSelected---"+$scope.startdateSelected);
        };

        $scope.updateEndDate = function (enddate) {
            $scope.enddateSelected = enddate;
            //  alert("$scope.enddateSelected---"+ $scope.enddateSelected);
        };

        $scope.fnExcelReport = function () {

            var blob = new Blob([document.getElementById('divId').innerHTML], {
                type: 'text/plain;charset=utf-8'
            });
            saveAs(blob, "Report.xls");

        };

        $scope.exportData = function (program) {
            //   exportData($scope.date.startDate,$scope.date.endDate,program,$scope.selectedOrgUnit);
            exportData($scope.startdateSelected, $scope.enddateSelected, program, $scope.selectedOrgUnit);

        }

        $scope.generateReport = function (prog) {
            $('#loader').attr('style', 'display:block !important');
            //document.getElementById("loader").style.display="block";
            // document.getElementById("loader-wrapper").style.display="block";
            $timeout(function () { $scope.createReport(prog) }, 2000);
        }

        // $scope.progval=[]
        $scope.createReport = function (program) {
            // $scope.progval.push(prog)

            $scope.program = program;

            for (var i = 0; i < $scope.program.programTrackedEntityAttributes.length; i++) {
                var str = $scope.program.programTrackedEntityAttributes[i].displayName;
                var n = str.lastIndexOf('-');
                $scope.program.programTrackedEntityAttributes[i].displayName = str.substring(n + 1);

            }
            $scope.psDEs = [];
            $scope.Options = [];
            $scope.attribute = "Attributes";
            $scope.enrollment = ["Enrollment date", "Enrolling orgUnit"];
            var options = [];

            var index = 0;
            for (var i = 0; i < $scope.program.programStages.length; i++) {

                var psuid = $scope.program.programStages[i].id;
                $scope.psDEs.push({ dataElement: { id: "orgUnit", name: "orgUnit", ps: psuid } });
                $scope.psDEs.push({ dataElement: { id: "eventDate", name: "eventDate", ps: psuid } });

                for (var j = 0; j < $scope.program.programStages[i].programStageDataElements.length; j++) {

                    $scope.program.programStages[i].programStageDataElements[j].dataElement.ps = psuid;
                    var de = $scope.program.programStages[i].programStageDataElements[j];
                    $scope.psDEs.push(de);

                    if ($scope.program.programStages[i].programStageDataElements[j].dataElement.optionSet != undefined) {
                        if ($scope.program.programStages[i].programStageDataElements[j].dataElement.optionSet.options != undefined) {

                            for (var k = 0; k < $scope.program.programStages[i].programStageDataElements[j].dataElement.optionSet.options.length; k++) {
                                index = index + 1; // $scope.Options.push($scope.program.programStages[i].programStageDataElements[j]);
                                var code = $scope.program.programStages[i].programStageDataElements[j].dataElement.optionSet.options[k].code;
                                var name = $scope.program.programStages[i].programStageDataElements[j].dataElement.optionSet.options[k].displayName;

                                options.push({ code: code, name: name });
                                $scope.Options[$scope.program.programStages[i].programStageDataElements[j].dataElement.optionSet.options[k].code + "_index"] = $scope.program.programStages[i].programStageDataElements[j].dataElement.optionSet.options[k].displayName;
                            }
                        }
                    }
                }


            }


            //  var param = "var=program:"+program.id + "&var=orgunit:"+$scope.selectedOrgUnit.id+"&var=startdate:"+moment($scope.date.startDate).format("YYYY-MM-DD")+"&var=enddate:"+moment($scope.date.endDate).format("YYYY-MM-DD");
            var param = "var=program:" + program.id + "&var=orgunit:" + $scope.selectedOrgUnit.id + "&var=startdate:" + $scope.startdateSelected + "&var=enddate:" + $scope.enddateSelected + "&paging=false";

            MetadataService.getSQLView(SQLViewsName2IdMap[SQLQUERY_TEI_DATA_VALUE_NAME], param).then(function (stageData) {
                var changedRow = [];
                var index = -1;
                stageData.listGrid.rows.forEach(row => {
                    let values = JSON.parse(row["7"]["value"]);
                    if (Object.keys(values).length) {

                        row.pop();
                        let enrolldate = row.pop();
                        let name = row.pop();
                        for (key in values) {
                            index++;
                            changedRow[index] = [];
                            changedRow[index].push(...row);
                            changedRow[index].push(key);
                            changedRow[index].push("");
                            changedRow[index].push(values[key]["value"]);
                            changedRow[index].push(name);
                            changedRow[index].push(enrolldate);
                        }
                    }
                })
                stageData.listGrid.rows = changedRow
                $scope.stageData = stageData.listGrid;
                
                MetadataService.getSQLView(SQLViewsName2IdMap[SQLQUERY_TEI_ATTR_NAME], param).then(function (attrData) {
                    $scope.attrData = attrData.listGrid;

                    MetadataService.getSQLView(SQLViewsName2IdMap["OptionValue"], " ").then(function (optionsetValue) {
                        $scope.optionsetValue = optionsetValue.listGrid.rows;
                        MetadataService.getALLAttributes().then(function (allattr) {
                            $scope.allattr = allattr;
                            getwithoutEnroll($scope.stageData, $scope.attrData, $scope.allattr, $scope.optionsetValue,program);
                        })
                    })
                })
            })
            
        }
        function getwithoutEnroll(stageData, attrData, allattr, optionsetValue,program) {
            $scope.optionsetValue = []
            optionsetValue.forEach(element => {
                $scope.optionsetValue[element[2] + "-" + element[1]] = element[0];
            });

            var teiWiseAttrMap = [];
            $scope.attrMap = [];
            $scope.teiList = [];
            $scope.eventList = [];
            $scope.maxEventPerTei = [];

            $scope.teiEnrollOrgMap = [];
            $scope.teiEnrollMap = [];

            var teiPsMap = [];
            var teiPsEventMap = [];
            var teiPsEventDeMap = [];
            var teiEventMap = [];
            var metaAttrArr = [];

            // For attribute
            const index_tei = 0;
            const index_attruid = 2;
            const index_attrvalue = 3;
            // const index_attrname = 4;
            const index_ouname = 4;
            const index_enrollmentDate = 6;

            // For Data values
            const index_deuid = 5;
            const index_devalue = 7;
            const index_ps = 1;
            const index_ev = 3;
            const index_evDate = 4;
            const index_ou = 8;

            var allteiuid = []


            for (var i = 0; i < attrData.height; i++) {

                var teiuid = attrData.rows[i][index_tei];

                var attruid = attrData.rows[i][index_attruid];
                var attrvalue = attrData.rows[i][index_attrvalue];
                var ouname = attrData.rows[0][index_ouname];
                var enrollDate = attrData.rows[i][index_enrollmentDate]; // enrollment date
                enrollDate = enrollDate.substring(0, 10);
                var ounamenew = attrData.rows[i][index_ouname];

                // if (allattr.length > 0) {
                for (var m = 0; m < allattr.trackedEntityAttributes.length; m++) {

                    if (attruid == allattr.trackedEntityAttributes[m].id) {

                        // if (allattr.trackedEntityAttributes.length > 0) {
                        for (var k = 0; k < allattr.trackedEntityAttributes[m].attributeValues.length; k++) {
                            if (allattr.trackedEntityAttributes[m].attributeValues[k].attribute.code == 'Anonymous?' && allattr.trackedEntityAttributes[m].attributeValues[k].value == 'true') {
                                attrvalue = 'PRIVATE';
                            }
                            // }
                        }
                    }
                }
                if (attrvalue == "true") {
                    attrvalue = "Yes";
                }
                else if (attrvalue == "false") {
                    attrvalue = "No";
                }
                if (teiWiseAttrMap[teiuid] == undefined) {
                    teiWiseAttrMap[teiuid] = [];
                }
                teiWiseAttrMap[teiuid].push(attrData.rows[i]);
                // $scope.attrMap[teiuid+"-"+attruid] = ouname;
                $scope.attrMap[teiuid + "-" + attruid] = attrvalue;


                $scope.teiEnrollOrgMap[teiuid + "-ouname"] = ounamenew;
                $scope.teiEnrollMap[teiuid + "-enrollDate"] = enrollDate;


                allteiuid.push(teiuid)
                for (m in $scope.optionsetValue) {

                    if (attrvalue + '_index' == m) {

                        $scope.attrMap[teiuid + "-" + attruid] = $scope.optionsetValue[m];

                    }

                }

            }
            for (var attkey in $scope.attrMap) {
                var attrkey = attkey.split('-')
                for (var opskey in $scope.optionsetValue) {
                    var optionSetKey = opskey.split('-')

                    if (attrkey[1] == optionSetKey[0]) {
                        {
                            console.log(optionSetKey[1] + "----" + $scope.attrMap[attkey])
                            if (optionSetKey[1] == $scope.attrMap[attkey])
                                $scope.attrMap[attkey] = $scope.optionsetValue[opskey]
                        }
                    }

                }
            }



            $scope.allteiuid = allteiuid.filter(function (elem, index, self) {
                return index === self.indexOf(elem);
            })
            for (key in teiWiseAttrMap) {
                $scope.teiList.push({ teiuid: key });
                //    $scope.attrMap =$scope.attrMap;
            }

            $timeout(function () {
                $scope.teiList = $scope.teiList;
            })
            $scope.teis = prepareListFromMap(teiWiseAttrMap);

            var teiPerPsEventListMap = [];
            var teiToEventListMap = [];
            var eventToMiscMap = [];
            eventToMiscMap["dummy"] = { ou: "", evDate: "" };
            var teiList = [];



            for (var i = 0; i < stageData.rows.length; i++) {
                var teiuid = stageData.rows[i][index_tei];
                var psuid = stageData.rows[i][index_ps];
                var evuid = stageData.rows[i][index_ev];
                var evDate = stageData.rows[i][index_evDate];
                evDate = evDate.substring(0, 10);
                var deuid = stageData.rows[i][index_deuid];
                var devalue = stageData.rows[i][index_devalue];
                var ou = stageData.rows[i][index_ou];

                if (!teiList[teiuid]) {
                    teiList[teiuid] = true;
                }
                if (!teiPerPsEventListMap[teiuid]) {
                    teiPerPsEventListMap[teiuid] = [];
                    teiPerPsEventListMap[teiuid].max = 0;
                }

                if (!teiPerPsEventListMap[teiuid][psuid]) {
                    teiPerPsEventListMap[teiuid][psuid] = [];

                }

                if (!teiToEventListMap[evuid]) {
                    teiToEventListMap[evuid] = true;
                    teiPerPsEventListMap[teiuid][psuid].push(evuid);
                    if (teiPerPsEventListMap[teiuid][psuid].length > teiPerPsEventListMap[teiuid].max) {
                        teiPerPsEventListMap[teiuid].max = teiPerPsEventListMap[teiuid][psuid].length;
                    }
                }

                if (!teiPsEventMap[teiuid + "-" + psuid + "-" + evuid]) {
                    teiPsEventMap[teiuid + "-" + psuid + "-" + evuid] = [];
                }

                eventToMiscMap[evuid] = { ou: ou, evDate: evDate };
                teiPsEventDeMap[teiuid + "-" + evuid + "-" + deuid] = devalue;
            }
            $scope.TheRows = [];
            var psDes = $scope.psDEs;





            for (var i = 0; i < $scope.allteiuid.length; i++) {
                var returnval = checkteival(teiList, $scope.allteiuid[i])
                if (returnval == true)
                    $scope.allteiuid.splice(i, 1);

            }

            $scope.emptyval = [];
            evuid = "dummy";
            if(eventToMiscMap[evuid].evDate == ""){
            for (key in teiList) {
                var teiuid = key;
                $scope.eventList[teiuid] = [];

                var maxEventCount = teiPerPsEventListMap[teiuid].max;

                if (maxEventCount == 0) { debugger }
                for (var y = 0; y < maxEventCount; y++) {

                    $scope.TheRows = [];
                    for (var x = 0; x < psDes.length; x++) {
                        var psuid = psDes[x].dataElement.ps;
                        var deuid = psDes[x].dataElement.id;
                        var evuid = undefined;
                        if (teiPerPsEventListMap[teiuid][psuid]) {
                            evuid = teiPerPsEventListMap[teiuid][psuid][y];
                        }
                        if (!evuid) {
                            evuid = "dummy";
                        }
                        var val = teiPsEventDeMap[teiuid + "-" + evuid + "-" + deuid];
                        if (deuid == "orgUnit") {
                            val = eventToMiscMap[evuid].ou;//debugger
                        } else if (deuid == "eventDate") {
                            val = eventToMiscMap[evuid].evDate;//debugger
                        }
                        if ($scope.psDEs[x].dataElement.optionSet != undefined) {

                            if ($scope.psDEs[x].dataElement.optionSet.options != undefined) {

                                val = $scope.Options[val + '_index'];
                                if (!val)
                                    val = "";
                                //  dataValues.push(value);

                            }
                        }
                        $scope.TheRows.push(val ? val : "");
                    }
                    for (var i = 0; i < $scope.TheRows.length; i++) {

                        if ($scope.TheRows[i] == "true") {
                            $scope.TheRows[i] = "Yes";
                        }
                        if ($scope.TheRows[i] == "false") {
                            $scope.TheRows[i] = "No";
                        }


                    }
                    $scope.eventList[teiuid].push($scope.TheRows);
                }
            }
        }
            for (var i = 0; i < $scope.TheRows.length; i++)
                $scope.emptyval.push("");
            $('#divIdmmm').attr('style', 'display:block !important');

            $scope.teiPerPsEventListMap = teiPerPsEventListMap;
            $scope.teiListnew = Object.keys(teiList);
            $scope.teiList = $scope.allteiuid;

            $scope.teiList = $scope.teiList.filter(val => !$scope.teiListnew.includes(val));
            
            
            var param = "var=program:" + program.id + "&var=orgunit:" + $scope.selectedOrgUnit.id + "&var=startdate:" + $scope.startdateSelected + "&var=enddate:" + $scope.enddateSelected + "&paging=false";
            MetadataService.getSQLView(SQLViewsName2IdMap[SQLQUERY_TEI_DATA_VALUE_NAME], param).then(function (stageData) {
                var changedRow = [];
                var index = -1;
                stageData.listGrid.rows.forEach(row => {
                    let values = JSON.parse(row["7"]["value"]);
                    if (Object.keys(values).length) {

                        row.pop();
                        let enrolldate = row.pop();
                        let name = row.pop();
                        for (key in values) {
                            index++;
                            changedRow[index] = [];
                            changedRow[index].push(...row);
                            changedRow[index].push(key);
                            changedRow[index].push("");
                            changedRow[index].push(values[key]["value"]);
                            changedRow[index].push(name);
                            changedRow[index].push(enrolldate);
                        }
                    }
                })
                stageData.listGrid.rows = changedRow
                $scope.stageData = stageData.listGrid;

                MetadataService.getSQLView(SQLViewsName2IdMap["TRACKER_REPORTS_TEI_ATTR_ENROLLED"], param).then(function (attrData) {
                    $scope.attrData =  attrData.listGrid;;
                    MetadataService.getALLAttributes().then(function (allattr) {
                        $scope.allattr = allattr;
                        getWithEnroll($scope.stageData, $scope.attrData, $scope.allattr);
                    })
                })
            })

        }

        function getWithEnroll(stageData, attrData, allattr) {

            var teiWiseAttrMap = [];
            $scope.attrMap1 = [];
            $scope.teiList1 = [];
            $scope.eventList1 = [];
            $scope.maxEventPerTei = [];

            $scope.teiEnrollOrgMap = [];
            $scope.teiEnrollMap = [];

            var teiPsMap = [];
            var teiPsEventMap = [];
            var teiPsEventDeMap = [];
            var teiEventMap = [];
            var metaAttrArr = [];

            // For attribute
            const index_tei = 0;
            const index_attruid = 2;
            const index_attrvalue = 3;
            // const index_attrname = 4;
            const index_ouname = 4;
            const index_enrollmentDate = 6;

            // For Data values
            const index_deuid = 5;
            const index_devalue = 7;
            const index_ps = 1;
            const index_ev = 3;
            const index_evDate = 4;
            const index_ou = 8;

            var allteiuid = []


            for (var i = 0; i < attrData.height; i++) {

                var teiuid = attrData.rows[i][index_tei];

                var attruid = attrData.rows[i][index_attruid];
                var attrvalue = attrData.rows[i][index_attrvalue];
                var ouname = attrData.rows[0][index_ouname];
                var enrollDate = attrData.rows[i][index_enrollmentDate]; // enrollment date
                enrollDate = enrollDate.substring(0, 10);
                var ounamenew = attrData.rows[i][index_ouname];

                // if (allattr.length > 0) {
                for (var m = 0; m < allattr.trackedEntityAttributes.length; m++) {

                    if (attruid == allattr.trackedEntityAttributes[m].id) {

                        // if (allattr.trackedEntityAttributes.length > 0) {
                        for (var k = 0; k < allattr.trackedEntityAttributes[m].attributeValues.length; k++) {
                            if (allattr.trackedEntityAttributes[m].attributeValues[k].attribute.code == 'Anonymous?' && allattr.trackedEntityAttributes[m].attributeValues[k].value == 'true') {
                                attrvalue = 'PRIVATE';
                            }
                            // }
                        }
                    }
                }

                if (teiWiseAttrMap[teiuid] == undefined) {
                    teiWiseAttrMap[teiuid] = [];
                }
                teiWiseAttrMap[teiuid].push(attrData.rows[i]);
                // $scope.attrMap[teiuid+"-"+attruid] = ouname;
                $scope.attrMap1[teiuid + "-" + attruid] = attrvalue;


                $scope.teiEnrollOrgMap[teiuid + "-ouname"] = ounamenew;
                $scope.teiEnrollMap[teiuid + "-enrollDate"] = enrollDate;


                allteiuid.push(teiuid)
                for (m in $scope.Options) {

                    if (attrvalue + '_index' == m) {

                        $scope.attrMap1[teiuid + "-" + attruid] = $scope.Options[m];

                    }

                }

            }


            $scope.allteiuid = allteiuid.filter(function (elem, index, self) {
                return index === self.indexOf(elem);
            })
            for (key in teiWiseAttrMap) {
                $scope.teiList1.push({ teiuid: key });
                //    $scope.attrMap =$scope.attrMap;
            }

            $timeout(function () {
                $scope.teiList1 = $scope.teiList1;
            })
            $scope.teis = prepareListFromMap(teiWiseAttrMap);

            var teiPerPsEventListMap = [];
            var teiToEventListMap = [];
            var eventToMiscMap = [];
            eventToMiscMap["dummy"] = { ou: "", evDate: "" };
            var teiList1 = [];




            $scope.TheRows = [];
            var psDes = $scope.psDEs;





            for (var i = 0; i < $scope.allteiuid.length; i++) {
                var returnval = checkteival(teiList1, $scope.allteiuid[i])
                if (returnval == true)
                    $scope.allteiuid.splice(i, 1);

            }

            $scope.emptyval = [];

            for (key in teiList1) {
                var teiuid = key;
                $scope.eventList1[teiuid] = [];

                var maxEventCount = teiPerPsEventListMap[teiuid].max;

                if (maxEventCount == 0) { debugger }
                for (var y = 0; y < maxEventCount; y++) {

                    $scope.TheRows = [];
                    for (var x = 0; x < psDes.length; x++) {
                        var psuid = psDes[x].dataElement.ps;
                        var deuid = psDes[x].dataElement.id;
                        var evuid = undefined;
                        if (teiPerPsEventListMap[teiuid][psuid]) {
                            evuid = teiPerPsEventListMap[teiuid][psuid][y];
                        }
                        if (!evuid) {
                            evuid = "dummy";
                        }
                        var val = teiPsEventDeMap[teiuid + "-" + evuid + "-" + deuid];
                        if (deuid == "orgUnit") {
                            val = eventToMiscMap[evuid].ou;//debugger
                        } else if (deuid == "eventDate") {
                            val = eventToMiscMap[evuid].evDate;//debugger
                        }
                        /* if($scope.psDEs[x].dataElement.optionSet != undefined){

                             if($scope.psDEs[x].dataElement.optionSet.options != undefined){

                                 val = $scope.Options[val+'_index'];
                                 if (!val)
                                     val="";
                                 //  dataValues.push(value);

                             }
                         }*/
                        $scope.TheRows.push(val ? val : "");
                    }
                    $scope.eventList1[teiuid].push($scope.TheRows);
                }
            }
            for (var i = 0; i < $scope.TheRows.length; i++)
                $scope.emptyval.push("");
            $('#divIdmmm').attr('style', 'display:block !important');

            $scope.teiPerPsEventListMap = teiPerPsEventListMap;
            $scope.teiListnew1 = Object.keys(teiList1);
            $scope.teiList1 = $scope.allteiuid;

            $scope.teiList1 = $scope.teiList1.filter(val => !$scope.teiListnew1.includes(val));
            document.getElementById("loader").style.display = "none";

        }

        checkteival = function (teiList1, allteiuid) {
            var value = teiList1[allteiuid]

            return value;
        }

    });

