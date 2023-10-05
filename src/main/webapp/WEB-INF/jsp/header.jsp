 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <header id="header" class="fixed-top">
    <div class="container d-flex">

      <div class="logo mr-auto">
       
     
      <h1 class="text-light"><a href="home"> <!--  <img alt="" src="assets/logo.png"> --> E-Visitor  </a></h1>
     
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
         <li><a href="home">Home</a></li>
         
          <li><a href="visitorDashBoard">Visitor Dashboard</a></li>
         <!--  <li><a href="#">Vehicle Dashboard</a></li> -->
          <li><a href="viewVisitorDetails">Visitor Report</a></li>
          <!--  <li><a href="#">Vehicle Report</a></li> -->
          <li class="drop-down"><a href="#">${loginUser.getFirstName()}</a>
            <ul>
             <li><a href="#">${loginUser.getUserRole()}</a></li>
              <li><a href="profile">My Profile</a></li>
             
               <c:if test="${loginUser.getUserRole()=='ADMIN' || loginUser.getUserRole()=='SUPERADMIN'}">
               <li><a href="register">Add New User</a></li>
               <li><a href="getAllUser">View All User</a></li>
               </c:if>
                  <li><a href="logout">Log Out</a></li>
            </ul>
          </li>
        
          <!-- <li><a href="logout">Log Out</a></li> -->
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header>