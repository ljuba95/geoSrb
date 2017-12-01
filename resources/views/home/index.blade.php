@extends('layouts.main')
@section('title','Pocetna')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                @include('home.news',['posts' => $posts])
            </div>
            <div class="col-lg-3 col-md-10 mx-auto">
                @include('home.links', ['linkGroups' => $linkGroups])
            </div>
        </div>
    </div>

@endsection
