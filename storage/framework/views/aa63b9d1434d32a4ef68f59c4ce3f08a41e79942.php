<?php if(isset($dataTypeContent->{$row->field})): ?>
    <img src="<?php if( !filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL)): ?><?php echo e(Voyager::image( $dataTypeContent->{$row->field} )); ?><?php else: ?><?php echo e($dataTypeContent->{$row->field}); ?><?php endif; ?>"
         style="width:200px; height:auto; clear:both; display:block; padding:2px; border:1px solid #ddd; margin-bottom:10px;">
<?php endif; ?>
<input <?php if($row->required == 1 && !isset($dataTypeContent->{$row->field})): ?> required <?php endif; ?> type="file" data-name="<?php echo e($row->display_name); ?>"  name="<?php echo e($row->field); ?>">
