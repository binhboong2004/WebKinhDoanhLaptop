@extends('layouts.admin')
@section('title', 'View Email')
@section('content')
    <h2 class="mb-2 page-title">View Email</h2>
    <div class="row my-4">
        <!-- Small table -->
        <div class="col-md-12">
            <div class="card shadow">
                <div class="card-body">
                    <span>{{ $email->content }}</span>
                </div>
            </div>
            <a href="{{ route('admin.email.index') }}" class="btn btn-primary mt-2">Back</a>
        </div>
    </div> <!-- end section -->
@endsection
