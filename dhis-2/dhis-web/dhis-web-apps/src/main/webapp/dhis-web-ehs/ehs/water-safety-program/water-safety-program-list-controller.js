//Controller for EHS Home
var trackerCapture = angular.module('trackerCapture');
trackerCapture.controller('WaterSafetyProgramlistController',
    function($scope,
             AjaxCalls,
             $location) {




        AjaxCalls.getWaterSafetyProgram().then(function(data){
            $scope.foodsafetyprograms = data;




            AjaxCalls.getuserrole().then(function(data1) {


                $scope.userrole=data1.data.userCredentials.userRoles[0].id;
                $scope.userprogram="";
                AjaxCalls.getuserroleprogram($scope.userrole).then(function(data2)
                {
                    for(i=0;i<data2.data.programs.length;i++)
                    { $scope.userprogram+=" " +data2.data.programs[i].id ;}



                });
            });








        });
        $scope.waterSafety = function(value){
            $scope.value=value;
			
			if($scope.value=="lI7ERF9ikB7")
			{
            AjaxCalls.setfoodsafetyid($scope.value);
            selection.load();
            $location.path('/water-safety-program').search();
			}
			else if($scope.value=="qhdFZgTdRbo")
			{
            AjaxCalls.setfoodsafetyid($scope.value);
            selection.load();
            $location.path('/water-bottling-plants').search();
			}
			else if($scope.value=="q7iA10pQZEL")
			{
            AjaxCalls.setfoodsafetyid($scope.value);
            selection.load();
            $location.path('/water-truck-receptacles').search();
			}
			else if($scope.value=="JlYxDLMZJhK")
			{
            AjaxCalls.setfoodsafetyid($scope.value);
            selection.load();
            $location.path('/water-treatment-plants').search();
			}
            // $location.path('/establishments-registration').search();

            // selection.load();
            //  $location.path('/establishments-registration').search();
        };


        /*
         $scope.overdueEvents = function(){
         selection.load();
         $location.path('/overdue-events').search();
         };

         $scope.upcomingEvents = function(){
         selection.load();
         $location.path('/upcoming-events').search();
         };
         */
    });