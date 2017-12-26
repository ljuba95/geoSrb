<?php $__env->startSection('title', $pageContent->title); ?>
<?php $__env->startSection('content'); ?>

    <div id="pages-meta"></div>

    <div class="container">
      <?php echo $pageContent->body ?>
    </div>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.main', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>