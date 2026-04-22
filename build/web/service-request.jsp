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
                    <div class="col-md-12 service-grid"><br><br>
                        <h4 class="text-center p-3 bg-secondary text-white">Request List</h4>
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover table-bordered text-center">
                                    <thead>
                                        <tr>
                                            <th>Customer Name</th>
                                            <th>Address</th>
                                            <th>Service Type</th>
                                            <th>Service Name</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int us = Integer.parseInt((String) session.getAttribute("servicelogin"));
                                            Database db = new Database();
                                            ResultSet row = db.select_row("SELECT * FROM user_request WHERE service_prov_id='" + us + "'");
                                            
                                            while (row.next()) {
                                                String userreqid = row.getString("id");
                                                String status = row.getString("status");
                                                String user_id = row.getString("user_id");
                                                String service_id = row.getString("service_id");
                                                String type = row.getString("service_type");
                                                
                                                ResultSet serviceRow = db.select_row("SELECT * FROM services WHERE id=" + service_id + " AND status=1");
                                                serviceRow.next();
                                                String serviceName = serviceRow.getString("service_name");
                                                
                                                ResultSet customerRow = db.select_row("SELECT * FROM user_profile WHERE user_id=" + user_id);
                                                customerRow.next();
                                                String customerName = customerRow.getString("full_name");
                                                String customerAddress = customerRow.getString("address");
                                        %>
                                        <tr>
                                            <td><b><a href="view-user-profile.jsp?userid=<%= user_id %>" style="color: blue; text-decoration: none;"><%= customerName %></a></b></td>
                                            <td><%= customerAddress %></td>
                                            <td><%= type %></td>
                                            <td><%= serviceName %></td>
                                            <td>
                                                <%
                                                    if (status.equals("pending")) {
                                                %>
                                                    <span class="badge badge-pending">Pending</span>
                                                    <a href="javascript:updatestatusrequest(<%= userreqid %>, 'decline');" class="btn btn-danger btn-sm">Decline</a> 
                                                    <a href="javascript:updatestatusrequest(<%= userreqid %>, 'accept');" class="btn btn-success btn-sm">Accept</a>
                                                <%
                                                    } else if (status.equals("decline")) {
                                                %>
                                                    <span class="badge badge-declined">Not Accepted</span>
                                                <%
                                                    } else {
                                                %>
                                                    <span class="badge badge-accepted">Accepted</span>
                                                    <a href="request-details.jsp?userreqid=<%= userreqid %>" class="btn btn-info btn-sm">Details</a>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <% } %>
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

<script>
    function updatestatusrequest(userreqid, status) {
        if (confirm("Are you sure?")) {
            $.ajax({
                url: "includes/WebService.jsp",
                method: "POST",
                data: {"action": "updatestatusrequest", "status": status, "userreqid": userreqid},
                success: function(res) {
                    if (res == 1 && status === "accept") {
                        alert("User request accepted successfully!");
                    } else {
                        alert("User request declined successfully!");
                    }
                    window.location.reload();
                }
            });
        }
    }
</script>
