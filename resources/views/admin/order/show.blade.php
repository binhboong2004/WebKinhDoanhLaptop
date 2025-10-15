@extends('layouts.admin')
@section('title', 'Chi tiết đơn hàng')
@section('content')
    <h2 class="mb-2 page-title">Chi tiết đơn hàng</h2>
    <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
            <div class="card shadow">
                <div class="card-body">
                    <p>Khách hàng: <strong>{{ $order->user->name }}</strong></p>
                    <p>Mã đơn hàng: <strong>{{ $order->order_number }}</strong></p>
                    <p>Địa chỉ giao hàng: <strong>{{ $order->shipping_address }}</strong></p>
                    <p>Số điện thoại: <strong>{{ $order->phone }}</strong></p>
                    <p>Email: <strong>{{ $order->email }}</strong></p>
                    <p>Trạng thái: <strong class="text-{{ translateClassStatusOrder($order->status) }}">{{ Str::ucfirst($order->status) }}</strong></p>
                    <!-- table -->
                    <table class="table datatables" id="dataTable-1">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Mã đơn hàng</th>
                                <th>Sản phẩm</th>
                                <th>Hình ảnh</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $stt = 1;
                            @endphp
                            @foreach ($orderDetails as $details)
                            <tr>
                                <td>{{ $stt }}</td>
                                <td>{{ $details->order->order_number }}</td>
                                <td>{{ $details->product->product_name }}</td>
                                <td><img src="{{ asset('storage/' . $details->product->image) }}" alt="" class="rounded" style=" object-fit: cover" width="100px" height="100px"></td>
                                <td>{{ number_format($details->price) }} VNĐ</td>
                                <td>{{ number_format($details->quantity) }}</td>
                                <td>{{ number_format($details->total) }} VNĐ</td>
                            </tr>
                            @php
                                $stt ++;
                            @endphp
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- simple table -->
    </div> <!-- end section -->
@endsection
