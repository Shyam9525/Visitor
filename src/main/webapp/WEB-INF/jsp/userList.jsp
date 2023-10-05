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
		
			<div class="panel panel-info">
		
		
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;"> User List</h3>
			</div>
			<div class="panel-body">
				<div class="table">
					<table class="table table-striped table-bordered dt-responsive"
						style="width: 100%" id="ticketList">
						<thead style="font-size: 12px;">
							<tr bgcolor="#337ab7" style="color: white;">
								<th>Id:</th>
								<th>User Name</th>
								<th>Password</th>
								<th>Name</th>
								<th>Mobile:</th>
								<th>Role</th>
								<th>Active Status</th>
							<!-- 	<th>Action</th>
								 -->
							</tr>
						</thead>

						<tbody>
						  
							<c:forEach items="${userList}" var="ul">
							
								<tr style="font-size: 12px; font-weight: bolder;">
									<td>${ul.userId }</td>
									<td>${ul.userName}</td>
									<c:choose>
								    
								    <c:when test="${ul.userRole=='SUPERADMIN'}"><td>NA</td></c:when>
								     <c:otherwise><td>${ul.password}</td></c:otherwise>
								    </c:choose>
									<td>${ul.firstName}</td>
								    <td>${ul.mobile}</td>
								    <td>${ul.userRole}</td>
								    
								    <c:choose>
								    
								    <c:when test="${ul.active==true}"><td>Active</td></c:when>
								     <c:otherwise><td>De-Actived</td></c:otherwise>
								    </c:choose>
								    
								  <%--  
								    <td>
								    
								    <a href="updateUser?userId=${ul.userId}" type="button" class="btn btn-info btn-sm"style="border-radius:0px;" onclick="return  confirm('Are you sure, you want to Change status?')">Update</a>
									<a href="deleteUser?userId=${ul.userId}" type="button" class="btn btn-danger btn-sm"style="border-radius:0px;" onclick="return  confirm('Are you sure, you want to delete it?')">Delete </a>
								    </td> --%>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
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
   <script src="js/visitorDetails.js"></script>
  <script src="js/sweetalert.js"></script>
  
 
</body>

</html>