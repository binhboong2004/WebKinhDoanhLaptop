@extends('layouts.admin')
@section('title', 'Thêm sản phẩm')
@section('content')
    <div class="col-lg-12">
        <div class="row align-items-center my-4">
            <div class="col">
                <h2 class="h3 mb-0 page-title">Thêm sản phẩm</h2>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-body">
                <form class="needs-validation" action="{{ route('admin.product.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('POST')
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="">Tên sản phẩm</label>
                            <input type="text" name="product_name" class="form-control" required placeholder="Nhập tên sản phẩm">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Giá</label>
                            <input type="number" name="price" class="form-control" required placeholder="Nhập giá">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Giảm giá(%)</label>
                            <input type="number" name="discount" class="form-control" placeholder="Nhập % giảm giá">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Hình ảnh</label>
                            <input type="file" name="image" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Số lượng</label>
                            <input type="number" name="quantity" class="form-control" required placeholder="Nhập số lượng">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Danh mục</label>
                            <select name="category_id" id="" class="form-control">
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->category_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="">Chi tiết</label>
                            <textarea name="information" id="information" cols="30" rows="10"></textarea>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="">Mô tả</label>
                            <textarea name="description" id="description" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit"><i class="fe fe-check-circle fe-12"></i> Thêm mới</button>
                </form>
            </div> <!-- /.card-body -->
        </div> <!-- /.card -->
    </div> <!-- /.col -->
@endsection
 