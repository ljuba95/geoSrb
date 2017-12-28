<!DOCTYPE html>
<html lang="<?php echo e(app()->getLocale()); ?>">
<head>
    <?php echo $__env->make('includes.head', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
</head>
<body>
<?php echo $__env->make('includes.navbar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<div class="container-fluid">

    


    
        
            
        

        

            

        

        
            
        
    

    <?php echo $__env->yieldContent('content'); ?>


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
