<script type="text/javascript">
    $('document').ready(function(e) {
									
        $("#bottom-menu").hide();
        $("a.user-menu").click(function(){
            $("#bottom-menu").slideToggle();
        });
    });
</script>

<% 
    if(session.getAttribute("servicelogin")==null){
        response.sendRedirect("business.jsp");
    }
%>

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="header-container container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="#" class="logo d-flex align-items-center me-auto me-xl-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.webp" alt=""> -->
        <h1 class="sitename">E-Service Findings</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
             
          
          <%
                    if(session.getAttribute("servicelogin")!=null){
                    %>
                    <li><a href="service-profile.jsp" >My Profile</a></li>
                            <li><a href="service-request.jsp" >My Request</a></li>
                            <li><a href="logout.jsp" >Logout</a></li>
          <%
                    }
                    %>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
    </div>
  </header>
