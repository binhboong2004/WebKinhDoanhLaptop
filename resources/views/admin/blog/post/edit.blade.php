@extends('layouts.admin')
@section('title', 'Edit Post')
@section('content')
    <div class="col-lg-12">
        <div class="row align-items-center my-4">
            <div class="col">
                <h2 class="h3 mb-0 page-title">Edit Post</h2>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-body">
                <form class="needs-validation" action="{{ route('admin.blog.post.update', ['id' => $post->id]) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="form-row">
                        <div class="col-md-12 mb-3">
                            <label for="">Title</label>
                            <input type="text" name="title" class="form-control" required placeholder="Enter title" value="{{ $post->title }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Category</label>
                            <select name="category_id" id="" class="form-control">
                                <option value="{{ $post->category_id }}">{{ $post->category->category_name }}</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->category_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="">Image</label>
                            <input type="file" name="image" class="form-control">
                        </div>
                        <div class="col-md-6 mb-3">
                            <img src="{{ asset('storage/' . $post->image) }}" width="150px" height="150px" class="object-fit-cover rounded" alt="">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="">Description</label>
                            <textarea name="description" class="form-control" cols="30" rows="2">{{ $post->description }}</textarea>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="">Content</label>
                            <textarea name="content" id="content" cols="30" rows="10">{{ $post->content }}</textarea>
                        </div>
                    </div>
                    <button class="btn btn-success text-white" type="submit"><i class="fe fe-check-circle fe-12"></i> Update</button>
                </form>
            </div> <!-- /.card-body -->
        </div> <!-- /.card -->
    </div> <!-- /.col -->
@endsection
