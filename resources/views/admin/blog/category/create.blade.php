@extends('layouts.admin')
@section('title', 'Create Category Blog')
@section('content')
    <div class="col-lg-12">
        <div class="row align-items-center my-4">
            <div class="col">
                <h2 class="h3 mb-0 page-title">Create Category Blog</h2>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-body">
                <form class="needs-validation" action="{{ route('admin.blog.category.store') }}" method="POST" >
                    @csrf
                    @method('POST')
                    <div class="form-row">
                        <div class="col-md-12 mb-3">
                            <label for="">Category Name</label>
                            <input type="text" name="category_name" class="form-control" required placeholder="Enter category name">
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit"><i class="fe fe-check-circle fe-12"></i> Thêm mới</button>
                </form>
            </div> <!-- /.card-body -->
        </div> <!-- /.card -->
    </div> <!-- /.col -->
@endsection
