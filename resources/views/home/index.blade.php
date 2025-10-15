@extends('layouts.user')
@section('title', 'EgaGear')
@section('content')
    <!-- Categories Section Begin -->
    @include('sections.category')
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    @include('sections.featured-product')
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="{{ asset('user/img/banner/banner1.jpeg') }}" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="{{ asset('user/img/banner/banner2.jpeg') }}" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    @include('sections.slide-product')
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    @include('sections.blog-index')
    <!-- Blog Section End -->
@endsection