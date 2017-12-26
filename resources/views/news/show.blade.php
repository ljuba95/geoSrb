@extends('layouts.main')
@section('title', $vest->title)
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-lg-9">

                <img src="http://via.placeholder.com/900x300" class="rounded img-fluid">

                <h1 class="display-3 text-center">{{$vest->title}}</h1>
                <p><i>{!! $vest->excerpt !!}</i></p>
                {!!$vest->body !!}
            </div>
            <div class="col-lg-3">
                @include('home.links')
            </div>
        </div>

    </div>

@endsection
