@extends('layouts.main')
@section('title','Pocetna')
@section('content')

    @include('includes.header')
    @include('home.nigp_links')
    @include('home.news',['posts' => $posts])
    @include('home.partners')
    @include('home.portals')

@endsection
