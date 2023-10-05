 function getVisitorDetailsById(){
	  var visitorId = $("#visitorIdForSearch").val();
	  if(visitorId=="" || visitorId =='' || visitorId ==null){
		  swal("Enter Visitor ID.","","error");
		 return false; 
	  }else{
		  window.location.href="searchDeatils?visitorId="+visitorId; 
	  }
	  
  }
  
  function checkOutVisitor(){
	  
	  var visitorId = $("#visitorId").val();
	  var remark = $("#remark").val();
	  if(remark=="" || remark =='' || remark ==null){
		  swal("Enter remark.","","error");
		 return false; 
	  }else{
		  window.location.href="chechOutVisitorDetails?visitorId="+visitorId+"&remark="+remark; 
	  }
  }
  
  