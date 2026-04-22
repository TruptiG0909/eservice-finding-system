<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
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

<script type="text/javascript">
        
    function service_reg()
    {
        var fnm=document.forms[0].fname.value;
        var add=document.forms[0].address.value;
        var no=document.forms[0].num.value;
        var unm=document.forms[0].uname.value;
        var em=document.forms[0].email.value;
            
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
            document.form_service_reg.submit();
        }
            
    }
        
</script>
   
        <%@ include file="includes/service-header.jsp" %>	

<main class="main">

        <section id="contact-2" class="contact-2 section">
        <div class="container">
                                    
        <div class="service-grids">
            <div class="row">
            <%
            int us=Integer.parseInt((String)session.getAttribute("servicelogin"));
            Database db=new Database();
            
            ResultSet res1=db.select_row("select * from user where id="+us);
            
            ResultSet res=db.select_row("select * from service_provider_profile where user_id="+us);
            if(res!=null){
                res.next();
                res1.next();
            %>                                                
                <div class="col-md-12 service-grid">
                      <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    %>
                                    <div class="alert alert-success">
                                        Profile updated successfully!!
                                    </div>
                                    <%
                                }else{
                                    %>
                                    <div class="alert alert-danger">
                                        Profile not Updated!
                                    </div>
                                    <%
                                }
                            }
                        %>
                        <br><br><br>
                    <h4 style="text-align:left;"><p style="padding:0px 10px;">My Profile <a style="float:right; padding-right:5px;" href="service-pwd.jsp">Change Password</a></p></h4>
                    <div class="col-md-12" style="text-align:left;">
                        <div class="mail-grids">
                            <form action="includes/WebService.jsp" method="post" name="form_service_reg">
                                <div class="contact-form">
                                   <input type="hidden" name="action" value="updateserviceprof"/>
                                    <input type="hidden" name="uid" value="<%=us%>"/>
                                    <div class="col-md-6">
                                        <label>Full Name*</label>
                                        <input type="text" name="fname" class="form-control" value="<%=res.getString("full_name")%>"
                                               placeholder="Full name" required>
                                    </div>
                                                          
                                    <div class="col-md-6">
                                        <label>username*</label>
                                        <input type="text" name="uname" class="form-control" placeholder="Username" readonly value="<%=res1.getString("username")%>" required>
                                    </div>
                                                          
                                    <div class="col-md-6">
                                        <label>Address*</label>
                                        <input type="text" name="address" class="form-control" placeholder="Address" value="<%=res.getString("address")%>" required>
                                    </div>
                                                          
                                                          
                                    <div class="col-md-6">
                                        <label>Mobile number*</label>
                                        <input type="text" name="num" class="form-control" placeholder="Mobile number" value="<%=res.getString("mobile_no")%>"  required>
                                    </div>
                                                          
                                                          
                                    <div class="col-md-6">
                                        <label>Email-ID</label>
                                        <input type="email" name="email" class="form-control" placeholder="Email-id" value="<%=res.getString("email_id")%>"  required>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <label>About Me</label>
                                        <textarea class="form-control" class="form-control" name="descr" rows="4"><%=res.getString("descr")%></textarea>
                                    </div>
                                                      
                                    <div class="col-md-12">
                                        <div class="col-md-2">
                                            <br>
                                            <input type="button" onclick="service_reg();"  class="btn btn-primary" name="profile" value="Update Profile"/>
                                            <br><br><br>
                                        </div>
                                    </div>
                                                      
                                </div>
                                                  
                            </form>
                                    <div class="col-md-12"></div>
                                    <form action="uploadProfileFile.jsp" method="post" name="formfood" enctype="multipart/form-data">
                                                            <div class="contact-form" style="text-align: left;">
                                                                <div class="col-md-12"><br><hr><br></div>
                                                                <div class="col-md-6">
                                                                    <label>Select image</label>
                                                                    <input type="file" name="file" required="true"/>
                                                                     </div>
                                                                    <div class="col-md-6">
<%
                                                if(res.getString("image").equals("")){
                                                    %>    
                                                    <img src="uploads/default3.jpg" style="height: 195px;" class="img-responsive" alt=""/>
                                                    <%
                                                    }else {
                                                %>    
                                                    <img src="uploads/<%=res.getString("image")%>" style="height: 195px;" class="img-responsive" alt=""/>
                                                    <%
                                                }
                                                               %> 

                                                                    </div>
                                                               
                                                              

                                                                <div class="col-md-12" style="margin-bottom: 10px;">
                                                                    <div class="col-md-2">
                                                                        <input type="submit"  value="Update Image"/>
                                                                    </div>
                                                                    <br><br><br><br><br>
                                                                </div>
                                                            </div>
                                                        </form>

                        </div>
                    </div>
                                      
                                      
                </div>
                              <%
            }
                              %>      
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