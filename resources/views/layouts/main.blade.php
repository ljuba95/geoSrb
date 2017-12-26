<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    @include('includes.head')
</head>
<body>
@include('includes.navbar')
<div class="container-fluid">

    {{--@include('includes.header')--}}


    {{--<div class="row">--}}
        {{--<div class="col-lg-3 col-md-3" style="padding-left: 3%;">--}}
            {{--@include('includes.sidebar')--}}
        {{--</div>--}}

        {{--<div class="col-lg-6 col-md-6">--}}

            {{--@yield('content')--}}

        {{--</div>--}}

        {{--<div class="col-lg-3 col-md-3" style="padding-right: 5%">--}}
            {{--@include('home.links')--}}
        {{--</div>--}}
    {{--</div>--}}

    @yield('content')


</div>
@include('includes.footer')
<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="/js/clean-blog.min.js"></script>
@yield('scripts')
</body>
</html>
