<?php echo $header; ?>
<section class="module-small bg-dark" data-background="<?php echo $main_image; ?>">
  <div class="container">
    <!-- MODULE TITLE -->
    <div class="row">
      <div class="col-sm-6 col-sm-offset-3">
        <h1 class="mh-line-size-3 font-alt m-b-20 text-center"><?php echo $heading_title; ?></h1>
       </div>
    </div>
    <!-- /MODULE TITLE -->
  </div>
</section>
<!-- CONTACT -->
    <section class="module">

      <div class="container">
        <?php echo $content_top; ?>
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3">
            <h2 class="module-title font-alt"><?php echo $text_my_account; ?></h2>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1">
            <div class="col-xs-12 col-sm-4 m-b-30">
                <div class="team-item">
                  <div class="team-image">
                    
                    

                    <img src="<?php echo $image; ?>" alt="" id="i-account_image">
                    
                    <div class="team-detail text-center">
                      <a href="#" class="btn btn-info btn-round  btn-xs m-b-20" data-toggle="image" id="account_image">Изменить аватар</a>
                    </div>
                    <input type="hidden" name="image" value="<?php echo $image; ?>" />
                  </div>
                  <div class="team-descr">
                    <h5 class="team-name font-alt"><?php echo $firstname?>&nbsp;<?php echo $lastname?></h5>
                    
                    <a class="btn btn-info btn-round  btn-xs m-b-20" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                  </div>
                </div>
              
            </div>
            <div class="col-xs-12 col-sm-8 m-b-30">
              <div role="tabpanel">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  <li class="active"><a href="#stats" data-toggle="tab" aria-expanded="true">Статистика</a></li>
                  <li><a href="#contact_information" data-toggle="tab" aria-expanded="true">Контактная информация</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active " id="stats">
                    <!-- *********************************************************** -->
                    <div role="tabpanel">
                      <?php if ($list_statistics) { ?>
                      <?php $first = true; ?>
                      <?php $isset_tab = false; ?>
                      <ul class="nav nav-tabs font-alt" role="tablist">
                        <?php foreach ($occasion_groups as $occasion_group) { ?>

                          <?php if (!empty($list_statistics)) { ?>

                            <?php foreach ($list_statistics as $key => $stat) { ?>
                              <?php if($key == $occasion_group['occasion_group_id']) { ?>
                                <?php $isset_tab = true; ?>
                                <?php break; ?>
                              <?php } ?>
                            <?php } ?>

                          <?php } ?>

                          <?php if ($isset_tab) { ?>
                            <li class="<?php if ( $first ) { echo 'active'; };?>"><a href="#occasion_group_<?php echo $occasion_group['occasion_group_id'];?>" data-toggle="tab"><?php echo $occasion_group['occasion_title'];?></a></li>
                            <?php $isset_tab = false; ?>  
                            <?php $first = false; ?> 
                          <?php } ?>

                        <?php } ?>
                        
                      </ul>
                        <div class="tab-content">
                          <?php $first = true; ?>
                          <?php foreach ($occasion_groups as $occasion_group) { ?>

                            <?php if (!empty($list_statistics[$occasion_group['occasion_group_id']])) { ?>
                            <div class="tab-pane <?php if ( $first ) { echo 'active'; };?> " id="occasion_group_<?php echo $occasion_group['occasion_group_id'];?>">
                                  <div class="col-sm-12">
                                    <h5 class="text-center font-alt">Сезон: <?php echo $list_statistics[$occasion_group['occasion_group_id']]['season_title']; ?></h5>
                                  </div>
                              
                                  <div class="col-xs-6 col-sm-3">
                                    <h6 class="progress-title font-alt">Пасы <span ><?php echo $list_statistics[$occasion_group['occasion_group_id']]['pass']; ?></span></h6>
                                  </div>
                                  <div class="col-xs-6 col-sm-3">
                                    <h6 class="progress-title font-alt">Голы <span ><?php echo $list_statistics[$occasion_group['occasion_group_id']]['goal']; ?></span></h6>
                                  </div>
                                  <div class="col-xs-6 col-sm-3">
                                    <h6 class="progress-title font-alt">Очки <span ><?php echo ($list_statistics[$occasion_group['occasion_group_id']]['goal']+($list_statistics[$occasion_group['occasion_group_id']]['pass'])); ?></span></h6>
                                  </div>
                                  <div class="col-xs-6 col-sm-3">
                                    <h6 class="progress-title font-alt">MVP <span ><?php echo $list_statistics[$occasion_group['occasion_group_id']]['mvp']; ?></span></h6>
                                  </div>

                                    <h6 class="progress-title font-alt">Количество игровых дней <span class="pull-right"><?php echo $list_statistics[$occasion_group['occasion_group_id']]['day']; ?></span></h6>
                                    <div class="progress">
                                      <div class="progress-bar " aria-valuenow="<?php echo $list_statistics[$occasion_group['occasion_group_id']]['k_day_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <span class="font-alt"></span>
                                      </div>
                                    </div>

                                    <h6 class="progress-title font-alt">Результативность<span class="pull-right"><?php echo $list_statistics[$occasion_group['occasion_group_id']]['k_res']; ?></span></h6>
                                    <div class="progress">
                                      <div class="progress-bar " aria-valuenow="<?php echo $list_statistics[$occasion_group['occasion_group_id']]['k_res_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <span class="font-alt"></span>
                                      </div>
                                    </div>

                                    <h6 class="progress-title font-alt">Пас<span class="pull-right"><?php echo $list_statistics[$occasion_group['occasion_group_id']]['k_pass']; ?></span></h6>
                                    <div class="progress">
                                      <div class="progress-bar " aria-valuenow="<?php echo $list_statistics[$occasion_group['occasion_group_id']]['k_pass_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <span class="font-alt"></span>
                                      </div>
                                    </div>

                                    <h6 class="progress-title font-alt">Эффективность<span class="pull-right"><?php echo $list_statistics[$occasion_group['occasion_group_id']]['k_e']; ?></span></h6>
                                    <div class="progress">
                                      <div class="progress-bar " aria-valuenow="<?php echo $list_statistics[$occasion_group['occasion_group_id']]['k_e_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <span class="font-alt"></span>
                                      </div>
                                    </div>

                              
                            </div>
                            <?php $first = false; ?>
                            <?php } ?> 
                          
                          <?php } ?>

                        </div>
                      <?php } else { ?>
                        <h5 class="text-center font-alt">В данный момент статистика недоступна. </h5>
                        <h5 class="text-center font-alt">Зайдите немного позже. </h5>
                      <?php } ?>

                    <!-- /TABS -->
                    </div>
                    <!-- *********************************************************** -->
                    <?php if(!empty($list_statistics_for_as)) { ?>
                    <div class="row">
                      <div class="col-sm-12">
                        <h5 class="text-center font-alt">Архив статистики</h5>
                         <!-- *********************************************************** -->
                          <div role="tabpanel">
                            <ul class="nav nav-tabs font-alt" role="tablist">
                              <?php foreach ($list_statistics_for_as as $ks => $lsfas) { ?>
                                <li ><a href="#season_<?php echo $ks;?>" data-toggle="tab"><?php echo $seasons[$ks]['season_title'];?></a></li>
                              <?php } ?>
                            </ul>
                            <div class="tab-content">

                              <?php foreach ($list_statistics_for_as as $ks => $lsfas) { ?>

                                <div class="tab-pane <?php if ( $first ) { echo 'active'; };?> " id="season_<?php echo $ks;?>">

                                 <!-- *********************************************************** -->
                                  <div role="tabpanel">
                                    

                                    <?php $first = true; ?>
                                    <?php $isset_tab = false; ?>
                                    <ul class="nav nav-tabs font-alt" role="tablist">
                                      <?php foreach ($occasion_groups as $occasion_group) { ?>
                                          <?php foreach ($lsfas as $key => $stat) { ?>
                                            <?php if($key == $occasion_group['occasion_group_id']) { ?>
                                              <?php $isset_tab = true; ?>
                                              <?php break; ?>
                                            <?php } ?>
                                          <?php } ?>

                                        <?php if ($isset_tab) { ?>
                                          <li class="<?php if ( $first ) { echo 'active'; };?>"><a href="#seoccasion_group_<?php echo $occasion_group['occasion_group_id'];?>" data-toggle="tab"><?php echo $occasion_group['occasion_title'];?></a></li>
                                          <?php $isset_tab = false; ?>  
                                          <?php $first = false; ?> 
                                        <?php } ?>

                                      <?php } ?>
                                      </ul>
                                      <div class="tab-content">
                                        <?php $first = true; ?>
                                        <?php foreach ($occasion_groups as $occasion_group) { ?>
                                          <?php if (!empty($lsfas[$occasion_group['occasion_group_id']])) { ?>
                                            <div class="tab-pane <?php if ( $first ) { echo 'active'; };?> " id="seoccasion_group_<?php echo $occasion_group['occasion_group_id'];?>">


                                            <div class="col-xs-6 col-sm-3">
                                              <h6 class="progress-title font-alt">Пасы <span ><?php echo $lsfas[$occasion_group['occasion_group_id']]['pass']; ?></span></h6>
                                            </div>
                                            <div class="col-xs-6 col-sm-3">
                                              <h6 class="progress-title font-alt">Голы <span ><?php echo $lsfas[$occasion_group['occasion_group_id']]['goal']; ?></span></h6>
                                            </div>
                                            <div class="col-xs-6 col-sm-3">
                                              <h6 class="progress-title font-alt">Очки <span ><?php echo ($lsfas[$occasion_group['occasion_group_id']]['goal']+($lsfas[$occasion_group['occasion_group_id']]['pass'])); ?></span></h6>
                                            </div>
                                            <div class="col-xs-6 col-sm-3">
                                              <h6 class="progress-title font-alt">MVP <span ><?php echo $lsfas[$occasion_group['occasion_group_id']]['mvp']; ?></span></h6>
                                            </div>

                                              <h6 class="progress-title font-alt">Количество игровых дней <span class="pull-right"><?php echo $lsfas[$occasion_group['occasion_group_id']]['day']; ?></span></h6>
                                              <div class="progress">
                                                <div class="progress-bar " aria-valuenow="<?php echo $lsfas[$occasion_group['occasion_group_id']]['k_day_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                                  <span class="font-alt"></span>
                                                </div>
                                              </div>

                                              <h6 class="progress-title font-alt">Результативность<span class="pull-right"><?php echo $lsfas[$occasion_group['occasion_group_id']]['k_res']; ?></span></h6>
                                              <div class="progress">
                                                <div class="progress-bar " aria-valuenow="<?php echo $lsfas[$occasion_group['occasion_group_id']]['k_res_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                                  <span class="font-alt"></span>
                                                </div>
                                              </div>

                                              <h6 class="progress-title font-alt">Пас<span class="pull-right"><?php echo $lsfas[$occasion_group['occasion_group_id']]['k_pass']; ?></span></h6>
                                              <div class="progress">
                                                <div class="progress-bar " aria-valuenow="<?php echo $lsfas[$occasion_group['occasion_group_id']]['k_pass_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                                  <span class="font-alt"></span>
                                                </div>
                                              </div>

                                              <h6 class="progress-title font-alt">Эффективность<span class="pull-right"><?php echo $lsfas[$occasion_group['occasion_group_id']]['k_e']; ?></span></h6>
                                              <div class="progress">
                                                <div class="progress-bar " aria-valuenow="<?php echo $lsfas[$occasion_group['occasion_group_id']]['k_e_percent']; ?>" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                                  <span class="font-alt"></span>
                                                </div>
                                              </div>

                                              
                                            </div>
                                            <?php $first = false; ?>
                                          <?php } ?> 
                                        <?php } ?> 
                                      </div><!-- /tab-content -->
                                    
                                  </div><!-- /tabpanel -->
                                <!-- *********************************************************** -->

                                </div><!-- /tab-pane -->
                              <?php } ?>
                            </div><!-- /tab-content -->
                          </div><!-- /tabpanel -->
                        <!-- *********************************************************** -->
                      </div>
                    </div>
                    <?php } ?>
                    

                  </div>

                   <div class="tab-pane" id="contact_information">
                      <!-- *********************************************************** -->
                      <ul class="project-details m-b-sm-30 mb-t-20">
                        <li class="font-alt">Email: <?php echo $email?></li>
                        <li class="font-alt">Телефон: <?php echo $telephone?></li>
                      </ul>
                      <div>
                      <a class="btn btn-info btn-round btn-xs m-b-20" href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a>
                      <a class="btn btn-info btn-round btn-xs m-b-20" href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
                      </div>
                      <!-- *********************************************************** -->
                   </div>

                </div><!-- /.tab-content -->
              </div>     
            </div>
          </div>
        </div>
      </div>
    </section>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>
