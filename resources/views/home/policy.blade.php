@extends('layouts.user')
@section('title', 'Policy ' . $general->app_name)
@section('content')
    <div class="container blog-details-custom mb-5">
        <h3 class="mb-2"><strong>Chính sách</strong></h3>
        <div>{!! $policy->content !!}</div>
    </div>
@endsection
