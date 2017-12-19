<!-- Footer -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-8 mx-auto">
            <p class="copyright">
                <?php echo app('translator')->getFromJson('main.footer'); ?> &copy; 2009-<?php echo e(\Illuminate\Support\Carbon::now()->year); ?>

            </p>
        </div>
    </div>
</div>