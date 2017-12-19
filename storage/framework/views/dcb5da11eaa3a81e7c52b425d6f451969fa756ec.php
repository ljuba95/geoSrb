<nav id="sidebar-nav">

    <ul class="list.style">
        <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu_item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="border-style"><a class="side-bar" href="<?php echo e($menu_item->url); ?>"><?php echo e($menu_item->title); ?></a></div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </ul>
<!--
  <ul class="list.style">
    <div class="border-style first-item"> <a class="side-bar" href="/"><?php echo app('translator')->getFromJson('main.home'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="https://a3.geosrbija.rs/"><?php echo app('translator')->getFromJson('main.cartography'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="http://www.geosrbija.rs/rga/rga_metadatabrowser.aspx?gui=1&lang=3"><?php echo app('translator')->getFromJson('main.metaOverview'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="about"><?php echo app('translator')->getFromJson('main.introduction'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="inspire" ><?php echo app('translator')->getFromJson('main.inspire'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="/"><?php echo app('translator')->getFromJson('main.news'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="partners"><?php echo app('translator')->getFromJson('main.partners'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="terms"><?php echo app('translator')->getFromJson('main.terms'); ?></a></div>
    <div class="border-style"> <a class="side-bar" href="contacts"><?php echo app('translator')->getFromJson('main.contact'); ?></a></div>
  </ul>

  -->
</nav>
