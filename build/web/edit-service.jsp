
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
<!----header-banner--->
        <%@ include file="includes/service-header.jsp" %>	
		<main class="main">

        <section id="contact-2" class="contact-2 section">
				<div class="container">
					
						<div class="service-grids">
							<div class="service-grid">

                                <div class="col-md-12 service-grid"  style="background-color:#fff;">
                                    <h4 style="text-align:left;"><br><br><br>
                                        <p style="padding:0px 10px;">My service details</p></h4>
                                    <div class="mail-grids">
                                        <%
                                        Database db=new Database();
                                        String type=request.getParameter("type");
                                        if(type!=null)
                                        {
                                            String spid=request.getParameter("spid");
                                            String sid=request.getParameter("sid");
                                            session.setAttribute("type", type);
                                            session.setAttribute("spid", spid);
                                            session.setAttribute("sid", sid);
                                            
                                                    ResultSet res=db.select_row("select * from services where id='"+spid+"' AND service_provider_id='"+sid+"' AND status=1");
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
                                                        <div class="col-md-12">
                                                        <%
                                                        ResultSet row1 =db.select_row("select * from service_provider_profile where user_id='"+sid+"'");
                                                        if(row1!=null){
                                                            row1.next();

                                                        %>

                                                        <form action="includes/WebService.jsp" method="post" name="formroom" >
                                                            <div class="row" style="text-align: left;">

                                                                <div class="col-md-6">
                                                                    <label>Service Type*</label>
                                                                    <select name="service_type" class="form-control" required>
                                                                        <option value="">Choose service type</option>
                                                                        <option value="Electrician" <% if(type.equals("Electrician")){ out.println("selected"); } %>>Electrician</option>
                                                                        <option value="Plumber" <% if(type.equals("Plumber")){ out.println("selected"); } %>>Plumber</option>
                                                                        <option value="Carpenter" <% if(type.equals("Carpenter")){ out.println("selected"); } %>>Carpenter</option>
                                                                        <option value="Cleaner" <% if(type.equals("Cleaner")){ out.println("selected"); } %>>Cleaner</option>
                                                                    </select>
                                                                </div>
                                                                    
                                                                <div class="col-md-6">
                                                                    <label>Service Name*</label>
                                                                    <input type="text" name="service_name" class="form-control" value="<%=service_name%>" placeholder="" required>
                                                                </div>
                                                                    

                                                                <div class="col-md-6">
                                                                    <label>Start Price*</label>
                                                                    <input type="text" name="start_price" class="form-control" value="<%=start_price%>"
                                                                           placeholder="" required>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label>End Price*</label>
                                                                    <input type="text" name="end_price" class="form-control" value="<%=end_price%>"
                                                                           placeholder="" required>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label>Facilities*</label>
                                                                    <textarea name="facilities" class="form-control" class="form-control" required><%=facilities%></textarea>
                                                                </div>
                                                                           <input type="hidden" name="id" value="<%=res.getInt("id")%>"/>
                                                                           <input type="hidden" value="updateservice" name="action"/>
                                                                <div class="col-md-12" style="margin-bottom: 10px;"><br>
                                                                    <div class="col-md-2">
                                                                        <input type="submit"  class="btn btn-primary" value="Update service"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <form action="uploadFile.jsp" method="post" name="formroom" enctype="multipart/form-data">
                                                            <div class="contact-form" style="text-align: left;">
                                                                <div class="col-md-12"><br><hr><br></div>
                                                                <div class="col-md-6">
                                                                    <label>Select image</label>
                                                                    <input type="file" name="file" required="true"/>
                                                                     </div>
                                                                    <div class="col-md-6">
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
                                                               

                                                                <div class="col-md-12" style="margin-bottom: 10px;">
                                                                    <div class="col-md-2">
                                                                        <input type="submit"  value="Update Image"/>
                                                                    </div>
                                                                    <br><br><br><br><br>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    <%
                                                    }
                                                    }
                                                    }
                                                    
                                            
                                        }
                                        %>

                                </div>


							</div>
					</div>
			</div>
		</div>
                                </div></section>
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
 
