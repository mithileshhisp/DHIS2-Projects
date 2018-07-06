var orgid;
var dataElementUid_form_s = "-1";
var period;
var table_form_s = [];
var table2_form_s = [];
var table1_form_s = [];
var caseid_form_s = [];
var objList_form_s = [];
var objItem_form_s = {};
var orderArr_form_s =[];
var newcaseid_form_s=[];

var dataElementUid_form_p = "-1";

var table_form_p = [];
var table2_form_p = [];
var table1_form_p = [];
var caseid_form_p = [];
var objList_form_p = [];
var objItem_form_p = {};
var orderArr_form_p =[];
var newcaseid_form_p=[];



var dataElementUid_form_l = "-1";

var table_form_l = [];
var table2_form_l = [];
var table1_form_l = [];
var caseid_form_l = [];
var objList_form_l = [];
var objItem_form_l = {};
var orderArr_form_l =[];
var newcaseid_form_l=[];
bidReportsApp
    .controller('homeController', function ($rootScope,
                                            $scope) {
        $(document).ready(function () {
            //  $('#demo').append(table);
        });
        var orgUnitUid = "q24rstddbGh";
        var orgUnitID;
        var xmlhttp_form_s = new XMLHttpRequest();
		 var xmlhttp_form_p = new XMLHttpRequest();
		  var xmlhttp_form_l = new XMLHttpRequest();
		 
        xmlhttp_form_s.onreadystatechange = function () {
            if (xmlhttp_form_s.readyState == 4 && xmlhttp_form_s.status == 200) {
                myFunction_form_s(xmlhttp_form_s);
                generatePeriod();
                var orgUnit = {};
                $.get("../../organisationUnits?fields=id,name&filter=level:eq:2&paging=false", function (json) {
                    console.log("json--" + json.organisationUnits);
                    orgUnit["name"] = json.organisationUnits[0].name;
                    orgUnit["value"] = (json.organisationUnits[0].id);
                    // console.log("rows length--"+OrUnitAtLevel2);
                    objItem_form_s = {
                        orgName: orgUnit.name,
                        orgValue: orgUnit.value
                    };
                    objList_form_s.push(objItem_form_s);
                    generateApi_form_s(objItem_form_s).then(function (data) {
                        console.log(data);
						
						var aggData_form_s =[];
						datarows = data.rows;
			
						for(var i=0; i<datarows.length; i++)
						{
					aggData_form_s.push(json.rows);
					console.log("aggData_form_s--"+aggData_form_s);
						}
                        updateRow_form_s(objList_form_s[0],data);
                    });
                })
            }
        };
		
		 xmlhttp_form_p.onreadystatechange = function () {
            if (xmlhttp_form_p.readyState == 4 && xmlhttp_form_p.status == 200) {
                myFunction_form_p(xmlhttp_form_p);
                generatePeriod();
                var orgUnit = {};
                $.get("../../organisationUnits?fields=id,name&filter=level:eq:2&paging=false", function (json) {
                    console.log("json--" + json.organisationUnits);
                    orgUnit["name"] = json.organisationUnits[0].name;
                    orgUnit["value"] = (json.organisationUnits[0].id);
                    // console.log("rows length--"+OrUnitAtLevel2);
                    objItem_form_p = {
                        orgName: orgUnit.name,
                        orgValue: orgUnit.value
                    };
                    objList_form_p.push(objItem_form_p);
                    generateApi_form_p(objItem_form_p).then(function (data) {
                        console.log(data);
						
						var aggData_form_p =[];
						datarows = data.rows;
			
						for(var i=0; i<datarows.length; i++)
						{
					aggData_form_p.push(json.rows);
					console.log("aggData_form_p--"+aggData_form_p);
						}
						
                        updateRow_form_p(objList_form_p[0],data);
                    });
                })
            }
        };
		
		 xmlhttp_form_l.onreadystatechange = function () {
            if (xmlhttp_form_l.readyState == 4 && xmlhttp_form_l.status == 200) {
                myFunction_form_l(xmlhttp_form_l);
                generatePeriod();
                var orgUnit = {};
                $.get("../../organisationUnits?fields=id,name&filter=level:eq:2&paging=false", function (json) {
                    console.log("json--" + json.organisationUnits);
                    orgUnit["name"] = json.organisationUnits[0].name;
                    orgUnit["value"] = (json.organisationUnits[0].id);
                    // console.log("rows length--"+OrUnitAtLevel2);
                    objItem_form_l = {
                        orgName: orgUnit.name,
                        orgValue: orgUnit.value
                    };
                    objList_form_l.push(objItem_form_s);
                    generateApi_form_l(objItem_form_l).then(function (data) {
                        console.log(data);
						
						var aggData_form_l =[];
						datarows = data.rows;
			
						for(var i=0; i<datarows.length; i++)
						{
					aggData_form_l.push(json.rows);
					console.log("aggData_form_l--"+aggData_form_l);
						}
						
                        updateRow_form_l(objList_form_l[0],data);
                    });
                })
            }
        };
		
		
        xmlhttp_form_s.open("GET", "OutBreaks.xml", true);
		xmlhttp_form_p.open("GET", "OutBreaksFormP.xml", true);
		xmlhttp_form_l.open("GET", "OutBreaksFormL.xml", true);
        xmlhttp_form_s.send();
		xmlhttp_form_p.send();
		xmlhttp_form_l.send();
		
        var normId_form_s = [];
        var caseid_form_s = [];
        var deathId_form_s = [];
		 var normId_form_p = [];
        var caseid_form_p = [];
        var deathId_form_p = [];
		var normId_form_l = [];
        var caseid_form_l = [];
        var deathId_form_l = [];
		
        table1_form_s = "<td>" + "India" + "</td>";
		 table1_form_p = "<td>" + "India" + "</td>";
		 table1_form_l ="<td>" + "India" + "</td>";
        var apiChart1;

        function myFunction_form_s(xml) {
            var i;
            var xmlDoc = xml.responseXML;

            var x = xmlDoc.getElementsByTagName("norm");
            for (i = 0; i < x.length; i++) {
                normId_form_s.push(x[i].attributes[0].value);
                var check = x[i].attributes[1].value.indexOf(";");
              if(check>=0){
			    newcaseid_form_s.push(x[i].attributes[1].value);}
              caseid_form_s.push(x[i].attributes[1].value);
                deathId_form_p.push(x[i].attributes[2].value);
                var element = x[i].attributes[3].value;
                table1_form_s = table1_form_s + "<th>" + element + "</th>";
				orderArr_form_s.push(x[i].attributes[1].value);
            }
            for (var i = 0; i < caseid_form_s.length; i++) {
                dataElementUid_form_s += ";" + caseid_form_s[i];
            }
            console.log("dataElementUid--" + dataElementUid_form_s);
            table1_form_s = "<tr>" + table1_form_s + "</tr>"
        }

		 function myFunction_form_p(xml) {
            var i;
            var xmlDoc = xml.responseXML;

            var x = xmlDoc.getElementsByTagName("norm");
            for (i = 0; i < x.length; i++) {
                normId_form_p.push(x[i].attributes[0].value);
                var check = x[i].attributes[1].value.indexOf(";");
              if(check>=0){
			    newcaseid_form_p.push(x[i].attributes[1].value);}
              caseid_form_p.push(x[i].attributes[1].value);
                deathId_form_p.push(x[i].attributes[2].value);
                var element = x[i].attributes[3].value;
                table1_form_p = table1_form_p + "<th>" + element + "</th>";
				orderArr_form_p.push(x[i].attributes[1].value);
            }
            for (var i = 0; i < caseid_form_p.length; i++) {
                dataElementUid_form_p += ";" + caseid_form_p[i];
            }
            console.log("dataElementUid--" + dataElementUid_form_p);
            table1_form_p = "<tr>" + table1_form_p + "</tr>"
        }

		
		
		 function myFunction_form_l(xml) {
            var i;
            var xmlDoc = xml.responseXML;

            var x = xmlDoc.getElementsByTagName("norm");
            for (i = 0; i < x.length; i++) {
                normId_form_l.push(x[i].attributes[0].value);
                var check = x[i].attributes[1].value.indexOf(";");
              if(check>=0){
			    newcaseid_form_l.push(x[i].attributes[1].value);}
              caseid_form_l.push(x[i].attributes[1].value);
                deathId_form_l.push(x[i].attributes[3].value);
                var element = x[i].attributes[4].value;
                table1_form_l = table1_form_l + "<th>" + element + "</th>";
				orderArr_form_l.push(x[i].attributes[1].value);
            }
            for (var i = 0; i < caseid_form_l.length; i++) {
                dataElementUid_form_l += ";" + caseid_form_l[i];
            }
            console.log("dataElementUid--" + dataElementUid_form_l);
            table1_form_l = "<tr>" + table1_form_l + "</tr>"
        }

        
		
        function generatePeriod() {
            var d = new Date();
            var year = d.getFullYear();
            console.log("current year" + year);
            var onejan = new Date(d.getFullYear(), 0, 4);
            var week = (Math.ceil((((d - onejan) / 86400000) + onejan.getDay() + 1) / 7)) - 2; // value of last week
            console.log("week number-" + week);
            period = year + 'W' + week;
            var curr = new Date;
            var firstday = new Date(curr.setDate(curr.getDate() - curr.getDay() + 1));
            var lastday = new Date(curr.setDate(curr.getDate() - curr.getDay() + 5));
            var periodId = firstday.toString().split("::")[0];
            var periodString = " ( " + firstday.toString().split("::")[1] + " )";
            var periodDate = ((firstday.getDate()) + '-' + (firstday.getMonth() + 1) + '-' + firstday.getFullYear() + " " + "To" + " " + (lastday.getDate() + 1) + '-' + lastday.getMonth() + '-' + lastday.getFullYear());
             document.getElementById('date').innerHTML = periodDate;
        }
        
        var orgUnitID, orgUnitName;
        function getAllOU() {
            var ou_name = [], ou_id = [];
            $.get("../../../api/organisationUnits.json?field=*&paging=false", function (json) {

                for (var i = 0; i < json.organisationUnits.length; i++) {

                    ou_name.push(json.organisationUnits[i].name);
                    ou_id.push(json.organisationUnits[i].id);
                }
            })
        }
		
	

    });
	
	
	
	
	
	
function getImmediateChildren_form_s(orgid) {
    table2_form_s = [];

    $.get("../../../api/organisationUnits/" + orgid + ".json?&fields=id,name,children[id,name]", function (json) {
        var children_name;
        var children_id;
        var doingList = [];
        objList_form_s=[];
        for (var i = 0; i < json.children.length; i++) {
            children_name = json.children[i].name;
            children_id = json.children[i].id;
            objItem_form_s = {
                orgName: children_name,
                orgValue: children_id
            };
            objList_form_s.push(objItem_form_s);
            doingList.push(objItem_form_s);
        }
        $.when.apply($, doingList).then(function () {
            var schemas = arguments;
            for (var j = 0; j < schemas.length; j++) {
                console.log(schemas[j]);
                generateApi_form_s(schemas[j]).then(function (data,objItem_form_s) {
                    console.log("helo");
					console.log(objItem_form_s);
                    console.log(data);
					
					
					
					
					
                    updateRow_form_s(objItem_form_s,data);
                });
            }

	   }, function (e) {
            console.log("My ajax failed");
        });
    });
}
	
function getImmediateChildren_form_p(orgid) {
    table2_form_p = [];

    $.get("../../../api/organisationUnits/" + orgid + ".json?&fields=id,name,children[id,name]", function (json) {
        var children_name;
        var children_id;
        var doingList = [];
        objList_form_p=[];
        for (var i = 0; i < json.children.length; i++) {
            children_name = json.children[i].name;
            children_id = json.children[i].id;
            objItem_form_p = {
                orgName: children_name,
                orgValue: children_id
            };
            objList_form_p.push(objItem_form_p);
            doingList.push(objItem_form_p);
        }
        $.when.apply($, doingList).then(function () {
            var schemas = arguments;
            for (var j = 0; j < schemas.length; j++) {
                console.log(schemas[j]);
                generateApi_form_p(schemas[j]).then(function (data,objItem_form_p) {
                    console.log("helo");
					console.log(objItem_form_p);
                    console.log(data);
					
					
					
					
					
                    updateRow_form_p(objItem_form_p,data);
                });
            }

	   }, function (e) {
            console.log("My ajax failed");
        });
    });
}



	
function getImmediateChildren_form_l(orgid) {
    table2_form_l = [];

    $.get("../../../api/organisationUnits/" + orgid + ".json?&fields=id,name,children[id,name]", function (json) {
        var children_name;
        var children_id;
        var doingList = [];
        objList_form_l=[];
        for (var i = 0; i < json.children.length; i++) {
            children_name = json.children[i].name;
            children_id = json.children[i].id;
            objItem_form_l = {
                orgName: children_name,
                orgValue: children_id
            };
            objList_form_l.push(objItem_form_l);
            doingList.push(objItem_form_l);
        }
        $.when.apply($, doingList).then(function () {
            var schemas = arguments;
            for (var j = 0; j < schemas.length; j++) {
                console.log(schemas[j]);
                generateApi_form_l(schemas[j]).then(function (data,objItem_form_l) {
                    console.log("helo");
					console.log(objItem_form_l);
                    console.log(data);
					
					
					
					
					
                    updateRow_form_l(objItem_form_l,data);
                });
            }

	   }, function (e) {
            console.log("My ajax failed");
        });
    });
}




function updateRow_form_s(objItem_form_s,json) {

    console.log("objectitem"+json);
    table2_form_s += "<td>" + "<a onclick=getImmediateChildren_form_s('" + objItem_form_s.orgValue + "')>" + objItem_form_s.orgName + "</a>" + "</td>";
	
	
	
	
	/****************************************************************************************************************/
	
	if(json.rows.length>0){
	
			//	console.log("rows length--"+json.rows.length);
		
		          var result1=0;
		          var result2=0;
				  var result=[];
				  function sortArr(orderAr, attributeArr){
				  var item={};
				  item["name"]=orderAr;
				  var n = orderAr.indexOf(";");
				   if(n==-1){
					   item["name"]=orderAr;
						for(var j =0; j<json.rows.length; j++){
						if(attributeArr[j][0]==orderAr){
							item["value"]=attributeArr[j][2];
							result.push(item);
							console.log(result);
						    break;
							}
											
						}			
	}
					
					else
					{
					
					var kao= orderAr.substring(0,n);
					var kao1= orderAr.substring(n+1,orderAr.length);
					item["name"]=orderAr;
							for(var j =0; j<json.rows.length; j++){
							if(attributeArr[j][0]==kao){
							result1=attributeArr[j][2];
							/*item["value"]=attributeArr[j][2];
							result.push(item);*/
							console.log(result);
						    break;
							}
						}
							for(var j =0; j<json.rows.length; j++){
							if(attributeArr[j][0]==kao1){
							result2=attributeArr[j][2];
							/*item["value"]=attributeArr[j][2];
							result.push(item);*/
							console.log(result);
						break
						}
						}
					result3=(parseFloat(result1)+parseFloat(result2)); 
					item["value"]=result3;
					result.push(item);
					var kao1= orderAr.substring(n+1,orderAr.length );
					console.log(kao);
					console.log(kao1);
					}
					
					return result;
				}
			
				for(var i=0;i<orderArr_form_s.length;i++){
					var result = sortArr(orderArr_form_s[i], json.rows);
					console.log(result.length);
			
				}
					var items = [];
					for (var l = 0; l < result.length; l++) {

					  var item = result[l].value; 
						table2_form_s += "<td>" +item+
							"</td>";

					}
					console.log(items);
				   
					for (var i=0; i<caseid_form_s.length;i++){
					console.log("caseid"+caseid_form_s[i]);

					}}
					else{
						for (var l = 0; l < 11; l++) {
						table2_form_s += "<td>" +" "+
							"</td>";

					}
					}
					
					table2_form_s = "<tr>" + table2_form_s + "</tr>";
                    table_form_s = table1_form_s + table2_form_s;
					document.getElementById("demo_form_s").innerHTML = table_form_s;
	
	
	/************************************************************************************************************/
	
	
	
}


function updateRow_form_p(objItem_form_p,json) {

    console.log("objectitem"+json);
    table2_form_p += "<td>" + "<a style=cursor: pointer; onclick=getImmediateChildren_form_p('" + objItem_form_p.orgValue + "')>" + objItem_form_p.orgName + "</a>" + "</td>";
	
	
	
	
	/****************************************************************************************************************/
	
	if(json.rows.length>0){
	
			//	console.log("rows length--"+json.rows.length);
		
		          var result1=0;
		          var result2=0;
				  var result=[];
				  function sortArr(orderAr, attributeArr){
				  var item={};
				  item["name"]=orderAr;
				  var n = orderAr.indexOf(";");
				   if(n==-1){
					   item["name"]=orderAr;
						for(var j =0; j<json.rows.length; j++){
						if(attributeArr[j][0]==orderAr){
							item["value"]=attributeArr[j][2];
							result.push(item);
							console.log(result);
						    break;
							}
											
						}			
	}
					
					else
					{
					
					var kao= orderAr.substring(0,n);
					var kao1= orderAr.substring(n+1,orderAr.length);
					item["name"]=orderAr;
							for(var j =0; j<json.rows.length; j++){
							if(attributeArr[j][0]==kao){
							result1=attributeArr[j][2];
							/*item["value"]=attributeArr[j][2];
							result.push(item);*/
							console.log(result);
						    break;
							}
						}
							for(var j =0; j<json.rows.length; j++){
							if(attributeArr[j][0]==kao1){
							result2=attributeArr[j][2];
							/*item["value"]=attributeArr[j][2];
							result.push(item);*/
							console.log(result);
						break
						}
						}
					result3=(parseFloat(result1)+parseFloat(result2)); 
					item["value"]=result3;
					result.push(item);
					var kao1= orderAr.substring(n+1,orderAr.length );
					console.log(kao);
					console.log(kao1);
					}
					
					return result;
				}
			
				for(var i=0;i<orderArr_form_p.length;i++){
					var result = sortArr(orderArr_form_p[i], json.rows);
					console.log(result.length);
			
				}
					var items = [];
					for (var l = 0; l < result.length; l++) {

					  var item = result[l].value; 
						table2_form_p += "<td>" +item+
							"</td>";

					}
					console.log(items);
				   
					for (var i=0; i<caseid_form_p.length;i++){
					console.log("caseid"+caseid_form_p[i]);

					}}
					else{
						for (var l = 0; l < 24; l++) {
						table2_form_p += "<td>" +" "+
							"</td>";

					}
					}
					
					table2_form_p = "<tr>" + table2_form_p + "</tr>";
                    table_form_p = table1_form_p + table2_form_p;
					document.getElementById("demo_form_p").innerHTML = table_form_p;
	
	
	/************************************************************************************************************/
	
	
	
}





function updateRow_form_l(objItem_form_l,json) {

    console.log("objectitem"+json);
    table2_form_l += "<td>" + "<a onclick=getImmediateChildren_form_l('" + objItem_form_l.orgValue + "')>" + objItem_form_l.orgName + "</a>" + "</td>";
	
	
	
	
	/****************************************************************************************************************/
	
	if(json.rows.length>0){
	
			//	console.log("rows length--"+json.rows.length);
		
		          var result1=0;
		          var result2=0;
				  var result=[];
				  function sortArr(orderAr, attributeArr){
				  var item={};
				  item["name"]=orderAr;
				  var n = orderAr.indexOf(";");
				   if(n==-1){
					   item["name"]=orderAr;
						for(var j =0; j<json.rows.length; j++){
						if(attributeArr[j][0]==orderAr){
							item["value"]=attributeArr[j][2];
							result.push(item);
							console.log(result);
						    break;
							}
											
						}			
	}
					
					else
					{
					
					var kao= orderAr.substring(0,n);
					var kao1= orderAr.substring(n+1,orderAr.length);
					item["name"]=orderAr;
							for(var j =0; j<json.rows.length; j++){
							if(attributeArr[j][0]==kao){
							result1=attributeArr[j][2];
							/*item["value"]=attributeArr[j][2];
							result.push(item);*/
							console.log(result);
						    break;
							}
						}
							for(var j =0; j<json.rows.length; j++){
							if(attributeArr[j][0]==kao1){
							result2=attributeArr[j][2];
							/*item["value"]=attributeArr[j][2];
							result.push(item);*/
							console.log(result);
						break
						}
						}
					result3=(parseFloat(result1)+parseFloat(result2)); 
					item["value"]=result3;
					result.push(item);
					var kao1= orderAr.substring(n+1,orderAr.length );
					console.log(kao);
					console.log(kao1);
					}
					
					return result;
				}
			
				for(var i=0;i<orderArr_form_l.length;i++){
					var result = sortArr(orderArr_form_p[i], json.rows);
					console.log(result.length);
			
				}
					var items = [];
					for (var l = 0; l < result.length; l++) {

					  var item = result[l].value; 
						table2_form_ls += "<td>" +item+
							"</td>";

					}
					console.log(items);
				   
					for (var i=0; i<caseid_form_l.length;i++){
					console.log("caseid"+caseid_form_l[i]);

					}}
					else{
						for (var l = 0; l < 15; l++) {
						table2_form_l += "<td>" +" "+
							"</td>";

					}
					}
					
					table2_form_l = "<tr>" + table2_form_l + "</tr>";
                    table_form_l = table1_form_l + table2_form_l;
					document.getElementById("demo_form_l").innerHTML = table_form_l;
	
	
	/************************************************************************************************************/
	
	
	
}




function generateApi_form_s(objItem_form_s) {
    var _url = "../../../api/analytics.json?dimension=dx:" + dataElementUid_form_s + "&dimension=pe:" + period + "&filter=ou:" + objItem_form_s.orgValue;
    console.log(_url);
	
    var dfd = jQuery.Deferred();
    $.ajax({
        url: _url,
        success: function (data) {
            dfd.resolve(data,objItem_form_s);
        },
        timeout: 20000
    }).fail(function (xhr, status) {
        if (status == "timeout") {
            dfd.reject(status)
        }
    });

    return dfd.promise();
	//});

}

function generateApi_form_p(objItem_form_p) {
    var _url = "../../../api/analytics.json?dimension=dx:" + dataElementUid_form_p + "&dimension=pe:" + period + "&filter=ou:" + objItem_form_p.orgValue;
    console.log(_url);
   	
    var dfd = jQuery.Deferred();
    $.ajax({
        url: _url,
        success: function (data) {
            dfd.resolve(data,objItem_form_p);
        },
        timeout: 20000
    }).fail(function (xhr, status) {
        if (status == "timeout") {
            dfd.reject(status)
        }
    });

    return dfd.promise();
	//});

}

function generateApi_form_l(objItem_form_l) {
    var _url = "../../../api/analytics.json?dimension=dx:" + dataElementUid_form_l + "&dimension=pe:" + period + "&filter=ou:" + objItem_form_l.orgValue;
    console.log(_url);
   
    var dfd = jQuery.Deferred();
    $.ajax({
        url: _url,
        success: function (data) {
            dfd.resolve(data,objItem_form_l);
        },
        timeout: 20000
    }).fail(function (xhr, status) {
        if (status == "timeout") {
            dfd.reject(status)
        }
    });

    return dfd.promise();
	//});
}

 // methods for IDSP OUTBREAK
 /*   public String getPeriodIdForIDSPOutBreak()
    {
        String periodIdResult = "-1";
        String startDate = " ";
        String endDate = " ";
        try
        {
            Date toDay = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
            String toDaysDate = simpleDateFormat.format( toDay );

            int periodId = -1;

            String query = "SELECT periodid, startdate, enddate FROM period WHERE periodtypeid = 2 AND "
                + " startdate <= '" + toDaysDate + "' AND enddate >= '" + toDaysDate + "'";

            SqlRowSet rs1 = jdbcTemplate.queryForRowSet( query );
            if ( rs1 != null && rs1.next() )
            {
                periodId = rs1.getInt( 1 );
                startDate = rs1.getString( 2 );
                endDate = rs1.getString( 3 );

                // System.out.println( periodId + " : " + startDate + " : " +
                // endDate + " : " + toDaysDate );

                if ( !endDate.equalsIgnoreCase( toDaysDate ) )
                {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime( toDay );
                    cal.add( Calendar.DATE, -7 );
                    toDaysDate = simpleDateFormat.format( cal.getTime() );

                    query = "SELECT periodid, startdate, enddate FROM period WHERE periodtypeid = 2 AND "
                        + " startdate <= '" + toDaysDate + "' AND enddate >= '" + toDaysDate + "'";
                    SqlRowSet rs2 = jdbcTemplate.queryForRowSet( query );
                    if ( rs2 != null && rs2.next() )
                    {
                        periodId = rs2.getInt( 1 );
                        startDate = rs2.getString( 2 );
                        endDate = rs2.getString( 3 );
                    }
                    // System.out.println( periodId + " : " + toDaysDate );
                }

                periodIdResult = "" + periodId + "::" + startDate + " TO " + endDate;
            }
            else
            {
                Calendar cal = Calendar.getInstance();
                cal.setTime( toDay );
                cal.add( Calendar.DATE, -7 );
                toDaysDate = simpleDateFormat.format( cal.getTime() );

                query = "SELECT periodid, startdate, enddate FROM period WHERE periodtypeid = 2 AND "
                    + " startdate <= '" + toDaysDate + "' AND enddate >= '" + toDaysDate + "'";
                SqlRowSet rs2 = jdbcTemplate.queryForRowSet( query );
                if ( rs2 != null && rs2.next() )
                {
                    periodId = rs2.getInt( 1 );
                    startDate = rs2.getString( 2 );
                    endDate = rs2.getString( 3 );
                }
                periodIdResult = "" + periodId + "::" + startDate + " TO " + endDate;
            }
        }
        catch ( Exception e )
        {
            throw new RuntimeException( e );
        }

        // System.out.println( "PeriodId : " +periodIdResult );
        return periodIdResult;
    }

    public String getPeriodIdForIDSPPopulation()
    {
        String periodIdResult = "-1";

        try
        {
            Date toDay = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
            String toDaysDate = simpleDateFormat.format( toDay );

            String query = "SELECT periodid FROM period INNER JOIN periodtype ON period.periodtypeid = period.periodtypeid "+ 
							" WHERE periodtype.name LIKE 'Yearly' AND startdate <= '" + toDaysDate + "' AND enddate >= '" + toDaysDate + "'";

            SqlRowSet rs1 = jdbcTemplate.queryForRowSet( query );
            if ( rs1 != null && rs1.next() )
            {
                periodIdResult = "" + rs1.getInt( 1 );
            }
        }
        catch ( Exception e )
        {
            throw new RuntimeException( e );
        }

        // System.out.println( "PeriodId : " +periodIdResult );
        return periodIdResult;

    }

  function getAggregatedData(orgUnitIdsByComma, deIdsByComma, periodId )
    {
      var aggData = 0;

      
            String query = "SELECT SUM( CAST( value AS DECIMAL) ) FROM datavalue " + " WHERE sourceid IN (" + orgUnitIdsByComma + ") AND "
                + " dataelementid IN (" + deIdsByComma + ") AND " + " periodid = " + periodId;

            SqlRowSet rs1 = jdbcTemplate.queryForRowSet( query );

            if ( rs1 != null && rs1.next() )
            {
                double temp = rs1.getDouble( 1 );

                aggData = (int) temp;
            }
        
   
        return aggData;
    }*/

  // function getConfirmedCount( String orgUnitIdsByComma, String dataSetId, String periodId )
  /* function getConfirmedCount(orgUnitIdsByComma, dataSetId, periodId )
    {
        var confirmedCount = 0;

       // String query = "SELECT COUNT(*) FROM completedatasetregistration " + " WHERE sourceid IN ("
          //      + orgUnitIdsByComma + ") AND " + " datasetid = " + dataSetId + " AND " + " periodid = " + periodId;
		  
		  $.get("../api/analytics?dimension=dx:"+dataElementUid_form_s+"&dimension=pe:2016W16&dimension=ou:q24rstddbGh&aggregationType=COUNT"

            SqlRowSet rs1 = jdbcTemplate.queryForRowSet( query );

            if ( rs1 != null && rs1.next() )
            {
                double temp = rs1.getDouble( 1 );

                confirmedCount = (int) temp;
            }
        }
        catch ( Exception e )
        {
            throw new RuntimeException( e );
        }

        return confirmedCount;
    }

  /*  public String getRAFolderName()
    {
        return reportService.getRAFolderName();
    }
}
*/
