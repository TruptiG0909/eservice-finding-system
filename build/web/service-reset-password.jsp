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

        <section id="contact-2" class="contact-2 section">
            <!-- container -->
            <div class="container">
                <div class="mail-grids" style="display: flex; justify-content: center; align-items: center; flex-direction: column; text-align: center;">
                    
                   <!--
                    <div class="col-md-6 contact-form">
                        <h3>New Customer Can Register.</h3>
                        <br>
                        <a href="user-reg.jsp"><input type="button" value="NEW REGISTER"/></a>
                    </div>
                    -->
                   
                    <div class="col-md-6 contact-form">
                        <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("2")){
                                    %>
                                    <div class="alert alert-danger">
                                        Invalid OTP 
                                    </div>
                                    <%
                                }else if(login.equals("3")){
                                    %>
                                    <div class="alert alert-danger">
                                        Password not matched.
                                    </div>
                                    <%
                                }
                            }
                        %>
                        
                        <h3 style="margin-top: 0px; margin-bottom: 0px;">Service Reset Password</h3>
                        <br>
                        <form name="form_user_login" action="includes/WebService.jsp" method="post">
                            <input type="hidden" value="serviceresetpassword" name="action"/>
                            <label>Email Id</label>
                            <input type="text" name="email" placeholder="Email Id" readonly value="<%=request.getParameter("email")%>" required>
                            <label>Enter OTP (One time password)</label>
                            <input type="text" name="otp" required>
                            <label>New Password</label>
                            <input type="password" name="pass" placeholder="*********" required>
                            <label>Confirm Password</label>
                            <input type="password" name="confpass" placeholder="*********" required>
                            <input type="submit" value="Submit"/>
                        </form>
                        <br>
                             
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- //container -->
        </section>
        </main>
        <!-- //mail --><br><br><br><br><br>
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
