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
        <%@ include file="includes/header.jsp" %>
                <main class="main">

        <section id="contact-2" class="contact-2 section">
            <div class="container">
                <div class="service-grids">
                    <div class="service-grid1">
                        <div class="col-md-12 service-grid">
                            <br><br><br>
                            <h4 class="text-center p-3 bg-secondary text-white">Request List</h4>
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover table-bordered text-center">
                                        <thead>
                                            <tr>
                                                <th>Service Provider</th>
                                                <th>Service Type</th>
                                                <th>Service</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int userid = Integer.parseInt((String) session.getAttribute("userlogin"));
                                                Database db = new Database();
                                                ResultSet rs = db.select_row("SELECT * FROM user_request WHERE user_id=" + userid);
                                                if (rs != null) {
                                                    while (rs.next()) {
                                                        int c = rs.getInt("id");
                                                        int service_prov_id = rs.getInt("service_prov_id");
                                                        int service_id = rs.getInt("service_id");
                                                        String sertype = rs.getString("service_type");
                                                        String status = rs.getString("status");

                                                        ResultSet rse = db.select_row("SELECT * FROM services WHERE id=" + service_id);
                                                        if (rse != null && rse.next()) {
                                                            ResultSet resser = db.select_row("SELECT * FROM service_provider_profile WHERE user_id=" + service_prov_id);
                                                            if (resser != null && resser.next()) {
                                            %>
                                            <tr>
                                                <td><%= resser.getString("full_name") %></td>
                                                <td><%= sertype %></td>
                                                <td><%= rse.getString("service_name") %></td>
                                                <td class="text-center align-middle">
                                                <div class="d-flex flex-column justify-content-center align-items-center" style="height: 100%;">
                                                <% 
                                                    String badgeClass = "";
                                                    if (status.equals("pending")) { 
                                                        badgeClass = "status-badge status-pending"; 
                                                    } else if (status.equals("decline")) { 
                                                        badgeClass = "status-badge status-decline";
                                                    } else { 
                                                        badgeClass = "status-badge status-accepted"; 
                                                    }
                                                %>
                                                <span class="<%= badgeClass %> mb-2">
                                                    <%= status.substring(0, 1).toUpperCase() + status.substring(1) %> 
                                                </span>
                                                <a href="user-request-details.jsp?userreqid=<%= c %>" class="btn btn-info mt-2">Details</a>
                                                </div>
                                                </td>


                                            </tr>
                                            <%
                                                            }
                                                        }
                                                    }
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
