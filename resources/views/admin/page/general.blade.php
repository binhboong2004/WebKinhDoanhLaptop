@extends('layouts.admin')
@section('title', 'General Settings')
@section('content')
<div class="container mt-5">
    <h2 class="mb-4">General Settings</h2>
    <div class="card">
        <div class="card-body">
            <form method="POST" action="{{ route('admin.page.general.update') }}" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="mb-3">
                    <label for="logo" class="form-label">Logo</label>
                    <input type="file" class="form-control" id="logo" name="logo">
                    @if($general->logo)
                        <img src="{{ asset('storage/' . $general->logo) }}" alt="Logo" class="img-fluid mt-2" style="max-height: 150px;">
                    @endif
                </div>
                <div class="mb-3">
                    <label for="app_name" class="form-label">App Name</label>
                    <input type="text" class="form-control" id="app_name" name="app_name" value="{{ $general->app_name }}" placeholder="Enter app name">
                </div>
                <div class="mb-3">
                    <label for="welcome" class="form-label">Welcome Message</label>
                    <input type="text" class="form-control" id="welcome" name="welcome" value="{{ $general->welcome }}" placeholder="Enter welcome message">
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
