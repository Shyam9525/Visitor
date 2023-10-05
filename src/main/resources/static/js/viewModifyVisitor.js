document.onkeydown = function(){
  switch (event.keyCode){
        case 116 : //F5 button
            event.returnValue = false;
            event.keyCode = 0;
            return false;
        case 82 : //R button
            if (event.ctrlKey){ 
                event.returnValue = false;
                event.keyCode = 0;
                return false;
            }
    }
}
function validateVisitorDetails(){
	
	$("#saveVisitorRegistrationModel").modal();

}

function updatevisitorDetails(){
	
    document.visitorDetails.action = "viewAndModify?modify";
	document.visitorDetails.target = "_self";
	document.visitorDetails.submit();
}