@extends('layouts.user')
@section('title', 'Chi tiết đơn hàng')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Chi tiết đơn hàng</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>Chi tiết đơn hàng</span>
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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="w-100 table-custom">
                                <thead>
                                    <tr>
                                        <th>Mã đơn hàng</th>
                                        <th>Hình ảnh</th>
                                        <th>Sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($orderDetails as $details)
                                        <tr>
                                            <td>{{ $details->order->order_number }}</td>
                                            <td><img src="{{ asset('storage/' . $details->product->image ) }}" alt="" width="100px"></td>
                                            <td>{{ $details->product->product_name }}</td>
                                            <td>{{ number_format($details->price) }} VNĐ</td>
                                            <td>{{ $details->quantity }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="d-flex justify-content-end">
                            <a href="{{ route('user.my-order') }}" class="btn btn-dark mt-3">Trở về</a>
                        </div>
                    </div>
                </div> 
            </div>
        </section>
        <!-- Shoping Cart Section End -->
@endsection