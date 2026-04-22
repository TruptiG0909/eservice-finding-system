
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

    <script type="text/javascript">
            function postservice()
            {
                var service_type=document.formservice.service_type.value;
                var service_name=document.formservice.service_name.value;
                var start_price=document.formservice.start_price.value;
                var end_price=document.formservice.end_price.value;
                var facilities=document.formservice.facilities.value;

                if(service_type=='')
                {
                    alert('Please choose service type.');
                }
                else if(service_name=='')
                {
                    alert('Please enter service name.');
                }
                else if(start_price=='')
                {
                    alert('Please enter start price.');
                }
                else if(end_price=='')
                {
                    alert('Please enter end price.');
                }
                else if(!$.isNumeric(start_price))
                {
                    alert('Please enter valid cost.');
                }
                else if(!$.isNumeric(end_price))
                {
                    alert('Please enter valid cost.');
                }
                else if(facilities=='')
                {
                    alert('Please enter facilities.');
                }
                else
                {
                    if(confirm("Are you sure want to add service?"))
                    {
                        document.formservice.submit();
                    }
                    else
                    {

                    }
                }
            }
    </script>
 
</head>

<body class="contact-page">
        <%@ include file="includes/service-header.jsp" %>	
        <main class="main">

        <section id="contact-2" class="contact-2 section">
				<div class="container">
					
						<div class="service-grids">
							<div class="service-grid1">

                                <div class="col-md-12 service-grid"><br><br><br>
                                    <h4 style="text-align:left;"><p style="padding:0px 10px;">Add service<a style="float:right; padding-right:5px;" href="my-services.jsp">All services</a></p></h4>
                                    <div class="mail-grids">
                                           
                                        <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    %>
                                    <script>alert("Service added..."); window.location.href="add-service.jsp";</script>
                                    <%
                                }else{
                                    %>
                                    <script>alert("Service not added..."); window.location.href="add-service.jsp";</script>
                                    <%
                                }
                            }
                        %>    
                                       
                                                    <form action="includes/WebService.jsp" method="post" name="formservice" >
                                                        <input type="hidden" name="action" value="postservice"/>
                                                        <div class="contact-form" style="text-align: left;">
                                                            <div class="col-md-6">
                                                                <label>Service Type*</label>
                                                                <select name="service_type" class="form-control" required>
                                                                    <option value="">Choose service type</option>
                                                                    <option value="Electrician">Electrician</option>
                                                                    <option value="Plumber">Plumber</option>
                                                                    <option value="Carpenter">Carpenter</option>
                                                                    <option value="Cleaner">Cleaner</option>
                                                           
                                                                </select>
                                                            </div>
                                                            
                                                            <div class="col-md-6">
                                                                <label>Service name*</label>
                                                                <input type="text" name="service_name" class="form-control" placeholder="" required>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label>Price Start*</label>
                                                                <input type="text" name="start_price" class="form-control" placeholder="" required>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label>Price End*</label>
                                                                <input type="text" name="end_price" class="form-control" placeholder="" required>
                                                            </div>

                                                            <div class="col-md-12">
                                                                <label>Facilities*</label>
                                                                <textarea name="facilities" class="form-control" placeholder="" class="form-control" required></textarea>
                                                            </div>
                                                            
                                                            <div class="col-md-12" style="margin-bottom: 10px;"><br>
                                                                <div class="col-md-2">
                                                                    <input type="button" class="btn btn-primary" onclick="postservice();"  value="Add service"/>
                                                                </div>
                                                                <br><br><br><br><br>
                                                            </div>
                                                        </div>
                                                    </form>
                                                          

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
 
