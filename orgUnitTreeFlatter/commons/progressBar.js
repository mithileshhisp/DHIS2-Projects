var progressTimer;
var progressbar; 
var progressLabel; 
var dialogButtons; 
var dialog; 
var dialog_confirm;

var DETERMINATE = 0;
var INDETERMINATE = 1;

function initializeProgressBar(progressBarID, dialogID, dialogConfirmID, confirmFunction, cancelFunction){
    progressbar = $( "#" + progressBarID ); 
    progressLabel = $( ".progress-label" );
    dialogButtons = [{
        text: "Close this window",
        click: closeProgressBar
    }];

    dialog = $( "#" + dialogID ).dialog({
        autoOpen: false,
        closeOnEscape: false,
        resizable: false,
        buttons: dialogButtons,
        open: function() {
            progressTimer = setTimeout( progressBarAdd, 1000);
        }
    }) ;

    dialog_confirm = $( "#" + dialogConfirmID ).dialog({
        autoOpen: false,
        closeOnEscape: false,
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "Proceed uploading events": function() {
                confirmFunction();
                $( this ).dialog( "close" );
            },
            Cancel: function() {
                cancelFunction();
                $( this ).dialog( "close" );
            }
        }
    });

    progressbar.progressbar({
        value: false,
        change: function() {
            progressLabel.text( "Current Progress: " + precisionRound(progressbar.progressbar( "value" ), 1) + "%" );
        },
        complete: function() {
            variableTasksForTimer = 0;
            fixedTaskForTimer = 0;
            progressLabel.text( "Complete!" );
            dialog.dialog( "option", "buttons", [{
            text: "Close",
            click: closeProgressBar
            }]);
            $(".ui-dialog button").last().trigger( "focus" );
        }
    });
}

function openEventUploadConfirmation(){
    dialog_confirm.dialog( "open" );
}
function openProgressBar(mode) {
    if (mode == INDETERMINATE) {
        progressbar.progressbar( "value", false );        
    } else {
        progressbar.progressbar( "value", 0 );                
    }
    dialog.dialog( "open" );
}


function closeProgressBar() {
    clearTimeout( progressTimer );
    dialog
        .dialog( "option", "buttons", dialogButtons )
        .dialog( "close" );
    progressbar.progressbar( "value", false );
    progressLabel
        .text( "Starting process..." );
}


function progressBarAdd(percentage) {
    var val = progressbar.progressbar( "value" ) || 0;

    if (typeof percentage !== "undefined") {
        percentage =  Math.ceil(percentage * 10) / 10; 
        progressbar.progressbar( "value", val + percentage );
    }

    if ( val <= 99 ) {
        progressTimer = setTimeout( progressBarAdd, 1000 );
    }
}