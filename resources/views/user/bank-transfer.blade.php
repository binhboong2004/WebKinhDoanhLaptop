@extends('layouts.user')
@section('title', 'Thanh toán Chuyển khoản')
@section('content')
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Thanh toán Chuyển khoản</h2>
                        <div class="breadcrumb__option">
                            <a href="{{ route('home.index') }}">Trang chủ</a>
                            <span>Chuyển khoản Ngân hàng</span>
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
                        <h4 class="text-center">Quét mã QR để thanh toán</h4>
                        <p class="text-center">Vui lòng sử dụng App Ngân hàng hoặc Ví điện tử để quét mã và thanh toán.</p>
                        
                        <div class="text-center my-4">
                            <img src="{{ $qrUrl }}" alt="Mã QR Thanh toán" style="max-width: 300px; border: 1px solid #ddd;">
                        </div>

                        <div class="checkout__order__total">
                            Tổng tiền
                            <span>{{ number_format($total) }} VNĐ</span>
                        </div>

                        <ul style="list-style: none; padding-left: 0;">
                            <li style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                <strong>Ngân hàng:</strong>
                                <span>{{ $bankName }}</span>
                            </li>
                            <li style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                <strong>Chủ tài khoản:</strong>
                                <span>{{ $accountName }}</span>
                            </li>
                            <li style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                <strong>Số tài khoản:</strong>
                                <span>{{ $bankAccount }}</span>
                            </li>
                            <li style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                <strong>Nội dung:</strong>
                                <span style="font-weight: bold; color: #dd2222;">{{ $orderNumber }}</span>
                            </li>
                        </ul>
                        
                        <p class="text-center" style="font-style: italic; margin-top: 15px;">
                            (Đơn hàng của bạn đã được tạo. Vui lòng chuyển khoản đúng nội dung và số tiền để được xác nhận tự động trong 1->10 phút.)
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