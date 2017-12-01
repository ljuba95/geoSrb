<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
    <head>
        @include('includes.head')
    </head>
    <body>
        <div>
            @include('includes.nav')

        </div>

        @yield('content')


        @include('includes.footer')
        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}"></script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script src="js/clean-blog.min.js"></script>
    </body>
</html>
