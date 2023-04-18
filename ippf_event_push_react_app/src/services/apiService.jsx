import { BaseUrl } from '../services/BaseUrlService';
export const ApiService = {
    updateEnrollmentStatus,
    getEvents,
    getOptionSetOptions,
    getTrackedEntityInstanceDetails,
    getTrackedEntityInstance,
    newEnrollmentTEI,
    createNewEnrollment,
    getProgram,
    getProgramStage,
    getDataElements,
    getTrackedEntityInstances,
    postEvent,
    getUserData,
    getMetaData,
    getProgramRules,
    getProgramDetials,
    getDetials,
    getProgramTEIAttribute
};

// update enrollment Status
function updateEnrollmentStatus(enrollment) {
    const requestOptions = {
        method: 'PUT',
        body: JSON.stringify(enrollment),
        headers: {
            'Content-Type': 'application/json'}
    };
    return fetch( BaseUrl + '/api/enrollments/'+ enrollment.enrollment, requestOptions).then(res => res.json());
}

// new enrollment creation
function createNewEnrollment(enrollment) {
    const requestOptions = {
        method: 'POST',
        body: JSON.stringify(enrollment),
        headers: {
            'Content-Type': 'application/json'}
    };
    return fetch( BaseUrl + '/api/enrollments', requestOptions).then(res => res.json());
}

// update new TEI
function newEnrollmentTEI(trackedEntityInstance) {
    const requestOptions = {
        method: 'PUT',
        body: JSON.stringify(trackedEntityInstance),
        headers: {
            'Content-Type': 'application/json'}
    };
    return fetch( BaseUrl + '/api/trackedEntityInstances/'+ trackedEntityInstance.trackedEntityInstance, requestOptions).then(res => res.json());
}

// get events
function getEvents(eventParam) {
    const requestOptions = { method: 'GET' };
    return fetch( BaseUrl + '/api/events.json?program=' + eventParam.programId + '&orgUnit=' + eventParam.orgUnitId + '&ouMode=DESCENDANTS&paging=false', requestOptions).then(res => res.json());
}

// get trackedEntityInstance and its enrollments
function getTrackedEntityInstanceDetails(tei) {
    const requestOptions = { method: 'GET' };
    return fetch(BaseUrl + '/api/trackedEntityInstances/' + tei + '.json?fields=*&paging=false', requestOptions).then(res => res.json());
}

// get trackedEntityInstance and its enrollments
function getTrackedEntityInstance(tei) {
    const requestOptions = { method: 'GET' };
    return fetch(BaseUrl + '/api/trackedEntityInstances/' + tei + '.json', requestOptions).then(res => res.json());
}

// get optionSet's options
function getOptionSetOptions(id) {
    const requestOptions = { method: 'GET' };
    return fetch(BaseUrl + '/api/optionSets/' + id + '.json?fields=id,displayName,options[id,displayName,code]&paging=false', requestOptions).then(res => res.json());
}

function getProgram(id) {
    const requestOptions = { method: 'GET' };
    return fetch(BaseUrl + '/api/organisationUnits/' + id + '.json?fields=id,name,displayName,programs[id,name,displayName,code,withoutRegistration,attributeValues[value,attribute[id,name,code]]]&paging=false', requestOptions).then(res => res.json());
}

function getProgramStage(id) {
    const requestOptions = { method: 'GET' };
    return fetch(BaseUrl+"/api/programs/"+id +".json?fields=id,displayName,name,programStages[id,name,displayName,code]&paging=false", requestOptions).then(res => res.json());
}

function getDataElements(id) {
    const requestOptions = { method: 'GET' };
    return fetch( BaseUrl+"/api/programStages/"+id+".json?fields=id,displayName,name,programStageSections[id,name,displayName,dataElements[id,name,valueType,displayFormName,optionSetValue,optionSet[id,name,valueType,options[id,name,code,valueType]]]]&paging=false", requestOptions).then(res => res.json());
}

function getTrackedEntityInstances(data) {
    const requestOptions = { method: 'GET' };
    return fetch( BaseUrl + '/api/trackedEntityInstances.json?paging=false&fields=*&program=' + data.program + '&ou=' + data.ou + '', requestOptions).then(res => res.json());
}

function postEvent(event) {
    const requestOptions = { 
         method: 'POST',
         body: JSON.stringify(event), 
         headers: {
                'Content-Type': 'application/json'}
                };
    return fetch( BaseUrl + '/api/events', requestOptions).then(res => res.json());
}

function getUserData() {
    const requestOptions = { method: 'GET'};
    return fetch( BaseUrl + '/api/me.json?paging=false&fields=organisationUnits,userGroups,userCredentials[username]', requestOptions).then(res => res.json());
}

function getMetaData() {
    const requestOptions = { method: 'GET'};
    return fetch( BaseUrl + '/api/metadata.json?paging=false&fields=children,condition,code,dataElement,displayName,formName,id,name,options,organisationUnits,path,priority,program,programRuleActions[programRuleActionType,dataElement,optionGroup,content,trackedEntityAttribute,programStageSection,data],programStage,programStages[id,displayName,access,programStageDataElements[dataElement[id],compulsory],programStageSections[id,name,displayName,renderType,dataElements[id,displayFormName,code,valueType,optionSetValue,optionSet]]],trackedEntityTypeAttributes[name,id,displayName,valueType,unique,optionSetValue,optionSet,mandatory,trackedEntityAttribute[name,id,displayName,valueType,unique,optionSetValue,optionSet]],value&order=level:asc&constants=true&dataElements=true&optionGroups=true&options=true&optionSets=true&organisationUnits=true&programRules=true&programRuleVariables=true&programs=true&trackedEntityTypes=true', requestOptions).then(res => res.json());
}

function getProgramRules() {
    const requestOptions = { method: 'GET'};
    return fetch( BaseUrl + '/api/programRules.json?fields=id,name,condition,displayName,program[id,name],programRuleActions[programRuleActionType,dataElement[id,name,valueType]]&paging=false', requestOptions).then(res => res.json());
}

function getProgramDetials(id) {
    const requestOptions = { method: 'GET'};
    return fetch( BaseUrl + '/api/programs/'+id+'.json?fields=name,id,displayName,programRuleVariables[id,name,displayName,dataElement[id,name,displayName],program[id,name,displayName]],programStages[id,name,displayName,access,programStageDataElements[compulsory,dataElement[id,displayName,name,valueType]],programStageSections[id,name,displayName,dataElements[id,name,valueType,displayFormName,optionSetValue,optionSet[id,name,valueType,options[id,name,valueType]]]]&paging=false', requestOptions).then(res => res.json());
}
  
// get data using programStageSections id
function getDetials(id ) {
    console.log('here is id',id)
    const requestOptions = { method: 'GET'};
    return fetch( BaseUrl + '/api/programStageSections/'+id+'.json?fields=programStage[id,name,displayName,programStageDataElements[compulsory,dataElement[id,name,displayName]],program[id,name,programRuleVariables[id,name,displayName,dataElement[id,name,valueType,optionSet[id,name,displayName,options[id,name,displayName]]]]]],dataElements[optionSetValue,valueType,displayName,id,formName,optionSet[id,name,displayName,options[id,name,displayName]]]&paging=false', requestOptions).then(res => res.json());
}

// get data using programStageSections id
function getProgramTEIAttribute(id ) {
    console.log('here is id',id);
    const requestOptions = { method: 'GET'};
    return fetch( BaseUrl + '/api/programs/'+id+'.json?fields=id,displayName,programTrackedEntityAttributes[mandatory,displayInList,valueType,optionSetValue,optionSet[id,name,valueType,options[id,name,valueType]],trackedEntityAttribute[id,displayName]]&paging=false', requestOptions).then(res => res.json());
}