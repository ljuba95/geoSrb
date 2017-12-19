<link href="<?php echo e(asset('css/news.css')); ?>" rel="stylesheet">

<div>
    <h1 class="post-title" style="text-align: center;"><?php echo app('translator')->getFromJson('main.news'); ?></h1>
    <div style="padding-top: 5%">
        <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div>
                <a href="news/show/<?php echo e($post->id); ?>">
                    <h2 class="post-title">
                        <?php echo e($post->title); ?>

                    </h2>
                </a>
                <p class="post-content">
                    <?php echo e($post->excerpt); ?>

                </p>
                <p class="post-meta">
                    <?php echo e($post->created_at->format('d.m.Y')); ?>

                    <hr>                    
                </p>       
            </div>  
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
    <div class = "float-right"><?php echo e($posts->links()); ?></div>
    <!-- Pager 
    <div class="clearfix">
        <a class="btn btn-primary float-right" href="#"><?php echo app('translator')->getFromJson('main.older'); ?> &rarr;</a>
    </div> -->
</div>

voy