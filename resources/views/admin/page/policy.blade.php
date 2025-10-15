@extends('layouts.admin')
@section('title', 'Policy Page')
@section('content')
    <div class="container mt-5">
        <h2 class="mb-4">Information Policy Page</h2>
        <div class="card">
            <div class="card-body">
                <form method="POST" action="{{ route('admin.page.policy.update') }}">
                    @csrf
                    @method('PUT')
                    <div class="mb-3">
                        <label for="content" class="form-label">Content</label>
                        <textarea class="form-control" id="content" name="content" rows="10" placeholder="Nhập nội dung chính sách">{{ $policy->content }}</textarea>
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection