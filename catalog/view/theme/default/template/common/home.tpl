<?php echo $header; ?>
<?php echo $content_top; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<?php echo $content_bottom; ?>
  <main class="content clear">
    <header class="header clear">
      <nav class="menu clear">
        <ul>
          <li class="menu__item"><a class="menu__link" href="#">О нас</a></li>
          <li class="menu__item"><a class="menu__link" href="#">Проекты</a></li>
          <li class="menu__item"><a class="menu__link" href="#">Услуги</a></li>
          <li class="menu__item"><a class="menu__link" href="#">Команда</a></li>
          <li class="menu__item"><a class="menu__link" href="#">Контакты</a></li>
        </ul>
      </nav>
    </header>
    <section class="banner parallax">
      <a title="Бутик-агенство Ruedo" class="banner__logo" href="/">
        <img alt="Ruedo" src="images/logo_ruedo.png"/>
      </a>
      
      <div class="parallax-element parallax-element-subheading">
        <h2>ruedo pr &amp; business communication</h2>
      </div>
      <div class="banner__slide banner__slide_main"></div>
      <div class="parallax-outer">        
        <img class="parallax-element parallax-element2" src="images/banner/2.png"/>
        <img class="parallax-element parallax-element3" data-direction="-1" src="images/banner/3.png"/>
        <img class="parallax-element parallax-element4" src="images/banner/4.png"/>
        <img class="parallax-element parallax-element5" src="images/banner/5.png"/>
        <img class="parallax-element parallax-element6" data-direction="-1" src="images/banner/6.png"/>
        <img class="parallax-element parallax-element7" src="images/banner/7.png"/>
        <img class="parallax-element parallax-element8" data-direction="-1" data-speed="3" src="images/banner/8.png"/>
        <img class="parallax-element parallax-element9" data-direction="-1" data-speed="12" src="images/banner/9.png"/>
        <img class="parallax-element parallax-element10" data-speed="2.5" src="images/banner/10.png"/>
        <img class="parallax-element parallax-element11" data-direction="-1" data-speed="3" src="images/banner/11.png"/>
        <img class="parallax-element parallax-element12" data-direction="1" src="images/banner/12.png"/>
        <img class="parallax-element parallax-element13" data-direction="-1" data-speed="2" src="images/banner/13.png"/>
        <img class="parallax-element parallax-element14" data-direction="-1" data-speed="2.5" src="images/banner/14.png"/>
        <img class="parallax-element parallax-element15" src="images/banner/15.png"/>
        <img class="parallax-element parallax-element16" data-direction="-1" data-speed="6" src="images/banner/16.png"/>
        <img class="parallax-element parallax-element17" data-direction="-1" data-speed="2" src="images/banner/17.png"/>
        <img class="parallax-element parallax-element18" src="images/banner/18.png"/>
        <img class="parallax-element parallax-element19" data-direction="-1" data-speed="7" src="images/banner/19.png"/>
        <img class="parallax-element parallax-element20" data-direction="-1" data-speed="9" src="images/banner/20.png"/>
      </div>
   </section>
    <?php if(!empty($information_about)) { ?>
      <?php echo html_entity_decode( $information_about['description'], ENT_QUOTES); ?>
    <?php } ?>
    

    <section class="projects parallax block block_black">
      <div class="wrap clear">
        <div class="projects__title-wrap parallax-element">
          <h2 class="projects__title">Проекты</h2>
        </div>
        <div class="notes-slider-wrap">
          <div class="notes-slider">
            <div>
              От корпоративных представлений до застройки лесопарка.
            </div>
            <div>
              От корпоративных представлений до застройки лесопарка 2.
            </div>
            <div>
              От корпоративных представлений до застройки лесопарка 3.
            </div>
            <div>
              От корпоративных представлений до застройки лесопарка 4.
            </div>
            <div>
              От корпоративных представлений до застройки лесопарка 5.
            </div>
          </div>
        </div>
        <nav class="projects-menu">
          <span class="projects-menu__toggle"></span>
          <ul class="projects-menu__list">
            <li class="projects-menu__item"><a class="projects-menu__link projects-menu__link_active" data-type="" href="#">Все</a></li>
            <?php if (!empty($occasion_groups)) { ?>
              <?php $i = 1; ?>
              <?php foreach ($occasion_groups as $og) { ?>
                <li class="projects-menu__item"><a class="projects-menu__link <?php echo ($i%2 ==0)?'projects-menu__link_highlight': ''; ?>" data-type="<?php echo $og['link']; ?>" href="#"><?php echo $og['title']; ?></a></li>
                <?php $i++ ?>
              <?php } ?>
              
            <?php } ?>
          </ul>
        </nav>
        <div class="projects-list clear">

          <?php if(!empty($occasions)){ ?>
            <?php foreach ($occasions as $occ_pr) { ?>
              <div class="project <?php echo $occ_pr['class']; ?>">
                <img class="project__image" src="<?php echo $occ_pr['image']; ?>"/>
                <a class="project__name-outer popup" href="#project_<?php echo $occ_pr['occasion_id']; ?>">
                  <span class="project__name">
                    <span class="project__title"><?php echo $occ_pr['title']; ?></span> <?php echo $occ_pr['min_title']; ?></span>
                </a>
              </div>
            <?php } ?>
          <?php } ?>

        </div>
      </div>
      <div class="parallax-outer">        
        <img class="parallax-element parallax-element33" src="images/projects/1.png"/>
        <img class="parallax-element parallax-element33-2" data-direction="-1" data-speed="8" src="images/projects/2.png"/>
        <img class="parallax-element parallax-element33-3" data-direction="-1" data-speed="3" src="images/projects/3.png"/>
        <img class="parallax-element parallax-element33-4" data-speed="2.5" src="images/projects/4.png"/>
        <img class="parallax-element parallax-element33-5" data-direction="-1" src="images/projects/5.png"/>
        <img class="parallax-element parallax-element33-6" data-direction="-1" data-speed="9" src="images/projects/6.png"/>
        <img class="parallax-element parallax-element33-7" data-direction="-1" src="images/projects/7.png"/>
        <img class="parallax-element parallax-element33-8" data-direction="-1" src="images/projects/8.png"/>
      </div>
    </section>

    <section class="service parallax block block_white">
      <div class="service__title-wrap parallax-element">
        <h2 class="service__title">Услуги</h2>
      </div>
      <div class="wrap">
        <div class="notes-slider-wrap">
          <div class="notes-slider">
            <div>
              Бутик-агенство в большом городе
            </div>
            <div>
              Бутик-агенство в большом городе 2
            </div>
            <div>
              Бутик-агенство в большом городе 3
            </div>
            <div>
              Бутик-агенство в большом городе 4
            </div>
            <div>
              Бутик-агенство в большом городе 5
            </div>
          </div>
        </div>
        <div class="service__list clear">
          <div class="swiper-container">
            <div class="swiper-wrapper">
              
              <?php if(!empty($places)){ ?>
                <?php foreach ($places as $pl) { ?>

                  <div class="swiper-slide">
                    <div class="service-item service-item_grey">
                      <img class="service-item__image" src="<?php echo $pl['place_image']; ?>"/>
                      <h3><?php echo $pl['place_title']; ?></h3>
                      <?php echo $pl['place_description']; ?>
                    </div>
                  </div>

                <?php } ?>
              <?php } ?>
             


            </div>
          </div>
        </div>
      </div>
      <div class="parallax-outer">        
        <img class="parallax-element parallax-element34_0" data-direction="-1" data-speed="2.4" src="images/service/0.png"/>
        <img class="parallax-element parallax-element34" data-direction="-1" data-speed="5" src="images/service/1.png"/>
        <img class="parallax-element parallax-element35" data-speed="3" src="images/service/2.png"/>
        <img class="parallax-element parallax-element36" data-direction="-1" data-speed="9" src="images/service/3.png"/>
        <img class="parallax-element parallax-element37" data-speed="3" src="images/service/4.png"/>
        <img class="parallax-element parallax-element38" data-speed="2.7" src="images/service/5.png"/>
        <img class="parallax-element parallax-element39" data-speed="1.3" src="images/service/6.png"/>
        <img class="parallax-element parallax-element39-2" data-speed="3" src="images/service/6.png"/>
        <img class="parallax-element parallax-element40" data-direction="-1" data-speed="7" src="images/service/7.png"/>
        <img class="parallax-element parallax-element41" src="images/service/8.png"/>
        <img class="parallax-element parallax-element42" data-direction="-1"  data-speed="8" src="images/service/9.png"/>
        <img class="parallax-element parallax-element43" src="images/service/10.png"/>
        <img class="parallax-element parallax-element44" src="images/service/11.png"/>
      </div>
    </section>

    <?php if(!empty($information_team)) { ?>
      <?php echo html_entity_decode( $information_team['description'], ENT_QUOTES); ?>
    <?php } ?>
     <?php if(!empty($information_contact)) { ?>
      <?php echo html_entity_decode( $information_contact['description'], ENT_QUOTES); ?>
    <?php } ?>
    
    <footer class="footer">
      Ruedo. Allright reserved 2015
    </footer>
  </main>   
  <noindex>
    <div class="loader"></div>

    <?php if(!empty($occasions)){ ?>
      <?php foreach ($occasions as $occ_pr) { ?>
       <div id="project_<?php echo $occ_pr['occasion_id']; ?>" class="popup-project popup-project_item">
        <div class="popup-project__inner">
          <div class="wrap clear">
            <article class="popup-project__text">
              <h2><?php echo $occ_pr['title']; ?></h2>
              <h3><?php echo $occ_pr['min_title']; ?></h3>
              <?php echo $occ_pr['description']; ?>
            </article>
            <div class="popup-project__images slider">
              <h2><?php echo $occ_pr['project_title']; ?></h2>
              <div class="swiper-container">
                <div class="swiper-wrapper">
                  <?php if(!empty($occ_pr['images_project'])){ ?>
                    <?php foreach ($occ_pr['images_project'] as $ip) { ?>
                      <div class="swiper-slide">
                        <img src="<?php echo  $ip['image']; ?>"/>
                      </div>
                    <?php } ?>
                  <?php } ?>
                  </div>
                <div class="slider__pagination"></div>
              </div>
            </div>
            <div class="popup-project__border"></div>
            <a class="popup-project__prev" href="#"></a>
            <a class="popup-project__next" href="#"></a>
            <a class="popup-project__close" href="#"></a>
          </div>
        </div>
      </div>
        
      <?php } ?>
    <?php } ?>


    
  </noindex>
<?php echo $footer; ?>