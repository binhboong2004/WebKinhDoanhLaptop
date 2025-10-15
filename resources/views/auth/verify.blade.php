@extends('layouts.user')
@section('title', 'Xác nhận')
@section('content')
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{ asset('user/img/breadcrumb.jpg') }}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Xác nhận</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Trang chủ </a>
                            <span>Xác nhận</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    {{-- Verify --}}
    <div class="container mb-5 mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary-custom text-white font-weight-bold">{{ __('Xác minh địa chỉ email của bạn') }}</div>
    
                    <div class="card-body">
                        @if (session('resent'))
                            <div class="alert alert-success" role="alert">
                                {{ __('Một liên kết xác minh mới đã được gửi tới địa chỉ email của bạn.') }}
                            </div>
                        @endif
    
                        {{ __('Before proceeding, please check your email for a verification link.') }}
                        {{ __('If you did not receive the email') }},
                        <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                            @csrf
                            <button type="submit" class="btn btn-link-custom p-0 m-0 align-baseline">{{ __('nhấp vào đây để yêu cầu một cái khác') }}</button>.
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{-- Verify --}}
@endsection
