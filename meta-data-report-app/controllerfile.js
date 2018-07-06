/**
 * Created by HISP-WS19 on 16-12-2016.
 */

var app = angular.module('testapp',['jsonFormatter']);
app.controller('testcontroller',function($scope, $http,$timeout, $window){
		
		var getUrl = $window.location.href;
		var urlPart = getUrl.split('=');
		var urlUid = urlPart[1];
		//var flag;
		$scope.getSchemas = function (input){
		$http.get("../../schemas.json?paging=false")
          .then(function (data1) {
			  var data = data1.data;
		$scope.callSchemaEndPoint(0,data,input);
	
	});
	
	}
//	angular.element(document).ready(function () {
				if(urlPart.length == 1){
					//alert("Enter Uid");
					//return false;
					//flag = 1;
				}
				else if(urlUid == ""){
					alert("Enter Uid");
				}
				else{
				if(urlUid.length == 11){
						$scope.uid = urlUid;
						document.getElementById("overlay").style.display = "block";
						document.getElementById("loader").style.display = "block"; 
						document.getElementById("loading").style.display = "block"; 
						$scope.getSchemas($scope.uid);
					}
					else{
						alert("Uid must be of 11 characters.");
					}}
	//	});
		
		$scope.callSchemaEndPoint = function (i,dataSchemas,uid,uidFound){
	
			if (i>=dataSchemas.schemas.length){
		document.getElementById("loader").style.display = "none";
		 document.getElementById("loading").style.display = "none";
		 document.getElementById("loading").innerHTML ="";
		document.getElementById("data").style.display = "none";
		 document.getElementById("overlay").style.display = "none";
		 document.getElementById("Name").style.display = "none";
		window.alert("Uid is not valid !");
			//document.getElementById("Uid is not valid").innerHTML = "UID does not exist";
			return;
		}
		var j= i-1;
		if (uidFound){
			
			 document.getElementById("loader").style.display = "none";
			  document.getElementById("loading").style.display = "none";
			  document.getElementById("loading").innerHTML ="";
			 document.getElementById("data").style.display = "block";
			 document.getElementById("overlay").style.display = "none";
			 document.getElementById("Type").innerHTML = "<b>UID Type : "+dataSchemas.schemas[j].displayName+"</b>";
			//console.log($scope.names);
			return;}
		var endPointName = dataSchemas.schemas[i].collectionName;
		document.getElementById("loading").innerHTML ="<img src='loading.gif'><p id='loadtext'><span>" +endPointName+"</span></p>";
				$.getJSON("../../"+endPointName+"/"+uid+".json?paging=false", function (response){	
				$timeout(function(){
				$scope.names = response;
			})
			 document.getElementById("Name").innerHTML = "<b>Name : "+response.name+"</b><br>";
					$scope.callSchemaEndPoint(i+1,dataSchemas,uid,true);
					
	})
		.error(function(e, x) {			
		$scope.callSchemaEndPoint(i+1,dataSchemas,uid,false);
		});
		

}
		
    $scope.submit = function () {	
	
	var input = $scope.uid;
  if(input == undefined || input == ""){
		//document.getElementById("find").style.borderColor = "red";
		//document.getElementById("error").innerHTML = "*uid cannot be empty*";
		//document.getElementById("error").focus();
		//document.getElementById("find").style.boxShadow = "0 0 7px red";
	}
	else if (input.length < 11 || input.length >11 ) {
					//alert("Uid must contain at least 11 characters");
		document.getElementById("find").style.borderColor = "red";
		document.getElementById("find").style.boxShadow = "0 0 7px red";
		document.getElementById("error").focus();
		document.getElementById("error").innerHTML = "*uid must contain 11 characters*";
			}
  
  else {
	   document.getElementById("overlay").style.display = "block";
	  document.getElementById("loader").style.display = "block"; 
	  document.getElementById("loading").style.display = "block"; 
		$scope.getSchemas($scope.uid);

          }
    };

});	