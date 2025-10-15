@extends('layouts.admin')
@section('title', 'Cập nhật sản phẩm')
@section('content')
    <div class="col-lg-12">
        <div class="row align-items-center my-4">
            <div class="col">
                <h2 class="h3 mb-0 page-title">Cập nhật sản phẩm</h2>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-body">
                <form class="needs-validation" action="{{ route('admin.product.update', ['id' => $product->id ]) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="form-row">
                        <div class="col-md-12 mb-3">
                            <label for="">Tên sản phẩm</label>
                            <input type="text" name="product_name" class="form-control" required placeholder="Nhập tên sản phẩm" value="{{ $product->product_name }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Giá</label>
                            <input type="number" name="price" class="form-control" required placeholder="Nhập giá" value="{{ $product->price }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Giảm giá</label>
                            <input type="number" name="discount" class="form-control" placeholder="Nhập phần trăm giảm giá" value="{{ $product->discount }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Số lượng</label>
                            <input type="number" name="quantity" class="form-control" required placeholder="Nhập số lượng" value="{{ $product->quantity }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Danh mục</label>
                            <select name="category_id" id="" class="form-control">
                                <option value="{{ $product->category_id }}">{{ $product->category->category_name }}</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->category_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="">IChi tiết</label>
                            <textarea name="information" id="information" cols="30" rows="10">
                                {{ $product->information }}
                            </textarea>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="">Mô tả</label>
                            <textarea name="description" id="description" cols="30" rows="10">
                                {{ $product->description }}
                            </textarea>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="">Image</label>
                            <input type="file" name="image" class="form-control">
                            <img src="{{ asset('storage/' . $product->image) }}" width="200px" class="m-1 rounded mt-3" alt=""> 
                        </div>
                    </div>
                    <button class="btn btn-success text-white" type="submit"><i class="fe fe-check-circle fe-12"></i> Cập nhật</button>
                </form>
            </div> <!-- /.card-body -->
        </div> <!-- /.card -->
    </div> <!-- /.col -->
@endsection
