@extends('layouts.user')
@section('title', 'Kết quả tìm kiếm')
@section('content')
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Kết quả tìm kiếm</h2>
                </div>
            </div>
        </div>
        @if($products->isNotEmpty())
            @foreach ($products as $product)
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix {{ lowercaseText(removeSpaces($product->category->category_name)) }}">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="{{ asset('storage/' . $product->image) }}">
                            <ul class="featured__item__pic__hover">
                                <li><a href="{{ route('user.cart.add', ['id'=>$product->id, 'quantity'=>1]) }}"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="{{ route('home.shop-details', ['id' => $product->id]) }}">{{ $product->product_name }}</a></h6>
                            <h5>{{ number_format($product->price) }} VNĐ</h5>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        @else
            <div class="text-center">
                <span class="text-danger font-weight-bold">Không tìm thấy.</span>
            </div>
        @endif
    </div>
</section>
@endsection
