/* global trackerCapture, angular */

var trackerCapture = angular.module('trackerCapture');
trackerCapture.controller('RelationshipController',
        function($scope,
                $rootScope,
                $modal,$window,
                $location,
                TEIService,
                AttributesFactory,
                CurrentSelection,
                RelationshipFactory,
                ModalService,
                DialogService,
                CommonUtils,
                AjaxCalls) {
    $scope.dashboardReady = false;
    $rootScope.showAddRelationshipDiv = false;    
    $scope.relatedProgramRelationship = false;
    
    //listen for the selected entity       
    $scope.$on('dashboardWidgets', function(event, args) { 
        $scope.relationshipTypes = []; 
        $scope.relationships = [];
        $scope.relatedTeis = [];
        $scope.selections = CurrentSelection.get();
        $scope.optionSets = $scope.selections.optionSets;
        $scope.selectedTei = angular.copy($scope.selections.tei);        
        $scope.attributesById = CurrentSelection.getAttributesById();

        //$scope.showTeiList = true;

        $scope.attributes = [];

        if( $scope.selectedProgram.name === 'Food Handlers')
        {
            //get attributes for display in association widget
            AjaxCalls.getAssociationWidgetAttributes().then(function(associationWidgetAttributes){
                $scope.attributes = associationWidgetAttributes;
            });
        }
        else if( $scope.selectedProgram.name === 'Food Establishments')
        {
            //get attributes for display in association widget
            AjaxCalls.getFoodEstablishmentRelationShipWidgetAttributes().then(function(relationShipWidgetAttributes){
                $scope.attributes = relationShipWidgetAttributes;
            });
        }
        else
        {
            for(var key in $scope.attributesById){
                if($scope.attributesById.hasOwnProperty(key)){
                    $scope.attributes.push($scope.attributesById[key]);
                }
            }
        }

        $scope.trackedEntity = $scope.selections.te;
        $scope.selectedEnrollment = $scope.selections.selectedEnrollment;
        $scope.selectedProgram = $scope.selections.pr;
        $scope.programs = $scope.selections.pr;



        console.log( $scope.selectedProgram.name + "--" + $scope.selectedProgram.id);

        RelationshipFactory.getAll().then(function(rels){
            $scope.relationshipTypes = rels;    
            angular.forEach(rels, function(rel){
                $scope.relationships[rel.id] = rel;
            });
            
            $scope.dashboardReady = true;
            setRelationships();            
        });
    });
    
    $scope.showAddRelationship = function(related) {
        $scope.relatedProgramRelationship = related;
        $rootScope.showAddRelationshipDiv = !$rootScope.showAddRelationshipDiv;
       
        if($rootScope.showAddRelationshipDiv){
            var modalInstance = $modal.open({
                templateUrl: 'components/teiadd/tei-add.html',
                controller: 'TEIAddController',
                windowClass: 'modal-full-window',
                resolve: {
                    relationshipTypes: function () {
                        return $scope.relationshipTypes;
                    },
                    selectedAttribute: function(){
                        return null;
                    },
                    existingAssociateUid: function(){
                        return null;
                    },
                    addingRelationship: function(){
                        return true;
                    },
                    selections: function () {
                        return $scope.selections;
                    },
                    selectedTei: function(){
                        return $scope.selectedTei;
                    },
                    selectedProgram: function(){
                        return $scope.selectedProgram;
                    },
                    relatedProgramRelationship: function(){
                        return $scope.relatedProgramRelationship;
                    }
                }
            });

            modalInstance.result.then(function (relationships) {
                $scope.selectedTei.relationships = relationships;                
                setRelationships();
            });
        }
    };
    
    $scope.removeRelationship = function(rel){
        
        var modalOptions = {
            closeButtonText: 'cancel',
            actionButtonText: 'delete',
            headerText: 'delete',
            bodyText: 'are_you_sure_to_delete_relationship'
        };

        ModalService.showModal({}, modalOptions).then(function(result){
            
            var index = -1;
            for(var i=0; i<$scope.selectedTei.relationships.length; i++){
                if($scope.selectedTei.relationships[i].relationship === rel.relId){
                    index = i;
                    break;
                }
            }

            if( index !== -1 ){
                $scope.selectedTei.relationships.splice(index,1);
                var trimmedTei = angular.copy($scope.selectedTei);
                angular.forEach(trimmedTei.relationships, function(rel){
                    delete rel.relative;
                });
                TEIService.update(trimmedTei, $scope.optionSets, $scope.attributesById).then(function(response){
                    if(response.response && response.response.status !== 'SUCCESS'){//update has failed
                        var dialogOptions = {
                                headerText: 'update_error',
                                bodyText: response.message
                            };
                        DialogService.showDialog({}, dialogOptions);
                        return;
                    }                    
                    setRelationships();
                });
            }
        });        
    };

// show events Details


    $scope.showRelationShipDetails = function(){
        //alert(selectedTEI.id + "--" + selectedProgramId);

        //var url = 'schedulingInspectionsList.action?listAll=true&selectedTEIUid=' + selectedTEI.id + "&selectedProgramUid=" + selectedProgramId;
        //window.location.href = url;

        alert( $scope.selectedTei.trackedEntityInstance + " -- " + $scope.relatedProgramRelationship );
        jQuery('#listTEIDiv').dialog('destroy').remove();
        jQuery('<div id="listTEIDiv">' ).load( 'showTEIList.action?programId='+ 115 ).dialog({
            title: 'aaaa',
            maximize: true,
            closable: true,
            modal:true,
            overlay:{background:'#000000', opacity:0.1},
            width: 1000,
            height: 450
        });


        /*
        var $popup = $window.open("showTEIList.action?programId=115", "popup", "width=250,height=100,left=10,top=150");
        $popup.Name = "Test";
        */

        /*
        $scope.modalInstance=$modal.open({
            templateUrl: 'showTEIList.action?programId=115'
        });
        */


    };

    //$scope.width = "50%";
    //$scope.height = "50%";
    //$scope.maxWidth = undefined;
    //$scope.maxHeight = undefined;
    //$scope.minWidth = undefined;
    //$scope.minHeight = undefined;
    //
    $scope.showEventDetails = function() {
        if($scope.relatedTeis != undefined){
            var modalInstance = $modal.open({
                templateUrl: 'components/relationship/eventDetails.html',
                //templateUrl: 'showTEIList.action?programId=115',
                controller: 'EventDetailsController',
                windowClass: 'modal-full-window',
                resolve: {
                    //selectedTei: function(){
                    //    return relatedTEIId;
                    //},
                    selectedProgram: function(){
                        return $scope.selectedProgram;
                    },
                    relatedTeis: function(){
                        return $scope.relatedTeis;
                    }


                }
            });

            modalInstance.result.then(function () {
            }, function () {
            });
        }
    };


       $scope.showDashboard = function(teiId, relId){
        
        var dashboardProgram = null;
        
        if($scope.selectedProgram && $scope.selectedProgram.relationshipType){
            if($scope.selectedProgram.relationshipType.id === relId && $scope.selectedProgram.relatedProgram ){
                dashboardProgram = $scope.selectedProgram.relatedProgram.id;
            }
        }        
    
        $location.path('/dashboard').search({tei: teiId, program: dashboardProgram}); 
    };
    
    var setRelationships = function(){
        $scope.relatedTeis = [];
        angular.forEach($scope.selectedTei.relationships, function(rel){
            var teiId = rel.trackedEntityInstanceA;
            var relName = $scope.relationships[rel.relationship].aIsToB;
            if($scope.selectedTei.trackedEntityInstance === rel.trackedEntityInstanceA){
                teiId = rel.trackedEntityInstanceB;
                relName = $scope.relationships[rel.relationship].bIsToA;
            }
            var relative = {trackedEntityInstance: teiId, relName: relName, relId: rel.relationship, attributes: getRelativeAttributes(rel)};            
            $scope.relatedTeis.push(relative);
        });
        
        var selections = CurrentSelection.get();
        CurrentSelection.set({tei: $scope.selectedTei, te: $scope.selectedTei.trackedEntity, prs: selections.prs, pr: $scope.selectedProgram, prNames: selections.prNames, prStNames: selections.prStNames, enrollments: selections.enrollments, selectedEnrollment: $scope.selectedEnrollment, optionSets: selections.optionSets});       
    };
    
    var getRelativeAttributes = function(tei){
        
        var attributes = {};
        
        if(tei && tei.relative && tei.relative.attributes && !tei.relative.processed){
            angular.forEach(tei.relative.attributes, function(att){                
                if( att.attribute && $scope.attributesById[att.attribute] ){
                    att.value = CommonUtils.formatDataValue(null, att.value, $scope.attributesById[att.attribute], $scope.optionSets, 'USER');                
                }                
                attributes[att.attribute] = att.value;
            });
        }
        
        if(tei && tei.relative && tei.relative.processed){
            attributes = tei.relative.attributes;
        }
        
        return attributes;
    };
});