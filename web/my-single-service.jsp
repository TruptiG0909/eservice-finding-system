
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
        <%@ include file="includes/service-header.jsp" %>	
			<main class="main">

        <section id="contact-2" class="contact-2 section">
				<div class="container">

                    <div class="row contact-form"  style="background-color:#FFF;margin:5px;">
                    	<div class="col-md-12">
                        
                        	<div class="service-grids" style="padding-top:20px;">
                                    <br><br><br>
								<div class="service-grid1">
			<%
                                    String spid="";
                            Database db=new Database();
                            String serviceid=request.getParameter("sid");
                                    if(request.getParameter("type")!=null)
                                    {
                                        spid=request.getParameter("spid");
                                        
                                        ResultSet res=db.select_row("select * from services where id='"+spid+"' AND service_provider_id='"+serviceid+"' AND status=1");
                                                if(res!=null){
                                        while(res.next()){
                                                String image=res.getString("image");
                                                String service_name=res.getString("service_name");
                                                String facilities=res.getString("facilities");
                                                String service_type=res.getString("service_type");
                                                String start_price=res.getString("start_price");
                                                String end_price=res.getString("end_price");
                                                String service_id=res.getString("service_provider_id");
                                                String status=res.getString("status");
                                                                        %>                                   
                                            <div class="row">
                                                <div class="col-md-4 service-grid">
                                                    <%
                                                if(image.equals("")){
                                                    %>    
                                                    <img src="uploads/default3.jpg" style="height: 195px;" class="img-responsive" alt=""/>
                                                    <%
                                                    }else {
                                                %>    
                                                    <img src="uploads/<%=image%>" style="height: 195px;" class="img-responsive" alt=""/>
                                                    <%
                                                }
                                                               %> 

                                                </div>
                                                <%
                                                ResultSet row1 =db.select_row("select * from service_provider_profile where user_id='"+serviceid+"'");
                                                if(row1!=null){
                                                    row1.next();
                                                
                                                %>
                                                <div class="col-md-8" style="margin-bottom: 20px; background-color:#096e ; padding: 10px;">
                                                     <div class="row">
                                                    <div class="col-md-4" style="padding: 5px; text-align: left;">
                                                        <h4 style="margin:0px;">Service :</h4>
                                                    </div>
                                                    <div class="col-md-6"  style="padding: 5px; text-align: left;">
                                                        <%=service_name%>
                                                    </div>

                                                    <div class="col-md-4"  style="padding: 5px; text-align: left;">
                                                        <h4 style="margin:0px;">Facilities :</h4>
                                                    </div>
                                                    <div class="col-md-8"  style="padding: 5px; text-align: left;">
                                                        <%=facilities%>
                                                    </div>

                                                    <div class="col-md-4" style="padding: 5px; text-align: left;">
                                                        <h4 style="margin:0px;">Address :</h4>
                                                    </div>
                                                    <div class="col-md-8" style="padding: 5px; text-align: left;">
                                                        <%=row1.getString("address")%>
                                                    </div>

                                                    <div class="col-md-4" style="padding: 5px; text-align: left;">
                                                        <h4 style="margin:0px;">Mobile no. :</h4>
                                                    </div>
                                                    <div class="col-md-8" style="padding: 5px; text-align: left;">
                                                        <%=row1.getString("mobile_no")%>
                                                    </div>

                                                    <div class="col-md-4" style="padding: 5px; text-align: left;">
                                                        <h4 style="margin:0px;">Service Type :</h4>
                                                    </div>
                                                    <div class="col-md-8" style="padding: 5px; text-align: left;">
                                                        <%=service_type%>
                                                    </div>

                                                    <div class="col-md-4" style="padding: 5px; text-align: left;">
                                                        <h4 style="margin:0px;">Price Range :</h4>
                                                    </div>
                                                    <div class="col-md-8" style="padding: 5px; text-align: left;">
                                                       <%=start_price%> Rs. - <%=end_price%> Rs.
                                                    </div>
                                                    <a class="col-md-5" style="float: right;"  href="edit-service.jsp?spid=<%=spid%>&sid=<%=serviceid%>&type=<%=service_type%>"><input type="button" name="request" class="btn btn-warning" value="Edit service"/></a>
                                                     </div>
                                            </div>
                                                <%
                                                }
                                                %>
                                        </div>
                                       <%
                                    }
    }
}
%>

								</div>
							</div>
                            
                    	</div>
                    </div>
					
			</div>
		</section>
                        </main><br><br><br><br><br><br>
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
 
 