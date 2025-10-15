@extends('layouts.user')
@section('title', 'Cửa hàng')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Cửa hàng</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>Cửa hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Danh mục</h4>
                            <ul>
                                @foreach ($categories as $category)
                                    <li><a href="{{ route('home.filter-category', ['id'=>$category->id]) }}">{{ $category->category_name }} ({{ $category->quantityProduct($category->id) }})</a></li> 
                                @endforeach
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Sản phẩm bán chạy</h4>
                                <div class="latest-product__slider owl-carousel">
                                    @php
                                        $chunks = $topSellingProducts->chunk(3);
                                    @endphp
                                    @foreach ($chunks as $chunk)
                                        <div class="latest-prdouct__slider__item">
                                            @foreach ($chunk as $sellingProduct)
                                                <a href="{{ route('home.shop-details', ['id' => $sellingProduct->id]) }}" class="latest-product__item">
                                                    <div class="latest-product__item__pic">
                                                        <img src="{{  asset('storage/' . $sellingProduct->image )}}" alt="">
                                                    </div>
                                                    <div class="latest-product__item__text">
                                                        <h6>{{ $sellingProduct->product_name }}</h6>
                                                        <span>{{ number_format($sellingProduct->price) }} VNĐ</span>
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
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Giảm giá</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                @foreach ($saleProducts as $saleProduct)
                                    <div class="col-lg-4">
                                        <div class="product__discount__item">
                                            <div class="product__discount__item__pic set-bg"
                                                data-setbg="{{ asset('storage/' . $saleProduct->image) }}">
                                                <div class="product__discount__percent">-{{ $saleProduct->discount }}%</div>
                                                <ul class="product__item__pic__hover">
                                                    <li><a href="{{ route('user.cart.add', ['id'=>$saleProduct->id, 'quantity'=>1]) }}"><i class="fa fa-shopping-cart"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="product__discount__item__text">
                                                <span>{{ $saleProduct->category->category_name }}</span>
                                                <h5><a href="{{ route('home.shop-details', ['id' => $saleProduct->id]) }}">{{ $saleProduct->product_name }}</a></h5>
                                                <div class="product__item__price">{{ number_format(calculateDiscountedPrice($saleProduct->price, $saleProduct->discount)) }} VNĐ<span>{{ number_format($saleProduct->price) }} VNĐ</span></div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sắp xếp</span>
                                    <select>
                                        <option value="0">Tăng dần</option>
                                        <option value="0">Giảm dần</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6>Tất cả sản phẩm</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="product-list">
                        @foreach ($products as $product)
                            <div class="col-lg-4 col-md-6 col-sm-6 product-item" data-image="{{ asset('storage/' . $product->image) }}">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="{{ asset('storage/' . $product->image) }}">
                                        <ul class="product__item__pic__hover">
                                            <li><a href="{{ route('user.cart.add', ['id'=>$product->id, 'quantity'=>1]) }}"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="{{ route('home.shop-details', ['id' => $product->id]) }}">{{ $product->product_name }}</a></h6>
                                        <h5>{{ number_format($product->price, 2) }} VNĐ</h5>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="product__pagination" id="pagination"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
@endsection

