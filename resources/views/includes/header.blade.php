<ul class="list-inline">
    @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
        <li class="list-inline-item">
            <a rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                {{ $properties['native'] }}
            </a>
        </li>
    @endforeach
</ul>
<header class="masthead" style="background-image: url('img/srb.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1> @lang('main.geoserbia') </h1>
                </div>
            </div>
        </div>
    </div>
</header>