@extends('layouts.user')
@section('title', 'Hồ sơ')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Hồ sơ</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ</a>
                            <span>Hồ sơ</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4 text-center">
                <img src="{{ $user->avatar ? asset('storage/' . $user->avatar) : 'https://via.placeholder.com/150' }}" alt="Avatar" width="200px" height="200px" class="rounded-circle" style="object-fit: cover">
            </div>
            <div class="col-md-8 my-3">
                <h3 class="font-weight-bold">{{ $user->name }}</h3>
                <p><strong>Địa chỉ:</strong> {{ $user->address ?? 'Chưa cập nhật' }}</p>
                <p><strong>Số điện thoại:</strong> {{ $user->phone ?? 'Chưa cập nhật' }}</p>
                <p><strong>Email:</strong> {{ $user->email }}</p>
                <a href="{{ route('user.profile.edit') }}" class="btn btn-success">Cập nhật</a>
                <a href="{{ route('user.my-order') }}" class="btn btn-dark">Đơn hàng của tôi</a>
            </div>
        </div>
    </div>
@endsection