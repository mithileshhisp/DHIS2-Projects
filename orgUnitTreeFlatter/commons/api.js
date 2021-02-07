


/***********
 * 
 * This file contains function to interact with the api
 * 
 * @author Ramón José Jiménez Pomareta
 * @version 6
 * @date 16.09.2020
 * 
 * version 6: getAndBuildOrgUnitTree gets also code
 * version 5: new  getAggregateEvents and addParam functions
 * 
 * earlier:
 * new: getNumberOfDivisions
 *      dataValueSets
 *  */       

var BASE_URL = "../../..";
var API_URL = BASE_URL + "/api/";
var ORG_UNITS = "organisationUnits";
var EVENTS = "events";
var AGGREGATE_EVENTS = "analytics/events/aggregate";
var QUERY_EVENTS = "analytics/events/query";
var RESOURCES = "resources";
var DATAVALUESETS = "dataValueSets"
var DATASETS = "dataSets"
var PROGRAMS = "programs"
var ME = "me";
var SHARING = "sharing";
var USERS = "users";
var parameters = "?preheatMode=REFERENCE&importReportMode=DEBUG";
var LEVEL = "LEVEL-";
var SQLVIEWS = "sqlViews";
var TASK = "system/tasks/";
var SKIP_META = true;
var SKIP_PAGING = true;

var POST = "POST";
var PATCH = "PATCH";
var PUT = "PUT";

var AGGR_TYPE = {
    SUM : "SUM",
    AVERAGE : "AVERAGE",
    AVERAGE_SUM_ORG_UNIT : "AVERAGE_SUM_ORG_UNIT",
    LAST : "LAST",
    LAST_AVERAGE_ORG_UNIT : "LAST_AVERAGE_ORG_UNIT",
    FIRST : "FIRST", // may not be supported for aggregate event
    FIRST_AVERAGE_ORG_UNIT : "FIRST_AVERAGE_ORG_UNIT", // may not be supported for aggregate event
    COUNT : "COUNT",
    STDDEV : "STDDEV",
    VARIANCE : "VARIANCE",
    MIN : "MIN",
    MAX : "MAX",
    NONE : "NONE",
    CUSTOM : "CUSTOM",
    BY_DE : "DEFAULT"
}

var OUTPUT_TYPE = {
    EVENT: "EVENT",
    ENROLLMT : "ENROLLMENT",
    TEI: "TRACKED_ENTITY_INSTANCE"
}

    /****************************************************************************************************
 	 **********                    	    FUNCTIONS CALLING THE API         	           	       **********
	 ****************************************************************************************************/

	function getAndBuildOrgUnitTree(tree, id, level, maxLevel, fields){//, progressBarAdd){
        
        if (level<=maxLevel){
            var params = {
                level : level,
                fields: fields,
                paging: "false"
            }
            var builtUrl = buildAPIUrl("organisationUnits/"+id, params);

            
            return $.ajax({
                url: builtUrl,
                
            }).then(function(data) {

                for (var i=0; i<data.organisationUnits.length; i++){
                    tree.add(data.organisationUnits[i].id, data.organisationUnits[i].code, data.organisationUnits[i].displayName, data.organisationUnits[i].parent.id, tree.traverseBF);
                }
//                progressBarAdd(100/(variableTasksForTimer+fixedTaskForTimer));

                return getAndBuildOrgUnitTree(tree, id, level+1, maxLevel, fields);//, progressBarAdd);
    
            });
        } else {
  //          progressBarAdd(100/(variableTasksForTimer+fixedTaskForTimer));

            return tree;
        }
        
    }

    function getNumberOfDivisions(lvl, fields){
		var params = {
			level : lvl,
			fields: fields,
            paging: "false"
		}
		var builtUrl = buildAPIUrl(ORG_UNITS, params);

		
		return $.ajax({
			url: builtUrl
			
		}).then(function(data) {
            return data;
		});
    }
    
    /**
     * 
     * @param {*} id the id of the orgUnit
     * @param {*} lvl the level under the orgUnit
     * @param {*} fields the fields to show of the subdivisions
     */
    function getNumberOfDivisionsFor(id, lvl, fields){
		var params = {
			level : lvl,
			fields: fields,
            paging: "false"
		}
		var builtUrl = buildAPIUrl(ORG_UNITS + "/"+ id, params);

		
		return $.ajax({
			url: builtUrl
			
		}).then(function(data) {
            return data;
		});
    }

    function mergeButKeepFirst(priorityArray, secondArray){
        
        if (typeof secondArray !== 'undefined' && secondArray !==null){
            for (var i=0;i<secondArray.length;i++){
                var exists = false;
                for (var j=0;j<priorityArray.length;j++){
                    if (secondArray[i].id.localeCompare(priorityArray[j].id)==0){
                        exists = true;
                        j = priorityArray.length;
                    }
                }
                if (!exists){
                    priorityArray.push(secondArray[i]);
                }
            }
        }
        return priorityArray;
    }

    function updateSharingStatus(type, id, payload){
        (function (_type, _id, _payload) {
            $.when(getSharingStatus(_type, _id))
            .done(function(answer){
                _payload.object.userGroupAccesses = mergeButKeepFirst(_payload.object.userGroupAccesses, answer.userGroupAccesses);
                _payload.object.userAccesses = mergeButKeepFirst(_payload.object.userAccesses, answer.userAccesses);
                setSharingStatus(_type, _id, _payload);
            });
        })(type, id, payload);
    }

    function setSharingStatus(type, id, object){
        var params = {
			type: type,
            id: id
		}
        var builtUrl = buildAPIUrl(SHARING, params);
        console.log ("POST: "+builtUrl);
        console.log (object);
        return $.ajax({
            url: builtUrl,
            type: 'POST',
            dataType: 'json',
            //   processData: false,
            contentType: 'application/json',
            data: JSON.stringify(object)
            
        }).done(function(data) {
            console.log("done");
            console.log(data);
            return data;
        }).fail(function(data) {
            console.log(data);
            return data;
        });
    }

    function getSharingStatus(type, id){
        var params = {
			type: type,
            id: id
		}
        var builtUrl = buildAPIUrl(SHARING, params);
        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data.object;
        });
    }

    function getObjectWithDependencies(type,id){

        var builtUrl = buildAPIUrl(type+"/"+id+"/metadata.json");

        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });
    }
    function updateByID(resource, id, payload, callback){
        var builtUrl = buildAPIUrl(resource);
        builtUrl += "/"+id;
        $.ajax({
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            url: builtUrl,
            type: 'PUT',
            dataType: 'json',            
            data: payload
            
        }).then(function(data) {
            callback(data);
        });
    }

    function deleteEvent(id, callback){
        var builtUrl = buildAPIUrl(EVENTS);
        builtUrl += "/"+id;
        return $.ajax({
            url: builtUrl,
            type: 'DELETE'
            
        }).then(function(data) {
            callback();
            return data;
        });
    }

    function getEventsByProgram(program, orgUnit, extraParams, skipPaging, antiCache){
        var params = {
			program: program,
            orgUnit: orgUnit
        }
        
        //for backwards compatibility
        if (typeof skipPaging !== 'undefined') {
            params.skipPaging = skipPaging;
        } else {
            params.skipPaging = true;
        }

        //for backwards compatibility
        if (typeof antiCache !== 'undefined') {
            if (antiCache){
                params.antiCache = Date.now();
            }
        } 

        var builtUrl = buildAPIUrl(EVENTS, params);
        builtUrl += extraParams;
        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });

    }    

    /**
     * Gets aggregate event data
     * @param {*} program the ID of the program
     * @param {*} dimensions an array of dimensions {<type>,<item-id>} or dimension filter{<item-id>,<operator>,<filter>}
     *                         check https://docs.dhis2.org/2.30/en/developer/html/webapi_analytics.html#webapi_analytics_dimensions_and_items
     * @param {*} value the dataElement ID
     * @param {*} filters an array of filters {<item-id>,<operator>,<filter>}
     *                         check https://docs.dhis2.org/2.30/en/developer/html/webapi_event_analytics.html#webapi_event_analytics_request_query_parameters
     * @param {*} aggregationType one of the types of AGGR_TYPE
     * @param {*} skipPaging true or false
     * @param {*} skipMeta true or false
     * @param {*} outputType one of the types of OUTPUT_TYPE
     * @param {*} extraParams 
     */
    function getAggregateEvents(program, dimensions, value, filters, aggregationType, skipPaging, skipMeta, outputType, extraParams){

        var params = {
            program: program,
            aggregationType: aggregationType,
            skipPaging: skipPaging,
            skipMeta: skipMeta,
            outputType: outputType

        }
        if (value != null) {
            params.value = value;
        }

        var builtUrl = buildAPIUrl(AGGREGATE_EVENTS + '/' + program, params);

        if (Array.isArray(dimensions)){
            Object.keys(dimensions).forEach(function (dim) {
                var dimensionParam = "";
                for (var i =0; i<dimensions[dim].length; i++){
                    dimensionParam +=  dimensions[dim][i] + ":";
                }
                // removes last :
                dimensionParam = dimensionParam.slice(0, -1); 
                builtUrl += addParam({dimension: dimensionParam});
            });
        }
      
        if (Array.isArray(filters)){
            Object.keys(filters).forEach(function (filter) {
                var filterParam = "";
                for (var i =0; i<filters[filter].length; i++){
                    filterParam +=  filters[filter][i] + ":";
                }
                // removes last :
                filterParam = filterParam.slice(0, -1); 
                builtUrl += addParam({filter: filterParam});
            });
        }

        if (typeof extraParams !== 'undefined') {
            builtUrl += extraParams;
        }

        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });

    }

    /**
     * Gets query event data
     * @param {*} program the ID of the program
     * @param {*} dimensions an array of dimensions {<type>,<item-id>} or dimension filter{<item-id>,<operator>,<filter>}
     *                         check https://docs.dhis2.org/2.30/en/developer/html/webapi_analytics.html#webapi_analytics_dimensions_and_items
     * @param {*} dimensions an array of filters {<item-id>,<operator>,<filter>}
     *                         check https://docs.dhis2.org/2.30/en/developer/html/webapi_event_analytics.html#webapi_event_analytics_request_query_parameters
     * @param {*} outputType one of the types of OUTPUT_TYPE
     * @param {*} extraParams 
     */
    function getQueryEvents(program, dimensions, filters, outputType, extraParams){

        var params = {
            outputType: outputType
        }

        var builtUrl = buildAPIUrl(QUERY_EVENTS + '/' + program, params);

        if (Array.isArray(dimensions)){
            Object.keys(dimensions).forEach(function (dim) {
                var dimensionParam = "";
                for (var i =0; i<dimensions[dim].length; i++){
                    dimensionParam +=  dimensions[dim][i] + ":";
                }
                // removes last :
                dimensionParam = dimensionParam.slice(0, -1); 
                builtUrl += addParam({dimension: dimensionParam});
            });
        }

        if (Array.isArray(filters)){
            Object.keys(filters).forEach(function (filter) {
                var filterParam = "";
                for (var i =0; i<filters[filter].length; i++){
                    filterParam +=  filters[filter][i] + ":";
                }
                // removes last :
                filterParam = filterParam.slice(0, -1); 
                builtUrl += addParam({filter: filterParam});
            });
        }

        if (typeof extraParams !== 'undefined') {
            builtUrl += extraParams;
        }

        return $.ajax({
            url: builtUrl,
            type: 'GET'

        }).then(function(data) {
            return data;
        });

    }
    
    function getByID(resource, id){

      
        var builtUrl = buildAPIUrl(resource);
        builtUrl += "/"+id;
        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });
    }


    function get(resource, fields){

        var params = {
			fields: fields,
            paging: "false"
		}
        var builtUrl = buildAPIUrl(resource, params);

        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });
    }

    function getv2(resource, params){
        

        var builtUrl = buildAPIUrl(resource, params);

        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });
    }
    /**
     * 
     * @param {string} a valid DHIS2 endonpoint 
     * @param {object} an object including parameters 
     * @param {string} including & characters 
     */
    function getv3(resource, params, extraParams){
        

        var builtUrl = buildAPIUrl(resource, params);

        if (typeof extraParams !== 'undefined') {
            builtUrl += extraParams;
        }

        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });
    }


    function getTaskStatus(id, type){
        return getv2(TASK + type + "/"+ id);
    }

    function getArrayOfIDs(quantity){

        var builtUrl = buildAPIUrl("system/id?limit="+quantity);
        
        return $.ajax({
            url: builtUrl,
            type: 'GET'
            
        }).then(function(data) {
            return data;
        });
    }

  
    function deleteOrgUnit(id){
        var builtUrl = buildAPIUrl(ORG_UNITS);
        builtUrl += "/"+id;
        return $.ajax({
            url: builtUrl,
            type: 'DELETE'
            
        }).then(function(data) {
            return data;
        });
    }

    function sendObjectTo(endpoint, object, mode) {

        var builtUrl = buildAPIUrl(endpoint);
        console.log (mode + ": "+builtUrl);
        console.log (object);
        return $.ajax({
            url: builtUrl,
            async: false,
            type: mode,
            dataType: 'json',
            //   processData: false,
            contentType: 'application/json',
            data: JSON.stringify(object)
            
        }).done(function(data) {
            console.log(mode + " OK");
        }).fail(function(data) {
            console.log(mode + " ERROR");
            console.log(data);
        }).then(function(data) {
            return data;
        });
    }


    function updateUser(userId, details, roles, dcmOU, doaOU, userGroups, restrictions, mode, callback) {
        $.when(getByID(USERS, userId))
        .done(function(userRes){
            if (mode == MODE_UPDATE){

                userRes.organisationUnits = userRes.organisationUnits.concat(dcmOU);
                userRes.dataViewOrganisationUnits = userRes.dataViewOrganisationUnits.concat(doaOU);
                userRes.userGroups = userRes.userGroups.concat(userGroups);
                userRes.userCredentials.userRoles = userRes.userCredentials.userRoles.concat(roles);

            } else if (mode == MODE_SET) {
                userRes.organisationUnits = dcmOU;
                userRes.dataViewOrganisationUnits = doaOU;
                userRes.userGroups = userGroups;
                userRes.userCredentials.userRoles = roles;
            } else if (mode == MODE_DELETE){

            }

            updateByID(USERS, userId, JSON.stringify(userRes), callback);
        
        });
    }




     /*
    * Accepts callbacks on positions 0 for success and 1 for fail
    */
    function sendFile(endpoint, formData, callbacks){
        var builtUrl = buildAPIUrl(endpoint);
        return $.ajax({
            url: builtUrl,
            beforeSend: function(xhr) { 

            },
            type: 'POST',
            dataType: false,
            contentType:false, // jQuery will generate multipart
            processData: false,
            data: formData
            
        }).then(function(data) {
            console.log("file upload success");
            console.log(data);
            console.log(arguments);

            if (callbacks.length > 1){
                callbacks[0](data, callbacks[1]);
            }
            

        }).fail(function(data) {
            console.log("file upload failed");
            console.log(data);
            if (callbacks.length > 2){
                callbacks[2](data);
            }
        });
    }

    var prepareFile = function (endpoint, file, callback){

        var formData = new FormData();
        // This should automatically set the file name and type.
        formData.append('file', file,  file.name);
        var clonedArray = Array.prototype.slice.call(arguments);
        clonedArray.splice(0,3); // removes first three arguments
        callback(endpoint, formData, clonedArray);
    
    }
    



    /***************************** AUXILIARY FUNCTIONS ********************* */
        
    // Allows to add already existing parameters
    function addParam(param){
        return "&" + decodeURIComponent($.param(param, true));
    }

    function buildAPIUrl(page, params){
        if(params!== null && params !=undefined){
		    return API_URL+page+"?"+$.param(params, true);
        } else {
		    return API_URL+page;
        }
	}