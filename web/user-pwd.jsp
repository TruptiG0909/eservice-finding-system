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
<script>
        function updatepwd()
        {
            var p=document.editpwd.pwd.value;
            var np=document.editpwd.npwd.value;
            var cp=document.editpwd.cpwd.value;

            if(p=='')
            {
                alert('Please enter current password.');
            }
            else if(np=='')
            {
                alert('Please enter new password.');
            }
            else if(cp=='')
            {
                alert('Please enter confirm password.');
            }
            else if (np.length > 16) {
                alert('Please enter 8 - 16 characters password.');
            }
            else if (np.length < 8) {
                alert('Please enter 8 - 16 characters password.');
            }
            else if(np!=cp)
            {
                alert('Passwords does not match.');
            }
            else
            {
                document.editpwd.submit();
            }

        }
    </script>
		
			<section id="contact-2" class="contact-2 section">
				<div class="container">
					
						<div class="service-grids">
							<div class="row  gy-4 mb-5">

                                <div class="col-md-12 service-grid">
                                    <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    %>
                                    <div class="alert alert-success">
                                        Password updated successfully!!
                                    </div>
                                    <%
                                }else{
                                    %>
                                    <div class="alert alert-danger">
                                        Current password not exist!
                                    </div>
                                    <%
                                }
                            }
                        %><br><br><br>
                                    <h4 style="text-align:left;"><p style="padding:0px 10px;">My Profile <a style="float:right; padding-right:5px;" href="user-profile.jsp">Change Profile</a></p></h4>
                                  <div class="col-md-12" style="text-align:left;">
                                      <div class="mail-grids">
                                          <form action="includes/WebService.jsp" method="post" name="editpwd">
                                              <input type="hidden" name="action" value="updatepassword" />
                                              <div class="contact-form">
                                                      <div class="col-md-6">
                                                          <label>Current Password*</label>
                                                          <input type="password" name="pwd" class="form-control" placeholder="Password" required>
                                                          <label>New Password*</label>
                                                          <input type="password" name="npwd" class="form-control" placeholder="Password" required>
                                                          <label>Confirm Password</label>
                                                          <input type="password" name="cpwd" class="form-control" placeholder="Password" required>
                                                      </div>
                                                  <?php
                                                  }
                                                  ?>

                                                  <div class="col-md-12">
                                                      <div class="col-md-2">
                                                          <br>
                                                          <input type="button" class="btn btn-primary" onclick="updatepwd();" value="Update Password"/>
                                                          <br><br><br><br><br>
                                                      </div>
                                                  </div>
                                                  <div class="clearfix"> </div>
                                              </div>
                                          </form>
                                      </div>
                                  </div>
                                
                                </div>

                                <div class="clearfix"> </div>
							</div>
					</div>
			</div>
		</section>
        </main>
        <%@ include file="includes/footer.jsp" %>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/drift-zoom/Drift.min.js"></script>
  <script src="css/jquery.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>
        
    </body>
</html>
<?php