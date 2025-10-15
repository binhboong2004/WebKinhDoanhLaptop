@extends('layouts.user')
@section('title', 'Giỏ hàng')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Giỏ hàng</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>Giỏ hàng của bạn</span>
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
            @php
            @endphp
            @if (!empty($carts))
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Tổng</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $subTotal = 0;
                                    @endphp
                                    @foreach ($carts as $cart)
                                        <tr>
                                            <td class="shoping__cart__item">
                                                <img src="{{ asset('storage/' . $cart['image'] ) }}" width="150px" alt="">
                                                <h5>{{ $cart['name'] }}</h5>
                                            </td>
                                            <td class="shoping__cart__price">
                                                {{ number_format($cart['price']) }} VNĐ
                                            </td>
                                            <td class="shoping__cart__quantity">
                                                <div class="cart-quantity">
                                                    <a href="{{ route('user.cart-control', ['id'=>$cart['id'], 'action' => 'down']) }}" class="quantity-control">-</a>
                                                    <span class="quantity-number">{{ $cart['quantity'] }}</span>
                                                    <a href="{{ route('user.cart-control', ['id'=>$cart['id'], 'action' => 'up']) }}" class="quantity-control">+</a>
                                                </div>
                                            </td>                                            
                                            <td class="shoping__cart__total">
                                                {{ number_format($cart['price'] * $cart['quantity']) }} VNĐ
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                <a href="{{ route('user.cart.delete', ['id'=>$cart['id']]) }}" class="cart_close icon_close"></a>
                                            </td>
                                        </tr>
                                        @php
                                            $subTotal += $cart['price'] * $cart['quantity'];
                                        @endphp
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="{{ route('home.shop') }}" class="primary-btn cart-btn">Tiếp tục mua hàng</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__continue">
                            <div class="shoping__discount">
                                <h5>Mã giảm giá</h5>
                                <form action="#">
                                    <input type="text" placeholder="Nhập mã giảm giá">
                                    <button type="submit" class="site-btn">Áp dụng mã</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <h5>Tổng tiền giỏ hàng</h5>
                            <ul>
                                <li>Tạm tính <span>{{ number_format($subTotal) }} VNĐ</span></li>
                                <li>Tổng cộng <span>{{ number_format($subTotal) }} VNĐ</span></li>
                            </ul>
                            <a href="{{ route('user.checkout') }}" class="primary-btn">Tiến hành thanh toán</a>
                        </div>
                    </div>
                </div>
            @else
                <h3 class="text-center text-danger ">Giỏ hàng trống</h3>
            @endif
        </div>
    </section>
    <!-- Shoping Cart Section End -->
@endsection