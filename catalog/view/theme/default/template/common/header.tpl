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

  <!--[if lt IE 9]>
    <script src="catalog/view/javascript/html5shiv.js"></script>
    <script src="catalog/view/javascript/selectivizr.min.js"></script>
  <![endif]-->
  
  <script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script type="text/javascript" src="catalog/view/javascript/jquery.1.8.min.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/idangerous.swiper.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/jquery.fancybox.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/prefixfree.min.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/jquery.transit.min.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/slick.min.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/modernizr.js"></script>
  <script type="text/javascript" src="catalog/view/javascript/main.js"></script>



  <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>

  <link rel="stylesheet" href="catalog/view/theme/default/assets/css/normalize.css" />
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/assets/css/idangerous.swiper.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/assets/css/jquery.fancybox.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/assets/css/slick.css"/>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/assets/css/main.css"/>


  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  
  <?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?> body">
  


