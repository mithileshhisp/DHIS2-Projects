/***********
 * 
 * This file contains function to create tables easily
 * 
 * @author Ramón José Jiménez Pomareta
 * @version 1
 * @date 12.02.2018
 * 
 * 
 */       
function emptyTable(id){
    $("#"+id).empty();
}

function addTableHeader (id, array){

    var table = document.getElementById(id);
    var header = table.createTHead();
    var row = header.insertRow(0);

    var cell;
    for (var i = 0; i<array.length; i++) {
        cell = row.insertCell(i);
        cell.outerHTML = "<th>" + array[i] + "</th>";
    }
}

function addTableBody (id){
    var tBody = document.createElement ("tbody");
    var table = document.getElementById(id);
    table.appendChild (tBody);
}    


function addTableRow (id, array){
    var table = document.getElementById("fileTable");
    var row = table.tBodies[0].insertRow(0);
    var cell;
    for (var i = 0; i<array.length; i++) {
        cell = row.insertCell(i);
        cell.innerHTML = array[i];
    }

}