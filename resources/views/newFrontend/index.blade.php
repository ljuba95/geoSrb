<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GeoSrbija</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="css/agency.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="  js-scroll-trigger" href="#page-top">Start Bootstrap</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav  ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#portfolio">Portfolio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#team">Team</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container d-flex flex-column justify-content-between">
        <div class="intro-text">
          <div class="intro-heading ">geoSrbija</div>
          <div class="description">Digitalna platforma za Nacionalnu infrastrukturu geoprostornih podatataka</div>
          <div>
            <ul class="snsUl">
              <li>Pronadji</li>
              <li class="snsLi">Povezi</li>
              <li class="snsLi">Prikazi</li>
            </ul>
          </div>
          <div class="buttonWrapper">
            <div class="btnInnerWrapper">
              <a class="btn btn-primary btn-xl js-scroll-trigger" href="#">Katalog metapodataka</a>
            </div>
            <div  class="btnInnerWrapper">
              <a class="btn btn-primary btn-xl js-scroll-trigger" href="#">Kartografski pregled</a>
            </div>
          </div>
           <ul class="headerLanguages">
            @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
              <li class="languageLi">
                  <a id="languageLi" rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                      {{ $properties['native'] }}
                  </a>
              </li>
            @endforeach
          </ul>
        </div>
      </div>
    </header>

    <!-- Services -->
    <section class="nigpSection">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading ">Nacionalna infrastruktura geoprostornih podataka</h2>
          </div>
        </div>
        <div class="row text-center nigpRow">
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <a href="#"><img src="img/logos/katalog_metapodataka.svg" alt="Kartografski pregled"></a>
            </span>
            <p class="nigpDescription">Katalog metapodataka</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <a href="#"><img src="img/logos/kartografski_pregled.svg" alt="Kartografski pregled"></a>
            </span>
            <p class="nigpDescription">Kartografski pregled</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <a href="#"><img src="img/logos/video_uputstvo.svg" alt="Kartografski pregled"></a>
            </span>
            <p class="nigpDescription">Video uputstvo</p>
          </div>
        </div>
      </div>
    </section>

    <!-- News Grid -->
    <section class="newsLabel" id="news">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading ">Novosti</h2>
          </div>
        </div>
      </div>
    </section>

    <section class="newsSection">
      <div class="container">
        <div class="row">
          <div>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium ex inventore animi aut ipsa saepe voluptatibus nulla non! Quia vel, assumenda laboriosam maxime ab dolores alias quasi incidunt corporis est.
          </div>
        </div>
      </div>
    </section>

    <!-- About -->
    <section class="partnersSection">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading ">Partneri NIGP-a</h2>
          </div>
        partneri
      </div>
    </section>

    <!-- Team -->
    <section class="geoportalsSection">
    <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading ">Geoportali</h2>
          </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="footerSection">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; Your Website 2017</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-linkedin"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>

  </body>

</html>
