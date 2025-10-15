@extends('layouts.admin')
@section('title', 'Page Contact')
@section('content')
<div class="container mt-5">
    <h2 class="mb-4">Information Contact Page</h2>
    <div class="card">
        <div class="card-body">
            <form method="POST" action="{{ route('admin.page.contact.update') }}">
                @csrf
                @method('PUT')
                <div class="mb-3">
                    <label for="phone" class="form-label">Numberphone</label>
                    <input type="text" class="form-control" name="phone" id="phone" value="{{ $contact->phone }}" placeholder="Enter numberphone">
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" name="address" id="address" value="{{ $contact->address }}" placeholder="Enter address">
                </div>
                <div class="mb-3">
                    <label for="open_time" class="form-label">Open time</label>
                    <input type="text" class="form-control" name="open_time" id="open_time" value="{{ $contact->open_time }}" placeholder="Enter open time">
                </div>
                <div class="mb-3">
                    <label for="close_time" class="form-label">Close time</label>
                    <input type="text" class="form-control" name="close_time" id="close_time" value="{{ $contact->close_time }}" placeholder="Enter close time">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" id="email" value="{{ $contact->email }}" placeholder="Enter email">
                </div>
                <div class="mb-3">
                    <label for="url_iframe" class="form-label">Map (URL Iframe)</label>
                    <input type="text" class="form-control" name="url_iframe" id="url_iframe" value="{{ $contact->url_iframe }}" placeholder="Enter url iframe">
                </div>
                <div class="mb-3">
                    <iframe src="{{ $contact->url_iframe }}" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <div class="mb-3">
                    <button class="btn btn-primary">Save change</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection