<?php $__env->startSection('title', $pageContent->title); ?>
<?php $__env->startSection('content'); ?>

    <div id="pages-meta"></div>

    <div class="container">
      <?php echo $pageContent->body ?>
    </div>

<?php $__env->stopSection(); ?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    var div = document.getElementById('pages-meta');

    $.ajax({
      type: 'GET',
      url: 'http://localhost:8000/pages/',
      success: function(data) {
        json = JSON.parse(data);
        console.log(json);
        pages = json.map(element => {
          return `${element.id} ${element.title}`;
        });
        div.innerHTML = pages;
      }
    })
  });
</script>
<?php echo $__env->make('layouts.main', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>