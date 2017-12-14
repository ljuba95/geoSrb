@extends('layouts.main')
@section('title', $vest->title)
@section('content')

    <div class="container">
        <h1 class="display-3 text-center">{{$vest->title}}</h1>
        <p><i>{!! $vest->excerpt !!}</i></p>
        {!!$vest->body !!}
    </div>

@endsection
