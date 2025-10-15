<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm nổi bật</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        @php
                            $printedCategories = [];
                        @endphp
                        <li class="active" data-filter="*">All</li>
                        @foreach ($topSellingProducts as $sellingProduct)
                            @php
                                $categoryName = lowercaseText(removeSpaces($sellingProduct->category->category_name));
                            @endphp
                            @if (!in_array($categoryName, $printedCategories))
                                <li data-filter=".{{ $categoryName }}">{{ $sellingProduct->category->category_name }}</li>
                                @php
                                    $printedCategories[] = $categoryName; 
                                @endphp
                            @endif
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            @foreach ($topSellingProducts as $sellingProduct)
                <div class="col-lg-3 col-md-4 col-sm-6 mix {{ lowercaseText(removeSpaces($sellingProduct->category->category_name)) }}">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{ asset('storage/' . $sellingProduct->image) }}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="{{ route('user.cart.add', ['id'=>$sellingProduct->id, 'quantity'=>1]) }}"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="{{ route('home.shop-details', ['id' => $sellingProduct->id]) }}">{{ $sellingProduct->product_name }}</a></h6>
                            <h5>{{ number_format($sellingProduct->price) }} VNĐ</h5>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>