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
        <script type="text/javascript">
            
            
            function user_reg()
            {
                var fnm=document.form_user_reg.fname.value;
                var add=document.form_user_reg.address.value;
                var no=document.form_user_reg.num.value;
                var unm=document.form_user_reg.uname.value;
                var p=document.form_user_reg.pass.value;
                var cp=document.form_user_reg.conf_pass.value;
                var em=document.form_user_reg.email.value;
                
                if(fnm=='')
                {
                    alert('Please enter full name.');
                }
                else if(!fnm.match(" "))
                {
                    alert('Please enter valid full name.');
                }
                else if(unm=='')
                {
                    alert('Please enter username.');
                }
                else if(add=='')
                {
                    alert('Please enter address.');
                }
                else if(no=='')
                {
                    alert('Please enter mobile number.');
                }
                else if(no.length!=10)
                {
                    alert('Please enter valid mobile number.');
                }
                else if(!$.isNumeric(no))
                {
                    alert('Enter valid mobile number.');
                }
                else if(p=='')
                {
                    alert('Please enter password.');
                }
                else if(cp=='')
                {
                    alert('Please enter confirm password.');
                }
                else if(p!=cp)
                {
                    alert('Passwords does not match.');
                }
                else if (p.length > 16) {
                    alert('Please enter 8 - 16 characters password.');
                }
                else if (p.length < 8) {
                    alert('Please enter 8 - 16 characters password.');
                }
                else if(em=='')
                {
                    alert('Please enter valid email id.');
                }
                else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(em)))
                {
                    alert('Please enter valid email id.');
                }
                else
                {
                    document.form_user_reg.submit();
                }
            } 
            
            
        </script>
            
            
        <main class="main">
            <!-- container -->
            <div class="container">
                <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    %>
                                    <div class="alert alert-success">
                                        Registration is successful. Wait for the administrators approval!
                                    </div>
                                    <%
                                }
                            }
                        %>
                <h4 style="font-size:25px; font-weight:bold;">Customer registration.</h4>
                <div class="mail-grids">
                    <form action="includes/WebService.jsp" name="form_user_reg" method="POST">
                        <input type="hidden" name="action" value="newuserreg">
                        <div class="contact-form">
                            <div class="col-md-6"> 
                                <label>Full Name</label>
                                <input type="text" name="fname" placeholder="Full name" required >   
                            </div>
                                
                            <div class="col-md-6">
                                <label>username*</label>
                                <input type="text" name="uname" placeholder="Username" required>
                            </div>
                                
                            <div class="col-md-6">
                                <label>Address</label>
                                <input type="text" name="address" placeholder="Address" required>
                            </div>
                                
                            <div class="col-md-6">
                                <label>Password*</label>
                                <input type="password" name="pass" placeholder="*********" required>
                            </div>
                                
                            <div class="col-md-6">
                                <label>Mobile number</label>
                                <input type="text" name="num" maxlength="10" onkeypress="return event.charCode >= 48 && event.charCode <= 57" placeholder="Mobile number" required>
                            </div>
                                
                            <div class="col-md-6">
                                <label>Confirm Password*</label>
                                <input type="password" name="conf_pass" placeholder="*********" required>
                            </div>
                            <div class="col-md-6">
                                <label>Email-ID</label>
                                <input type="email" name="email" placeholder="Email-id" required>
                            </div>
                                
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <br>
                                    <input type="hidden" name=""/>
                                    <input type="button" name="submit_user_reg" onclick="user_reg();" value="Sign Up"/>
                                    <br><br><br><br><br><br>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                </div>
                <!-- //container -->
            </div>
        </main>
            <!-- //mail -->
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