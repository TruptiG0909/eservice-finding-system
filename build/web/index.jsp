
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

<body class="index-page">
    
    <%@ include file="includes/header.jsp" %>
            
  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="hero-content">
          <div class="row align-items-center">

            <div class="col-lg-6 hero-text" data-aos="fade-right" data-aos-delay="200">
              <div class="hero-badge">
                <i class="bi bi-star-fill"></i>
                <span>Premium Services</span>
              </div>
              <h1>E-Service Finding - A platform to find and hire temporary workers online.</h1>

              <div class="search-form" data-aos="fade-up" data-aos-delay="300">
                  <form action="service-page.jsp" method="get">
                  <div class="row g-3">
                    <div class="col-12">
                      <div class="form-floating">
                        <input type="text" class="form-control" id="location" name="location" required>
                        <label for="location">Location</label>
                      </div>
                    </div>

                    <div class="col-md-12">
                      <div class="form-floating">
                        <select class="form-select" id="key" name="key" required>
                          <option value="">Select Service</option>
                          <option value="Electrician">Electrician</option>
                          <option value="Plumber">Plumber</option>
                          <option value="Carpenter">Carpenter</option>
                          <option value="Cleaner">Cleaner</option>
                        </select>
                        <label for="property-type">Service</label>
                      </div>
                    </div>


                    <div class="col-12">
                      <button type="submit" class="btn btn-search w-100">
                        <i class="bi bi-search"></i>
                        Search
                      </button>
                    </div>
                  </div>
                </form>
              </div>

              <div class="hero-stats" data-aos="fade-up" data-aos-delay="400">
                <div class="row">
                  <div class="col-4">
                    <div class="stat-item">
                      <h3><span data-purecounter-start="0" data-purecounter-end="2847" data-purecounter-duration="1" class="purecounter"></span>+</h3>
                      <p>Services Listed</p>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="stat-item">
                      <h3><span data-purecounter-start="0" data-purecounter-end="156" data-purecounter-duration="1" class="purecounter"></span>+</h3>
                      <p>Verified Service providers</p>
                    </div>
                  </div>
                  <div class="col-4">
                    <div class="stat-item">
                      <h3><span data-purecounter-start="0" data-purecounter-end="98" data-purecounter-duration="1" class="purecounter"></span>%</h3>
                      <p>Client Satisfaction</p>
                    </div>
                  </div>
                </div>
              </div>

            </div><!-- End Hero Text -->

            <div class="col-lg-6 hero-images" data-aos="fade-left" data-aos-delay="400">
              <div class="image-stack">
                <div class="main-image">
                  <img src="assets/img/real-estate/property-exterior-3.png" alt="Luxury Property" class="img-fluid">
                </div>
                <div class="secondary-image">
                  <img src="assets/img/real-estate/property-interior-7.webp" alt="Property Interior" class="img-fluid">
                </div>

              </div>
            </div><!-- End Hero Images -->

          </div>
        </div>

      </div>

    </section><!-- /Hero Section -->

    <!-- Featured Services Section -->
    <section id="featured-services" class="featured-services section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Featured Services</h2>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-4 justify-content-center">

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="200">
            <div class="service-card">
              <div class="service-header">
                <div class="service-icon">
                  <i class="bi bi-search"></i>
                </div>
                <div class="service-number">01</div>
              </div>
              <div class="service-content">
                <h3><a href="service-page.jsp?key=Electrician">Electrician</a></h3>
                
              </div>
              <div class="service-action">
                <a href="service-page.jsp?key=Electrician" class="service-btn">
                  <span>Find</span>
                  <i class="bi bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="300">
            <div class="service-card featured">
              <div class="service-header">
                <div class="service-icon">
                  <i class="bi bi-graph-up"></i>
                </div>
                <div class="service-number">02</div>
              </div>
              <div class="service-content">
                <h3><a href="service-page.jsp?key=Plumber">Plumber</a></h3>
               
              </div>
              <div class="service-action">
                <a href="service-page.jsp?key=Plumber" class="service-btn">
                  <span>Find</span>
                  <i class="bi bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="400">
            <div class="service-card">
              <div class="service-header">
                <div class="service-icon">
                  <i class="bi bi-key"></i>
                </div>
                <div class="service-number">03</div>
              </div>
              <div class="service-content">
                <h3><a href="service-page.jsp?key=Carpenter">Carpenter</a></h3>
                
              </div>
              <div class="service-action">
                <a href="service-page.jsp?key=Carpenter" class="service-btn">
                  <span>Find</span>
                  <i class="bi bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="500">
            <div class="service-card">
              <div class="service-header">
                <div class="service-icon">
                  <i class="bi bi-shield-check"></i>
                </div>
                <div class="service-number">04</div>
              </div>
              <div class="service-content">
                <h3><a href="service-page.jsp?key=Cleaner">Cleaner</a></h3>
                
              </div>
              <div class="service-action">
                <a href="service-page.jsp?key=Cleaner" class="service-btn">
                  <span>Find</span>
                  <i class="bi bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div><!-- End Service Item -->

        </div>


      </div>

    </section><!-- /Featured Services Section -->

  </main>

<%@ include file="includes/footer.jsp" %>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/drift-zoom/Drift.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html> 