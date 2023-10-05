<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Visitor</title>
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
  
     <!-- jquery css -->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <!--  <link rel="stylesheet" href="/resources/demos/style.css">
     -->

  <style type="text/css">
  
  .form-control{
  height: 25px;
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
<div class="card">

  <c:if test="${msg!=null }"> 
      	<div class="alert alert-success alert-dismissible">
    <button type="button" class="close"   data-dismiss="alert">&times;</button>
    <strong></strong>${msg }
     </div>
     </c:if>

	  <div class="card-header card bg-primary text-white">Visitor details</div>
	  
  
	  <div class="card-body">
	
<form action="viewAndModify" method="POST" modelAttribute="visitorDetails" id="visitorDetails" name="visitorDetails">
  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Visitor ID</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  name="visitorId" readonly="readonly" value="${visitorDetails.visitorId }">
    </div>
     <div class="col-sm-2">
       <label for="email"><b>Visitor Name</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control" name="visitorName" id="visitorName"  value="${visitorDetails.visitorName }">
    </div>
     <div class="col-sm-2">
     <label for="email"><b>Visitor Mobile No</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  name="visitorMobileNo"  maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');"  id="visitorMobileNo"  value="${visitorDetails.visitorMobileNo }">
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Visit Date</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control" readonly="readonly" name="visitDate" id="visitDate"  value="${visitorDetails.visitDateAndTime}">
    </div>
     <div class="col-sm-2">
       <label for="email"><b>ID Type</b></label>
    </div>
     <div class="col-sm-2">
     <%--  <input type="text" class="form-control"   value="${visitorDetails.idType.name }"> --%>
      <select class="form-control"  name="idType" id="idType">
        
       <option selected="selected" value="${visitorDetails.idType.id }">${visitorDetails.idType.name }</option>
        <c:forEach items="${idTypeList }" var="idTypeList">
        <option  value="${idTypeList.id }">${idTypeList.name }</option>
        </c:forEach>
        
        </select>
       
    </div>
     <div class="col-sm-2">
     <label for="email"><b>ID Number</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control" id="idNumber" name="idNumber"  value="${visitorDetails.idNumber }">
    </div>
  </div>
  
   <br>
  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Email ID</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control"  name="emailId" id="emailId"  value="${visitorDetails.emailId }">
    </div>
     <div class="col-sm-2">
       <label for="email"><b>Coming City</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control" id="comingCity" name="comingCity" value="${visitorDetails.comingCity }">
    </div>
     <div class="col-sm-2">
     <label for="email"><b>Department</b></label>
    </div>
     <div class="col-sm-2">
     <%--  <input type="text" class="form-control"   value="${visitorDetails.department.name }"> --%>
     <select class="form-control"  name="department" id="department">
        
       <option selected="selected" value="${visitorDetails.department.id }">${visitorDetails.department.name }</option>
        <c:forEach items="${departmentTypeList }" var="departmentTypeList">
        <option  value="${departmentTypeList.id }">${departmentTypeList.name }</option>
        </c:forEach>
        
        </select>
    </div>
  </div>
  
  <br>
  <div class="row">
    <div class="col-sm-2">
      <label for="email"><b>Host Name</b></label>
    </div>
     <div class="col-sm-2">
      <%-- <input type="text" class="form-control"  name="visitorId"  value="${visitorDetails.hostName.name }"> --%>
      
       <select class="form-control"  name="hostName" id="hostName">
        
       <option selected="selected" value="${visitorDetails.hostName.id }">${visitorDetails.hostName.name }</option>
        <c:forEach items="${hostNameList }" var="hostNameList">
        <option  value="${hostNameList.id }">${hostNameList.name }</option>
        </c:forEach>
        
        </select>
      
    </div>
     <div class="col-sm-2">
       <label for="email"><b>Visit Purpose</b></label>
    </div>
     <div class="col-sm-2">
      <%-- <input type="text" class="form-control"   value="${visitorDetails.purpose.name }"> --%>
       <select class="form-control"  name="purpose" id="purpose">
        
       <option selected="selected" value="${visitorDetails.purpose.id }">${visitorDetails.purpose.name }</option>
        <c:forEach items="${purposeList }" var="purposeList">
        <option  value="${purposeList.id }">${purposeList.name }</option>
        </c:forEach>
        
        </select>
    </div>
     <div class="col-sm-2">
     <label for="email"><b>Address</b></label>
    </div>
     <div class="col-sm-2">
      <input type="text" class="form-control" id="address" name="address"  value="${visitorDetails.address }">
    </div>
  </div>
  
</form>
      </div>
 
 	  
	


 <div class="card-footer" style="text-align: center;">
	
	 
	  <button class="btn btn-success btn-sm"style="border-radius:0px;" onclick="return validateVisitorDetails();" >Update Details </button>
	  <button type="button"  class="btn btn-info btn-sm"style="border-radius:0px;"  onclick="window.location.href='home'">Back To Home</button>
	
 </div>
</div>

</div>

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
        <button type="button" id="saveVisitorDetails" onclick="updatevisitorDetails();" class="btn btn-info btn-sm" style="border-radius:0px;">Update Visitor Details</button>
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
   <script src="js/viewModifyVisitor.js"></script>
  <script src="js/sweetalert.js"></script>
  
    <!-- jquery js  -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script type="text/javascript">

   
 /*   $("#visitDate").datepicker({dateFormat : 'dd/mm/yy',changeMonth : true,changeYear : true,autoclose: true,yearRange: "-100:+0",maxDate: '0'});
   jQuery.noConflict();
    */
   </script>

</body>

</html>