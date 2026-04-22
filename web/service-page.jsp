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
    
        <%@ include file="includes/header.jsp" %>
  <main class="main">

    <!-- Page Title -->
    <div class="page-title">
        <div class="heading" style="padding: 40px 0;">
        <div class="container">
          <div class="row">
            <div class="col-lg-8">
              <h1 class="heading-title">Search Result</h1>
            </div>
          </div>
        </div>
      </div>
      
    </div><!-- End Page Title -->
    <section id="contact-2" class="contact-2 section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <!-- Contact Info Boxes -->
        <div class="row gy-4 mb-5">

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="contact-info-box row">
              <h4 class="h2">Search</h4>
                    <div class="col-md-12">
                        <form  method="get" action="service-page.jsp">
                            <input type="text" class="form-control" name="key" value='<% if(request.getParameter("location")!=null){ out.println(request.getParameter("location"));  } %>' placeholder="Search by location" required/>
                            <br>
                            <select class="form-select" id="key" name="key" required>
                              <option value="<% if(request.getParameter("key")!=null){ out.println(request.getParameter("key"));  } %>"><% if(request.getParameter("key")!=null){ out.println(request.getParameter("key"));  } %></option>
                              <option value="Electrician">Electrician</option>
                              <option value="Plumber">Plumber</option>
                              <option value="Carpenter">Carpenter</option>
                              <option value="Cleaner">Cleaner</option>
                            </select>
                            <br><input type="submit" class="btn btn-primary btn-submit" name="submit" value="Search"/><br><br>
                        </form>
                    </div>
            </div>
          </div>

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
            <div class="contact-info-box">
              <%
            
            Database db=new Database();
            String keyword="";
            ResultSet rsservices=null;
            if(request.getParameter("key")!=null){
                keyword=request.getParameter("key");
                rsservices=db.select_row("select * from services where service_name LIKE '%"+keyword+"%' or service_type LIKE '%"+keyword+"%'");
            }else{
                rsservices=db.select_row("select * from services");
            }
        %>  
        
        <div class="service-grids" style="padding-top:20px;">
                            <div class="service-grid1">
                                <%
                        if(rsservices!=null){
                            while(rsservices.next()){
                                String service_name=rsservices.getString("service_name");
                                String sid=rsservices.getString("id");
                                
                                    String facilities=rsservices.getString("facilities");
                                    String service_type=rsservices.getString("service_type");
                                    String start_price=rsservices.getString("start_price");
                                    String end_price=rsservices.getString("end_price");
                                    String image=rsservices.getString("image");
                                    String service_id=rsservices.getString("service_provider_id");
                                    String status=rsservices.getString("status");
                                    
                        %>
                        <div class="col-md-4 service-grid">
                                    <h4><a href="single-service-page.jsp?type=<%=service_type%>&sid=<%=sid%>"><%=service_name%></a></h4>
                                     <%
                                    if(image.equals("")){
                                    %>    
                                       <img src="uploads/default3.jpg" style="height: 195px;" class="img-responsive" alt=""/>
                                    <%
                                    }else{
                                     %>    
                                     <img src="uploads/<%=image%>" style="height: 195px;" class="img-responsive" alt=""/>
                                    <%   
                                    }
                                    %>       
                                       <h5><%=service_type%></h5>
                                </div>
                        <%
                                
                            }
                        }
                        %>
                               
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        
            </div>
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

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>