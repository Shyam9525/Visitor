function validateRegistrationForm(){
	
	
	var f = true;
	
	if($("#visitorName").val()=='' || $("#visitorName").val()=="" || $("#visitorName").val()==null){
		swal("Enter Visitor Name.","","error");
		f = false;
		return false;
	}else if($("#visitorMobileNo").val()=='' || $("#visitorMobileNo").val()=="" || $("#visitorMobileNo").val()==null){
		swal("Enter Visitor Mobile Number.","","error");
		f = false;
		return false;
	}
	
	else if($("#idType").val()=='' || $("#idType").val()=="" || $("#idType").val()==null || $("#idType").val()=='0'){
		swal("Select ID Type.","","error");
		f = false;
		return false;
	}
	
	else if($("#idNumber").val()=='' || $("#idNumber").val()=="" || $("#idNumber").val()==null){
		swal("Select ID Number.","","error");
		f = false;
		return false;
	}
	
	else if($("#department").val()=='' || $("#department").val()=="" || $("#department").val()==null || $("#department").val()=='0'){
		swal("Select Department.","","error");
		f = false;
		return false;
	}
	
	else if($("#hostName").val()=='' || $("#hostName").val()=="" || $("#hostName").val()==null || $("#hostName").val()=='0'){
		swal("Select Host Name.","","error");
		f = false;
		return false;
	}
	
	else if($("#purpose").val()=='' || $("#purpose").val()=="" || $("#purpose").val()==null || $("#purpose").val()=='0'){
		swal("Select Visit Perpose.","","error");
		f = false;
		return false;
	}
	
	else if($("#visitDuration").val()=='' || $("#visitDuration").val()=="" || $("#visitDuration").val()==null || $("#visitDuration").val()=='0'){
		swal("Select Visit Duration.","","error");
		f = false;
		return false;
	}
	
	else if($("#address").val()=='' || $("#address").val()=="" || $("#address").val()==null || $("#address").val()=='0'){
		swal("Enter Address.","","error");
		f = false;
		return false;
	}
	
	else{
		f = true;
		$("#saveVisitorRegistrationModel").modal();
	}
	
}


function saveVisitroDetails(){
	
	document.visitorDetails.action = "visitorRegistration?saveVisitorDetails";
	document.visitorDetails.target = "_self";
	document.visitorDetails.submit();
}


function getOldVisitData(){
	
	var serchId = $("#serchId").val();
	
	if(serchId=='' || serchId =="" || serchId ==null){
		swal("Enter Mobile Number Or Visitor ID","","error");
		return false;
	}else if(serchId.length<10){
		swal("Enter 10 digit  Mobile Number.","","error");
		return false;
	}
	else{
		 window.location.href="getOldVisitData?serchId="+serchId;
	}
}



function take_snapshot() {
	 
	   // take snapshot and get image data
	   Webcam.snap( function(data_uri) {
	       // display results in page
	       document.getElementById('results').innerHTML = 
	        '<img id="imgUrl" src="'+data_uri+'"/>';
	    } );
	   
	   var img1_src = $("#imgUrl").attr("src");
	   $('#base64String').attr('value', img1_src);
	   Webcam.reset();
	}
function loadWebCamOnclick(){
	
	Webcam.set({
	     width: 320,
	     height: 240,
	     image_format: 'jpeg',
	     jpeg_quality: 90
	 });
	 Webcam.attach( '#my_camera' );

}



function printVisitorDetails(){
	
	 window.location.href="print?visitorId="+$("#visitorId").val();
}