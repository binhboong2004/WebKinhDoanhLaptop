@extends('layouts.admin')
@section('title', 'Thêm danh mục')
@section('content')
    <div class="col-lg-12">
        <div class="row align-items-center my-4">
            <div class="col">
                <h2 class="h3 mb-0 page-title">Thêm danh mục</h2>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-body">
                <form class="needs-validation" action="{{ route('admin.category.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('POST')
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="">Tên danh mục</label>
                            <input type="text" name="category_name" class="form-control" required placeholder="Nhập tên danh mục">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Hình ảnh</label>
                            <input type="file" name="image" class="form-control" required>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit"><i class="fe fe-check-circle fe-12"></i> Thêm mới</button>
                </form>
            </div> <!-- /.card-body -->
        </div> <!-- /.card -->
    </div> <!-- /.col -->
@endsection
