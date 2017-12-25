<!DOCTYPE html>
<html lang="<?php echo e(app()->getLocale()); ?>">
    <head>
        <?php echo $__env->make('includes.head', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    </head>
    <body class="margin">
        <?php echo $__env->make('includes.header', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

        <div class="row">
            <div class="col-lg-3 col-md-3" style="padding-left: 3%;">
                <?php echo $__env->make('includes.sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>

            <div class="col-lg-6 col-md-6">

                 <?php echo $__env->yieldContent('content'); ?>

            </div>

            <div class="col-lg-3 col-md-3" style="padding-right: 5%">
                <?php echo $__env->make('home.links', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
        </div>

        <?php echo $__env->make('includes.footer', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

        <!-- Scripts -->
        <script src="<?php echo e(asset('js/app.js')); ?>"></script>
        <script src="/vendor/jquery/jquery.min.js"></script>
        <script src="/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script src="/js/clean-blog.min.js"></script>
        <?php echo $__env->yieldContent('scripts'); ?>
    </body>
</html>
