<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<% if((String)session.getAttribute("userlogin")==null){
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

        <section id="contact-2" class="contact-2 section">
        <div class="container">
            <div class="service-grids">
                <div class="service-grid1">
                    <div class="col-md-12 service-grid">
                        <br><br><br>
                        <h4 class="text-center p-3 bg-secondary text-white">Service Request Details</h4>
                        <div class="col-md-12">
                            
                            <div class="table-responsive">
                                <table class="table table-striped table-hover table-bordered text-center">
                                    <thead>
                                        <tr>
                                            <th>Service Name</th>
                                            <th>Service Details</th>
                                            <th>Service Type</th>
                                            <th>Service Provider</th>
                                            <th>Mobile No.</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            String userreqid = request.getParameter("userreqid");
                                            int us = Integer.parseInt((String)session.getAttribute("userlogin"));
                                            Database db = new Database();
                                            ResultSet row = db.select_row("SELECT * FROM user_request WHERE id='" + userreqid + "'");
                                            while (row.next()) {
                                                String status = row.getString("status");
                                                String service_prov_id = row.getString("service_prov_id");
                                                String service_id = row.getString("service_id");
                                                String type = row.getString("service_type");

                                                ResultSet row3 = db.select_row("SELECT * FROM services WHERE id=" + service_id + " AND status=1");
                                                row3.next();
                                                String serpro = row3.getString("service_name");
                                                String details = row3.getString("facilities") + " | " + row3.getString("service_type");

                                                ResultSet ress = db.select_row("SELECT * FROM service_provider_profile WHERE user_id=" + service_prov_id);
                                                ress.next();
                                                String serviceProviderName = ress.getString("full_name");
                                                String serviceProviderMobile = ress.getString("mobile_no");
                                        %>
                                        <tr>
                                            <td><%= serpro %></td>
                                            <td><%= details %></td>
                                            <td><%= type %></td>
                                            <td><%= serviceProviderName %></td>
                                            <td><%= serviceProviderMobile %></td>
                                            <td>
                                                <% String badgeClass = status.equals("pending") ? "status-badge status-pending" : 
                                                   status.equals("decline") ? "status-badge status-decline" : "status-badge status-accepted"; %>
                                                <span class="<%= badgeClass %>">
                                                    <%= status.substring(0, 1).toUpperCase() + status.substring(1) %>
                                                </span>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
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
  <script src="css/jquery.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>
        
    </body>
</html>
