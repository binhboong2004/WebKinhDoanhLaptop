@extends('layouts.admin')
@section('title', 'Chi tiết người dùng')
@section('content')
<div class="col-12 col-lg-10 col-xl-8">
    <h2 class="h3 mb-4 page-title">{{ ($user->role->name == 'user') ? 'Hồ sơ' : 'Cài đặt' }}</h2>
    <div class="my-4">
        <form method="POST" action="{{ route('admin.user.update') }}" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="row mt-5 align-items-center">
                <div class="col-md-3 text-center mb-2">
                    <div class="avatar avatar-xl position-relative">
                        <img src="{{ $user->avatar ? asset('storage/' . $user->avatar) : asset('admin/assets/images/profile-default.png') }}" alt="..." class="avatar-img rounded-circle" style="width: 100px; height: 100px; object-fit: cover">
                        <label for="file-upload" class="overlay-upload">Ảnh</label>
                        <input type="file" id="file-upload" name="avatar" style="display: none;">
                    </div>
                </div>
                
                <div class="col">
                    <div class="row align-items-center">
                        <div class="col-md-7 avatar-responsive">
                            <h4 class="mb-1 text-center-res">{{ $user->name }}</h4>
                            <p class="small mb-3 text-center-res"><span class="badge badge-dark">{{ $user->email }}</span></p>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="name">Họ tên</label>
                    <input type="text" id="name" name="name" class="form-control" value="{{ $user->name }}" {{ checkRoleEditInformationUser(auth()->user()->id, $user->id) }}>
                </div>
                <div class="form-group col-md-6">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" id="phone" name="phone" class="form-control" value="{{ $user->phone ?? "" }}" {{ checkRoleEditInformationUser(auth()->user()->id, $user->id) }}>
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" id="email" value="{{ $user->email }}" {{ checkRoleEditInformationUser(auth()->user()->id, $user->id) }}>
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" class="form-control" name="address" id="address" value="{{ $user->address ?? "" }}" {{ checkRoleEditInformationUser(auth()->user()->id, $user->id) }}>
            </div>
            @if ($user->role->name == 'admin' || $user->role->name == 'staff' && auth()->user()->id === $user->id)
                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
            @endif
        </form>
    </div> <!-- /.card-body -->
</div> <!-- /.col-12 -->
@endsection
