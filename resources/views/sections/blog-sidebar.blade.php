<div class="blog__sidebar">
    <div class="blog__sidebar__search">
        <form action="{{ route('home.blog.search') }}" method="POST">
            @csrf
            @method('POST')
            <input type="text" name="keyword" placeholder="Search...">
            <button type="submit" name="search"><span class="icon_search"></span></button>
        </form>
    </div>
    <div class="blog__sidebar__item">
        <h4>Danh mục</h4>
        <ul>
            <li><a href="#">All</a></li>
            @foreach ($categoryBlogs as $categoryBlog)
                <li><a href="{{ route('home.blog.filter', ['id' => $categoryBlog->id]) }}">{{ $categoryBlog->category_name }} ({{ $categoryBlog->quantityPost() }})</a></li>
            @endforeach
        </ul>
    </div>
    <div class="blog__sidebar__item">
        <h4>Recent News</h4>
        <div class="blog__sidebar__recent">
            @foreach ($newBlogs as $newBlog)    
                <a href="{{ route('home.blog-details', ['id' => $newBlog->id]) }}" class="blog__sidebar__recent__item">
                    <div class="blog__sidebar__recent__item__pic">
                        <img src="{{ asset('storage/' . $newBlog->image)}}" class="rounded" width="100px" alt="">
                    </div>
                    <div class="blog__sidebar__recent__item__text">
                        <h6>{{ $newBlog->title }}</h6>
                        <span>{{ $newBlog->created_at }}</span>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
    <div class="blog__sidebar__item">
        <h4>Search By</h4>
        <div class="blog__sidebar__item__tags">
            <a href="#">Apple</a>
            <a href="#">Beauty</a>
            <a href="#">Vegetables</a>
            <a href="#">Fruit</a>
            <a href="#">Healthy Food</a>
            <a href="#">Lifestyle</a>
        </div>
    </div>
</div>