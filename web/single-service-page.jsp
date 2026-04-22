<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
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
<!----header-banner--->
        <%@ include file="includes/header.jsp" %>
	<main class="main">

        <section id="contact-2" class="contact-2 section">
				<div class="container">
                                    <br><br><br>
                                    <div class="row">
					<div class="col-md-3 contact-form" style="background-color:#FFF; margin:5px;">
                    	<h4 class="h2">Search</h4>
                        <div class="col-md-12 service-grid1">
                            <form  method="get" action="service-page.jsp">
                                <input type="text" name="key" placeholder="Search by service name" required/>
                                <input type="submit" name="submit" value="Search"/><br><br>
                            </form><br><br>
                        </div>
                    </div>
                    
                    <div class="col-md-8 contact-form"  style="background-color:#FFF;margin:5px; padding: 0px">
                    	<div >
                        
                        	<div class="service-grids" style="padding-top:20px;">
								<div class="service-grid1">

                                               <%
                                               String type=request.getParameter("type");
                                               String sid=request.getParameter("sid");
                                               Database db=new Database();
                                               
                                                   ResultSet rsservices=db.select_row("select * from services where id="+sid+" and status=1");
                                                   if(rsservices!=null){
                                                       while(rsservices.next()){
                                                           
                                                            String facilities=rsservices.getString("facilities");
                                                            String service_type=rsservices.getString("service_type");
                                                            String start_price=rsservices.getString("start_price");
                                                            String end_price=rsservices.getString("end_price");
                                                            String image=rsservices.getString("image");
                                                            String service_id=rsservices.getString("service_provider_id");
                                                            String status=rsservices.getString("status");
                                                            
                                                            ResultSet rsprovider=db.select_row("select * from service_provider_profile where user_id="+service_id);
                                                            if(rsprovider!=null){
                                                            rsprovider.next();
                                               %> 
                                                                    <div >
                                                                        <div class="col-md-12 text-left">
                                                                          <%
                                                             if(rsprovider.getString("descr")!=null){
                                                             %>
                                                                            <%=rsprovider.getString("descr")%>
                                                                            <br><br>
                                                                            <%
                                                             }
                                                                            %>
                                                                        </div>
                                                    <div class="col-md-12 service-grid">
                                                        <%
                                                        if(image.equals("")){
                                                            %>
                                                            <img src="uploads/default3.jpg" style="height: 250px; width:100%" class="img-responsive" alt=""/>
                                                            <%
                                                        }else{
                                                            %>
                                                            <img src="uploads/<%=image%>" style="height: 250px; width:100%" class="img-responsive" alt=""/>
                                                            <%  
                                                        }
                                                        %>
                                                        <br><br>
                                                    </div>
                                                    <div class="col-md-12 service-grid">
                                                       <table width="100%" height="200px">
                                                           <tr><th style="text-align: center; background-color: darkslategrey;color:#fff " colspan="2"><%=service_type%></th></tr>
                                                           <tr><th>Facilities : </th><td align="left"><%=facilities%></td></tr>
                                                           <tr><th>Price Range: </th><td align="left"><%=start_price%> Rs. - <%=end_price%> Rs.</td></tr>
                                                           <tr><th>Address : </th><td align="left"><%=rsprovider.getString("address")%></td></tr>
                                                           <tr><th>Provided by : </th><td align="left"><%=rsprovider.getString("full_name")%></td></tr>
                                                       </table>
                                                        <input type="button" class="requestsent btn btn-primary" id="<%=service_id%>" alt="<%=service_type%>" label="<%=sid%>" name="request" value="Send request"/>

                                                    </div>
                                                </div>
                                                <%      }
                                                       }
                                                   }
                                               
                                        %>        
                                        
								</div>
							</div>
                                        
                            
                    	</div>
                    </div>
                                    </div>
                    <br><br>
			</div><br><br><br><br>
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
 

<script>
    $(document).on("click",".requestsent",function(){
        var provid=$(this).attr("id");
        var type=$(this).attr("alt");
        var sid=$(this).attr("label");
        
        if(confirm("Are you sure?")){
            $.ajax({
                url:"includes/WebService.jsp",
                method:"POST",
                data:{"action":"requestsend","provid":provid,"type":type,"sid":sid},
                success:function(res){
//                    alert(res);
                    if(res==1){
                        window.location.href="request-send.jsp";
                    }else if(res==2){
                        alert("Your request already sent...");
                    }else{
                        window.location.href="login.jsp";
                    }
                }
            });
        }
    });
</script>