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
            <div class="service-grid1">
                <div class="col-md-12 service-grid">
                    <br><br><br>
                    <h4 class="title-bar">User Details <a style="float:right; padding-right:5px;" href="service-request.jsp">Back</a></h4>
                    <div class="user-details-card">
                        <div class="row">
                            <%  
                            String ureg_id = request.getParameter("userid");
                            Database db = new Database();
                            ResultSet row = db.select_row("select * from user_profile where user_id='" + ureg_id + "'");
                            if (row.next()) {
                                String img = row.getString("image");
                                ResultSet row1 = db.select_row("select * from user where id=" + ureg_id);
                                row1.next();
                            %>
                            <div class="col-md-4 text-center">
                                <% if (img.equals("")) { %>
                                    <img src="uploads/default3.jpg" class="img-fluid" alt="Profile Image"/>
                                <% } else { %>
                                    <img src="uploads/<%=img%>" class="img-fluid" alt="Profile Image"/>
                                <% } %>
                            </div>
                            <div class="col-md-8">
                                <table class="table table-borderless">
                                    <tr>
                                        <td class="user-details-label">Full Name:</td>
                                        <td><%= row.getString("full_name") %></td>
                                    </tr>
                                    <tr>
                                        <td class="user-details-label">Username:</td>
                                        <td><%= row1.getString("username") %></td>
                                    </tr>
                                    <tr>
                                        <td class="user-details-label">Address:</td>
                                        <td><%= row.getString("address") %></td>
                                    </tr>
                                    <tr>
                                        <td class="user-details-label">Mobile Number:</td>
                                        <td><%= row.getString("mobile_no") %></td>
                                    </tr>
                                    <tr>
                                        <td class="user-details-label">Email ID:</td>
                                        <td><%= row.getString("email_id") %></td>
                                    </tr>
                                </table>
                            </div>
                            <% } %>
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
