@extends('layouts.admin')
@section('title', 'Danh sách sản phẩm')
@section('content')
    <h2 class="mb-2 page-title">Danh sách sản phẩm</h2>
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
                                <th>Tên</th>
                                <th>Ảnh</th>
                                <th>Giá</th>
                                <th>Giảm giá</th>
                                <th>Số lượng</th>
                                <th>Danh mục</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $stt = 1;
                            @endphp
                            @foreach ($products as $product)
                            <tr>
                                <td>{{ $stt }}</td>
                                <td>{{ $product->product_name }}</td>
                                <td><a href="{{ route('admin.product.image.create', ['id' => $product->id]) }}"><img src="{{ asset('storage/' . $product->image) }}" width="100px" height="100px" style="object-fit: cover" class="rounded object-cover" alt=""></a></td>
                                <td>{{ number_format($product->price) }} VNĐ</td>
                                <td>{{ number_format($product->discount) }}%</td>
                                <td>{{ number_format($product->quantity) }}</td>
                                <td>{{ $product->category->category_name }}</td>
                                <td>
                                    <form action="{{ route('admin.product.update-status', ['id' => $product->id]) }}" method="POST">
                                        @csrf
                                        @method('PUT')
                                        <input type="hidden" value="{{ $product->status }}" name="status">
                                        <button class="btn"><span class="fe fe-23 fe-{{ translateClassStatusCustom($product->status) }}" style="font-size: 20px"></span></button>
                                    </form>
                                </td>
                                <td>
                                    <button class="btn btn-sm dropdown-toggle more-horizontal" type="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-muted sr-only">Thao tác</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="{{ route('admin.product.edit', ['id' => $product->id]) }}"><i class="fe fe-edit fe-12 mr-4"></i> Cập nhật</a>
                                        <a class="dropdown-item" href="{{ route('admin.product.destroy', ['id' => $product->id]) }}" onclick="return confirm('Are you sure?')"><i class="fe fe-delete fe-12 mr-4"></i> Xóa</a>
                                    </div>
                                </td>
                            </tr>
                            @php
                                $stt++;
                            @endphp
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- simple table -->
    </div> <!-- end section -->
@endsection
