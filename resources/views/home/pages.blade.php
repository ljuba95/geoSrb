
@extends('layouts.main')
@section('title', $pageContent->title)
@section('content')

    <div id="pages-meta"></div>

    <div class="container">
      <?php echo $pageContent->body ?>
    </div>

@endsection