<div>
    <h1>@lang('main.news')</h1>
    <div style="padding-top: 5%">
        @foreach($posts as $post)
            <div>
                <a href="#">
                    <h2 class="post-title">
                        {{ $post->title }}
                    </h2>
                </a>
                <p class="post-content">
                    {{ $post->excerpt }}
                </p>
                <p class="post-meta">
                    {{ $post->created_at->format('d.m.Y') }}
                    <hr>                    
                </p>       
            </div>  
        @endforeach
    </div>
    <!-- Pager -->
    <div class="clearfix">
        <a class="btn btn-primary float-right" href="#">@lang('main.older') &rarr;</a>
    </div>
</div>
