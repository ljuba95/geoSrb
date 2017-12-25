
@extends('layouts.main')
@section('title', $pageContent->title)
@section('content')

    <div id="pages-meta"></div>

    <div class="container">
      <?php echo $pageContent->body ?>
    </div>

@endsection

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
        <?php echo $pageContent->body ?>
    </div>

@endsection
@section('scripts')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var div = $('#pages-meta');
            $.ajax({
                type: 'GET',
                url: 'http://localhost:8000/pages/',
                success: function (data) {
                    json = JSON.parse(data);
                    console.log(json);
                    pages = json.map(element => {
                        return `${element.id} ${element.title}`;
                    });
                    div.html(pages);
                }
            })
        });
    </script>
@endsection
