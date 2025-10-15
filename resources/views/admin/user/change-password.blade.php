@extends('layouts.admin')
@section('title', 'User Profile')
@section('content')
<div class="col-12 col-lg-10 col-xl-8">
    <h2 class="h3 mb-4 page-title">{{ ($user->role->name == 'user') ? 'Profile' : 'Setting' }}</h2>
    <div class="my-4">
        <form method="POST" action="{{ route('admin.user.process-change-password') }}">
            @csrf
            @method('POST')
            <div class="row mt-5 align-items-center">
                <div class="col-md-3 text-center mb-2">
                    <div class="avatar avatar-xl position-relative">
                        <img src="{{ $user->avatar ? asset('storage/' . $user->avatar) : asset('admin/assets/images/profile-default.png') }}" alt="..." class="avatar-img rounded-circle" style="width: 100px; height: 100px; object-fit: cover">
                        <label for="file-upload" class="overlay-upload">Image</label>
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
            @if ($user->role->name == 'admin' || $user->role->name == 'staff' && auth()->user()->id === $user->id)
            <hr class="my-4">
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputPassword4">Old Password</label>
                        <input type="password" name="oldPassword" class="form-control" id="inputPassword5">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword5">New Password</label>
                        <input type="password" name="newPassword" class="form-control" id="inputPassword5">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword6">Confirm Password</label>
                        <input type="password" name="confirmNewPassword" class="form-control" id="inputPassword6">
                    </div>
                </div>
                <div class="col-md-6">
                    <p class="mb-2">Password requirements</p>
                    <p class="small text-muted mb-2"> To create a new password, you have to meet all of the following
                        requirements: </p>
                    <ul class="small text-muted pl-4 mb-0">
                        <li> Minimum 8 character </li>
                        <li>At least one special character</li>
                        <li>At least one number</li>
                        <li>Can’t be the same as a previous password </li>
                    </ul>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Save Change</button>
            @endif
        </form>
    </div> <!-- /.card-body -->
</div> <!-- /.col-12 -->
@endsection
@if ($errors->has('newPassword'))
    <div class="alert alert-danger">
        @foreach ($errors->get('newPassword') as $message)
            <p>{{ $message }}</p>
        @endforeach
    </div>
@endif
