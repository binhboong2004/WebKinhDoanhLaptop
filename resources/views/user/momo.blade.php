@extends('layouts.user')
@section('title', 'Thanh toán MoMo')
@section('content')
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Thanh toán MoMo</h2>
                        <div class="breadcrumb__option">
                            <a href="{{ route('home.index') }}">Trang chủ</a>
                            <span>Quét Mã MoMo</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="checkout spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="checkout__order" style="border: 1px solid #e1e1e1; padding: 30px; border-radius: 5px;">
                        <h4 class="text-center">Quét mã QR MoMo để thanh toán</h4>
                        <p class="text-center">Vui lòng sử dụng Ứng dụng MoMo để quét mã.</p>
                        
                        <div class="text-center my-4">
                            <img src="{{ asset('user/img/momo-qr.png') }}" alt="Mã QR MoMo" style="max-width: 300px; border: 1px solid #ddd;">
                        </div>

                        <div class="checkout__order__total">
                            Số tiền cần thanh toán
                            <span>{{ number_format($total) }} VNĐ</span>
                        </div>

                        <ul style="list-style: none; padding-left: 0; margin-top: 20px;">
                            <li style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                <strong>Nội dung chuyển khoản:</strong>
                                <span style="font-weight: bold; color: #dd2222;">{{ $orderNumber }}</span>
                            </li>
                        </ul>
                        
                        <p class="text-center" style="font-style: italic; margin-top: 15px;">
                            <strong>Quan trọng:</strong> Vui lòng nhập chính xác <strong>Số tiền</strong> và <strong>Nội dung chuyển khoản</strong> là mã đơn hàng ở trên để chúng tôi xác nhận.
                        </p>

                        <a href="{{ route('home.index') }}" class="primary-btn site-btn" style="width: 100%; text-align: center; margin-top: 20px;">
                            ĐÃ THANH TOÁN / VỀ TRANG CHỦ
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endsection