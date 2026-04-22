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
        <%@ include file="includes/service-header.jsp" %>    
        <main class="main">

        <section id="contact-2" class="contact-2 section">
            <div class="container">
                <div class="service-grids">
                    <div class="service-grid1">
                        <% int userid = Integer.parseInt((String)session.getAttribute("servicelogin")); %>
                        <div class="col-md-12 service-grid">
                            <br><br><br>
                            <h4 style="text-align:left;">
                                <p style="padding:0px 10px;">My Services
                                    <a class="add-service-btn" style="float:right;" href="add-service.jsp">+ Add Service</a>
                                </p>
                            </h4>
                            <div class="col-md-12"> 
                                <br>
                                <%
                                    Database db = new Database();
                                    ResultSet rsea = db.select_row("SELECT * FROM services WHERE service_provider_id=" + userid);
                                    boolean hasServices = false;
                                    if (rsea != null) {
                                        while (rsea.next()) {
                                            hasServices = true;
                                            String image = rsea.getString("image");
                                            String service_id = rsea.getString("service_provider_id");
                                            String id = rsea.getString("id");
                                %>
                                <div class="col-md-3 service-grid">
                                    <h4>
                                        <a href="my-single-service.jsp?type=<%=rsea.getString("service_type")%>&sid=<%=service_id%>&spid=<%=id%>">
                                            <%=rsea.getString("service_name")%>
                                        </a>
                                    </h4>
                                    <img src="uploads/<%=image.isEmpty() ? "default3.jpg" : image%>" class="img-responsive" alt="Service Image"/>
                                    <h5><%=rsea.getString("service_type")%></h5>
                                </div>
                                <%
                                        }
                                    }
                                    if (!hasServices) {
                                %>
                                <p class="empty-message">No services added yet. <a href="add-service.jsp">Click here</a> to add one.</p>
                                <% } %>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
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
 
