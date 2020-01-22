//Controller for column show/hide
msfReportsApp.controller('LeftBarMenuController',
    function ($scope,
        $location) {
        $scope.showTodaySchedule = function () {
            $location.path('/schedule-today').search();
        };
        // $scope.showEventReport = function(){
        //     $location.path('/event-report').search();
        // };

        $scope.showTrackerReport = function () {
            $location.path('/tracker-report').search();
        };
    });