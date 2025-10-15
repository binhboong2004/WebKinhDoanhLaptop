<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Mới nhất</h4>
                    <div class="latest-product__slider owl-carousel">
                        @php
                            $chunks = $products->chunk(3);
                        @endphp
                        @foreach ($chunks as $chunk)
                            <div class="latest-prdouct__slider__item">
                                @foreach ($chunk as $product)
                                    <a href="{{ route('home.shop-details', ['id' => $product->id]) }}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{ asset('storage/' . $product->image)}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>{{ $product->product_name }}</h6>
                                            <span>{{ number_format($product->price) }} VNĐ</span>
                                        </div>
                                    </a>
                                @endforeach
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Đánh giá cao</h4>
                    <div class="latest-product__slider owl-carousel">
                        @php
                            $chunks = $products->chunk(3);
                        @endphp
                        @foreach ($chunks as $chunk)
                            <div class="latest-prdouct__slider__item">
                                @foreach ($chunk as $product)
                                    <a href="{{ route('home.shop-details', ['id' => $product->id]) }}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{ asset('storage/' . $product->image)}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>{{ $product->product_name }}</h6>
                                            <span>{{ number_format($product->price) }} VNĐ</span>
                                        </div>
                                    </a>
                                @endforeach
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Đánh giá nhiều nhất</h4>
                    <div class="latest-product__slider owl-carousel">
                        @php
                            $chunks = $products->chunk(3);
                        @endphp
                        @foreach ($chunks as $chunk)
                            <div class="latest-prdouct__slider__item">
                                @foreach ($chunk as $product)
                                    <a href="{{ route('home.shop-details', ['id' => $product->id]) }}" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="{{ asset('storage/' . $product->image)}}" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>{{ $product->product_name }}</h6>
                                            <span>{{ number_format($product->price) }} VNĐ</span>
                                        </div>
                                    </a>
                                @endforeach
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>