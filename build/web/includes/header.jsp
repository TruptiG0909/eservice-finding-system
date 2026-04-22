  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="header-container container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="#" class="logo d-flex align-items-center me-auto me-xl-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.webp" alt=""> -->
        <h1 class="sitename">E-Service Findings</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
             
          <li><a href="index.jsp" class="active">Home</a></li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="faq.jsp">Faq's</a></li>
          <li><a href="contact.jsp">Contact</a></li>
          
          <%
                    if(session.getAttribute("userlogin")!=null){
                    %>
                    <li><a href="user-profile.jsp" >My Profile</a></li>
                            <li><a href="request-list.jsp" >My Request</a></li>
                            <li><a href="logout.jsp" >Logout</a></li>
          <%
                    }
                    %>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
        <%
                    if(session.getAttribute("userlogin")==null){
                    %>
      <a class="btn-getstarted" href="login.jsp">Login/Register</a>
 <%
                    }
                    %>
    </div>
  </header>
