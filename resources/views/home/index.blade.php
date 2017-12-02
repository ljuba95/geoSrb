@extends('layouts.main')
@section('title','Pocetna')
@section('content')
    <div class="container">
        <div>
            @include('home.news',['posts' => $posts])
        </div>
    </div>

@endsection
