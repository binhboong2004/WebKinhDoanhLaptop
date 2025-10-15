@extends('layouts.admin')
@section('title', 'Chi tiết ảnh')
@section('content')
    <h2 class="mb-2 page-title">Chi tiết ảnh</h2>
    <a href="{{ route('admin.product.index') }}" class="btn btn-secondary mb-3">Trở về</a>
    <div class="col-lg-12 p-0">
        <div class="card shadow mb-4">
            <div class="card-body">
                <form class="needs-validation" action="{{ route('admin.product.image.store', ['id' => $product->id]) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('POST')
                    <div class="form-row">
                        <div class="col-md-12 mb-3">
                            <label for="" class="font-weight-bold">Thêm ảnh mới</label>
                            <input type="file" name="image" class="form-control" required>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit">Thêm mới</button>
                </form>
            </div> <!-- /.card-body -->
        </div> <!-- /.card -->
    </div> <!-- /.col -->
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
                                <th>Image</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $stt = 1;
                            @endphp
                            @foreach ($images as $image)
                            <tr>
                                <td>{{ $stt }}</td>
                                <td><img src="{{ asset('storage/' . $image->image) }}" alt="" class="rounded object-fit-cover" width="100px" height="100px"></td>
                                <td>
                                    <form action="{{ route('admin.product.image.destroy', ['id' => $image->id]) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-danger text-white" onclick="return confirm('Are you sure?')">Delete</button>
                                    </form>
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
