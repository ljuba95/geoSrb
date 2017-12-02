<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
    <head>
        @include('includes.head')
    </head>
    <body>
        @include('includes.header')
        <div>
            <div class="col-lg-3 col-md-3" style="padding-left: 5%; padding-top: 2%">
                @include('includes.sidebar')
            </div>
            
            <div class="col-lg-6 col-md-6">

                 @yield('content')

                <footer>
                    @include('includes.footer')
                </footer>
            </div>

            <div class="col-lg-3 col-md-3" style="padding-right: 5%">
                @include('home.links', ['linkGroups' => $linkGroups])
            </div>
        </div>
       
        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}"></script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <script src="js/clean-blog.min.js"></script>
    </body>
</html>
