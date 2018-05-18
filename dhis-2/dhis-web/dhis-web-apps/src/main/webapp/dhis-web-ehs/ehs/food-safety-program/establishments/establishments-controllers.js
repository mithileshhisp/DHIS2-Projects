var trackerCapture = angular.module('trackerCapture');


trackerCapture.controller('EstablishmentsSelectionController',
        function($rootScope,
                 $scope,
                 $modal,
                 $location,
                 $filter,
                 $timeout,
                 $translate,
                 orderByFilter,
                 Paginator,
                 SessionStorageService,
                 MetaDataFactory,
                 DateUtils,
                 OrgUnitFactory,
                 OperatorFactory,
                 ProgramFactory,
                 AttributesFactory,
                 EntityQueryFactory,
                 CurrentSelection,
                 TEIGridService,
                 TEIService,
                 EventReportService,
                 TCStorageService,
                 $q,
                 ProgramAndTEIService,
                 $window,
                 AjaxCalls,
                 OrganisationUnitService) {




            var foodsafetyid=AjaxCalls.getfoodsafetyid();


            // for saint lucia
            $scope.showEstablishmentsRegistration = function(){
                selection.load();
                $location.path('/establishments-registration').search();
            };
            $scope.showOperatorsRegistration = function(){
                selection.load();
                $location.path('/operators-registration').search();
            };

            $scope.showUpdateForm = function( selectedTEI, selectedProgramId ){
                alert(selectedTEI.id + "--" + selectedProgramId);
            };

            OrganisationUnitService.getRootOrganisationUnit().then(function(rootOrganisationUnit){
                $scope.rootOrgUnit = rootOrganisationUnit.organisationUnits[0];
                $scope.selectedCountryName = rootOrganisationUnit.organisationUnits[0].name;
            });


            $scope.trackerAssociateInstancesMap = [];
            $scope.establishmentsProgran = foodsafetyid;
            $scope.operatorsProgram = 'ieLe1vT4Vad';
            //$scope.displayAttribute = 'v9dlF13XghP';
            //$scope.displayAttribute = 'THGyyoT23tr';
            $scope.displayAttribute = 'tyXd890iVJG';
			$scope.selectedTEname = "";

            var savedAdvancedSeachOptions = null;
            var defaultColumn = {
                id: 'created',
                displayName: 'registration_date',
                valueType: 'date',
                displayInListNoProgram: false,
                showFilter: false,
                show: false
            };
            $scope.maxOptionSize = 30;
            $scope.eventsTodayFilters = [{name: $translate.instant('events_today_all'), value: 'all'},{name: $translate.instant('events_today_completeoractive'),value: 'completedOrActive', status:['COMPLETED', 'ACTIVE']},{name: $translate.instant('events_today_skipped') , value: 'skipped', status:['SKIPPED']},{name: $translate.instant('events_today_scheduled'), value: 'scheduled', status:['SCHEDULE']}];
            $scope.selectedEventsTodayFilter = $scope.eventsTodayFilters[0];
            $scope.availablePrograms = {};




            //Selection
            $scope.ouModes = [{name: 'SELECTED'}, {name: 'CHILDREN'}, {name: 'DESCENDANTS'}, {name: 'ACCESSIBLE'}];
            $scope.selectedOuMode = $scope.ouModes[2];
            $scope.dashboardProgramId = ($location.search()).program;
            $scope.selectedOrgUnitId = ($location.search()).ou;
            $scope.treeLoaded = false;
            $scope.searchOuTree = {open: true};
            $scope.teiListMode = {onlyActive: false};
            $scope.enrollmentStatus = 'FIND';

            //Searching
            $scope.showSearchDiv = false;
            $scope.model = {searchText: null, exportFormats:["XML","JSON","CSV"]};
            $scope.searchFilterExists = false;
            $scope.defaultOperators = OperatorFactory.defaultOperators;
            $scope.boolOperators = OperatorFactory.boolOperators;
            $scope.enrollment = {enrollmentStartDate: '', enrollmentEndDate: '', incidentStartDate: '', incidentEndDate: '', operator: $scope.defaultOperators[0]};
            $scope.searchMode = { listAll: 'LIST_ALL', freeText: 'FREE_TEXT', attributeBased: 'ATTRIBUTE_BASED' };
            $scope.optionSets = null;
            $scope.attributesById = null;
            $scope.dataElementTranslations = null;
            $scope.doSearch = true;

            $scope.sortColumn = defaultColumn;

            var establishmentsPrograms = [];

            function resetParams(goToPage){
                $scope.trackedEntityList = null;
                $scope.sortColumn = {};
                $scope.emptySearchText = false;
                $scope.emptySearchAttribute = false;
                $scope.showRegistrationDiv = false;
                $scope.showTrackedEntityDiv = false;
                $scope.teiFetched = false;
                $scope.queryUrl = null;
                $scope.programUrl = null;
                $scope.teiFetched = false;
                $scope.frontPageListEnabled = false;
                $scope.attributeUrl = {url: null, hasValue: false};
                if(!goToPage){
                    $scope.pager = {pageSize: 50, page: 1, toolBarDisplay: 5};
                }

            }

            //watch for selection of org unit from tree
            $scope.$watch('selectedOrgUnit', function() {
                if( angular.isObject($scope.selectedOrgUnit)){
                    $scope.doSearch = true;
                    $scope.searchingOrgUnit = $scope.selectedOrgUnit;

                    SessionStorageService.set('SELECTED_OU', $scope.selectedOrgUnit);

                    $scope.trackedEntityList = null;
                    $scope.model.searchText = null;

                    $scope.optionSets = CurrentSelection.getOptionSets();

                    $scope.attributesById = CurrentSelection.getAttributesById();
                    savedAdvancedSeachOptions = CurrentSelection.getAdvancedSearchOptions();
                    if (savedAdvancedSeachOptions) {
                        $scope.searchingOrgUnit = angular.copy(savedAdvancedSeachOptions.searchingOrgUnit);
                        $scope.selectedOuMode = angular.copy(savedAdvancedSeachOptions.selectedOuMode);
                        $scope.enrollment.programEnrollmentStartDate = savedAdvancedSeachOptions.programEnrollmentStartDate;
                        $scope.enrollment.programEnrollmentEndDate = savedAdvancedSeachOptions.programEnrollmentEndDate;
                        $scope.enrollment.programIncidentStartDate = savedAdvancedSeachOptions.programIncidentStartDate;
                        $scope.enrollment.programIncidentEndDate = savedAdvancedSeachOptions.programIncidentEndDate;
                        if (savedAdvancedSeachOptions.searchText) {
                            $scope.model.searchText = savedAdvancedSeachOptions.searchText;
                        }
                        if (savedAdvancedSeachOptions.sortColumn) {
                            $scope.sortColumn = angular.copy(savedAdvancedSeachOptions.sortColumn);
                        }
                        
                        $scope.showSearchDiv = savedAdvancedSeachOptions.showSearchDiv;
                        $scope.teiFetched = savedAdvancedSeachOptions.teiFetched;
                        $scope.doSearch = savedAdvancedSeachOptions.doSearch;
                    }
                    $scope.savedTeis = CurrentSelection.getTrackedEntities();

                    if(!$scope.attributesById){
                        $scope.attributesById = [];
                        MetaDataFactory.getAll('attributes').then(function(atts){
                            angular.forEach(atts, function(att){
                                $scope.attributesById[att.id] = att;
                            });
                            CurrentSelection.setAttributesById($scope.attributesById);
                        });
                    }

                    if(!$scope.optionSets){
                        $scope.optionSets = [];
                        MetaDataFactory.getAll('optionSets').then(function(optionSets){
                            angular.forEach(optionSets, function(optionSet){
                                $scope.optionSets[optionSet.id] = optionSet;
                            });
                            CurrentSelection.setOptionSets($scope.optionSets);
                        });
                    }
                   
                    $scope.ouLevels = CurrentSelection.getOuLevels();
                    if(!$scope.ouLevels){
                        TCStorageService.currentStore.open().done(function(){
                            TCStorageService.currentStore.getAll('ouLevels').done(function(response){
                                var ouLevels = angular.isObject(response) ? orderByFilter(response, '-level').reverse() : [];
                                CurrentSelection.setOuLevels(orderByFilter(ouLevels, '-level').reverse());
                            });
                        });
                    }

                    //Labels
                    $scope.programNameLevel = $translate.instant('food_safety_establishments');
                    $scope.trackerCaptureLabel = $translate.instant('tracker_capture');
                    $scope.orgUnitLabel = $translate.instant('org_unit');
                    $scope.listAllLabel = $translate.instant('list_all');
                    $scope.registerLabel = $translate.instant('register');
                    $scope.searchOusLabel = $translate.instant('locate_organisation_unit_by_name');
                    $scope.printLabel = $translate.instant('print');
                    $scope.searchLabel = $translate.instant('search');
                    $scope.findLabel = $translate.instant('find');
                    $scope.advancedSearchLabel = $translate.instant('advanced_search');
                    $scope.allEnrollmentsLabel = $translate.instant('all_enrollment');
                    $scope.completedEnrollmentsLabel = $translate.instant('completed_enrollment');
                    $scope.activeEnrollmentsLabel = $translate.instant('active_enrollment');
                    $scope.cancelledEnrollmentsLabel = $translate.instant('cancelled_enrollment');
                    $scope.searchCriteriaLabel = $translate.instant('type_your_search_criteria_here');
                    $scope.programSelectLabel = $translate.instant('please_select_a_program');
                    $scope.settingsLabel = $translate.instant('settings');
                    $scope.showHideLabel = $translate.instant('show_hide_columns');
                    $scope.listProgramsLabel = $translate.instant('list_programs');
                    $scope.settingsLabel = $translate.instant('settings');
                    $scope.todayLabel = $translate.instant('events_today_persons');
                    angular.forEach($scope.eventsTodayFilters, function(filter){
                        filter.name = $translate.instant(filter.name);
                    });
                    $scope.displayModeLabel = $translate.instant('display_mode');

                    resetParams();
                    //$scope.doSearch = true;
                    $scope.loadPrograms($scope.selectedOrgUnit);
                }
            });

            // for saitn Lucia Start
            if ($scope.trackerAssociateInstancesMap.length == 0)
            {
                AttributesFactory.getAll().then(function (atts) {
                    angular.forEach(atts, function (att) {
                        if (att.valueType == 'TRACKER_ASSOCIATE') {
                            ProgramAndTEIService.getTrackedEntityInstancesByProgram( $scope.operatorsProgram ).then(function (teis) {
                                //var test = $rootScope.ConfigurationSettings.parameters['tracker-associate-attribute-display'].value;
                                //var trackerAssociateAttributeIndex = 5;//attributes start from 5th index through the API

                                for (var i in teis.trackedEntityInstances) {

                                    for (var j in teis.trackedEntityInstances[i].attributes) {
                                        if (teis.trackedEntityInstances[i].attributes[j].attribute == $scope.displayAttribute ) {
                                            //console.log( teis.trackedEntityInstances[i].trackedEntityInstance +" -- " + teis.trackedEntityInstances[i].attributes[j].value );
                                            $scope.trackerAssociateInstancesMap[teis.trackedEntityInstances[i].trackedEntityInstance] = teis.trackedEntityInstances[i].attributes[j].value;
                                        }
                                    }
                                }
                            });

                        }
                    });
                });
            }
            //  // for Saint Lucia End
            //watch for changes in ou mode - mode could be selected without notifcation to grid column generator
            $scope.$watch('selectedOuMode.name', function() {
                if( $scope.selectedOuMode.name && angular.isObject($scope.gridColumns)){
                    var continueLoop = true;
                    for(var i=0; i<$scope.gridColumns.length && continueLoop; i++){
                        if($scope.gridColumns[i].id === 'orgUnitName' && $scope.selectedOuMode.name !== 'SELECTED'){
                            $scope.gridColumns[i].show = true;
                            continueLoop = false;
                        }
                    }
                }
            });

            //watch for program feedback (this is when coming back from dashboard)
            if($scope.dashboardProgramId && $scope.dashboardProgramId !== 'null'){
                ProgramFactory.get($scope.dashboardProgramId).then(function(program){
                    $scope.selectedProgram = program;
                });
            }

            //load programs associated with the selected org unit.
            $scope.loadPrograms = function(orgUnit) {
                $scope.selectedOrgUnit = orgUnit;

                if (angular.isObject($scope.selectedOrgUnit)) {

                    ProgramFactory.getProgramsByOu($scope.selectedOrgUnit, $scope.selectedProgram).then(function(response){

                        for(var i=0; i<response.programs.length; i++){
                            if(response.programs[i].id === $scope.establishmentsProgran ){
                                establishmentsPrograms.push(response.programs[i]);
                                $scope.selectedProgram = response.programs[i];
                                $scope.model.selectedProgram = response.programs[i];
                                $scope.getProgramAttributes( $scope.model.selectedProgram);
								$scope.selectedTEname = response.programs[i].trackedEntity.displayName;
								//$scope.selectedTEname = response.programs[i].displayName;
                            }
                        }
                        //$scope.programs = response.programs;
                        $scope.programs = establishmentsPrograms;
                        //$scope.selectedProgram = response.selectedProgram;
                        //$scope.model.selectedProgram = $scope.selectedProgram;
                        $scope.trackedEntityList = null;
                        $scope.selectedSearchMode = $scope.searchMode.listAll;
                        $scope.processAttributes();
                    });
                }
            };

            $scope.getProgramAttributes = function(program){
                resetParams();
                $scope.doSearch = true;
                $scope.selectedProgram = program;
                $scope.trackedEntityList = null;
                $scope.model.searchText = null;
                $scope.savedTeis = null;
                CurrentSelection.setAdvancedSearchOptions(null);
                savedAdvancedSeachOptions = null;
                $scope.gridColumns = null;
                $scope.processAttributes();
            };

            $scope.processAttributes = function(){
                if(savedAdvancedSeachOptions && savedAdvancedSeachOptions.sortColumn) {
                    $scope.sortColumn = angular.copy(savedAdvancedSeachOptions.sortColumn);
                } else {
                    $scope.sortColumn = {};
                }
                AttributesFactory.getByProgram($scope.selectedProgram).then(function(atts){
                    if (savedAdvancedSeachOptions) {
                        $scope.attributes = angular.copy(savedAdvancedSeachOptions.attributes);
                    } else {
                        $scope.attributes = AttributesFactory.generateAttributeFilters(atts);
                    }
                    if($scope.showRegistrationDiv){
                        $scope.doSearch = false;
                    }

                    $scope.setEnrollmentStatus();
                    if ($scope.savedTeis) {
                        restoreSavedTeis();
                    } else {
                        if ($scope.doSearch && $scope.selectedProgram && ($scope.selectedProgram.displayFrontPageList)) {
                            $scope.search($scope.searchMode);
                        }
                    }
                });

                function restoreSavedTeis() {
                    $scope.gridColumns = angular.copy(savedAdvancedSeachOptions.gridColumns);
                    $scope.pager = angular.copy(savedAdvancedSeachOptions.pager);
                    Paginator.setPage($scope.pager.page);
                    Paginator.setPageCount($scope.pager.pageCount);
                    Paginator.setPageSize($scope.pager.pageSize);
                    Paginator.setItemCount($scope.pager.total);

                    $scope.frontPageListEnabled = savedAdvancedSeachOptions.frontPageListEnabled;
                    $scope.showTrackedEntityDiv = savedAdvancedSeachOptions.showTrackedEntityDiv;

                    $scope.trackedEntityList = $scope.savedTeis;
                    //process tei grid
                    $scope.showSearchDiv = savedAdvancedSeachOptions.showSearchDiv;
                    $scope.teiFetched = savedAdvancedSeachOptions.teiFetched;
                    $scope.doSearch = savedAdvancedSeachOptions.doSearch;
                    $scope.reverse = savedAdvancedSeachOptions.reverse;
                    $scope.selectedSearchMode = savedAdvancedSeachOptions.searchMode;

                    if (!$scope.sortColumn.id) {
                        $scope.sortColumn = defaultColumn;
                    }
                }
            };

            $scope.setEnrollmentStatus =  function(){
                if($rootScope.enrollmentStatus){
                    $scope.enrollmentStatus = $rootScope.enrollmentStatus;
                    $rootScope.enrollmentStatus = null;
                    $scope.filterByEnrollmentStatus($scope.enrollmentStatus, true);
                }else if($scope.selectedProgram){
                    $scope.enrollmentStatus = 'ALL';
                }
            };

            //sortGrid
            $scope.sortGrid = function(gridHeader){
                if ($scope.sortColumn && $scope.sortColumn.id === gridHeader.id){
                    $scope.reverse = !$scope.reverse;
                    CurrentSelection.setColumnReverse( $scope.reverse);
                    return;
                }
                $scope.sortColumn = gridHeader;
                if($scope.sortColumn.valueType === 'date'){
                    $scope.reverse = true;
                }
                else{
                    $scope.reverse = false;
                }
                CurrentSelection.setSortColumn( $scope.sortColumn);
                CurrentSelection.setColumnReverse( $scope.reverse);
            };

            $scope.d2Sort = function(tei){
                if($scope.sortColumn && $scope.sortColumn.valueType === 'date'){
                    var d = tei[$scope.sortColumn.id];
                    return DateUtils.getDate(d);
                }
                return tei[$scope.sortColumn.id];
            };

            //$scope.searchParam = {bools: []};

            $scope.search_list_all = function() {

                $window.location.reload();
            };

            $scope.search = function(mode,goToPage){
                //resetParams(goToPage);
                var grid;
                if (!$scope.gridColumns) {
                    grid = TEIGridService.generateGridColumns($scope.attributes, $scope.selectedOuMode.name, true);
                    $scope.gridColumns = grid.columns;
                }

                $scope.selectedSearchMode = mode;
                $scope.savedTeis = null;


                //check search mode
                if( $scope.selectedSearchMode === $scope.searchMode.freeText ){
                    $scope.frontPageListEnabled = true;
                    if($scope.enrollmentStatus === 'TODAY') {
                        $scope.enrollmentStatus = 'ALL';
                    }
                    if($scope.model.searchText != ""){
                        $scope.queryUrl = 'query=LIKE:' + $scope.model.searchText;
                    }
                    else
					{
                       /* if(!$scope.selectedProgram || !$scope.selectedProgram.displayFrontPageList) {
                            $scope.emptySearchText = true;
                            $scope.teiFetched = false;
                            return;
                        }*/
						$scope.selectedSearchMode = $scope.searchMode.listAll;
					}
					//{
                   //     if(!$scope.selectedProgram || !$scope.selectedProgram.displayFrontPageList){
                    //        $scope.emptySearchText = true;
                      //      $scope.teiFetched = false;
                      //      return;
                      //  }
                    //}

                    $scope.attributes = EntityQueryFactory.resetAttributesQuery($scope.attributes, $scope.enrollment);
                    $scope.searchingOrgUnit = $scope.selectedSearchingOrgUnit && $scope.selectedSearchingOrgUnit.id ? $scope.selectedSearchingOrgUnit : $scope.selectedOrgUnit;
                }

                if($scope.selectedProgram){
                    $scope.programUrl = 'program=' + $scope.selectedProgram.id;
                    if($scope.enrollmentStatus !== 'ALL'){
                        $scope.programUrl = 'program=' + $scope.selectedProgram.id + '&programStatus=' + $scope.enrollmentStatus;
                    }
                }

                if( $scope.selectedSearchMode === $scope.searchMode.attributeBased ){

                    $scope.model.searchText = null;

                    $scope.attributeUrl = EntityQueryFactory.getAttributesQuery($scope.attributes, $scope.enrollment);


                    if(!$scope.attributeUrl.hasValue){
                        $scope.emptySearchAttribute = true;
                        $scope.teiFetched = false;
                        $scope.selectedSearchMode = $scope.searchMode.listAll;
                        //return;
                    }

                    $scope.searchingOrgUnit = $scope.selectedSearchingOrgUnit && $scope.selectedSearchingOrgUnit.id ? $scope.selectedSearchingOrgUnit : $scope.selectedOrgUnit;
                }

                if( $scope.selectedSearchMode === $scope.searchMode.listAll ){
                    $scope.queryUrl=null;
                    $scope.model.searchText = null;
                    $scope.attributes = EntityQueryFactory.resetAttributesQuery($scope.attributes, $scope.enrollment);
                    $scope.searchingOrgUnit =  $scope.rootOrgUnit;
                    //$scope.searchingOrgUnit = $scope.selectedSearchingOrgUnit && $scope.selectedSearchingOrgUnit.id ? $scope.selectedSearchingOrgUnit : $scope.selectedOrgUnit;
                }

                $scope.doSearch = false;
                $scope.fetchTeis();
            };
            $scope.fetchTeisEventsToday = function(eventsTodayFilter){
                if(!$scope.selectedProgram){
                    $scope.teiFetched = true;
                    return;
                }
                $scope.teiFetched = false;
                $scope.selectedEventsTodayFilter = eventsTodayFilter;
                $scope.trackedEntityList = null;
                var today = DateUtils.formatFromUserToApi(DateUtils.getToday());
                var promises = [];
                if(!eventsTodayFilter.status){
                    promises.push(EventReportService.getEventReport($scope.selectedOrgUnit.id,$scope.selectedOuMode.name, $scope.selectedProgram.id,today,today,'ACTIVE',null,$scope.pager));
                }else{
                    angular.forEach(eventsTodayFilter.status, function(status){
                        promises.push(EventReportService.getEventReport($scope.selectedOrgUnit.id,$scope.selectedOuMode.name, $scope.selectedProgram.id,today,today,'ACTIVE',status,$scope.pager));
                    });
                }
                $q.all(promises).then(function(data){
                    $scope.trackedEntityList = { rows: {own:[]}};
                    var ids = [];
                    angular.forEach(data, function(result){
                        if(result && result.eventRows){
                            angular.forEach(result.eventRows, function(eventRow){
                                if(ids.indexOf(eventRow.trackedEntityInstance) === -1){

                                    var row = {
                                        id: eventRow.trackedEntityInstance,
                                        created: DateUtils.formatFromApiToUser(eventRow.trackedEntityInstanceCreated),
                                        orgUnit: eventRow.trackedEntityInstanceOrgUnit,
                                        orgUnitName: eventRow.trackedEntityInstanceOrgUnitName,
                                        inactive: eventRow.trackedEntityInstanceInactive
                                    };

                                    angular.forEach(eventRow.attributes, function(attr){
                                        row[attr.attribute] = attr.value;
                                    });
                                    $scope.trackedEntityList.rows.own.push(row);
                                    ids.push(eventRow.trackedEntityInstance);

                                }
                            });
                        }
                    });
                    $scope.trackedEntityList.length = $scope.trackedEntityList.rows.own.length;
                    $scope.teiFetched = true;
                });
            };

            $scope.fetchTeis = function(){
                $scope.teiFetched = false;
                $scope.trackedEntityList = null;
                $scope.showTrackedEntityDiv = true;
                $scope.eventsToday = false;
                //get events for the specified parameters
                if($scope.enrollmentStatus==='TODAY'){
                    $scope.fetchTeisEventsToday($scope.selectedEventsTodayFilter);
                }else{
                    TEIService.search($scope.searchingOrgUnit.id,
                        $scope.selectedOuMode.name,
                        $scope.queryUrl,
                        $scope.programUrl,
                        $scope.attributeUrl.url,
                        $scope.pager,
                        true).then(function(data){
                        if (data && data.metaData && data.metaData.pager) {
                            $scope.pager = data.metaData.pager;
                            $scope.pager.toolBarDisplay = 5;

                            Paginator.setPage($scope.pager.page);
                            Paginator.setPageCount($scope.pager.pageCount);
                            Paginator.setPageSize($scope.pager.pageSize);
                            Paginator.setItemCount($scope.pager.total);
                        }

                        //process tei grid
                        TEIGridService.format(data, false, $scope.optionSets, null).then(function (response) {
                            $scope.trackedEntityList = response;
                            $scope.showSearchDiv = false;
                            $scope.teiFetched = true;
                            $scope.doSearch = true;

                            if (!$scope.sortColumn.id) {
                                $scope.sortGrid(defaultColumn);
                            }
                            CurrentSelection.setAdvancedSearchOptions({
                                searchingOrgUnit: angular.copy($scope.searchingOrgUnit),
                                searchMode: $scope.selectedSearchMode,
                                gridColumns: angular.copy($scope.gridColumns),
                                attributes: angular.copy($scope.attributes),
                                selectedOuMode: angular.copy($scope.selectedOuMode),
                                programEnrollmentStartDate: $scope.enrollment.programEnrollmentStartDate,
                                programEnrollmentEndDate: $scope.enrollment.programEnrollmentEndDate,
                                programIncidentStartDate: $scope.enrollment.programIncidentStartDate,
                                programIncidentEndDate: $scope.enrollment.programIncidentEndDate,
                                searchText: $scope.model.searchText,
                                sortColumn: angular.copy($scope.sortColumn),
                                pager: angular.copy($scope.pager),
                                showSearchDiv: $scope.showSearchDiv,
                                teiFetched: $scope.teiFetched,
                                doSearch: $scope.doSearch,
                                frontPageListEnabled: $scope.frontPageListEnabled,
                                showTrackedEntityDiv: $scope.showTrackedEntityDiv,
                                reverse: $scope.reverse
                            });
                            CurrentSelection.setTrackedEntities($scope.trackedEntityList);
                        });
                    });

                }
            };

            $scope.jumpToPage = function(){
                if($scope.pager && $scope.pager.page && $scope.pager.pageCount && $scope.pager.page > $scope.pager.pageCount){
                    $scope.pager.page = $scope.pager.pageCount;
                }
                $scope.search($scope.selectedSearchMode,true);
            };

            $scope.resetPageSize = function(){
                $scope.pager.page = 1;
                $scope.search(null,true);
            };

            $scope.getPage = function(page){
                $scope.pager.page = page;
                $scope.search($scope.selectedSearchMode, true);
            };

            $scope.clearEntities = function(){
                $scope.trackedEntityList = null;
            };

            $scope.showRegistration = function(){
                $scope.showRegistrationDiv = !$scope.showRegistrationDiv;
                if($scope.showRegistrationDiv){
                    $scope.showTrackedEntityDiv = false;
                    $scope.showSearchDiv = false;
                    $timeout(function() {
                        $rootScope.$broadcast('registrationWidget', {registrationMode: 'REGISTRATION'});
                    }, 200);
                }
            };

            $scope.showDisplayMode = function(){

                var modalInstance = $modal.open({
                    templateUrl: 'views/display-mode-modal.html',
                    controller: 'DisplayModeController',
                    resolve: {
                        programs: function(){
                            return $scope.programs;
                        }
                    }
                });

                modalInstance.result.then(function () {
                }, function () {});
            };

            $scope.showHideColumns = function(){
                $scope.hiddenGridColumns = 0;

                angular.forEach($scope.gridColumns, function(gridColumn){
                    if(!gridColumn.show){
                        $scope.hiddenGridColumns++;
                    }
                });

                var modalInstance = $modal.open({
                    templateUrl: 'views/column-modal.html',
                    controller: 'ColumnDisplayController',
                    resolve: {
                        gridColumns: function () {
                            return $scope.gridColumns;
                        },
                        hiddenGridColumns: function(){
                            return $scope.hiddenGridColumns;
                        }
                    }
                });

                modalInstance.result.then(function (gridColumns) {
                    $scope.gridColumns = gridColumns;
                    CurrentSelection.setGridColumns(angular.copy($scope.gridColumns));
                }, function () {
                });
            };

            $scope.showDashboard = function(currentEntity){
                var sortedTei = $filter('orderBy')($scope.trackedEntityList.rows, function(tei) {
                    return $scope.d2Sort(tei);
                }, $scope.reverse);

                var sortedTeiIds = [];
                angular.forEach(sortedTei, function(tei){
                    sortedTeiIds.push(tei.id);
                });

                CurrentSelection.setSortedTeiIds(sortedTeiIds);
                $rootScope.enrollmentStatus = $scope.enrollmentStatus;
                $location.path('/dashboard').search({tei: currentEntity.id,
                    program: $scope.selectedProgram ? $scope.selectedProgram.id: null,
                    ou: currentEntity.orgUnit});// add for saint lucia
                    //ou: $scope.selectedOrgUnit.id});
            };

            $scope.getHelpContent = function(){
            };

            //Get orgunits for the logged in user
            OrgUnitFactory.getSearchTreeRoot().then(function(response) {
                $scope.orgUnits = response.organisationUnits;
                angular.forEach($scope.orgUnits, function(ou){
                    ou.show = true;
                    angular.forEach(ou.children, function(o){
                        o.hasChildren = o.children && o.children.length > 0 ? true : false;
                    });
                });
                $scope.selectedSearchingOrgUnit = $scope.orgUnits[0] ? $scope.orgUnits[0] : null;
            });

            //expand/collapse of search orgunit tree
            $scope.expandCollapse = function(orgUnit) {
                if( orgUnit.hasChildren ){
                    //Get children for the selected orgUnit
                    OrgUnitFactory.get(orgUnit.id).then(function(ou) {
                        orgUnit.show = !orgUnit.show;
                        orgUnit.hasChildren = false;
                        orgUnit.children = ou.organisationUnits[0].children;
                        angular.forEach(orgUnit.children, function(ou){
                            ou.hasChildren = ou.children && ou.children.length > 0 ? true : false;
                        });
                    });
                }
                else{
                    orgUnit.show = !orgUnit.show;
                }
            };


            $scope.filterByEnrollmentStatus = function(status, doNotFetch){
                if(status !== $scope.enrollmentStatus){
                    $scope.enrollmentStatus = status;
                    if($scope.enrollmentStatus === 'ALL'){
                        $scope.programUrl = 'program=' + $scope.selectedProgram.id;
                    }else if($scope.enrollmentStatus ==='TODAY'){
                        $scope.programUrl = 'program=' + $scope.selectedProgram.id + '&programStatus=' + $scope.enrollmentStatus;
                    }
                    else{
                        $scope.programUrl = 'program=' + $scope.selectedProgram.id + '&programStatus=' + $scope.enrollmentStatus;
                    }
                    if(!doNotFetch){
                        $scope.fetchTeis();
                    }

                }
            };

            //load programs for the selected orgunit (from tree)
            $scope.setSelectedSearchingOrgUnit = function(orgUnit){
                $scope.selectedSearchingOrgUnit = orgUnit;
            };

            $scope.getExportList = function (format) {
                var deferred = $q.defer();
                var attrIdList = null;
                var attrNamesList = [];
                var attrNamesIdMap = {};
                if (!format || ($scope.model.exportFormats.indexOf(format) === -1)) {
                    return;
                }
                format = format.toLowerCase();

                angular.forEach($scope.gridColumns, function (item) {
                    if (item.show && item.attribute) {
                        if (!attrIdList) {
                            attrIdList = "attribute=" + item.id;
                        } else {
                            attrIdList += "&attribute=" + item.id;
                        }
                        attrNamesList.push(item.id);
                        attrNamesIdMap[item.displayName] = item.id;
                    }
                });


                TEIService.search($scope.searchingOrgUnit.id, $scope.selectedOuMode.name, $scope.queryUrl,
                    $scope.programUrl, attrIdList, false, false, format, attrNamesList, attrNamesIdMap, $scope.optionSets).then(function (data) {
                    var fileName = "trackedEntityList." + format;// any file name with any extension
                    var a = document.createElement('a');
                    var blob, url;
                    a.style = "display: none";
                    blob = new Blob(['' + data], {type: "octet/stream", endings: 'native'});
                    url = window.URL.createObjectURL(blob);
                    a.href = url;
                    a.download = fileName;
                    document.body.appendChild(a);
                    a.click();
                    setTimeout(function () {
                        document.body.removeChild(a);
                        window.URL.revokeObjectURL(url);
                    }, 300);
                    deferred.resolve(data);
                });
                return deferred.promise;
            };

            $scope.exportEnabled = function() {
                return $scope.trackedEntityList && $scope.trackedEntityList.length > 0 ;
            };
        });