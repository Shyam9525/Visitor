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
  
  <!-- datatables -->
  <link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
	
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css">
	
	<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
  
  
  <style type="text/css">
  
  .form-control{
  height: 25px;
  padding: 2px;
  
  }
  .dtr-title {
	font-size: 12px;
}

.dtr-data {
	font-size: 12px;
}
  </style>
 
</head>

<body>

  <!-- ======= Header ======= -->
  <%@include file="header.jsp" %>
 <!-- End Header -->
<br><br><br><br>
  
<div class="container-fluid">

<div class="card">

 <c:if test="${msg!=null }"> 
      	<div class="alert alert-success alert-dismissible">
    <button type="button" class="close"   data-dismiss="alert">&times;</button>
    <strong></strong>${msg }
     </div>
     </c:if>
 
	  <div class="card-header card bg-primary text-white">All Visitor Details</div>
	  
  
	  <div class="card-body">
	
	
	
	 <div class="table">
					<table class="table table-striped table-bordered dt-responsive"
						style="width: 100%" id="allVisitorDetails">
						<thead style="font-size: 12px;">
							<tr bgcolor="#337ab7" style="color: white;">
								         <th>ID</th>
								        
								         <th>Visitor Name</th>
								          <th>Check-In</th>
								            <th>Check-Out</th>
										<!-- <th>Coming City</th> -->
										<th>Department</th>
										<th>Host Name</th>
										<th>Visit Purpose</th>
										<th>Image</th>
									     <td>Print</td>
								
							</tr>
						</thead>

						<tbody>
						  
							<c:forEach items="${visitorDetailsList }" var="visitorDetailsList">
							
							<tr style="font-size: 12px; font-weight: bolder;">
								 
								  <td>${visitorDetailsList.visitorId}</td>   
								  
								  <td>${visitorDetailsList.visitorName}</td>
								  <td>${visitorDetailsList.visitDateAndTime}</td> 
								  <c:choose>
								  
								  <c:when test="${visitorDetailsList.status =='N'}">
								   <td><b style="color:red;">Not Check Out Yet</b></td>  
								  </c:when>
								  <c:otherwise>
								   <td>${visitorDetailsList.checkOutDateAndTime}</td>  
								  </c:otherwise>
								  </c:choose> 
								 
								 <%--  <td>${visitorDetailsList.comingCity}</td>    --%>
								  <td>${visitorDetailsList.department.name}</td>  
								  <td>${visitorDetailsList.hostName.name}</td>  
								  <td>${visitorDetailsList.purpose.name}</td>  
								   <td style="text-align: center;"><img src="viewImage?id=${visitorDetailsList.imageName}" height="100" width="100"></td>  
								   <td><a href="print?visitorId=${visitorDetailsList.visitorId}">PRINT</a></td>
								</tr>
							</c:forEach>
							
								
								
						
							
							
							
						</tbody>
						
						
					
					</table>
					
					
				</div>
	
	</div>
     
	  <div class="card-footer" style="text-align: center;">
	
	    <button type="button" id="backToHome" onclick="window.location.href='home'" class="btn btn-info btn-sm" style="border-radius:0px;">Back To Home</button>
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
  
  <script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
		
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
		
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>	
	
  
  <script type="text/javascript">
  
 /*  $(document).ready(function() {
	    $('#allVisitorDetails').DataTable();
	} ); */
  
  $(document).ready(function() {
	    $('#allVisitorDetails').DataTable( {
	        dom: 'Bfrtip',
	        buttons: [
	            { extend: 'copyHtml5', footer: true },
	            { extend: 'excelHtml5', footer: true },
	            { extend: 'csvHtml5', footer: true },
	            { extend: 'pdfHtml5', footer: true }
	            
	        ]
	    } );
	} );

  
  </script>
  
</body>

</html>