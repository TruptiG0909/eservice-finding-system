<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<% 
    if(session.getAttribute("userlogin")==null){
        response.sendRedirect("login.jsp");
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
        <script type="text/javascript">


            function edit_user_reg()
            {
                var fnm=document.form_user_reg.fname.value;
                var add=document.form_user_reg.address.value;
                var no=document.form_user_reg.num.value;
                var unm=document.form_user_reg.uname.value;
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
                else if(no.length<10)
                {
                    alert('Please enter valid mobile number.');
                }
                else if(no.length>11)
                {
                    alert('Please enter valid mobile number.');
                }
                else if(!$.isNumeric(no))
                {
                    alert('Enter valid mobile number.');
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
        
         <section id="contact-2" class="contact-2 section">
            <div class="container">
                
                <div class="service-grids">
                    
                    <div class="row">
                        
                        <div class="col-md-12 service-grid" style="margin-top: 100px">
                            
                            <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    %>
                                    <div class="alert alert-success">
                                        Profile updated successfully!
                                    </div>
                                    <%
                                }else{
                                    %>
                                    <div class="alert alert-danger">
                                        Profile not updated!!
                                    </div>
                                    <%
                                }
                            }
                        %>
                            <h4 style="text-align:left;"><p style="padding:0px 10px;">My Profile Details <a style="float:right; padding-right:5px;" href="user-pwd.jsp">Change Password</a></p></h4>
                            <div class="col-md-12" style="text-align:left;">
                                <%
                                Database db=new Database();
                                int userid=Integer.parseInt((String)session.getAttribute("userlogin"));
                                ResultSet res=db.select_row("select * from user where id="+userid+" and status='1'");
                                if(res!=null){
                                    while(res.next()){
                                        String user=res.getString("username");
                                        String userrole=res.getString("user_role");
                                        ResultSet resprof=db.select_row("select * from user_profile where user_id="+userid);
                                        resprof.next();
                                        String fname=resprof.getString("full_name");
                                        String address=resprof.getString("address");
                                        String email=resprof.getString("email_id");
                                        String image=resprof.getString("image");
                                        String mobile_no=resprof.getString("mobile_no");
                                    
                                %>
                                <div class="mail-grids">
                                    <form action="includes/WebService.jsp" method="post" name="form_user_reg">
                                        <input type="hidden" name="action" value="updateuserprofie"/>
                                        <div class="contact-form">
                                            <input type="hidden" name="uid" value="<%=userid%>"/>
                                            <div class="col-md-6">
                                                <label>Full Name*</label>
                                                <input type="text" name="fname" class="form-control" value="<%=fname%>"
                                                       placeholder="Full name" required>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <label>username*</label>
                                                <input type="text" name="uname" class="form-control" readonly placeholder="Username" value="<%=user%>" required>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <label>Address*</label>
                                                <input type="text" name="address" class="form-control" placeholder="Address" value="<%=address%>" required>
                                            </div>
                                            
                                            
                                            <div class="col-md-6">
                                                <label>Mobile number*</label>
                                                <input type="text" name="num" class="form-control" placeholder="Mobile number" value="<%=mobile_no%>"  required>
                                            </div>
                                            
                                            
                                            <div class="col-md-6">
                                                <label>Email-ID</label>
                                                <input type="email" name="email" class="form-control" placeholder="Email-id" value="<%=email%>"  required>
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <div class="col-md-2">
                                                    <br>
                                                    <input type="button" class="btn btn-primary" onclick="edit_user_reg();" value="Update Profile"/>
                                                    <br><br><br>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                             <div class="col-md-12" style="text-align:left;">
                                 <div class="mail-grids">
                                     <form action="includes/uploadFile.jsp" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="uid" value="<%=userid%>"/>
                                            <div class="col-md-6">
                                                <input type="hidden" name="action" value="updateuserprofiephoto"/>
                                                <label>Profile image</label>
                                                <input type="file" name="file"  class="form-control" required>
                                            </div>
                                            <div class="col-md-6">
                                                <%
                                                
                                                if(image.equals("")){
                                                   out.println("Image not available..."); 
                                                }else{
                                                    try{
                                                        %>
                                                        <img style="width:200px; height:100px" src="uploads/<%=image%>" />
                                                            <%
                                                    }catch(Exception ex){
                                                    }
                                                    
                                                }
                                                %>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="col-md-2">
                                                    <br>
                                                    <input type="submit" class="btn btn-primary" value="Update Photo"/>
                                                    <br><br><br><br><br>
                                                </div>
                                            </div>
                                     </form>
                                 </div>
                             </div>
                            <%
                            }
                                }
                            %>
                            
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
