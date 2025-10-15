<section class="hero {{ url()->current() == url('/') ? '' : 'hero-normal' }}">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Tất cả danh mục</span>
                    </div>
                    <ul>
                        @foreach ($categories as $category)
                            <li><a href="{{ route('home.filter-category', ['id'=>$category->id]) }}">{{ $category->category_name }}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="{{ route('home.search') }}" method="POST">
                            @csrf
                            @method('POST')
                            <div class="hero__search__categories">
                                Tất cả danh mục
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" name="keyword" placeholder="Tìm theo tên sản phẩm . . .">
                            <button type="submit" class="site-btn">Tìm kiếm</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>{{ $contact->phone }}</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
                {{-- /* --------------------------------- BANNER --------------------------------- */ --}}
                @if (url()->current() == url('/'))
                    @include('sections.banner')
                @endif            
                {{-- /* --------------------------------- BANNER --------------------------------- */ --}}
            </div>
        </div>
    </div>
</section>