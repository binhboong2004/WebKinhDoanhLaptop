@extends('layouts.admin')
@section('title', 'Danh sách đơn hàng')
@section('content')
    <h2 class="mb-2 page-title">Danh sách đơn hàng</h2>
    <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
            <div class="card shadow">
                <div class="card-body">
                    <!-- table -->
                    <table class="table datatables" id="dataTable-1">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Người dùng</th>
                                <th>Mã đơn hàng</th>
                                <th>Tổng tiền</th>
                                <th>PTTT</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $stt = 1;
                            @endphp
                            @foreach ($orders as $order)
                            <tr>
                                <td>{{ $stt }}</td>
                                <td>{{ $order->user->name }}</td>
                                <td>{{ $order->order_number }}</td>
                                <td>{{ number_format($order->total) }} VNĐ</td>
                                <td>{{ $order->payment_method }}</td>
                                <td>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div><div class="dot dot-lg bg-{{ translateClassStatusOrder($order->status) }}"></div></div>
                                        <div>
                                            <button class="btn btn-sm dropdown-toggle more-horizontal" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="text-muted sr-only">Action</span>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="{{ route('admin.order.update-status', ['id' => $order->id, 'status' => 'processing']) }}"><div class="dot dot-lg bg-warning"></div> Đang xử lý</a>
                                                <a class="dropdown-item" href="{{ route('admin.order.update-status', ['id' => $order->id, 'status' => 'delivering']) }}"><div class="dot dot-lg bg-primary"></div> Đang giao hàng</a>
                                                <a class="dropdown-item" href="{{ route('admin.order.update-status', ['id' => $order->id, 'status' => 'completed']) }}"><div class="dot dot-lg bg-success"></div> Đã giao hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <button class="btn btn-sm dropdown-toggle more-horizontal" type="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-muted sr-only">Action</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="{{ route('admin.order.show', ['id' => $order->id]) }}"><i class="fe fe-eye fe-12 mr-4"></i> Chi tiết</a>
                                        <a class="dropdown-item" href="{{ route('admin.order.destroy', ['id' => $order->id]) }}" onclick="return confirm('Are you sure?')"><i class="fe fe-delete fe-12 mr-4"></i> Xóa</a>
                                    </div>
                                </td>
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
