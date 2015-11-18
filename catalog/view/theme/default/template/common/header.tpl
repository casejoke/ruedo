<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Favicons -->
<link href="catalog/view/theme/default/assets/images/favicon.ico" rel="icon" />
<link rel="shortcut icon" href="catalog/view/theme/default/assets/images/favicon.ico">
<link rel="apple-touch-icon" href="catalog/view/theme/default/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="catalog/view/theme/default/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="catalog/view/theme/default/assets/images/apple-touch-icon-114x114.png">


<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter31400433 = new Ya.Metrika({id:31400433,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/31400433" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
  <!-- Javascript files -->
  <script src="catalog/view/theme/default/assets/js/jquery.superslides.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/jquery.mb.YTPlayer.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/jquery.magnific-popup.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/owl.carousel.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/jquery.simple-text-rotator.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/imagesloaded.pkgd.js"></script>
  <script src="catalog/view/theme/default/assets/js/isotope.pkgd.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/packery-mode.pkgd.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/appear.js"></script>
  <script src="catalog/view/theme/default/assets/js/jquery.easing.1.3.js"></script>
  <script src="catalog/view/theme/default/assets/js/wow.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/jqBootstrapValidation.js"></script>
  <script src="catalog/view/theme/default/assets/js/jquery.fitvids.js"></script>
  <script src="catalog/view/theme/default/assets/js/jquery.parallax-1.1.3.js"></script>
  <script src="catalog/view/theme/default/assets/js/smoothscroll.js"></script>
  <script src="catalog/view/theme/default/assets/js/contact.js"></script>
  <script src="catalog/view/theme/default/assets/js/stupidtable.min.js"></script>
  <script src="catalog/view/theme/default/assets/js/custom.js"></script>




  <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>

  
  <!-- Bootstrap core CSS -->
  <link href="catalog/view/theme/default/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Plugins -->
  <link href="catalog/view/theme/default/assets/css/font-awesome.min.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/css/ionicons.min.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/css/simpletextrotator.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/css/magnific-popup.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/css/owl.carousel.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/css/vertical.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/css/jquery.bootgrid.min.css" rel="stylesheet">
  <link href="catalog/view/theme/default/assets/css/animate.css" rel="stylesheet">
  
  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <!-- Template core CSS -->
  <link href="catalog/view/theme/default/assets/css/style.css" rel="stylesheet">
  <?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
  <!-- PRELOADER -->
  <div class="page-loader">
    <div class="loader">Loading...</div>
  </div>
  <!-- /PRELOADER -->
  <!-- OVERLAY MENU -->
  <div id="overlay-menu" class="overlay-menu">

    <a href="#" id="overlay-menu-hide" class="navigation-hide"><i class="ion-close-round"></i></a>
    
    <div class="overlay-menu-inner">
      <nav class="overlay-menu-nav">
        <ul id="nav">
          <li><a href="/statistics" title="Статистика">Статистика</a></li>
          <li><a href="/timetable" title="Расписание">Расписание</a></li>
          <li><a href="/reports" title="Отчеты">Отчеты</a></li>
          <li><a href="/about_us" title="О нас">О нас</a></li>
          <li><a href="/news" title="Новости">Новости</a></li>
          <?php if ($logged) { ?>
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
          <?php } else { ?>
          <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
          <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
          <?php } ?>
        </ul>
      </nav>
    </div>
    
    <div class="overlay-navigation-footer">
    
      <div class="container">
    
        <div class="row">
    
          <div class="col-sm-12 text-center">
            <p class="copyright font-alt m-b-0">&copy;&nbsp;2015 footbic.ru, Все права защищены.</p>
          </div>
    
        </div>
    
      </div>
    
    </div>

  </div>
  <!-- /OVERLAY MENU -->

  <!-- WRAPPER -->
  <div class="wrapper">

    <!-- NAVIGATION -->
    <nav class="navbar navbar-custom navbar-transparent navbar-fixed-top">

      <div class="container">
      
        <div class="navbar-header">
          <!-- YOU LOGO HERE -->
            <?php if ($logo) { ?>
              <a class="navbar-brand" href="<?php echo $home; ?>">
                <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" width="140"/>
              </a>
            <?php } ?>
        </div>
       
        <!-- ICONS NAVBAR -->
        <ul id="icons-navbar" class="nav navbar-nav navbar-right">
          <li>
            <a href="#" id="toggle-menu" class="show-overlay" title="Menu">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
          </li>
        </ul>
        <!-- /ICONS NAVBAR -->
      
        <ul class="extra-navbar nav navbar-nav navbar-right">
        
          <li><a href="/statistics" title="Статистика">Статистика</a></li>
          <li><a href="/timetable" title="Расписание">Расписание</a></li>
          <li><a href="/reports" title="Отчеты">Отчеты</a></li>
          <li><a href="/about_us" title="О нас">О нас</a></li>
          <li><a href="/news" title="Новости">Новости</a></li>
          <?php if ($logged) { ?>
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
          <?php } else { ?>
          <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
          <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
          <?php } ?>
        </ul>
      
      </div>

    </nav>
    <!-- /NAVIGATION -->


