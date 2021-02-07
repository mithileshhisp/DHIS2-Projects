    /***********
 * 
 * This file contains useful functions
 * 
 * @author Ramón José Jiménez Pomareta
 * @version 5
 * 
 * @date 05.11.2019
 * @version 6
 * new function formatIntValue
 * 
 * @date 13.06.2019
 * @version 5
 * changes:
 *  new generateMonthlyPeriodsForYear function
 * 
 * @date 12.03.2019
 * @version 4.1
 * changes:
 *  parseValue can also be passed as string instead as function
 * 
 * @date 14.02.2019
 * @version 4
 * changes:
 *  added parseValue and expectedValueType optional parameters to createEventDataValue and createDataValue functions
 * 
 * @date 07.11.2018
 * changes: ++ addValueToEvent
 *                  createEvent
 *                  createEventDataValue
 *                  createDataValue
 * @date 13.02.2018
 * changes: ++ do Nothing function
 * 
 */     
    const units = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    
    var JAN = 0,
    FEB = 1,
    MAR = 2,
    APR = 3,
    MAY = 4,
    JUN = 5,
    JUL = 6,
    AUG = 7,
    SEP = 8,
    OCT = 9,
    NOV = 10,
    DEC = 11;

    var FIRST_MONTH = JAN;
    var LAST_MONTH = DEC;

    var monthNumbers = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

    var ERROR_VALUE_TYPE_NOT_EXPECTED = "The format of the data was not correct.";

    var DEFAULT_FALSE = false;
    var DEFAULT_TRUE = true;

    
	var SAME = 0;
	var ROUND = 1;
    var FLOOR = 2;
    var CEIL = 3;

    var INTEGER_FORMAT = 0;
    var LOCALE_FORMAT = 1;

    function niceBytes(x){
      let l = 0, n = parseInt(x, 10) || 0;
      while(n >= 1024){
          n = n/1024;
          l++;
      }
      return(n.toFixed(n >= 10 || l < 1 ? 0 : 1) + ' ' + units[l]);
    }

    function precisionRound(number, precision) {
        var factor = Math.pow(10, precision);
        return Math.round(number * factor) / factor;
      }
      
    function doNothing(){

    }

    function returnValue(val){
        return val;
    }


    function addValueToEvent(event, value){
        
        if(!event.hasOwnProperty("dataValues")){
            event.dataValues = [];
        }

        event.dataValues.push(value);
        return event;
    }


    function booleanToYesNo(text){
        var YES = "Yes";
        var NO = "No";

        var textString = String(text);
        
        switch(textString){
            case "0": 
                return NO;
            case "1":
                return YES;
            case "false":
                    return NO;
            case "true" :
                return YES;
            default:
                return text;
        }
    }

    /**
     * 
     * @param {*} text Expected text = true, false, 0 or 1 or numbers 0 or 1
     * @param {*} defaultAction what to do in case of other text
     */
    function booleanToTrueFalse(text, defaultAction){

        var textString = String(text);
        
        switch(textString){
            case "0": 
                return false;
            case "1":
                return true;
            case "false":
                    return false;
            case "true" :
                return true;
            default:
                return defaultAction;
        }
    }

    function createEvent(program, period, orgUnit){
        var event = new Object();
        event.program = program;      
        event.orgUnit = orgUnit;
        event.eventDate = period;
        return event;
    }

    /**
     * Generates a string of all months for a particular year
     * @param {*} year the year
     * @param {*} separator ";" for aggregated requests, or empty 
     */
    function generateMonthlyPeriodsForYear(year, separator){
        var monthlyPeriods = "";

        for (var i = 0; i < monthNumbers.length; i++){
            monthlyPeriods += year + monthNumbers[i] + separator;
        }
        return monthlyPeriods.slice(0, -1); // removes last separator

    }

    /*
    * (opt) parseValue a function that converts from data source to an expected value type
    * (opt) expectedValueType the expected javascript type value
    */
    function createEventDataValue(dataElement, value, parseValue, expectedValueType){
        var dataValue = new Object();
        dataValue.dataElement = dataElement;
        if(typeof parseValue == 'function') { 
            dataValue.value = parseValue(value);
        } else if(typeof parseValue == 'string') { 
            dataValue.value = window[parseValue](value); // the parseValue function is passed as string
        } else {
            dataValue.value = value;
        }

        if (typeof expectedValueType !== 'undefined') {
            
            if (typeof dataValue.value !== expectedValueType) {
                return ERROR_VALUE_TYPE_NOT_EXPECTED;
            } else {
                return dataValue;
            }
            
        } else {
            return dataValue;
        }

    }

    
    /*
    * (opt) parseValue a function that converts from data source to an expected value type
    * (opt) expectedValueType the expected javascript type value
    */
    function createDataValue(dataElement, period, orgUnit, value, parseValue, expectedValueType){
        var dataValue = new Object();
        dataValue.dataElement = dataElement;
        dataValue.period = period;
        dataValue.orgUnit = orgUnit;
        dataValue.value = value;

        if(typeof parseValue == 'function') { 
            dataValue.value = parseValue(value);
        } else if(typeof parseValue == 'string') { 
            dataValue.value = window[parseValue](value); // the parseValue function is passed as string
        } else {
            dataValue.value = value;
        }

        if (typeof expectedValueType !== 'undefined') {
            
            if (typeof dataValue.value !== expectedValueType) {
                return ERROR_VALUE_TYPE_NOT_EXPECTED;
            } else {
                return dataValue;
            }
            
        } else {
            return dataValue;
        }

    }

    /**
     * 
     * @param {*} subNLevel the (sub)national level. 0 = national, 1 = first subnational level
     */
    function subNationalLevelToAbs(subNLevel){
        return parseInt(subNLevel) + 3;
    }

    /**
     * 
     * @param {*} value an integer, number or string value
     * @param {*} roundMode SAME, ROUND, FLOOR or CEIL
     * @param {*} outputMode INTEGER_FORMAT / LOCALE_FORMAT
     * @returns integer (or the non-number-convertible string value)
     */
    function formatIntValue(value, roundMode, outputMode){

        var roundFx = returnValue;
        switch(roundMode){
            case ROUND:
                roundFx = Math.round;
                break;
            case FLOOR:
                roundFx = Math.floor;
                break;
            case CEIL:
                roundFx = Math.ceil;
                break;
        }

        var test_value = Number(value);
        if (outputMode == INTEGER_FORMAT) {
            return isNaN(test_value) ?  value : roundFx(test_value); 
        } else {
            return isNaN(test_value) ?  value : roundFx(test_value).toLocaleString(); 
        }
      
    }