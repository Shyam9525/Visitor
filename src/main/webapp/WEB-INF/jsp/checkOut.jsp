<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Save||Success</title>
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
  height: 23px;
  padding: 2px;
 
  }
  
  </style>
 
</head>

<body>

  <!-- ======= Header ======= -->
  <%@include file="header.jsp" %>
 <!-- End Header -->
<br><br><br><br>
  
<div class="container">
	<form action="chechOutVisitorDetails" method="GET">
	 <c:if test="${msg!=null }"> 
      	<div class="alert alert-success alert-dismissible">
    <button type="button" class="close"   data-dismiss="alert">&times;</button>
    <strong></strong>${msg }
     </div>
     </c:if>
     
   <br>
<div class="row">

 

    <div class="col-sm-2">
      <label for="email"><b>Visitor ID</b></label>
    </div>
    
     <div class="col-sm-2">
       <input type="text" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');"  placeholder="Enter Visitor ID" name="visitorIdForSearch" id="visitorIdForSearch" value="${visitorDetails.visitorId }">
    </div>
    
    
     <div class="col-sm-2">
      <button type="button"  class="btn btn-success btn-sm"style="border-radius:0px;"  onclick="getVisitorDetailsById();">Search</button>
    </div>
     
  </div>
  
  <br>
  <c:if test="${showDetail=='Y'}">
<div class="card">

	  <div class="card-header card bg-primary text-white">Visitor details</div>
	  
  
	  <div class="card-body">
	

  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Visitor ID</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control" id="visitorId" name="visitorId" readonly="readonly" value="${visitorDetails.visitorId }">
    </div>
     <div class="col-sm-2">
       <label for="email"><b>Visitor Name</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.visitorName }">
    </div>
     <div class="col-sm-2">
     <label for="email"><b>Visitor Mobile No</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.visitorMobileNo }">
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Check-In Date Time</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  name="visitorId" readonly="readonly" value="${visitorDetails.visitDateAndTime }">
    </div>
     <div class="col-sm-2">
       <label for="email"><b>ID Type</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.idType.name }">
    </div>
     <div class="col-sm-2">
     <label for="email"><b>ID Number</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.idNumber }">
    </div>
  </div>
  
   <br>
  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Email ID</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  name="visitorId" readonly="readonly" value="${visitorDetails.emailId }">
    </div>
     <div class="col-sm-2">
       <label for="email"><b>Coming City</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.comingCity }">
    </div>
     <div class="col-sm-2">
     <label for="email"><b>Department</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.department.name }">
    </div>
  </div>
  
  <br>
  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Host Name</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  name="visitorId" readonly="readonly" value="${visitorDetails.hostName.name }">
    </div>
     <div class="col-sm-2">
       <label for="email"><b>Visit Purpose</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.purpose.name }">
    </div>
     <div class="col-sm-2">
     <label for="email"><b>Visit Duration(Hr)</b></label>
    </div>
     <div class="col-sm-2">
     <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.visitDuration }"> 
     <%--  <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.address }"> --%>
    </div>
  </div>
  <br>
   <div class="row">
    
     <div class="col-sm-3">
     <label for="email"><b>Address</b></label>
     </div>
      <div class="col-sm-3">
     <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.address }">
    </div>
    <div class="col-sm-3">
     <label for="email"><b>Remark</b></label>
      </div>
       <div class="col-sm-3">
     <input type="text" class="form-control"  id="remark" name="remark" value="${visitorDetails.remark }">
    </div>
  </div>
  <br>
   <div class="row">
    
     <div class="col-sm-3">
     <label for="email"><b>Check-Out Date And Time</b></label>
      </div>
      <div class="col-sm-3">
     <input type="text" class="form-control"  readonly="readonly" value="${visitorDetails.checkOutDateAndTime }">
    </div>
    <%-- <div class="col-sm-3">
     <label for="email"><b>Actual Visit Duration(Hr)</b></label>
       </div>
     <div class="col-sm-3">
     <input type="text" class="form-control"  id="remark" name="remark" value="${visitorDetails.remark }">
    </div> --%>
  </div>
  

      </div>
 
 	  
	


 <div class="card-footer" style="text-align: center;">
	
	 <c:if test="${visitorDetails.checkOutStatus=='N'}">
	  <button class="btn btn-success btn-sm"style="border-radius:0px;" onclick="checkOutVisitor();">Check Out Visitor </button>
	 </c:if>
	
 </div>
</div>
</c:if>
</form>
</div>
 <br>
  <!-- ======= Footer ======= -->
  <br> <br> <br> <br> <br>  <br> <br> <br> <br> <br> 
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
   <script src="js/checkOut.js"></script>
  <script src="js/sweetalert.js"></script>
  
  
  
</body>

</html>