@extends('layouts.user')
@section('title', 'Thanh toán')
@section('content')    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Thanh toán</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>Thanh toán</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Chi tiết hóa đơn</h4>
                <form action="{{ route('user.checkout.process') }}" method="POST">
                    @csrf
                    @method('POST')
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                <p>Địa chỉ giao hàng<span>*</span></p>
                                <input type="text" name="address" placeholder="Nhập địa chỉ" class="checkout__input__add" required>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Số điện thoại<span>*</span></p>
                                        <input type="text" name="phone" placeholder="Nhập số điện thoại" required>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" name="email" placeholder="Nhập Email" required>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Ghi chú<span>*</span></p>
                                <input type="text" name="note" placeholder="Nhập ghi chú (nếu có)">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Đơn hàng của bạn</h4>
                                <div class="checkout__order__products">Sản phẩm <span>Tổng tiền</span></div>
                                <ul>
                                    @php
                                        $subTotal = 0;
                                    @endphp
                                    @foreach ($carts as $cart)
                                        <li>{{ $cart['name'] }} x{{ $cart['quantity'] }} <span>{{ number_format($cart['price']) }} VNĐ</span></li>
                                        @php
                                            $subTotal += $cart['price'] * $cart['quantity'];
                                        @endphp
                                    @endforeach
                                </ul>
                                <div class="checkout__order__subtotal">Tạm tính <span>{{ number_format($subTotal) }} VNĐ</span></div>
                                <div class="checkout__order__total">Tổng cộng <span>{{ number_format($subTotal) }} VNĐ</span></div>
                                <input type="hidden" name="total" value="{{ $subTotal }}">
                                <div>
                                    <div class="form-group d-flex align-items-center">
                                        <input type="radio" id="cash-on-delivery" value="Thanh toán khi nhận hàng" name="payment" checked>
                                        <label for="cash-on-delivery" class="mb-0 ml-2">Thanh toán khi nhận hàng</label>
                                    </div>
                                    <div class="form-group d-flex align-items-center">
                                        <input type="radio" id="momo" name="payment" value="Quét Mã Momo">
                                        <label for="momo" class="mb-0 ml-2">Quét Mã MoMo</label>
                                    </div>
                                    <div class="form-group d-flex align-items-center">
                                        <input type="radio" id="zalopay" name="payment" value="Quét Mã ZaloPay">
                                        <label for="zalopay" class="mb-0 ml-2">Quét Mã ZaloPay</label>
                                    </div>
                                    <div class="form-group d-flex align-items-center">
                                        <input type="radio" id="nganhang" name="payment" value="Chuyển Khoản Ngân Hàng">
                                        <label for="nganhang" class="mb-0 ml-2">Chuyển Khoản Ngân Hàng</label>
                                    </div>
                                </div>
                                <button type="submit" name="checkout" class="site-btn">THANH TOÁN</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
@endsection