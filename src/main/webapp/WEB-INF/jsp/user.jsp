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
		
		<div class="row">
		
			<div class="col-sm-2"></div>
			
			
			<div class="col-sm-8" style="background-color:#e6dfdf;color: black;  border-radius: 25px;">
			                               
                      <c:if test="${msg!=null }"> 
	      	<div class="alert alert-success alert-dismissible">
		    <button type="button" class="close"   data-dismiss="alert">&times;</button>
		    <strong></strong>${msg }
		     </div>
	     </c:if>
								<h3 style="text-align: center;">Create User</h3>
							
						
								
								<form id="register" action="register" method="post" >
									<div class="form-group">
									<label> First Name</label>
									 
										<input type="text" name="firstName" id="firstName"  tabindex="1" class="form-control" placeholder="Enter First Name" required>
									</div>
									<div class="form-group">
										<label> Last Name</label>
										<input type="text" name="lastName" id="lastName"  tabindex="1" class="form-control" placeholder="Email Last Name" value="">
									</div>
									<div class="form-group">
										<label> User Name</label>
										<input type="text" name="userName" id="userName"  tabindex="2" class="form-control" placeholder="user Name" >
									</div>
									<div class="form-group">
										<label> Mobile Number</label>
										<input type="text" name="mobile"  id="mobile" tabindex="2" class="form-control" placeholder="Enter mobile">
									</div>
									 <div class="form-group">
										<label> Password </label>
										<input type="password" name="password"  id="password" tabindex="2" class="form-control" placeholder="Enter password">
									</div>
									<div class="form-group">
										<label> Email </label>
										<input type="email" name="email" id="email"   tabindex="2" class="form-control" placeholder="Enter email">
									</div>
									
										<div class="form-group">
										<label> USER ROLE </label>
										 <select  name="userRole" id="userRole" class="form-control">
										
						              	<option value="USER">USER</option>
						    	        <option value="ADMIN">ADMIN</option>
						    	         <option value="APPROVER">APPROVER</option>
										</select>
									</div>
									
									
									
									<div class="form-group">
										<div class="row">
										<div class="col-sm-4"></div>
											<div class="col-sm-4">
												<input type="submit" name="register-submit" style="border-radius:0px;" id="register-submit" class="btn btn-success" value="Create User">
											</div>
											<div class="col-sm-4"></div>
										</div>
									</div>
								</form>
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
   <script src="js/visitorDetails.js"></script>
  <script src="js/sweetalert.js"></script>
  
 
</body>

</html>