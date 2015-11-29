<ul class="main-menu">

  <li><a href="<?php echo $occasion; ?>"><i class="md md-format-list-bulleted"></i> <?php echo $text_occasion; ?> </a></li>
  <li><a href="<?php echo $occasion_group; ?>"><i class="md md-format-list-bulleted"></i> <?php echo $text_occasion_group; ?> </a></li>
  <li><a href="<?php echo $place; ?>"><i class="md md-format-list-bulleted"></i> <?php echo $text_place; ?> </a></li>

  <li class="sub-menu">
    <a href=""><i class="md md-description"></i> <?php echo $text_content; ?></a>
    <ul>
      <li><a href="<?php echo $about; ?>">Блок о нас</a></li>
      <li><a href="<?php echo $team; ?>">Блок о команде</a></li>
      <li><a href="<?php echo $contact; ?>">Блок с контактами</a></li>
    </ul>
  </li>
  
  <li class="sub-menu ">
    <a href=""><i class="md md-settings"></i> <?php echo $text_setting; ?></a>
    <ul>
      <li class="hidden"><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
      <li ><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
      <li class="hidden"><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
      <li class="hidden"><a href="<?php echo $installer; ?>"><?php echo $text_installer; ?></a></li>
      <li class="hidden"><a href="<?php echo $modification; ?>"><?php echo $text_modification; ?></a></li>
      <li class="hidden"><a href="<?php echo $location; ?>"><?php echo $text_location; ?></a></li>
      <li class="hidden"><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
    </ul>
  </li>
  <li class="sub-menu">

    <a href=""><i class="md md-settings-backup-restore"></i> <?php echo $text_tools; ?></a>
    <ul>
      <li class="hidden"><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
      <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
      <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
    </ul>
  </li>
</ul>
