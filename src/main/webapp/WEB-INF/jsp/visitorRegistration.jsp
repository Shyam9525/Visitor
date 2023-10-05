<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Visitor||Registration</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <style type="text/css">
  
  .form-control{
  height: 25px;
  padding: 2px;
  
  font-size: medium;
  }

 #my_camera{
     width: 320px;
     height: 240px;
     border: 1px solid black;
}
  
  </style>
 
</head>

<body >

  <!-- ======= Header ======= -->
  <%@include file="header.jsp" %>
 <!-- End Header -->
<br><br><br><br>
  
<div class="container">
 <c:if test="${registrationPageOpen==false }">
 <br><br>
 <div class="row">

 

    <div class="col-sm-3">
      <label for="email"><b>Mobile Number</b>&nbsp;<font style="color: red;">*</font></label>
    </div>
    
     <div class="col-sm-3">
       <input type="text" class="form-control" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');"  placeholder="Enter Mobile Number" name="serchId" id="serchId">
    </div>
    
    
     <div class="col-sm-3">
      <button type="button"  class="btn btn-success btn-sm"style="border-radius:0px;"  onclick="getOldVisitData();">Search</button>
    </div>
     <div class="col-sm-3">
    
    </div>
     
  </div>
  <br><br><br><br><br>  <br><br><br><br><br>
 </c:if>
 <c:if test="${registrationPageOpen==true }">
 <form:form action="visitorRegistration" method="POST" modelAttribute="visitorDetails" id="visitorDetails" name="visitorDetails" >
<div class="card">
	  <div class="card-header card bg-primary text-white">Visitor Details</div>
	  
  
	  <div class="card-body">
	
	<div class="row">
   
   <div class="col-md-3">
    <div class="form-group">
    <input type="hidden" id="txn_flag" name="txn_flag" value="save">
    <label class="control-label" for=""><b>Visitor Name</b> &nbsp;<font size="3" color="red">*</font></label>
         
      <input type="text"  name="visitorName" id="visitorName" value="${visitorDetails.visitorName }" class="form-control"  placeholder="Enter Visitor Name">          
         
       
  </div>
  </div>
  
  <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Visitor Mobile No</b> &nbsp;<font size="3" color="red">*</font></label>
         
        <input type="text"name="visitorMobileNo" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');"  id="visitorMobileNo" value="${visitorDetails.visitorMobileNo }" class="form-control">       
       
  </div>
  </div>
  
  <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>ID Type</b> &nbsp;<font size="3" color="red">*</font></label>
         
        <select class="form-control"  name="idType" id="idType">
        
         
        <option  value="0">--select--</option>
        
        <c:forEach items="${idTypeList }" var="idTypeList">
        <option  value="${idTypeList.id }">${idTypeList.name }</option>
        </c:forEach>
        
        </select>
       
  </div>
  </div>
  
 <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>ID Number</b> &nbsp;<font size="3" color="red">*</font></label>
         
      <input type="text"  name="idNumber" id="idNumber" class="form-control"   placeholder="Enter ID Number">      
       
  </div>
  </div>
  
 
  </div>
  
  
  <div class="row">
   
   <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Email ID</b> &nbsp;</label>
         
      <input type="email" value="${visitorDetails.emailId }"  name="emailId" id="emailId" value=""class="form-control"   placeholder="Enter Email Id">          
         
       
  </div>
  </div>
  
  <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Coming From</b> &nbsp;</label>
         
        <input type="text"  name="comingCity" id="comingCity" class="form-control"  placeholder="Enter coming City">       
       
  </div>
  </div>
  
  <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Department </b> &nbsp;<font size="3" color="red">*</font></label>
         
        <select class="form-control"  name="department" id="department">
        
         
        <option  value="0">--select--</option>
        <c:forEach items="${departmentTypeList }" var="departmentTypeList">
        <option  value="${departmentTypeList.id }">${departmentTypeList.name }</option>
        </c:forEach>
        
        
        </select>
       
  </div>
  </div>
  
 <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Host Name</b> &nbsp;<font size="3" color="red">*</font></label>
         
        <select class="form-control"  name="hostName" id="hostName">
        
         
        <option  value="0">--select--</option>
        
         <c:forEach items="${hostNameList }" var="hostNameList">
        <option  value="${hostNameList.id }">${hostNameList.name }</option>
        </c:forEach>
        </select>
       
  </div>
  </div>
  
 
  </div>
  
  
  <div class="row">
   
   <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Visit Purpose</b> &nbsp;<font size="3" color="red">*</font></label>
         
     <select class="form-control"  name="purpose" id="purpose">
        
         
        <option  value="0">--select--</option>
          <c:forEach items="${purposeList }" var="purposeList">
        <option  value="${purposeList.id }">${purposeList.name }</option>
        </c:forEach>
        
        </select>
  </div>
  </div>
  <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Visit Duration(Hr)</b>&nbsp;<font size="3" color="red">*</font></label>
         
        
       <select class="form-control" name="visitDuration" id="visitDuration">
        
         
        <option  value="0">--select--</option>
          <c:forEach items="${visitDurationList }" var="visitDurationList">
        <option  value="${visitDurationList}">${visitDurationList}</option>
        </c:forEach>
        
        </select>
        
          
  </div>
  </div>
  <div class="col-md-6">
    <div class="form-group">
    <label class="control-label" for=""><b>Address</b> &nbsp;<font size="3" color="red">*</font></label>
         
        <input type="text"  name="address" id="address" class="form-control"  >       
       
  </div>
  </div>
  
  
  </div>
  
  
  
	
	 <div class="row">
   
   <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Other Device</b></label>
     <input type="text"  name="otherDevice" id="otherDevice" class="form-control"  >       
       
  </div>
  </div>
  <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Laptop Details</b> &nbsp;</label>
         
         <input type="text"  name="laptopDetails" id="laptopDetails" class="form-control"  >  
      
          
  </div>
  </div>
  <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Vehicle Type</b> </label>
         
      <select class="form-control" name="vehicleType" id="vehicleType">
        
         
        <option  value="NO VEHICLE">NO VEHICLE</option>
         <c:forEach items="${vehicleType }" var="vehicleType">
        <option  value="${vehicleType}&nbsp;Wheeler ">${vehicleType}&nbsp;Wheeler </option>
        </c:forEach>
        
        </select>
          
       
  </div>
  </div>
  
   <div class="col-md-3">
    <div class="form-group">
    <label class="control-label" for=""><b>Vehicle Details</b></label>
         
        <input type="text"  name="vehicleDetails" id="vehicleDetails" class="form-control"  >       
       
  </div>
  </div>

 
  </div>
  
  
   <div class="row">
   <div class="form-group">
    <input type="button"class="btn btn-info btn-sm"style="border-radius:0px;" value="Open Camera"  name="image" id="image" onclick="loadWebCamOnclick();">   
    
  </div>&nbsp;&nbsp;
     <div id="my_camera"></div>
     <input type=button value="Take Snapshot" onClick="take_snapshot()">
 
	<div id="results" ></div>
	<input type="hidden" id="base64String" name="base64String"  >
	</div>
	</div>


	  <div class="card-footer" style="text-align: center;">
	
	 <button type="button"  class="btn btn-info btn-sm"style="border-radius:0px;" onclick="return validateRegistrationForm();">Save Visitor Details </button>
	  <button type="reset" class="btn btn-danger btn-sm"style="border-radius:0px;">Clear </button>
	
	  </div>
</div>

</form:form>
</c:if>
<div class="modal fade" id="saveVisitorRegistrationModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#007bff!important;color: white;">
        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <h6>Yes I checked All Details </h6>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="border-radius:0px;">Modify</button>
        <button type="button" id="saveVisitorDetails" onclick="saveVisitroDetails();" class="btn btn-info btn-sm" style="border-radius:0px;">Save Visitor Details</button>
      </div>
    </div>
  </div>
</div>

</div>
 <br>
  <!-- ======= Footer ======= -->
  
  <%@include file="footer.jsp" %>
 <!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
   <script src="js/visitorRegistration.js"></script>
  <script src="js/sweetalert.js"></script>
   <script src="js/webcam.js"></script>
 
</body>

</html>