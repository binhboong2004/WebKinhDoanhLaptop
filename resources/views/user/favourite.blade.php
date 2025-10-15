@extends('layouts.user')
@section('title', 'Favourite')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Favourite</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Favourite</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            @if (!empty($favourites))
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($favourites as $favourite)
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="{{ asset('storage/' . $favourite['image']) }}" alt="" width="150px">
                                        <h5>{{ $favourite['name'] }}</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        ${{ $favourite['price'] }}
                                    </td>
                                    <td class="shoping__cart__quantity">
                                    </td>
                                    <td class="shoping__cart__total">
                                        <a href="{{ route('user.cart.add', ['id'=>$favourite['id'], 'quantity'=>1]) }}" class="btn text-white" style="background-color: #EE1926"><i class="fa fa-shopping-cart"></i></a>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <a href="{{ route('user.favourite.delete', ['id'=>$favourite['id']]) }}" class="icon_close cart_close"></a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="{{ route('home.shop') }}" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="{{ route('user.cart') }}" class="primary-btn cart-btn cart-btn-right">
                            Go to cart</a>
                    </div>
                </div>
            </div>
            @else
                <h3 class="text-center text-danger ">Favourite empty</h3>
            @endif
        </div>
    </section>
    <!-- Shoping Cart Section End -->
@endsection