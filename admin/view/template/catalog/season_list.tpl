<?php echo $header; ?>
<?php echo $column_left; ?>
<section id="content">
  <div class="container">
    
    <div class="card">
      <div class="card-header">
        <h2><?php echo $heading_title; ?><small></small></h2>
        <ul class="actions">
            <li>
                <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>">
                    <i class="md  md-note-add"></i>
                </a>
            </li>
            <li><button class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-information').submit() : false;"> <?php echo $button_delete; ?></button></li>
        </ul>
      </div>
      <div class="card-body card-padding table-responsive">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $error_warning; ?>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
          <div class="alert alert-success alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <?php echo $success; ?>
          </div>
        <?php } ?>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-information">
          <table class="table">
              <thead>
                  <tr>
                     <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                      <td class="text-left"><?php if ($sort == 'dd.title') { ?>
                        <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                        <?php } ?></td>
                      <td><?php echo $column_season_date_begin; ?></td>  
                      <td><?php echo $column_season_date_end; ?></td>  
                      
                      <td class="text-right"><?php echo $column_action; ?></td>
                  </tr>
              </thead>
              <tbody>
                  <?php if ($seasons) { ?>
                  <?php foreach ($seasons as $season) { ?>
                  <tr>
                    <td class="text-center"><?php if (in_array($season['season_id'], $selected)) { ?>
                      <input type="checkbox" name="selected[]" value="<?php echo $season['season_id']; ?>" checked="checked" />
                      <?php } else { ?>
                      <input type="checkbox" name="selected[]" value="<?php echo $season['season_id']; ?>" />
                      <?php } ?></td>
                    <td class="text-left"><?php echo $season['title']; ?></td>
                    <td class="text-right"></td>
                    <td class="text-right"></td>
                    <td class="text-right"><a href="<?php echo $season['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                  </tr>
                  <?php } ?>
                  <?php } else { ?>
                  <tr>
                    <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
                  </tr>
                  <?php } ?>
              </tbody>
          </table>
        </form>
          <div class="hidden"><?php echo $results; ?></div>
          <?php echo $pagination; ?>
        </div>
      </div>
    </div> 
</section>
<?php echo $footer; ?>