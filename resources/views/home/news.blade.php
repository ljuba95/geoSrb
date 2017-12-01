@foreach($posts as $post)
    <div class="post-preview">
        <a href="#">
            <h2 class="post-title">
                {{ $post->title }}
            </h2>
        </a>
        <h5 class="post-content">
            {{ $post->excerpt }}
        </h5>
        <p class="post-meta">
            {{ $post->created_at }}
        </p>
    </div>
    <hr>
@endforeach
<!-- Pager -->
<div class="clearfix">
    <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
</div>