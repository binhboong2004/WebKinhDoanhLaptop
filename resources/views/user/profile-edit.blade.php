@extends('layouts.user')
@section('title', 'Cập nhật hồ sơ')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Cập nhật hồ sơ</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>Cập nhật hồ sơ</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <div class="container my-5">
        <form action="{{ route('user.profile.save-change') }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="row">
                <div class="col-md-4 text-center">
                    <!-- Avatar Upload -->
                    <div class="form-group">
                        <label for="avatar">Ảnh đại diện</label>
                        <div class="mb-3">
                            <img src="{{ $user->avatar ? asset('storage/' . $user->avatar)  : 'https://via.placeholder.com/150' }}" alt="Avatar" width="200px" height="200px" style="object-fit: cover;" class="rounded-circle mb-2" id="avatarPreview">
                        </div>
                        <input type="file" class="form-control-file" name="avatar" id="avatar" onchange="previewAvatar(event)">
                    </div>
                </div>
                <div class="col-md-8">
                    <!-- Name -->
                    <div class="form-group">
                        <label for="name">Họ tên</label>
                        <input type="text" class="form-control" name="name" id="name" value="{{ $user->name }}" placeholder="Nhập họ và tên" required>
                    </div>
                    <!-- Address -->
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" class="form-control" name="address" id="address" value="{{ $user->address }}" placeholder="Nhập địa chỉ" required>
                    </div>
                    <!-- Phone -->
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" class="form-control" name="phone" id="phone" value="{{ $user->phone }}" placeholder="Nhập số điện thoại" required>
                    </div>
                    <!-- Email -->
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email" value="{{ $user->email }}" placeholder="Nhập email" required>
                    </div>
                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                    <a href="{{ route('user.profile') }}" class="btn btn-dark">Hủy</a>
                </div>
            </div>
        </form>
    </div>
@endsection