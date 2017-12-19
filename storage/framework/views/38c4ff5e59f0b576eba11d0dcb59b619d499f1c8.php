<?php $__env->startSection('title','Pocetna'); ?>
<?php $__env->startSection('content'); ?>
    <div class="container">
        <div>
            <?php echo $__env->make('home.news',['posts' => $posts], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.main', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>