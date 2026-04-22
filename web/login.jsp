<% if(session.getAttribute("userlogin")!=null){
response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>E-Service Finding - A platform to find and hire temporary workers online.</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/drift-zoom/drift-basic.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

</head>

<body class="contact-page">
    
        <%@ include file="includes/header.jsp" %>			
        
  <main class="main">

    <!-- Page Title -->
    <div class="page-title">
      <div class="heading">
        <div class="container">
          <div class="row d-flex justify-content-center text-center">
            <div class="col-lg-8">
              <h1 class="heading-title">Login/Register</h1>
              <p class="mb-0">
                Please log in using your authorized credentials to manage records and system settings.
              </p>
            </div>
          </div>
        </div>
      </div>
      <nav class="breadcrumbs">
        <div class="container">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Login</li>
          </ol>
        </div>
      </nav>
    </div><!-- End Page Title -->

    <!-- Contact 2 Section -->
    <section id="contact-2" class="contact-2 section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <!-- Contact Info Boxes -->
        <div class="row gy-4 mb-5">
          <div class="col-lg-4">
<%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    
                                }else if(login.equals("11")){
                                    %>
                                    <div class="alert alert-success">
                                        Password changed successfully!
                                    </div>
                                    <%
                                }else{
                                    %>
                                    <div class="alert alert-danger">
                                        Username/Password Invalid.
                                    </div>
                                    <%
                                }
                            }
                        %>
              <div class="contact-form-wrapper">
              <h2 class="text-center mb-4">Login</h2>

              <form action="includes/WebService.jsp" name="form_user_login" method="post" class="php-email-form">
                <div class="row g-3">
                  <div class="col-md-12">
                    <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-person"></i>
                        <input type="text" class="form-control" name="uname" placeholder="Email Id" required>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-envelope"></i>
                        <input type="password" class="form-control" name="pass" placeholder="Password" required>
                      </div>
                    </div>
                  </div>
                   <div class="col-md-12">
                    <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-text-left"></i>
                        <select class="form-control" name="action" required>
                            <option value="loginuser">Service User</option>
                            <option value="serviceprovlogin">Service Provider</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center">
                    <button type="button"  onClick="javascript:user_login()" class="btn btn-primary btn-submit">LOGIN</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-8">
            <div class="contact-form-wrapper">
                <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                 %>
                                    <div class="alert alert-success">
                                        New user registered successfully!
                                    </div>
                                    <%   
                                }
                            }
                        %>
              <h2 class="text-center mb-4">Register User or Service Provider</h2>

              <form action="includes/WebService.jsp" method="post" class="php-email-form">
                <div class="row g-3">
                  <div class="col-md-6">
                    <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-person"></i>
                        <input type="text" class="form-control" name="fname" placeholder="Full Name" required>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-envelope"></i>
                        <input type="email" class="form-control" name="email" placeholder="Email Address" required>
                      </div>
                    </div>
                  </div>
                  
                 <div class="col-md-6">
                    <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-envelope"></i>
                        <input type="text" class="form-control" name="uname" placeholder="Username" required>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-6">
                  <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-person"></i>
                        <input type="text" class="form-control" name="num" placeholder="Mobile Number" required>
                      </div>
                    </div>
                  </div>
                
                  <div class="col-md-6">
                  <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-person"></i>
                        <input type="text" class="form-control" name="address" placeholder="Address" required>
                      </div>
                    </div>
                  </div>
                
                  <div class="col-md-6">
                  <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-person"></i>
                        <input type="password" class="form-control" name="pass" placeholder="Password" required>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-6">
                  <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-person"></i>
                        <input type="password" class="form-control" name="cpass" placeholder="Confirm Password" required>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="form-group">
                      <div class="input-with-icon">
                        <i class="bi bi-text-left"></i>
                        <select class="form-control" name="action" required>
                            <option value="newuserreg">Service User</option>
                            <option value="newserviceuserreg">Service Provider</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary btn-submit">SUBMIT</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>

      </div>
    </section><!-- /Contact 2 Section -->

  </main>
        <%@ include file="includes/footer.jsp" %>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/drift-zoom/Drift.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>
  
  <script type="text/javascript">

					
    function user_login()
    {
        var unm=document.form_user_login.uname.value;
        var pass=document.form_user_login.pass.value;

        if(unm=='')
        {
            alert('Please enter valid username');
        }
        else if(pass=='')
        {
            alert('Please enter valid password');
        }
        else
        {
            document.form_user_login.submit();
        }
    }
</script>


</body>

</html>
