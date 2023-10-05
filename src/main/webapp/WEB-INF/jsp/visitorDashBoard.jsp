<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Visitor Dashboard</title>
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
  
  .card-header{
     font-size: small;
  }.card-body{
     font-size: x-small;
  }
  
  </style>
 
</head>

<body style="background-color: #a9a0a0;">

  <!-- ======= Header ======= -->
  <%@include file="header.jsp" %>
 <!-- End Header -->
<br><br><br><br>
  
<div class="container-fluid">

 <c:if test="${msg!=null }"> 
      	<div class="alert alert-success alert-dismissible">
    <button type="button" class="close"   data-dismiss="alert">&times;</button>
    <strong></strong>${msg }
     </div>
     </c:if>	

<div class="row">
  <div class="col-sm-4">
    
    <div class="card">
	  <div class="card-header bg-danger text-white">Open Visits : ${ pendingVisitorsForApproval.size()} &nbsp;<b style="color: white;">(Pending For Approval)</b></div>
	  <div class="card-body">
	  
<c:forEach items="${pendingVisitorsForApproval}" var="pendingVisitorsForApproval" > 
<div id="accordion1">

  <div class="card">
    <div class="card-header d-flex">
      <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree1">
     
      <label>${pendingVisitorsForApproval.visitorName } -${pendingVisitorsForApproval.visitorId } &nbsp;(${pendingVisitorsForApproval.visitDate } ) </label><br>
       
      </a>
      <c:if test="${loginUser.getUserRole()=='ADMIN' || loginUser.getUserRole()=='SUPERADMIN' || loginUser.getUserRole()=='APPROVER'}">
      <a href="approveVisitor?visitorId=${pendingVisitorsForApproval.visitorId}" class="ml-auto btn btn-success btn-sm"style="border-radius:0px;" onclick="return confirm('Are you sure you want to Approve?');">approve</a>&nbsp;
      <a href="rejectVisitor?visitorId=${pendingVisitorsForApproval.visitorId}" onclick="return confirm('Are you sure you want to Reject Visitor?');" class="btn btn-danger btn-sm"style="border-radius:0px;">Reject</a>
      </c:if>
    </div>
    <div id="collapseThree1" class="collapse" data-parent="#accordion1">
      <div class="card-body">
       <div class="row">
	    <div class="col-sm-6">
	      <label for="email"><b>Whom to Meet</b></label><br> <label>${pendingVisitorsForApproval.hostName.name }</label>
	    </div>
	    
	     <div class="col-sm-6">
	      <label for="email"><b>Purpose</b></label><br><label>${pendingVisitorsForApproval.purpose.name }</label>
	    </div>
	    

     
  </div>
      </div>
    </div>
  </div>

</div>
	  
</c:forEach>	 	  
      </div>
	 
	</div>

  </div>
   <div class="col-sm-4">
    
   <div class="card">
	  <div class="card-header bg-info text-white">Checked-IN Visits : ${ pendingVisitorsForCheckOut.size()} &nbsp;</div>
	  <div class="card-body">
	  
<c:forEach items="${pendingVisitorsForCheckOut}" var="pendingVisitorsForCheckOut"> 
<div id="accordion2">

  <div class="card">
    <div class="card-header d-flex">
      <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree2">
     
      <label>${pendingVisitorsForCheckOut.visitorName } -${pendingVisitorsForCheckOut.visitorId } &nbsp;(${pendingVisitorsForCheckOut.visitDate } ) </label><br>
       
      </a>
      <c:if test="${loginUser.getUserRole()=='USER' || loginUser.getUserRole()=='SUPERADMIN'}">
       <a href="checkOutVisitor?visitorId=${pendingVisitorsForCheckOut.visitorId}" onclick="return confirm('Are you sure you want to Check-Out?');"  class="ml-auto btn btn-success btn-sm"style="border-radius:0px;">Check-Out</a>
  	  </c:if>
  	  </div>
    <div id="collapseThree2" class="collapse" data-parent="#accordion2">
      <div class="card-body">
       <div class="row">
	    <div class="col-sm-6">
	      <label for="email"><b>Whom to Meet</b></label><br> <label>${pendingVisitorsForCheckOut.hostName.name }</label>
	    </div>
	    
	     <div class="col-sm-6">
	      <label for="email"><b>Purpose</b></label><br><label>${pendingVisitorsForCheckOut.purpose.name }</label>
	    </div>
	    

     
  </div>
      </div>
    </div>
  </div>

</div>
	  
</c:forEach>	 	  
      </div>
	 
	</div>
  </div>
  
   <div class="col-sm-4">
    
    <div class="card">
	  <div class="card-header bg-success text-white">Checked-Out Visitors : ${ approvedCheckOutVisitors.size()}</div>
	  <div class="card-body">
	  
<c:forEach items="${approvedCheckOutVisitors}" var="approvedCheckOutVisitors"> 
<div id="accordion3">

  <div class="card">
    <div class="card-header">
      <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree3">
     
      <label>${approvedCheckOutVisitors.visitorName } -${approvedCheckOutVisitors.visitorId } &nbsp;(${approvedCheckOutVisitors.visitDate } ) </label><br>
       
      </a>
    </div>
    <div id="collapseThree3" class="collapse" data-parent="#accordion3">
      <div class="card-body">
       <div class="row">
	    <div class="col-sm-6">
	      <label for="email"><b>Whom to Meet</b></label><br> <label>${approvedCheckOutVisitors.hostName.name }</label>
	    </div>
	    
	     <div class="col-sm-6">
	      <label for="email"><b>Purpose</b></label><br><label>${approvedCheckOutVisitors.purpose.name }</label>
	    </div>
	    

     
  </div>
      </div>
    </div>
  </div>

</div>
	  
</c:forEach>	 	  
      </div>
	 
	</div>
  </div>
  
</div>


</div>
 <br>
  <!-- ======= Footer ======= -->
  <br> <br> 
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