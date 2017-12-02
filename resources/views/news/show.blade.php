@extends('layouts.main')
@section('title', $vest->title)
@section('content')

    <div class="container">
        <h1 class="display-1 text-center">{{$vest->title}}</h1>
        {!!$vest->body !!}
    </div>

@endsection
