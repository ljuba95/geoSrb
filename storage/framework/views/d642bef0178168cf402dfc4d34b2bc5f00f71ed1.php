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
        <a class="js-scroll-trigger navbar-brand" href="#page-top">
          <img width="150" src="img/logos/geoSrbija_logo.svg" alt="Republicki geodetski zavod" />
        </a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav  ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">Pocetna</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">NIGP</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">INSPIRE</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">Aktuelnosti</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">Najcesca pitanja</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">Korisni linkovi</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#">Kontakt</a>
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
            <?php $__currentLoopData = LaravelLocalization::getSupportedLocales(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $localeCode => $properties): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <li class="languageLi">
                  <a id="languageLi" rel="alternate" hreflang="<?php echo e($localeCode); ?>" href="<?php echo e(LaravelLocalization::getLocalizedURL($localeCode, null, [], true)); ?>">
                      <?php echo e($properties['native']); ?>

                  </a>
              </li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
        <div class="row" id="carousel">
          <div class="col-md-2 sliderButtons">
            <div id="buttons">
              <a href="#">
                <span id="prev" class="carousel-control-prev-icon"></span>
              </a>
            </div>
          </div>
          <div class="col-md-8" id="slides">
            <ul>
              <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <li class="slide newsWrapper">
                <div>
                  <p class="quoteHeading"><?php echo e($post->title); ?></p>
                </div>
                <div class="quoteContainer">
                  <p class="quote-phrase">
                    <?php echo e($post->excerpt); ?>

                  </p>
                </div>
                <div>
                  <button type="button" class="btn btn-outline-light">Procitaj jos</button>
                </div>
              </li>
              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
          </div>
          <div class="col-md-2 sliderButtons">
            <div id="buttons">
              <a href="#">
                <span id="next" class="carousel-control-next-icon"></span>
              </a>
            </div>
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
        <div class="listWrapper">
          <ul class="rowStyledList">
            <li class="listItem">Republicki geodetski zavod</li>
            <li class="listItem">Agencija za zastitu zivotne sredine</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>
            <li class="listItem">Zavod za zastitu prirode Srbije</li>

          </ul>
        </div>
      </div>
    </section>

    <!-- Team -->
    <section class="geoportalsSection">
    <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading ">Geoportali</h2>
          </div>
          <div class="listWrapper">
          <ul class="rowStyledList">
            <li class="listItem">INSPIRE</li>
            <li class="listItem">Norveska</li>
            <li class="listItem">Svedska</li>
            <li class="listItem">Nemacka</li>
            <li class="listItem">Svajcarska</li>
            <li class="listItem">Francuska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>
            <li class="listItem">Poljska</li>

          </ul>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="footerSection">
      <div>
        <img width="180" src="img/logos/rgz_beli_logo.svg" alt="Republicki geodetski zavod">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook-official"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-linkedin"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-envelope"></i>
                </a>
              </li>
            </ul>
            <span class="copyright">Copyright &copy; Republicki geodetski zavod</span>
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
    <script src="js/agency.js"></script>

  </body>

</html>
