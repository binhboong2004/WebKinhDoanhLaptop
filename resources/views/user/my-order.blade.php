@extends('layouts.user')
@section('title', 'Đơn hàng của tôi')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Đơn hàng của tôi</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>Đơn hàng của tôi</span>
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
                                        <th>Địa chỉ giao hàng</th>
                                        <th>Phương thức thanh toán</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($orders as $order)
                                        <tr>
                                            <td>{{ $order->order_number }}</td>
                                            <td>{{ $order->shipping_address }}</td>
                                            <td>{{ $order->payment_method }}</td>
                                            <td>{{ number_format($order->total) }} VNĐ</td>
                                            <td>
                                                @if ($order->status === 'pending')
                                                    Đang chờ xử lý
                                                @elseif ($order->status === 'delivering')
                                                    Đang giao hàng
                                                @elseif ($order->status === 'completed')
                                                    Đã giao hàng
                                                @elseif ($order->status === 'processing')
                                                    Đang xử lý
                                                @elseif ($order->status === 'paid')
                                                    Đã thanh toán
                                                @else
                                                    {{ ucfirst($order->status) }}
                                                @endif
                                            </td>

                                            <td>
                                                <div class="d-flex align-items-center" style="gap: 10px">
                                                    <a href="{{ route('user.order.details', ['id' => $order->id]) }}" class="btn btn-success">Xem</a>
                                                    @if ($order->status === 'pending')
                                                        <form action="{{ route('user.order.destroy', ['id' => $order->id]) }}" method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button class="btn btn-danger" onclick="return confirm('Bạn chắc chứ?')">Hủy</button>
                                                        </form>
                                                    @endif
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> 
            </div>
        </section>
        <!-- Shoping Cart Section End -->
@endsection